#include "diliNode.h"
#include "../butree/interval_utils.h"
#include "../global/global.h"
#include "../utils/data_utils.h"
#include "../utils/linux_sys_utils.h"
#include <vector>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <iostream>
#include <stack>
#ifndef DILI_DILI_H
#define DILI_DILI_H


namespace diliFunc {
    inline pair<diliNode **, double *>
    create_children(const int &height, diliNode **parents, int n_parents, double *parents_range_froms,
                    keyType *split_keys_for_children, recordPtr *ptrs, int n_keys,
                    int &act_total_N_children){
        act_total_N_children = 0;
        for (int i = 0; i < n_parents; ++i) {
            act_total_N_children += parents[i]->get_fanout();
        }
        diliNode **_children = new diliNode *[act_total_N_children];

        double *children_range_froms = NULL;
        if (height > 1) {
            children_range_froms = new double[act_total_N_children + 1];
        }

        diliNode *child = NULL;
        int last_idx = 0;
        int cursor = 0;

//        cout << "****height = " << height << ", n_parents = " << n_parents << ", n_keys = " << n_keys << endl;

        for (int i = 0; i < n_parents; ++i) {
            diliNode *parent = parents[i];
            int fanout = parent->fanout;
            parent->pe_data = new pairEntry[fanout];
            double range_from = parents_range_froms[i];
            double parent_range_to = parents_range_froms[i + 1];
//        parent->children = new diliNode*[fanout];
//        double range_from = parent->range_from;

            for (int child_id = 0; child_id < fanout; ++child_id) {
                double range_to = (1.0 * (child_id + 1) - parent->a) / parent->b;
                if (range_to > parent_range_to) {
                    assert(child_id >= (fanout - 1));
                    range_to = parent_range_to;
                }
                if (child_id == fanout - 1) {
                    range_to = parent_range_to;
                }
                int idx = data_utils::array_lower_bound(split_keys_for_children, range_to, 0, n_keys);
                int n_keys_this_child = idx - last_idx;

                if (last_idx > idx) {
                    cout << "child_id = " << child_id << ", range_from = " << range_from << ", range_to = " << range_to
                         << ", parent_range_to = " << parent_range_to << endl;
                }
                assert(idx >= last_idx);

                if (height > 1) {
                    diliNode *int_node = new diliNode(true);
//                int_node->set_range(range_from, range_to);
                    int_node->cal_lr_params(split_keys_for_children + last_idx, n_keys_this_child);
//                int_node->children_init();
                    child = int_node;
                    children_range_froms[cursor] = range_from;
                    _children[cursor++] = child;
                } else {
                    child = new diliNode(false);
                    _children[cursor++] = child;
                }
//            parent->children[child_id] = child;
                parent->pe_data[child_id].setChild(child);

                last_idx = idx;
                range_from = range_to;
            }

//        std::copy(parent->children, parent->children + fanout, _children + cursor);
//        cursor += fanout;
        }
        if (height > 1) {
            children_range_froms[cursor] = parents_range_froms[n_parents];
        }

        assert(last_idx = n_keys);
        return make_pair(_children, children_range_froms);
    }
};


class DILI {
    public:
    diliNode *root;
    string mirror_dir;

public:
    //----for SOSD benchmark
    uint64_t Build(const std::vector< pair<keyType, recordPtr> >& data) {
        return linux_sys_utils::timing(
                [&] { bulk_load(data); });
    }

    SearchBound EqualityLookup(const keyType &lookup_key) const {
        const uint64_t start = search(lookup_key);
        const uint64_t stop = start + 1;

        return (SearchBound){start, stop};
    }

    std::string name() const { return "DILI"; }

    std::size_t size() const { return total_size(); }

    // ---------------------
    DILI(): root(NULL) {
        init_insert_aux_vars();
    }
    // ~DILI() {
    //     clear();
    // }

    void clear() {
        if (root) {
            delete root;
            root = NULL;
        }
        free_insert_aux_vars();
    }


    inline void init_insert_aux_vars() {
        dili_auxiliary::init_insert_aux_vars();
    }

    inline void free_insert_aux_vars() {
        dili_auxiliary::free_insert_aux_vars();
    }

    inline void set_mirror_dir(const std::string &dir) { mirror_dir = dir; }

