// Copyright (c) 2011 The LevelDB Authors. All rights reserved.cache
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file. See the AUTHORS file for names of contributors.

#include <fcntl.h>
#include <table/filter_block.h>
#include "db/table_cache.h"
#include "db/filename.h"
#include "leveldb/env.h"
#include "leveldb/table.h"
#include "util/coding.h"
#include "mod/stats.h"
#include "table/block.h"
#include "db/version_set.h"
#include <iostream>
#include <chrono>
#include "mod/util.h"
#include <algorithm> 


namespace leveldb {

struct TableAndFile {
  RandomAccessFile* file;
  Table* table;
};

static void DeleteEntry(const Slice& key, void* value) {
  TableAndFile* tf = reinterpret_cast<TableAndFile*>(value);
  delete tf->table;
  delete tf->file;
  delete tf;
}

static void UnrefEntry(void* arg1, void* arg2) {
  Cache* cache = reinterpret_cast<Cache*>(arg1);
  Cache::Handle* h = reinterpret_cast<Cache::Handle*>(arg2);
  cache->Release(h);
}

TableCache::TableCache(const std::string& dbname, const Options& options,
                       int entries)
    : env_(options.env),
      dbname_(dbname),
      options_(options),
      cache_(NewLRUCache(entries)) {}

TableCache::~TableCache() { delete cache_; }

Status TableCache::FindTable(uint64_t file_number, uint64_t file_size,
                             Cache::Handle** handle) {

//  adgMod::Stats* instance = adgMod::Stats::GetInstance();
//
//
//  Status s;
//  char buf[sizeof(file_number)];
//  EncodeFixed64(buf, file_number);
//  Slice key(buf, sizeof(buf));
//  Cache::Handle* cache_handle = cache_->Lookup(key);
//  TableAndFile* tf = cache_handle != nullptr ? reinterpret_cast<TableAndFile*>(cache_->Value(cache_handle)) : new TableAndFile;
//
//  if (cache_handle == nullptr) {
//      std::string fname = TableFileName(dbname_, file_number);
//
//      s = env_->NewRandomAccessFile(fname, &tf->file);
//      if (!s.ok()) {
//          std::string old_fname = SSTTableFileName(dbname_, file_number);
//          if (env_->NewRandomAccessFile(old_fname, &tf->file).ok()) {
//              s = Status::OK();
//          }
//      }
//  }
//
//  if (cache_handle == nullptr || tf->table == nullptr) {
//      if (s.ok()) {
//          s = Table::Open(options_, tf->file, file_size, &tf->table);
//      }
//  }
//
//  if (cache_handle == nullptr) {
//      if (s.ok()) {
//          cache_handle = cache_->Insert(key, tf, 1, DeleteEntry);
//      } else {
//          assert(tf->table == nullptr);
//          delete tf->file;
//      }
//  }
//
//  *handle = cache_handle;
//  return s;

  Status s;
  char buf[sizeof(file_number)];
  EncodeFixed64(buf, file_number);
  Slice key(buf, sizeof(buf));
  *handle = cache_->Lookup(key);


  if (*handle == nullptr) {

    std::string fname = TableFileName(dbname_, file_number);
    RandomAccessFile* file = nullptr;
    Table* table = nullptr;
    s = env_->NewRandomAccessFile(fname, &file);
    if (!s.ok()) {
      std::string old_fname = SSTTableFileName(dbname_, file_number);
      if (env_->NewRandomAccessFile(old_fname, &file).ok()) {
        s = Status::OK();
      }
    }
    // adgMod::iocounter += 1;


    if (s.ok()) {
      s = Table::Open(options_, file, file_size, &table);
    }

    // std::cout<<"In FindTable status"<<s.ToString()<<std::endl;


    if (!s.ok()) {
      assert(table == nullptr);
      delete file;
      // We do not cache error results so that if the error is transient,
      // or somebody repairs the file, we recover automatically.
    } else {
      TableAndFile* tf = new TableAndFile;
      tf->file = file;
      tf->table = table;
      *handle = cache_->Insert(key, tf, 1, &DeleteEntry);
      
    }
  }
  return s;
}

Iterator* TableCache::NewIterator(const ReadOptions& options,
                                  uint64_t file_number, uint64_t file_size,
                                  Table** tableptr) {
  if (tableptr != nullptr) {
    *tableptr = nullptr;
  }

  Cache::Handle* handle = nullptr;
  Status s = FindTable(file_number, file_size, &handle);
  if (!s.ok()) {
    return NewErrorIterator(s);
  }

  Table* table = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->table;
  RandomAccessFile* file = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->file;
  Iterator* result = table->NewIterator(options,file_number,file);
  result->RegisterCleanup(&UnrefEntry, cache_, handle);
  if (tableptr != nullptr) {
    *tableptr = table;
  }
  return result;
}

Status TableCache::Get(const ReadOptions& options, uint64_t file_number,
                       uint64_t file_size, const Slice& k, void* arg,
                       void (*handle_result)(void*, const Slice&, const Slice&), int level,
                       FileMetaData* meta, uint64_t lower, uint64_t upper, bool learned, Version* version,
                       adgMod::LearnedIndexData** model, bool* file_learned) {
  Cache::Handle* handle = nullptr;
  adgMod::Stats* instance = adgMod::Stats::GetInstance();

  // printf("In table cache get\n");
  // std::cout<<"In file: "<<file_number<<std::endl;

  if ((adgMod::MOD == 6 || adgMod::MOD == 7 || adgMod::MOD == 9)) {
      // check if file model is ready
      *model = adgMod::file_data->GetModel(meta->number);
      assert(file_learned != nullptr);


      *file_learned = (*model)->Learned(version, adgMod::db->version_count, meta ,level);
      // std::cout<<"In file: "<<file_number<<"file learned"<<*file_learned<<std::endl;
      // if level model is used or file model is available, go Bourbon path
      // std::cout<<"Go Bourbon Path, Learned status: "<<learned<<" "<<*file_learned<<std::endl;
      if (learned || *file_learned) {
          LevelRead(options, file_number, file_size, k, arg, handle_result, level, meta, lower, upper, learned, version);
          return Status::OK();
      }
  }

  // else, go baseline path

  // std::cout<<"Go baseline path:"<<std::endl;
#ifdef INTERNAL_TIMER
  instance->StartTimer(1);
#endif
  Status s = FindTable(file_number, file_size, &handle);
#ifdef INTERNAL_TIMER
  instance->PauseTimer(1);
#endif
  if (s.ok()) {
      Table* t = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->table;
      s = t->InternalGet(options, k, arg, handle_result, level, meta, lower, upper, learned, version);
      cache_->Release(handle);
  }
#ifdef RECORD_LEVEL_INFO
  adgMod::levelled_counters[2].Increment(level);
#endif
  return s;
}

void TableCache::Evict(uint64_t file_number) {
  char buf[sizeof(file_number)];
  EncodeFixed64(buf, file_number);
  cache_->Erase(Slice(buf, sizeof(buf)));
}

bool TableCache::FillData(const ReadOptions& options, FileMetaData *meta, adgMod::LearnedIndexData* data) {
    Cache::Handle* handle = nullptr;
    // std::cout<<"Filling file "<<meta->number<<" file_size "<<meta->file_size<<std::endl;

    Status s = FindTable(meta->number, meta->file_size, &handle);
    
    if (s.ok()) {
        Table* table = reinterpret_cast<TableAndFile*>(cache_->Value(handle))->table;
        table->FillData(options, data);
        cache_->Release(handle);
        return true;
    } else {
      // std::cout<<"Return false in TableCache::FillData()"<<std::endl;
      return false;
    }
}












static void DeleteFilterAndFile(const Slice& key, void* value) {
    auto* filter_and_file = reinterpret_cast<FilterAndFile*>(value);
    delete filter_and_file;
}

Cache::Handle* TableCache::FindFile(const ReadOptions& options, uint64_t file_number, uint64_t file_size) {
    char buf[sizeof(file_number)];
    EncodeFixed64(buf, file_number);
    Slice cache_key(buf, sizeof(buf));
    Cache::Handle* cache_handle = cache_->Lookup(cache_key);

    if (cache_handle == nullptr) {
        RandomAccessFile* file = nullptr;

        // Create new file
        std::string filename = TableFileName(dbname_, file_number);
        env_->NewRandomAccessFileLearned(filename, &file);

//        if (adgMod::use_filter) {
//
//            // Load footer
//            char footer_scratch[Footer::kEncodedLength];
//            Slice footer_slice;
//            Status s = file->Read(file_size - Footer::kEncodedLength, Footer::kEncodedLength, &footer_slice, footer_scratch);
//            assert(s.ok());
//            Footer footer;
//            s = footer.DecodeFrom(&footer_slice);
//            assert(s.ok());
//
//            if (options_.filter_policy != nullptr) {
//                // Load meta index block
//
//                BlockContents meta_contents;
//                s = ReadBlock(file, options, footer.metaindex_handle(), &meta_contents);
//                assert(s.ok());
//                Block* meta_block = new Block(meta_contents);
//                Iterator* meta_iter = meta_block->NewIterator(BytewiseComparator());
//                string filter_name = "filter." + (string) options_.filter_policy->Name();
//                meta_iter->Seek(filter_name);
//                assert(meta_iter->Valid() && meta_iter->key() == filter_name);
//
//                // Load filter meta block
//                Slice filter_handle_slice = meta_iter->value();
//                BlockHandle filter_handle;
//                s = filter_handle.DecodeFrom(&filter_handle_slice);
//                assert(s.ok());
//                BlockContents filter_contents;
//                s = ReadBlock(file, options, filter_handle, &filter_contents);
//                filter = new FilterBlockReader(options_.filter_policy, filter_contents.data);
//            }
//        }

        // Insert Cache
        TableAndFile* tf = new TableAndFile;
        tf->file = file;
        tf->table = nullptr;
        //Table::Open(options_, tf->file, file_size, &tf->table);
        cache_handle = cache_->Insert(cache_key, tf, 1, DeleteEntry);
        // adgMod::iocounter += 1;  
    }

    return cache_handle;
}

void TableCache::LevelRead(const ReadOptions &options, uint64_t file_number,
                            uint64_t file_size, const Slice &k, void *arg,
                            void (*handle_result)(void *, const Slice &, const Slice &), int level,
                            FileMetaData *meta, uint64_t lower, uint64_t upper, bool learned, Version *version) {

    // printf("Heading to levelread...\n");
    adgMod::Stats* instance = adgMod::Stats::GetInstance();

    // Get the file
    
#ifdef INTERNAL_TIMER
    instance->StartTimer(1);
    auto beforeTime = std::chrono::steady_clock::now();
#endif
    
    //Cache::Handle* cache_handle = FindFile(options, file_number, file_size);
    Cache::Handle* cache_handle = nullptr;
    Status s = FindTable(file_number, file_size, &cache_handle);
    // std::cout<<"In file: "<<file_number<<std::endl; 
    TableAndFile* tf = reinterpret_cast<TableAndFile*>(cache_->Value(cache_handle));
    RandomAccessFile* file = tf->file;
    // std::cout<<"File is:"<<file<<std::endl;
    FilterBlockReader* filter = tf->table->rep_->filter;
    // std::cout<<"num key this file is:"<<meta->num_keys<<std::endl;

    // ParsedInternalKey parsed_key;
    // ParseInternalKey(k, &parsed_key);
    // if(parsed_key.user_key.ToString() == "0002887419491712"){
    //   std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
    //   std::cout<<"In file: "<<file_number<<std::endl; 
    //   std::cout<<"Learned flag:"<<learned<<std::endl;
    // }
    

    if(adgMod::modelmode == 0){
#ifdef INTERNAL_TIMER
    instance->PauseTimer(1);
    auto afterTime = std::chrono::steady_clock::now();
    double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
    adgMod::getfiled += duration_microsecond;
#endif


    // printf("Heading to learned index...\n");

    uint64_t table_entries = 0;

    // std::cout<<"Learned flag:"<<learned<<std::endl;
    if (!learned) {
      // if level model is not used, consult file model for predicted position
#ifdef INTERNAL_TIMER
      instance->StartTimer(2);
      beforeTime = std::chrono::steady_clock::now();
#endif
      
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      auto bounds = model->GetPosition(parsed_key.user_key);
      table_entries = model->size;
      // std::cout<<"Entries in this table is:"<< table_entries<<std::endl;
      lower = bounds.first;
      upper = bounds.second;
      // printf("here is range: %lu %lu %lu %lu %lu\n", lower, upper, model->MaxPosition(),table_entries, lower % adgMod::block_num_entries);
      
#ifdef INTERNAL_TIMER
      instance->PauseTimer(2);
      afterTime = std::chrono::steady_clock::now();
      duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      adgMod::getposd += duration_microsecond;
#endif
      if (lower > model->MaxPosition()) return;
#ifdef RECORD_LEVEL_INFO
        adgMod::levelled_counters[1].Increment(level);
      } else {
        adgMod::levelled_counters[0].Increment(level);
#endif
    }




//Model on block; model inside block; 

    // printf("Heading to blocks...\n");h
    // Get the position we want to read
    // Get the data block index
    size_t index_lower = lower / adgMod::block_num_entries;
    size_t index_upper = upper / adgMod::block_num_entries;
    // if(index_lower!=index_upper)printf("here is datablock range: %zu %zu\n", index_lower, index_upper);
    // printf("adgMod::block_num_entries is: %lu\n", adgMod::block_num_entries);

    // if the given interval overlaps two data block, consult the index block to get
    // the largest key in the first data block and compare it with the target key
    // to decide which data block the key is in
    uint64_t i = index_lower;
    uint64_t j = index_upper;
    // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);


    if(adgMod::nofence == 0 || adgMod::nofence == 2){
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      #ifdef INTERNAL_TIMER
        beforeTime = std::chrono::steady_clock::now();
      #endif
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }
      #ifdef INTERNAL_TIMER
        afterTime = std::chrono::steady_clock::now();
        duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
        adgMod::calblkd += duration_microsecond;
      #endif
      

    }



    // printf("index lower after fence pointer: %lu\n", i);
    // Check Filter Block

    ParsedInternalKey parsed_key;
    ParseInternalKey(k, &parsed_key);
    

    
    uint64_t block_offset = i * adgMod::block_size;
    // printf("Filter res: %d\n", filter->KeyMayMatch(block_offset, k));
#ifdef INTERNAL_TIMER
    instance->StartTimer(15);
    beforeTime = std::chrono::steady_clock::now();
#endif
    if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
#ifdef INTERNAL_TIMER
      auto time = instance->PauseTimer(15, true);
      adgMod::levelled_counters[9].Increment(level, time.second - time.first);
      afterTime = std::chrono::steady_clock::now();
      duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      adgMod::filterd += duration_microsecond;
#endif
      
      cache_->Release(cache_handle);
      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
      return;
    }
#ifdef INTERNAL_TIMER
    auto time = instance->PauseTimer(15, true);
    adgMod::levelled_counters[9].Increment(level, time.second - time.first);
    instance->StartTimer(5);
    afterTime = std::chrono::steady_clock::now();
    duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
#endif
    
