#include "leveldb/db.h"

int main() {
  leveldb::Options options;
  leveldb::DB* db;
  leveldb::Status status = leveldb::DB::Open(options, "/tmp/db1", &db);
  db->PrintLevelInfo();
}