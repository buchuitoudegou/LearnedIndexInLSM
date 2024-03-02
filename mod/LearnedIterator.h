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
    last_block_num_entries(file_model->real_num_entries - (num_blocks - 1) * adgMod::block_num_entries),
    block_content(), current_block(-1), current_entry(-1), key_(), value_() { };

  virtual ~LearnedIterator() = default;

  virtual void Seek(const Slice& target) {
		adgMod::Stats* instance = adgMod::Stats::GetInstance();
    // std::cout<<"using learned iter do range query"<<std::endl;

		// read the model
		ParsedInternalKey parsed_key;
    ParseInternalKey(target, &parsed_key);
    // std::cout<<"parsed_key:"<<parsed_key.user_key.ToString()<<std::endl;
    // std::cout<<"file_name:"<<file_num<<std::endl;

    if(adgMod::modelmode == 0){
      
      auto bounds = file_model->GetPosition(parsed_key.user_key);
      uint64_t lower = bounds.first;
      uint64_t upper = bounds.second;
      
      // Not found in this file
      if (lower > file_model->MaxPosition()) {
        block_content.clear();
        current_block = -1;
        return;
      }

      // std::cout<<"lower:"<<lower<<" upper:"<<upper<<std::endl;

      // Get the position we want to read
      size_t index_lower = lower / adgMod::block_num_entries;
      size_t index_upper = upper / adgMod::block_num_entries;
      // std::cout<<"index_lower:"<<index_lower<<" index_upper:"<<index_upper<<std::endl;
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
      uint64_t left = i == index_lower ? lower % adgMod::block_num_entries : 0;
      uint64_t right = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
      // std::cout<<"left:"<<left<<" right:"<<right<<std::endl;
      if (current_block != i) {
        current_block = i;
        ReadDataBlock();
      }
      // std::cout<<"block_content size"<<block_content.size()<<std::endl;
      // std::cout<<"real_num_entries"<<file_model->real_num_entries<<std::endl;
      // std::cout<<"block_num_entries"<<adgMod::block_num_entries<<std::endl;
      assert(!block_content.empty());
      // Binary Search
      while (left < right) {
        // std::cout<<"\tleft:"<<left<<" right:"<<right<<std::endl;
        uint32_t mid = (left + right) / 2;
        // std::cout<<"mid:"<<mid<<std::endl;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(block_content.data() + mid * adgMod::entry_size,
                block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
        // std::cout<<"key_pter:"<<key_ptr<<std::endl;
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"\tmid_key:"<<mid_key.ToString()<<std::endl;
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
      // std::cout<<"current_block:"<<current_block<<" current_entry:"<<current_entry<<std::endl;
      ParseEntry();
    }

    if(adgMod::modelmode == 1){
      // std::cout<<"using lipp to do range query"<<std::endl;
      lippValueType v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());

      // std::cout<<"search_key:"<<search_key<<std::endl;
      bool found = file_model->lipp_index.searchv2(search_key, &v);

      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      if(v<0) v = 0;
      if(v>real_num_entries) v = real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<" pred v after range:"<<v<<std::endl;
      //determine block
      size_t block_idx = v / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      // std::cout<< "block_idx:"<<block_idx<<std::endl;
      if (current_block != block_idx) {
        current_block = block_idx;
        ReadDataBlock();
      }

      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;
      // std::cout<< "relative_idx:"<<relative_idx<<std::endl;
      current_block = block_idx;
      current_entry = relative_idx;
      ParseEntry();

    }
    if(adgMod::modelmode == 2){
      ftValueType v=0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());
      // std::cout<<"search_key:"<<search_key<<std::endl;
      // std::cout<<"file name:"<<meta->number<<std::endl;
      int c = 0;
      bool found = file_model->ft.lookup(search_key, &c, &v);
      // std::cout<<"pred v:"<<v<<std::endl;

      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      if(v<0) v = 0;
      if(v>real_num_entries) v = real_num_entries;
      //determine block
      size_t block_idx = v / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;
      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;

      current_block = block_idx;
      current_entry = relative_idx;
      ParseEntry();
    }

    if(adgMod::modelmode == 3){

      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      pgm::ApproxPos range = file_model->pgm.pgmsearch(search_key);
      // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"file_name:"<<file_num<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;
      uint64_t lower = range.lo;
      uint64_t upper = range.hi;
      if (lower > real_num_entries) {
        block_content.clear();
        current_block = -1;
        return;
      }
      // Get the position we want to read
      size_t index_lower = lower / adgMod::block_num_entries;
      size_t index_upper = upper / adgMod::block_num_entries;
      // std::cout<<"index_lower:"<<index_lower<<" index_upper:"<<index_upper<<std::endl;
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
      uint64_t left = i == index_lower ? lower % adgMod::block_num_entries : 0;
      uint64_t right = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
      if (current_block != i) {
        current_block = i;
        ReadDataBlock();
      }

      // std::cout<<"current_block:"<<current_block<<std::endl;
      // std::cout<<"adgMod::block_num_entries:"<<adgMod::block_num_entries<<std::endl;

      // std::cout<<"left:"<<left<<" right:"<<right<<std::endl;

      assert(!block_content.empty());
      // Binary Search
      while (left < right) {
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(block_content.data() + mid * adgMod::entry_size,
                block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Mid key:"<<mid_key.ToString()<<std::endl;
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
      ParseEntry();
    }
    if(adgMod::modelmode == 4){

      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->rmi.search(search_key);
        // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
        // std::cout<<"file name:"<<meta->number<<std::endl;
        // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      uint64_t lower = range.lo;
      uint64_t upper = range.hi;
      if (upper == real_num_entries) upper -= 1;
            if (lower > file_model->MaxPosition()) {
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
      uint64_t left = i == index_lower ? lower % adgMod::block_num_entries : 0;
      uint64_t right = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
      if (current_block != i) {
        current_block = i;
        ReadDataBlock();
      }

      assert(!block_content.empty());
      // Binary Search
      while (left < right) {
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(block_content.data() + mid * adgMod::entry_size,
                block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
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
      ParseEntry();
    }

    if(adgMod::modelmode == 5){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());

      auto range = file_model->rs.GetSearchBound(search_key);
      // std::cout<<" lo:"<<range.begin<<" hi:"<<range.end<<std::endl;
     // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      uint64_t lower = range.begin;
      uint64_t upper = range.end;
      if (upper == real_num_entries) upper -= 1;

      if (lower > file_model->MaxPosition()) {
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
      uint64_t left = i == index_lower ? lower % adgMod::block_num_entries : 0;
      uint64_t right = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
      if (current_block != i) {
        current_block = i;
        ReadDataBlock();
      }

      assert(!block_content.empty());
      // Binary Search
      while (left < right) {
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(block_content.data() + mid * adgMod::entry_size,
                block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
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
      ParseEntry();
    }

    if(adgMod::modelmode == 6){
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      auto range = file_model->ts.GetSearchBound(search_key);
      // std::cout<<" lo:"<<range.begin<<" hi:"<<range.end<<std::endl;

     // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      uint64_t lower = range.begin;
      uint64_t upper = range.end;
      if (upper == real_num_entries) upper -= 1;

            // Not found in this file
      if (lower > file_model->MaxPosition()) {
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
      uint64_t left = i == index_lower ? lower % adgMod::block_num_entries : 0;
      uint64_t right = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;
      if (current_block != i) {
        current_block = i;
        ReadDataBlock();
      }

      assert(!block_content.empty());
      // Binary Search
      while (left < right) {
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(block_content.data() + mid * adgMod::entry_size,
                block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
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
      ParseEntry();

    }

    if(adgMod::modelmode == 7){
      lippValueType v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());

      // std::cout<<"search_key:"<<search_key<<std::endl;
      // std::cout<<"file name:"<<meta->number<<std::endl;

      int pred = file_model->dili.search(search_key);

      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<pred<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;

      if(pred<0) pred = 0;
      if(pred>real_num_entries) pred = real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<" pred v after range:"<<v<<std::endl;
      //determine block
      size_t block_idx = pred / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      if (current_block != block_idx) {
        current_block = block_idx;
        ReadDataBlock();
      }

      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;
      current_block = block_idx;
      current_entry = relative_idx;
      ParseEntry();
    }
    if(adgMod::modelmode == 8){
      int v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(target, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());
      // std::cout<<"search_key:"<<search_key<<std::endl;
      bool found = file_model->alex_index.get_leaf_disk(search_key, &v);
      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;
      uint64_t real_num_entries = file_model->real_num_entries;
      if(v<0) v = 0;
      if(v>real_num_entries) v = real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<" pred v after range:"<<v<<std::endl;
      //determine block
      size_t block_idx = v / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      if (current_block != block_idx) {
        current_block = block_idx;
        ReadDataBlock();
      }

      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;
      current_block = block_idx;
      current_entry = relative_idx;
      ParseEntry();
    }

    
	}

  virtual void SeekToFirst() { 
    current_block = 0;
    current_entry = 0;
    ReadDataBlock();
    ParseEntry();
  }

  virtual void SeekToLast() { assert(false); }
  virtual void Prev() { assert(false); }

  virtual void Next() { 
    ++current_entry;
    if (current_block == num_blocks - 1) {
      if (current_entry >= last_block_num_entries) {
        block_content.clear();
        current_block = -1;
        return;
      }
    } else {
      if (current_entry >= adgMod::block_num_entries) {
        ++current_block;
        current_entry = 0;
        ReadDataBlock();
      }
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
  
  // char* scratch = nullptr;
  char scratch[4096];
  const uint32_t num_blocks;  
	const uint32_t last_block_num_entries;
  
  Slice block_content;
  uint32_t current_block;
  uint32_t current_entry;

  Slice key_;
  Slice value_;

  void ParseEntry() {
    assert(Valid());
    uint32_t shared, non_shared, value_length;
    const char* key_ptr = DecodeEntry(block_content.data() + current_entry * adgMod::entry_size,
            block_content.data() + adgMod::block_size, &shared, &non_shared, &value_length);
    assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
    key_ = Slice(key_ptr, non_shared);
    value_ = Slice(key_ptr + non_shared, value_length);
  }

  void ReadDataBlock() {
    uint64_t read_size = current_block == num_blocks - 1 ? last_block_num_entries : adgMod::block_num_entries;
    // std::cout<<"read_size:"<<read_size<<std::endl;
    read_size *= adgMod::entry_size;
    // std::cout<<"read_size:"<<read_size<<" current block:"<<current_block<<" block_size:"<<adgMod::block_size<<std::endl;
    Status s = file->Read(current_block * adgMod::block_size, read_size, &block_content, scratch);
    assert(s.ok());
  }
};





}