    // adgMod::filterd += adgMod::filtere - adgMod::filterb;

    // Get the interval within the data block that the target key may lie in
    size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
    size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;


    // uint64_t last_block_entry;
    // if(adgMod::nofence == 1){
    //   if(table_entries>0 && (table_entries - upper <=  table_entries % adgMod::block_num_entries)){
    //     // std::cout<<table_entries<<" "<<upper<<" "<<adgMod::block_num_entries<<std::endl;
    //     pos_block_lower = 0;
    //     pos_block_upper = (table_entries % adgMod::block_num_entries) == 0 ? (adgMod::block_num_entries - 1) : (table_entries % adgMod::block_num_entries) ;
    //   }
    //   else{
    //     // std::cout<<"whole block look up"<<std::endl;
    //     pos_block_lower = 0;
    //     pos_block_upper = adgMod::block_num_entries - 1;
    //   }
    // }
    // ParsedInternalKey parsed_key;
    // ParseInternalKey(k, &parsed_key);
    // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<std::endl;

    // Read corresponding entries
    #ifdef INTERNAL_TIMER
      beforeTime = std::chrono::steady_clock::now();
    #endif
    size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
    // printf("here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
    // printf("blockoffset: %lu\n", block_offset);
    static char scratch[4096];
    Slice entries;
    s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
    assert(s.ok());
    // std::cout<<entries.ToString()<<std::endl;
    #ifdef INTERNAL_TIMER
      afterTime = std::chrono::steady_clock::now();
      duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      adgMod::readblkcounter += 1;
      adgMod::readblkd += duration_microsecond;
    #endif

#ifdef INTERNAL_TIMER
    bool first_search = true;
#endif


