#include "leveldb/db.h"

int main(int argc, char** argv) {
  assert(argc == 2);
  string dbpath = argv[1];
  leveldb::Options options;
  leveldb::DB* db;
  leveldb::Status status = leveldb::DB::Open(options, dbpath, &db);
  db->PrintLevelInfo();
}