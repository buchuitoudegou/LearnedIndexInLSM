#pragma once

#include <sstream>

#include "ts.h"

namespace ts {

template <class KeyType>
class Serializer {
 public:
  // Serializes the `ts` model and appends it to `bytes`.
  static void ToBytes(const TrieSpline<KeyType>& ts, std::string* bytes) {
    std::stringstream buffer;

    // Scalar members.
    buffer.write(reinterpret_cast<const char*>(&ts.min_key_), sizeof(KeyType));
    buffer.write(reinterpret_cast<const char*>(&ts.max_key_), sizeof(KeyType));
    buffer.write(reinterpret_cast<const char*>(&ts.num_keys_), sizeof(size_t));
    buffer.write(reinterpret_cast<const char*>(&ts.spline_max_error_), sizeof(size_t));

    // Spline points.
    const size_t spline_points_size = ts.spline_points_.size();
    buffer.write(reinterpret_cast<const char*>(&spline_points_size),
                 sizeof(size_t));
    for (size_t i = 0; i < ts.spline_points_.size(); ++i) {
      buffer.write(reinterpret_cast<const char*>(&ts.spline_points_[i].x),
                   sizeof(KeyType));
      buffer.write(reinterpret_cast<const char*>(&ts.spline_points_[i].y),
                   sizeof(double));
    }

    // cht
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.single_layer_), sizeof(bool));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.min_key_), sizeof(KeyType));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.max_key_), sizeof(KeyType));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.num_keys_), sizeof(size_t));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.num_bins_), sizeof(size_t));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.log_num_bins_), sizeof(size_t));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.max_error_), sizeof(size_t));
    buffer.write(reinterpret_cast<const char*>(&ts.cht_.shift_), sizeof(size_t));

    const size_t table_size = ts.cht_.table_.size();
    buffer.write(reinterpret_cast<const char*>(&table_size),
                 sizeof(size_t));
    for (size_t i = 0; i < ts.cht_.table_.size(); ++i) {
      buffer.write(reinterpret_cast<const char*>(&ts.cht_.table_[i]),
                   sizeof(unsigned));
    }

    bytes->append(buffer.str());
  }

  static TrieSpline<KeyType> FromBytes(const std::string& bytes) {
    std::istringstream in(bytes);
    int IOcount = 0;

    TrieSpline<KeyType> ts;

    // Scalar members.
    in.read(reinterpret_cast<char*>(&ts.min_key_), sizeof(KeyType));
    in.read(reinterpret_cast<char*>(&ts.max_key_), sizeof(KeyType));
    in.read(reinterpret_cast<char*>(&ts.num_keys_), sizeof(size_t));
    in.read(reinterpret_cast<char*>(&ts.spline_max_error_), sizeof(size_t));
    IOcount += 4;
    // Spline points.
    size_t spline_points_size;
    in.read(reinterpret_cast<char*>(&spline_points_size), sizeof(size_t));
    ts.spline_points_.resize(spline_points_size);
    for (int i = 0; i < ts.spline_points_.size(); ++i) {
      in.read(reinterpret_cast<char*>(&ts.spline_points_[i].x),
              sizeof(KeyType));
      in.read(reinterpret_cast<char*>(&ts.spline_points_[i].y), sizeof(double));
      IOcount += 2;
    }

    // cht
    ts_cht::CompactHistTree<KeyType> cht;

    // Scalar members.
    in.read(reinterpret_cast<char*>(&cht.single_layer_), sizeof(bool));
    in.read(reinterpret_cast<char*>(&cht.min_key_), sizeof(KeyType));
    in.read(reinterpret_cast<char*>(&cht.max_key_), sizeof(KeyType));
    in.read(reinterpret_cast<char*>(&cht.num_keys_), sizeof(size_t));
    in.read(reinterpret_cast<char*>(&cht.num_bins_), sizeof(size_t));
    in.read(reinterpret_cast<char*>(&cht.log_num_bins_), sizeof(size_t));
    in.read(reinterpret_cast<char*>(&cht.max_error_), sizeof(size_t));
    in.read(reinterpret_cast<char*>(&cht.shift_), sizeof(size_t));
    // Radix table.
    size_t table_size;
    in.read(reinterpret_cast<char*>(&table_size), sizeof(size_t));
    IOcount += 8;
    cht.table_.resize(table_size);
    for (int i = 0; i < cht.table_.size(); ++i) {
      in.read(reinterpret_cast<char*>(&cht.table_[i]), sizeof(unsigned));
      IOcount ++;
    }

    ts.cht_ = cht;

    // std::cout << "IO count: " << IOcount << std::endl;

    return ts;
  }
};

}  // namespace ts