    // Binary Search within the interval
    #ifdef INTERNAL_TIMER
      beforeTime = std::chrono::steady_clock::now();
    #endif
    uint64_t left = pos_block_lower, right = pos_block_upper;
    // std::cout<<right - left<<std::endl;
    while (left < right) {
      // std::cout<<right - left<<std::endl;
      uint32_t mid = (left + right) / 2;
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");

#ifdef INTERNAL_TIMER
      if (first_search) {
        first_search = false;
        instance->PauseTimer(5);
        instance->StartTimer(3);
        
      }
#endif

      // std::cout<<"keyptr: "<<(key_ptr==NULL)<<" "<<non_shared<<std::endl;
      // std::cout<<key_ptr<<" "<<shared<<" "<<non_shared<<" "<<value_length<<std::endl;
      Slice mid_key(key_ptr, non_shared);
      // std::cout<<"Midkey: "<<mid_key.ToString()<<std::endl;

      int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
      if (comp < 0) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    #ifdef INTERNAL_TIMER
      afterTime = std::chrono::steady_clock::now();
      duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      adgMod::binsearchd += duration_microsecond;
    #endif

        // decode the target entry to get the key and value (actually value_addr)
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
    #ifdef INTERNAL_TIMER
        if (!first_search) {
          instance->PauseTimer(3);
        } else {
          instance->PauseTimer(5);
        }
    #endif
        Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
        handle_result(arg, key, value);

        //cache handle;
        cache_->Release(cache_handle);

    }
    else if(adgMod::modelmode == 1)
    {
      // std::cout<<"inside lipp query process"<<std::endl;
      lippValueType v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());

      
      // std::cout<<"search_key:"<<search_key<<std::endl;
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"file name:"<<meta->number<<std::endl;
      // auto beforeTime = std::chrono::steady_clock::now();
      bool found = model->lipp_index.searchv2(search_key, &v);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;

