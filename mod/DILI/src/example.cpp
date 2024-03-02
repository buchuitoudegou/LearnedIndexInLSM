#include "global/global.h"
#include "utils/data_utils.h"
#include "utils/file_utils.h"
#include <iostream>
#include <cmath>
#include <cassert>
#include <algorithm>
#include <functional>
#include <utility>
#include <random>
#include <set>
#include <vector>
#include <filesystem>
#include "dili/DILI.h"
using namespace std;


vector< pair<keyType, recordPtr> > bulk_load_data;



int main(int argc, char *argv[]) {

    vector<long long> keys(4334);
    generate(keys.begin(), keys.end(), rand);
    sort(keys.begin(), keys.end());

    //convert vector keys to set to delete duplicate
    std::set<long long> unique_keys(keys.begin(), keys.end());
    keys.assign(unique_keys.begin(), unique_keys.end());    

    for (int i = 0; i < keys.size()-1; ++i) {
            if (keys[i] >= keys[i+1]) {
                cout << "i = " << i << ", keys[i] = " << keys[i] << ", keys[i+1] = " << keys[i+1] << endl;
            }
            assert(keys[i] < keys[i+1]);
        }


    string mirror_dir = "data/buTree";
    int status = file_utils::path_status(mirror_dir);
    assert(status != 2);
    if (status == 0) {
        file_utils::detect_and_create_dir(mirror_dir);
    }

    for(int i=0; i<keys.size(); i++){
        bulk_load_data.emplace_back(make_pair((long long)keys[i], (long long)i));
        // cout<<keys[i]<<" "<<i<<endl;
    }
    cout<<"bulk data size:"<<bulk_load_data.size()<<endl;
    for(int i=0; i<bulk_load_data.size(); i++){
        if(i%100000==0){
            cout<<bulk_load_data[i].first<<" "<<bulk_load_data[i].second<<endl;
        }
    }

    string command = "rm -rf " + mirror_dir;
    int rc = system(command.c_str());


    DILI dili;
    dili.set_mirror_dir(mirror_dir);
    dili.bulk_load(bulk_load_data); // or uint64_t construction_time = dili.Build(bulk_load_data);


    string filename = "dili.fmodel";
    dili.save(filename);
    DILI dili2;
    dili2.load(filename);
    DILI dili3;
    dili3 = dili2;

    cout << "Bulk loading test......";
    for (long i = 0; i < keys.size(); ++i) {
        recordPtr pred = dili3.search(keys[i]);
        assert (i == pred);
        if(i != pred){
            cout<<"Key not found!"<<endl;
         }
        
         else
            cout << "The key is found at position: "
            << pred << endl;
    }
    cout << "finished." << endl;



    dili.clear();
    dili2.clear();
    // dili3.clear();
    return 0;
}