    inline void build_from_mirror(l_matrix &mirror, const keyArray &all_keys, const recordPtrArray &all_ptrs, long N) {
        size_t H = mirror.size();

//        cout << "+++H = " << H << endl;
        intVec n_nodes_each_level;
        intVec n_nodes_each_level_mirror;
        for (longVec &lv : mirror) {
            n_nodes_each_level_mirror.push_back(lv.size());
        }

        keyType **split_keys_list = new keyType *[H];
        split_keys_list[0] = all_keys.get();

        for (int height = H - 1; height > 0; --height) {
            longVec &lv = mirror[height-1];
            int n_split_keys = lv.size();

            long *split_keys = new long[n_split_keys + 1];
            std::copy(lv.begin(), lv.end(), split_keys);
            split_keys[n_split_keys] = all_keys[N-1] + 1;

            split_keys_list[height] = (long long*)split_keys;
            data_utils::check(split_keys, n_split_keys+1);
        }
        root = new diliNode(true);
//    root->set_range(0, all_keys[N-1] + 1);
        int n_keys = n_nodes_each_level_mirror[H - 2];
        root->fanout = n_keys + 1;
        long ubd = split_keys_list[H-1][n_keys-1];
        long lbd = split_keys_list[H-1][0];
        root->b = 1.0 * n_keys / (ubd - lbd);
        root->a = -(root->b * lbd);
        n_nodes_each_level.push_back(1);
//    root->children_init();
        root->pe_data = new pairEntry[root->fanout];

        keyType lastone = split_keys_list[H - 2][n_nodes_each_level_mirror[H-3]-1];

        diliNode **parents = new diliNode*[1];
        parents[0] = root;
        int n_parents = 1;
        double *parents_range_froms = new double[2];
        parents_range_froms[0] = 0;
        parents_range_froms[1] = all_keys[N-1] + 1;

        // height: the height of parents
        diliNode **children = NULL;
        int act_total_N_children = 0;

        for (int height = H - 1; height > 0; --height) {
            n_keys = N;

            if (height > 1) {
                n_keys = n_nodes_each_level_mirror[height-2];
            }
            recordPtr *ptrs = NULL;
            if (height == 1) {
                ptrs = all_ptrs.get();
            }

            pair<diliNode **, double *> _pair = diliFunc::create_children(height, parents, n_parents, parents_range_froms, split_keys_list[height-1],
                                                                          ptrs, n_keys, act_total_N_children);
            children = _pair.first;
            double *children_range_froms = _pair.second;
            delete[] parents;

            parents = children;

            delete[] parents_range_froms;
            parents_range_froms = children_range_froms;

            n_parents = act_total_N_children;
            n_nodes_each_level.push_back(act_total_N_children);
        }

        for (int height = 1; height < H; ++height) {
            delete[] split_keys_list[height];
        }
        delete[] split_keys_list;

        for (long i = 0; i < N; ++i) {
            diliNode *leaf = find_leaf(all_keys[i]);
//        leaf->tmp.push_back(all_keys[i]);
            leaf->inc_num_nonempty();
        }

        long start_idx = 0;
        bool print = false;
        for (int i = 0; i < act_total_N_children; ++i) {
            diliNode *leaf = children[i];
            int _num_nonempty = leaf->num_nonempty;
            leaf->bulk_loading(all_keys.get() + start_idx, all_ptrs.get() + start_idx, print);
            start_idx += _num_nonempty;
        }
        if (start_idx != N) {
            cout << "error, start_idx = " << start_idx << ", N = " << N << endl;
        }
        assert(start_idx == N);

//        validness_check(all_keys, all_ptrs, N);

        root->trim();
        root->cal_num_nonempty();
#ifndef ALLOW_FAN2_NODE
        root->simplify();
#endif
        root->cal_avg_n_travs();
        root->init_after_bulk_load();
    }

    size_t total_size() const{
        std::stack<diliNode*> s;
        s.push(root);

        size_t size = 0;
        size_t delta = sizeof(diliNode);
        while (!s.empty()) {
            diliNode* node = s.top(); s.pop();

            size += delta;
            if (!(node->is_internal())) {
                size += node->num_nonempty * 2 * sizeof(long);
            } else {
                for (int i = 0; i < node->fanout; ++i) {
                    pairEntry &kp = node->pe_data[i];
                    if (kp.key < 0) {
                        if (kp.key == -1) {
                            s.push(kp.child);
                            size += sizeof(long);
                        } else if (kp.key == -2) {
                            size += (delta + 5 * sizeof(long));
                        }
                    } else {
                        size += 2 * sizeof(long);
                    }
                }
            }
        }
        return size;
    }


