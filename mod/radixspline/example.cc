#include <iostream>
#include <fstream>

#include "include/rs/multi_map.h"
#include "include/rs/serializer.h"

using namespace std;

void RadixSplineExample() {
  // Create random keys.
  vector<uint64_t> keys(1e5);
  generate(keys.begin(), keys.end(), rand);
  keys.push_back(8128);
  sort(keys.begin(), keys.end());

  // Build RadixSpline.
  uint64_t min = keys.front();
  uint64_t max = keys.back();
  rs::Builder<uint64_t> rsb(min, max);
  for (const auto& key : keys) rsb.AddKey(key);
  rs::RadixSpline<uint64_t> rs = rsb.Finalize();

  // Serialize
  rs::Serializer<uint64_t> serializer;
  std::string bytes;
  serializer.ToBytes(rs, &bytes);

  

  // write string to file
  std::ofstream outFile("rs.fmodel");
  outFile << bytes;
  outFile.close();

  // read string from file
  std::ifstream inFile("rs.fmodel");
  std::string fileContent;
  fileContent = string((std::istreambuf_iterator<char>(inFile)),
                std::istreambuf_iterator<char>());
  inFile.close();

  cout<< "is equal?" <<(fileContent == bytes)<<endl;
  cout<<fileContent.size()<<" "<<bytes.size()<<endl;

  const auto rs_deserialized = serializer.FromBytes(fileContent);


  // Search using RadixSpline.
  for(int i=0; i<keys.size(); i++){
      rs::SearchBound bound = rs_deserialized.GetSearchBound(keys[i]);
      // cout << "The search key is in the range: [" << bound.begin << ", "
      //     << bound.end << ")" << endl;
      auto start = begin(keys) + bound.begin, last = begin(keys) + bound.end;
      if(std::lower_bound(start, last, keys[i]) - begin(keys) != i){
        // cout<<"Key not found!"<<endl;
      }
        
      else
        cout << "The key is found at position: "
            << std::lower_bound(start, last, keys[i]) - begin(keys) << endl;
  }

}


int main(int argc, char** argv) {
  RadixSplineExample();

  return 0;
}
