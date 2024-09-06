#include <cassert>
#include <chrono>
#include <iostream>
#include "leveldb/db.h"
#include "leveldb/comparator.h"
#include "util.h"
#include "stats.h"
#include "learned_index.h"
#include <cstring>
#include "cxxopts.hpp"
#include <unistd.h>
#include <fstream>
#include "../db/version_set.h"
#include <cmath>
#include <random>
#include <fstream>
#include <numeric>
#include <algorithm>
#include <stdlib.h>

#include "gflags/gflags.h"

DEFINE_string(compaction_style, "leveling", "compaction style");
DEFINE_int32(num_levels, 5, "number of logical levels");
DEFINE_int64(buffer_size, 2 * 1024 * 1024, "buffer size"); // default 2MB
DEFINE_int32(T, 10, "size ratios");
DEFINE_int32(key_size, 24, "key size");
DEFINE_int32(value_size, 1000, "value size");
DEFINE_int32(num_ops, 10000000, "number of operations");

std::string PadString(const std::string& s, size_t n) {
  std::string ret = s;
  int pad = n - s.size();
  ret = std::string(pad, '0') + ret;
  return ret;
}

leveldb::Options GetLevelingOptions() {
  leveldb::Options options;
  options.create_if_missing = true;
  options.L0_compaction_trigger = 2;
  options.write_buffer_size = FLAGS_buffer_size;
  options.max_bytes_for_level_base = FLAGS_buffer_size * FLAGS_T; // size for level 1, default 20MB
  options.max_bytes_for_level_multiplier = FLAGS_T;
  options.max_logical_level = FLAGS_num_levels;
  options.max_file_size = 10 * (1<<20); // 10MB

  
  leveldb::config::kL0_CompactionTrigger = 2;
  leveldb::config::kL0_SlowdownWritesTrigger = 2;
  leveldb::config::kL0_StopWritesTrigger = 4;

  return options;
}

leveldb::Options GetTieringOptions() {
  leveldb::Options options;
  options.create_if_missing = true;
  options.L0_compaction_trigger = FLAGS_T;
  options.write_buffer_size = FLAGS_buffer_size;
  options.max_bytes_for_level_base = FLAGS_buffer_size * FLAGS_T * FLAGS_T; // size for level 1, default 200MB
  options.max_bytes_for_level_multiplier = FLAGS_T;
  options.max_logical_level = FLAGS_num_levels;
  options.max_file_size = 10 * (1<<20); // 10MB
  options.compaction_policy = leveldb::kCompactionStyleTier;

  leveldb::config::kL0_CompactionTrigger = FLAGS_T;
  leveldb::config::kL0_SlowdownWritesTrigger = FLAGS_T + 2;
  leveldb::config::kL0_StopWritesTrigger = FLAGS_T + 4;
  
  return options;
}

leveldb::Options GetLazyLevelOptions() {
  leveldb::Options options;
  options.create_if_missing = true;
  options.L0_compaction_trigger = FLAGS_T;
  options.write_buffer_size = FLAGS_buffer_size;
  options.max_bytes_for_level_base = FLAGS_buffer_size * FLAGS_T * FLAGS_T; // size for level 1, default 200MB
  options.max_bytes_for_level_multiplier = FLAGS_T;
  options.max_logical_level = FLAGS_num_levels;
  options.max_file_size = 10 * (1<<20); // 10MB
  options.compaction_policy = leveldb::kCompactionStyleLazyLevel;

  leveldb::config::kL0_CompactionTrigger = FLAGS_T;
  leveldb::config::kL0_SlowdownWritesTrigger = FLAGS_T + 2;
  leveldb::config::kL0_StopWritesTrigger = FLAGS_T + 4;
  
  return options;
}

void PrepareDB(leveldb::DB* db, int total_ops) {
  while (-- total_ops) {
    int rng = std::rand() % INT32_MAX;
    std::string key = PadString(std::to_string(rng), FLAGS_key_size);
    std::string value = PadString(std::to_string(rng), FLAGS_value_size);
    auto s = db->Put(leveldb::WriteOptions(), key, value);
    if (!s.ok()) {
      std::cout << "Failed to put key: " << key << ": " << s.ToString() << std::endl;
      return;
    }
    if (total_ops % 100000 == 0) {
      db->PrintLevelInfo();
      std::cout << "Left: " << total_ops << std::endl;
      std::cout << "---------" << std::endl;
    }
  }
}

int main(int argc, char** argv) {
  gflags::ParseCommandLineFlags(&argc, &argv, true);
  adgMod::MOD = 0;
  leveldb::Options options;
  if (FLAGS_compaction_style == "leveling") {
    std::cout << "leveling compaction" << std::endl;
    options = GetLevelingOptions();
  } else if (FLAGS_compaction_style == "tiering") {
    std::cout << "tiering compaction" << std::endl;
    options = GetTieringOptions();
  } else if (FLAGS_compaction_style == "lazylevel") {
    std::cout << "lazylevel compaction" << std::endl;
    options = GetLazyLevelOptions();
  } else {
    std::cout << "Invalid compaction style: " << FLAGS_compaction_style << std::endl;
    return 0;
  }
  leveldb::DB* db;
  leveldb::Status status = leveldb::DB::Open(options, "/tmp/db", &db);
  if (!status.ok()) {
    std::cout << "Failed to open db: " << status.ToString() << std::endl;
    return 0;
  }
  // db->PrintLevelInfo();
  PrepareDB(db, FLAGS_num_ops);
  db->PrintLevelInfo();

  std::cout << "--------------------" << std::endl;

  std::string stat;
  db->GetProperty("leveldb.stats", &stat);
  std::cout << stat << std::endl;

  adgMod::levelled_counters[10].Report();

  std::cout << "==================================" << std::endl;

  delete db;
  return 0;
}