    void validness_check(keyType *keys, recordPtr *ptrs, int n_keys) {
        for (int i = 0; i < n_keys; ++i) {
            recordPtr pred = search(keys[i]);
            if (pred != ptrs[i]) {
                cout << "i = " << i << ", key = " << keys[i] << ", pred = " << pred << ", ptr = " << ptrs[i] << endl;
            }
            assert(pred == ptrs[i]);
        }
    }

    inline bool insert(const keyType &key, const recordPtr &ptr) { return root->insert(key, ptr); };
    inline bool insert(const pair<keyType, recordPtr> &p) { return root->insert(p.first, p.second); };
    inline bool erase(const keyType &key) { return 0 <= (root->erase(key)); }
    inline recordPtr delete_key(const keyType &key) {
        recordPtr ptr = static_cast<recordPtr>(-1);
        root->erase_and_get_ptr(key, ptr);
        return ptr;
    }

    inline void save(const string &path){
        FILE *fp = NULL;

        if (NULL == (fp = fopen(path.c_str(), "wb"))) {
            cout << path << " cannot be created." << endl;
            exit(1);
        }

    //    saveNode(root, fp);
        root->save(fp);
        fclose(fp);
    };
    inline void load(const string &path){
        FILE *fp = NULL;

        if (NULL == (fp = fopen(path.c_str(), "rb"))) {
            cout << path << " cannot be opened." << endl;
            exit(1);
        }
        root = new diliNode(true);
        root->load(fp);
        fclose(fp);
    };
    diliNode* loadNode(FILE *fp);


    // only called on bulk loading stage
    inline diliNode* find_leaf(const keyType &key) {
        diliNode *node = root->find_child(key);
        while (node->is_internal()) {
            node = node->find_child(key);
        }
        return static_cast<diliNode*>(node);
    }



    inline long search(const keyType &key) const{
//        std::cout << "******key = " << key << std::endl;

        diliNode *node = root;
        while (true) {
            int pred = LR_PRED(node->a, node->b, key, node->fanout);
            pairEntry &kp = node->pe_data[pred];
            if (kp.key == key) {
                return kp.ptr;
            } else if (kp.key == -1) {
                node = kp.child;
            } else if (kp.key == -2) {
                fan2Leaf *child = kp.fan2child;
                if (child->k1 == key) {
                    return child->p1;
                }
                if (child->k2 == key) {
                    return child->p2;
                }
                return -1;
            }
            else {
                return -1;
            }
        }
    }


    inline int range_query(const keyType &k1, const keyType &k2, recordPtr *ptrs) { return root->range_query(k1, k2, ptrs); }


    inline void bulk_load(const keyArray &keys, const recordPtrArray &ptrs, long n_keys){ //}, const string &mirror_dir, const string &layout_conf_path, int interval_type) {
        const int interval_type = 1;
        l_matrix mirror;
        build_ideal_mirror(keys, nullptr, n_keys, mirror, mirror_dir, interval_type);
    //    build_mirror(keys, nullptr, n_keys, mirror, mirror_dir, interval_type);

    //    cout << "----mirror.layout:------" << endl;
    //    for (size_t i = 0; i < mirror.size(); ++i) {
    //        cout << mirror[i].size() << " " << endl;
    //    }
    //    cout << endl;

        // cout << "Building " << name() << "......" << endl;
        build_from_mirror(mirror, keys, ptrs, n_keys);
    };//, const string &mirror_dir, const string &layout_conf_path, int interval_type=1);
    inline void bulk_load(const std::vector< pair<keyType, recordPtr> > &bulk_load_data){
        size_t N = bulk_load_data.size();
        keyArray keys = std::make_unique<keyType []>(N + 1);
        recordPtrArray ptrs = std::make_unique<recordPtr []>(N + 1);
        for (size_t i = 0; i < N; ++i) {
            keys[i] = bulk_load_data[i].first;
            ptrs[i] = bulk_load_data[i].second;
        }
        keys[N] = keys[N-1] + 1;
        ptrs[N] = -1;
        bulk_load(keys, ptrs, static_cast<long>(N));
    };
};



#endif //DILI_DILI_H
