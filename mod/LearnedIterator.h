#include "leveldb/iterator.h"
#include "mod/learned_index.h"
#include "mod/stats.h"
#include "table/block.h"


namespace leveldb {

class LearnedIterator : public Iterator {
 public:
  LearnedIterator(Table* table, RandomAccessFile* file, adgMod::LearnedIndexData* file_model, int file_num) :
		table(table), file(file), file_model(file_model), file_num(file_num),
    num_blocks(table->rep_->index_block->NumRestarts()),
    // last_block_num_entries(file_model->real_num_entries - (num_blocks - 1) * adgMod::block_num_entries),
    last_block_num_entries(adgMod::num_entry_map[file_num] - (num_blocks-1) * adgMod::block_num_entries),
    block_content(), current_block(-1), current_entry(-1), key_(), value_() { };

  virtual ~LearnedIterator() {
    delete[] scratch;
  }

  virtual void Seek(const Slice& target) {
		adgMod::Stats* instance = adgMod::Stats::GetInstance();

		// read the model
		ParsedInternalKey parsed_key;
    ParseInternalKey(target, &parsed_key);

    uint64_t real_num_entries = adgMod::num_entry_map[file_num];
    uint64_t lower=0, upper=real_num_entries-1;

    if(adgMod::modelmode == 0){
      auto bounds = file_model->GetPosition(parsed_key.user_key);
      lower = bounds.first;
      upper = bounds.second;
    }
    if(adgMod::modelmode == 2){
      ftValueType v=0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      uint64_t search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->ft_index.get_approx_pos(search_key);

      lower = range.lo;
      upper = range.hi;
    }
    if(adgMod::modelmode == 3){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      long long int search_key = stoll(parsed_key.user_key.ToString());
      pgm::ApproxPos range = file_model->pgm.search(search_key);
      lower = range.lo;
      upper = range.hi;
    }
    if(adgMod::modelmode == 4){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      long long int search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->rmi.search(search_key);

      lower = range.lo;
      upper = range.hi;
    }
    if(adgMod::modelmode == 5){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      long long int search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->rs.GetSearchBound(search_key);

      lower = range.begin;
      upper = range.end;
    }
    if(adgMod::modelmode == 6){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      long long int search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->ts.GetSearchBound(search_key);

      lower = range.begin;
      upper = range.end;
    }

    // Not found in this file
    if (upper >= real_num_entries) 
      upper = real_num_entries-1;
    if (lower >= real_num_entries) 
    {
      block_content.clear();
      current_block = -1;
      return;
    }
    // Get the position we want to read
    size_t index_lower = lower / adgMod::block_num_entries;
    size_t index_upper = upper / adgMod::block_num_entries;

    uint64_t i = index_lower;
    if (index_lower != index_upper) {
      Block* index_block = table->rep_->index_block;
      uint32_t mid_index_entry = DecodeFixed32(index_block->data_ + index_block->restart_offset_ + index_lower * sizeof(uint32_t));
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                        index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
      Slice mid_key(key_ptr, non_shared);
      int comp = table->rep_->options.comparator->Compare(mid_key, target);
      i = comp < 0 ? index_upper : index_lower;
    }
    // No filter block search, just read corresponding entries
    size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
    size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
    prediction_range = pos_block_upper - pos_block_lower + 1;
    // read prediction range
    // if (scratch == nullptr) {
    //   scratch = new char[prediction_range * adgMod::entry_size];
    // }
    current_block = i;
    current_entry = pos_block_lower;
    pos_block_content = 0;
    ReadNEntries(prediction_range);
    assert(!block_content.empty());

    // Binary Search
    uint64_t left = pos_block_lower, right = pos_block_upper;
    while (left < right) {
      uint32_t mid = (left + right) / 2;
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(block_content.data() + (left - pos_block_lower) * adgMod::entry_size,
              block_content.data() + (pos_block_upper - pos_block_lower + 1)*adgMod::entry_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice mid_key(key_ptr, non_shared);
      int comp = table->rep_->options.comparator->Compare(mid_key, target);
      if (comp < 0) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }

    // Set appropriate values
    current_block = i;
    current_entry = left;
    pos_block_content = left-pos_block_lower;
    ParseEntry();
	}

  virtual void SeekToFirst() { 
    current_block = 0;
    current_entry = 0;
    pos_block_content=0;
    ReadNEntries(4);
    ParseEntry();
  }

  virtual void SeekToLast() { assert(false); }
  virtual void Prev() { assert(false); }

  virtual void Next() { 
    ++current_entry;
    ++pos_block_content;
    // end of SST
    if (current_block == num_blocks - 1 && current_entry >= last_block_num_entries) {
      block_content.clear();
      current_block = -1;
      return;
      }
    if (current_entry >= adgMod::block_num_entries) {
      ++current_block;
      current_entry = 0;
    }
    // read next prediction_range of entries
    if (pos_block_content*adgMod::entry_size >= block_content.size())
    {
      size_t n_entry_this_block = (current_block == num_blocks - 1 ? last_block_num_entries : adgMod::block_num_entries);
      int n_entry_to_read = min(int(n_entry_this_block - current_entry), 4);
      ReadNEntries(n_entry_to_read);
      pos_block_content=0;
    }
    ParseEntry();
  }
  
  virtual bool Valid() const { return !block_content.empty(); }

  virtual Slice key() const { 
    assert(Valid());
    return key_;
  }

  virtual Slice value() const { 
    assert(Valid());
    return value_;
  }

  virtual Status status() const { return Status::OK(); }

 private:
	Table* table;
	RandomAccessFile* file;
	adgMod::LearnedIndexData* file_model;
  int file_num;
  
  const uint32_t num_blocks;  
	const uint32_t last_block_num_entries;
  // char* scratch=nullptr;
  char scratch[10000000];
  // manually split physical block into logical blocks
  Slice block_content;
  // entry = current_block * blocksize + current_entry + pos_block_content
  // the block where current_entry locates
  uint32_t current_block;
  // the position of the current entry in the block
  uint32_t current_entry;
  // the position of the current entry in block_content
  uint32_t pos_block_content;
  // prediction range
  int prediction_range;

  Slice key_;
  Slice value_;

  void ParseEntry() {
    assert(Valid());
    uint32_t shared, non_shared, value_length;
    const char* key_ptr = DecodeEntry(block_content.data() + pos_block_content * adgMod::entry_size,
            block_content.data() + block_content.size(), &shared, &non_shared, &value_length);
    assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
    key_ = Slice(key_ptr, non_shared);
    value_ = Slice(key_ptr + non_shared, value_length);
  }

  void ReadDataBlock() {
    uint64_t read_size = current_block == num_blocks - 1 ? last_block_num_entries : adgMod::block_num_entries;
    ReadNEntries(read_size);
  }

  void ReadNEntries(int n)
  {
    // assert valid n
    if (adgMod::entry_size==0)
    {
      adgMod::entry_size = adgMod::key_size+adgMod::value_size+8;
    }
    uint64_t read_size = n * adgMod::entry_size;
    // cout<<"ReadNEntries: "<<read_size<<endl;
    Status s = file->Read(current_block * adgMod::block_size+current_entry*adgMod::entry_size, read_size, &block_content, scratch);
    assert(s.ok());
  }
};





}