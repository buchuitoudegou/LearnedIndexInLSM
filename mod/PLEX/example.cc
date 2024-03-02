#include <algorithm>
#include <iostream>
#include <vector>

#include "include/ts/builder.h"
#include "include/ts/common.h"
#include "include/ts/serializer.h"

using namespace std;

void TrieSplineExample() {
  // Create random keys.
  vector<long long int> keys(1e5);
  generate(keys.begin(), keys.end(), rand);
  keys.push_back(8128);
  sort(keys.begin(), keys.end());

  // Build RadixSpline.
  long long int min = keys.front();
  long long int max = keys.back();
  ts::Builder<long long int> tsb(min, max,32);
  for (const auto& key : keys) tsb.AddKey(key);
  ts::TrieSpline<long long int> ts;
  ts = tsb.Finalize();

  // Serialize
  ts::Serializer<long long int> serializer;
  std::string bytes;
  serializer.ToBytes(ts, &bytes);

  

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

  ts::Serializer<long long int> serializer2;
  const auto rs_deserialized = serializer2.FromBytes(fileContent);
  ts::TrieSpline<long long int> ts2;
  ts2 = rs_deserialized;


  // Search using RadixSpline.
  for(int i=0; i<keys.size(); i++){
      ts::SearchBound bound = ts2.GetSearchBound(keys[i]);
      // cout << "The search key is in the range: [" << bound.begin << ", "
      //     << bound.end << ")" << endl;
      auto start = begin(keys) + bound.begin, last = begin(keys) + bound.end;
      if(std::lower_bound(start, last, keys[i]) - begin(keys) != i){
        cout<<"Key not found!"<<endl;
      }
        
      else
        cout << "The key is found at position: "
            << std::lower_bound(start, last, keys[i]) - begin(keys) << endl;
  }

}

int main(int argc, char** argv) {
  TrieSplineExample();
  return 0;
}