      uint64_t real_num_entries = model->real_num_entries;

      if(v<0) v = 0;
      if(v>real_num_entries) v = real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<" pred v after range:"<<v<<std::endl;

      //determine block
      size_t block_idx = v / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;

      Slice entries;
      // uint64_t offset =  v * adgMod::entry_size;
      static char scratch[4096];
      // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
      s = file->Read(block_offset + relative_idx * adgMod::entry_size, adgMod::entry_size, &entries, scratch);
      uint32_t shared, non_shared, value_length;
      // std::cout<<"data: "<<entries.ToString()<<std::endl;
      const char* key_ptr = DecodeEntry(entries.data(),
              entries.data() + adgMod::entry_size, &shared, &non_shared, &value_length);
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      // std::cout<<"reskey: "<<key.ToString()<<std::endl;
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    
    }

    else if(adgMod::modelmode == 2){
      ftValueType v=0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());
      // std::cout<<"search_key:"<<search_key<<std::endl;
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"file name:"<<meta->number<<std::endl;
      // auto beforeTime = std::chrono::steady_clock::now();
      int c = 0;
      bool found = model->ft.lookup(search_key, &c, &v);
      // std::cout<<"pred v:"<<v<<std::endl;
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;

      uint64_t real_num_entries = model->real_num_entries;

      if(v<0) v = 0;
      if(v>real_num_entries) v = real_num_entries;

      //determine block
      size_t block_idx = v / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;

      Slice entries;
      // uint64_t offset =  v * adgMod::entry_size;
      static char scratch[4096];
      // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
      s = file->Read(block_offset + relative_idx * adgMod::entry_size, adgMod::entry_size, &entries, scratch);


      uint32_t shared, non_shared, value_length;
      // std::cout<<"data: "<<entries.ToString()<<std::endl;
      const char* key_ptr = DecodeEntry(entries.data(),
              entries.data() + adgMod::entry_size, &shared, &non_shared, &value_length);
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      // std::cout<<"reskey: "<<key.ToString()<<std::endl;
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    }
    else if(adgMod::modelmode == 3){
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      // auto beforeTime = std::chrono::steady_clock::now();
      pgm::ApproxPos range = model->pgm.pgmsearch(search_key);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;

      // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      lower = range.lo;
      upper = range.hi;

      size_t index_lower = range.lo / adgMod::block_num_entries;
      size_t index_upper = range.hi / adgMod::block_num_entries;

      uint64_t i = index_lower;
      uint64_t j = index_upper;
      // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }

      // ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      uint64_t block_offset = i * adgMod::block_size;

      if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
        cache_->Release(cache_handle);
        // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
        return;
      }
      // adgMod::filterd += adgMod::filtere - adgMod::filterb;

      // Get the interval within the data block that the target key may lie in
      size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
      size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;

      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<" bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<" entry size: "<<adgMod::entry_size<<std::endl;
      // std::cout<<"haha?"<<std::endl;
      // printf("1. here is read size: %lu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
      // std::cout<<"Read size calculated:"<<read_size<<std::endl;
      // printf("2. here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      // std::cout<<"blockoffset: "<<block_offset<<std::endl;
      // printf("blockoffset: %lu\n", block_offset);
      static char scratch[81920];
      Slice entries;
      // std::cout<<"ready to read()"<<std::endl;
      s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
      assert(s.ok());
      if(!s.ok()) std::cout<<"read done status: "<<s.ToString()<<std::endl;

      uint64_t left = pos_block_lower, right = pos_block_upper;
      // std::cout<<right - left<<std::endl;
      while (left < right) {
        // std::cout<<right - left<<std::endl;
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" k:"<<k.ToString()<<std::endl;
        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        if (comp < 0) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      // decode the target entry to get the key and value (actually value_addr)
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    }
    else if(adgMod::modelmode == 4){
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      // auto beforeTime = std::chrono::steady_clock::now();
      auto range = model->rmi.search(search_key);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;

      // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      lower = range.lo;
      upper = range.hi;

      size_t index_lower = range.lo / adgMod::block_num_entries;
      size_t index_upper = range.hi / adgMod::block_num_entries;

      uint64_t i = index_lower;
      uint64_t j = index_upper;
      // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }

      // ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      uint64_t block_offset = i * adgMod::block_size;

      if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
        cache_->Release(cache_handle);
        // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
        return;
      }
      // adgMod::filterd += adgMod::filtere - adgMod::filterb;

      // Get the interval within the data block that the target key may lie in
      size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
      size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;

      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<std::endl;
      size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
      // printf("here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      // printf("blockoffset: %lu\n", block_offset);
      static char scratch[81920];
      Slice entries;
      s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
      assert(s.ok());

      uint64_t left = pos_block_lower, right = pos_block_upper;
      // std::cout<<right - left<<std::endl;
      while (left < right) {
        // std::cout<<right - left<<std::endl;
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<std::endl;
        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        if (comp < 0) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      // decode the target entry to get the key and value (actually value_addr)
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    }

    else if(adgMod::modelmode == 5){
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      // auto beforeTime = std::chrono::steady_clock::now();
      auto range = model->rs.GetSearchBound(search_key);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<" lo:"<<range.begin<<" hi:"<<range.end<<std::endl;

     // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      lower = range.begin;
      upper = range.end;

      size_t index_lower = range.begin / adgMod::block_num_entries;
      size_t index_upper = range.end / adgMod::block_num_entries;

      uint64_t i = index_lower;
      uint64_t j = index_upper;
      // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }

      // ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      uint64_t block_offset = i * adgMod::block_size;

      if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
        cache_->Release(cache_handle);
        // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
        return;
      }
      // adgMod::filterd += adgMod::filtere - adgMod::filterb;

      // Get the interval within the data block that the target key may lie in
      size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
      size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;

      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<std::endl;
      size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
      // printf("here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      // printf("blockoffset: %lu\n", block_offset);
      static char scratch[81920];
      Slice entries;
      s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
      assert(s.ok());

      uint64_t left = pos_block_lower, right = pos_block_upper;
      // std::cout<<right - left<<std::endl;
      while (left < right) {
        // std::cout<<right - left<<std::endl;
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<std::endl;
        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        if (comp < 0) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      // decode the target entry to get the key and value (actually value_addr)
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    }
    else if(adgMod::modelmode == 6){
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"Now query:"<<adgMod::SliceToInteger(parsed_key.user_key)<<std::endl;
      long long int search_key = stoll(parsed_key.user_key.ToString());
      // auto beforeTime = std::chrono::steady_clock::now();
      auto range = model->ts.GetSearchBound(search_key);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<" lo:"<<range.begin<<" hi:"<<range.end<<std::endl;

     // std::cout<<"file name:"<<meta->number<<std::endl;
      // std::cout<<"pos: "<<range.pos<<" lo:"<<range.lo<<" hi:"<<range.hi<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;
      // std::cout<<"real_num_entries "<<real_num_entries<<std::endl;

      lower = range.begin;
      upper = range.end;

      size_t index_lower = range.begin / adgMod::block_num_entries;
      size_t index_upper = range.end / adgMod::block_num_entries;

      uint64_t i = index_lower;
      uint64_t j = index_upper;
      // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }

      // ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      uint64_t block_offset = i * adgMod::block_size;

      if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
        cache_->Release(cache_handle);
        // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
        return;
      }
      // adgMod::filterd += adgMod::filtere - adgMod::filterb;

      // Get the interval within the data block that the target key may lie in
      size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
      size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;

      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<std::endl;
      size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
      // printf("here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      // printf("blockoffset: %lu\n", block_offset);
      static char scratch[81920];
      Slice entries;
      s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
      assert(s.ok());

      uint64_t left = pos_block_lower, right = pos_block_upper;
      // std::cout<<right - left<<std::endl;
      while (left < right) {
        // std::cout<<right - left<<std::endl;
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<std::endl;
        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        if (comp < 0) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      // decode the target entry to get the key and value (actually value_addr)
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      handle_result(arg, key, value);
      cache_->Release(cache_handle);
    }
    else if(adgMod::modelmode == 7){
      lippValueType v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());

      // std::cout<<"search_key:"<<search_key<<std::endl;
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);
      // std::cout<<"file name:"<<meta->number<<std::endl;
      // auto beforeTime = std::chrono::steady_clock::now();
      int pred = model->dili.search(search_key);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<pred<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;

      if(pred<0) pred = 0;
      if(pred>real_num_entries) pred = real_num_entries;

      //determine block
      size_t block_idx = pred / adgMod::block_num_entries;
      uint64_t block_offset = block_idx * adgMod::block_size;

      size_t relative_idx = block_idx == 0 ? pred : pred % adgMod::block_num_entries;

      Slice entries;
      // uint64_t offset =  v * adgMod::entry_size;
      static char scratch[4096];
      // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
      s = file->Read(block_offset + relative_idx * adgMod::entry_size, adgMod::entry_size, &entries, scratch);

      // Slice entries;
      // uint64_t offset =  pred * adgMod::entry_size;
      // static char scratch[4096];
      // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
      uint32_t shared, non_shared, value_length;
      // std::cout<<"data: "<<entries.ToString()<<std::endl;
      const char* key_ptr = DecodeEntry(entries.data(),
              entries.data() + adgMod::entry_size, &shared, &non_shared, &value_length);
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      // std::cout<<"reskey: "<<key.ToString()<<std::endl;
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

    }
    else if(adgMod::modelmode == 8){
      // std::cout<<"good"<<std::endl;
      int v = 0;
      ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      // std::cout<<"Target key:"<<parsed_key.user_key.ToString()<<std::endl;
      lippKeyType search_key = stoll(parsed_key.user_key.ToString());
      // std::cout<<"search_key:"<<search_key<<std::endl;
      adgMod::LearnedIndexData* model = adgMod::file_data->GetModel(meta->number);

      // auto beforeTime = std::chrono::steady_clock::now();
      bool found = model->alex_index.get_leaf_disk(search_key, &v);
      // auto afterTime = std::chrono::steady_clock::now();
      // double duration_microsecond = std::chrono::duration<double, std::micro>(afterTime - beforeTime).count();
      // adgMod::getposd += duration_microsecond;
      // std::cout<<"found:"<<found<<std::endl;
      // std::cout<<"pred v:"<<v<<std::endl;
      uint64_t real_num_entries = model->real_num_entries;
      // std::cout<<"file name: "<<meta->number<<" search_key: "<<search_key<<" pred v: "<< v <<" real num entries: "<< int(model->real_num_entries) <<std::endl;

      if(adgMod::alex_interval != 1){

      

      // std::cout<<"pred v:"<< v <<" real num entries: "<< int(real_num_entries) << std::endl;

      v = std::max(std::min(v, int(real_num_entries)),  0);

      lower = std::max(v - adgMod::alex_interval, 0);
      upper = std::min(v + adgMod::alex_interval, int(real_num_entries));

      // std::cout<<"lower: "<<lower<<" upper: "<<upper<<std::endl;

      size_t index_lower = lower / adgMod::block_num_entries;
      size_t index_upper = upper / adgMod::block_num_entries;

      uint64_t i = index_lower;
      uint64_t j = index_upper;
      // printf("index lower by learned index: %lu, there are %lu entries in a block\n", i, adgMod::block_num_entries);
      // std::cout<<"i:"<<i<<" index_upper:"<<index_upper<<std::endl;
      
      while (i < j) { //Check
        //
        // std::cout<<"Entered!"<<std::endl;
        size_t mid = (i + j) / 2;
        Block* index_block = tf->table->rep_->index_block;
        uint32_t mid_index_entry = DecodeFixed32((index_block->data_) + (index_block->restart_offset_) + mid * sizeof(uint32_t));
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(index_block->data_ + mid_index_entry,
                                          index_block->data_ + index_block->restart_offset_, &shared, &non_shared, &value_length);
        //
        assert(key_ptr != nullptr && shared == 0 && "Index Entry Corruption");
        // std::cout<<key_ptr<<" "<<non_shared<<std::endl;
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<" "<<k.ToString()<<std::endl;

        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        // i = comp < 0 ? index_upper : index_lower;
        //comp<0 意味着  |lower...mid| ... |upper...key...| mid<k
        if(comp<0){
          i = mid + 1;
        }
        else{
          j = mid;
        }
      }

      // ParsedInternalKey parsed_key;
      ParseInternalKey(k, &parsed_key);
      uint64_t block_offset = i * adgMod::block_size;

      if (filter != nullptr && !filter->KeyMayMatch(block_offset, k)) {
        cache_->Release(cache_handle);
        // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"rejected by filter"<<std::endl;
        return;
      }
      // adgMod::filterd += adgMod::filtere - adgMod::filterb;

      // Get the interval within the data block that the target key may lie in
      size_t pos_block_lower = i == index_lower ? lower % adgMod::block_num_entries : 0;
      size_t pos_block_upper = i == index_upper ? upper % adgMod::block_num_entries : adgMod::block_num_entries - 1;

      // std::cout<<"Key:"<<adgMod::SliceToInteger(parsed_key.user_key)<<"bisearch bound:"<< pos_block_lower<<" "<<pos_block_upper<<std::endl;
      size_t read_size = (pos_block_upper - pos_block_lower + 1) * adgMod::entry_size;
      // printf("here is read size: %zu, and entry entries: %lu\n", pos_block_upper - pos_block_lower + 1, adgMod::entry_size);
      // printf("blockoffset: %lu\n", block_offset);
      static char scratch[81920];
      Slice entries;
      s = file->Read(block_offset + pos_block_lower * adgMod::entry_size, read_size, &entries, scratch);
      assert(s.ok());

      uint64_t left = pos_block_lower, right = pos_block_upper;
      // std::cout<<right - left<<std::endl;
      while (left < right) {
        // std::cout<<right - left<<std::endl;
        uint32_t mid = (left + right) / 2;
        uint32_t shared, non_shared, value_length;
        const char* key_ptr = DecodeEntry(entries.data() + (mid - pos_block_lower) * adgMod::entry_size,
                entries.data() + read_size, &shared, &non_shared, &value_length);
        assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
        Slice mid_key(key_ptr, non_shared);
        // std::cout<<"Midkey: "<<mid_key.ToString()<<std::endl;
        int comp = tf->table->rep_->options.comparator->Compare(mid_key, k);
        if (comp < 0) {
          left = mid + 1;
        } else {
          right = mid;
        }
      }

      // decode the target entry to get the key and value (actually value_addr)
      uint32_t shared, non_shared, value_length;
      const char* key_ptr = DecodeEntry(entries.data() + (left - pos_block_lower) * adgMod::entry_size,
              entries.data() + read_size, &shared, &non_shared, &value_length);
      assert(key_ptr != nullptr && shared == 0 && "Entry Corruption");
      Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
      handle_result(arg, key, value);
      cache_->Release(cache_handle);

      }
      else{
        if(v<0) v = 0;
        if(v>real_num_entries) v = real_num_entries-1;

        // std::cout<<"v_later:"<<v<<std::endl;

        //determine block
        size_t block_idx = v / adgMod::block_num_entries;
        uint64_t block_offset = block_idx * adgMod::block_size;

        size_t relative_idx = block_idx == 0 ? v : v % adgMod::block_num_entries;

        Slice entries;
        // uint64_t offset =  v * adgMod::entry_size;
        static char scratch[4096];
        // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
        s = file->Read(block_offset + relative_idx * adgMod::entry_size, adgMod::entry_size, &entries, scratch);


        // Slice entries;
        // uint64_t offset =  v * adgMod::entry_size;
        // static char scratch[4096];
        // s = file->Read(offset, adgMod::entry_size, &entries, scratch);
        uint32_t shared, non_shared, value_length;
        // std::cout<<"data: "<<entries.ToString()<<std::endl;
        const char* key_ptr = DecodeEntry(entries.data(),
                entries.data() + adgMod::entry_size, &shared, &non_shared, &value_length);
        Slice key(key_ptr, non_shared), value(key_ptr + non_shared, value_length);
        // std::cout<<"reskey: "<<key.ToString()<<std::endl;
        handle_result(arg, key, value);
        cache_->Release(cache_handle);
      }

      

    }
}




}  // namespace leveldb
