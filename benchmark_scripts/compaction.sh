# Usage:
#   leveldb read test [OPTION...]

#   -n, --get_number arg         the number of gets (to be multiplied by 1024)
#                                (default: 1000)
#   -s, --step arg               the step of the loop of the size of db
#                                (default: 1)
#   -i, --iteration arg          the number of iterations of a same size
#                                (default: 1)
#   -m, --modification arg       if set, run our modified version, 7 fjle-model
#                                bourbon, 8 wiskey, 9 ours (default: 0)
#   -h, --help                   print help message
#   -d, --directory arg          the directory of db (default: /mnt/ssd/testdb)
#   -k, --key_size arg           the size of key (default: 16)
#   -v, --value_size arg         the size of value (default: 8)
#       --single_timing          print the time of every single get
#       --file_info              print the file structure info
#       --test_num_segments arg  test: number of segments per level (default:
#                                1)
#       --string_mode            test: use string or int in model
#       --file_model_error arg   error in file model (default: 8)
#       --level_model_error arg  error in level model (default: 1)
#   -f, --input_file arg         the filename of input file (default: "")
#       --blocksize arg          block size in SSTables (default: 4096)
#   -r, --read_file arg          the filename of read file (default: "")
#       --multiple arg           test: use larger keys (default: 1)
#   -w, --write                  writedb
#   -c, --uncache                evict cache
#   -u, --unlimit_fd             unlimit fd
#   -b, --bpk arg                bits per key (default: 10)
#   -e, --modelerror arg         bits per key (default: 8)
#   -x, --dummy                  dummy option
#   -l, --load_type arg          load type (default: 0)
#       --filter                 use filter
#       --mix arg                portion of writes in workload in 1000
#                                operations (default: 0)
#       --distribution arg       operation distribution (default: "")
#       --change_level_load      load level model
#       --change_file_load       enable level learning
#   -p, --pause                  pause between operation
#       --policy arg             learn policy (default: 0)
#       --YCSB arg               use YCSB trace (default: "")
#       --insert arg             insert new value (default: 0)
#       --modelmode arg          mm=0 plr, mm=1 lipp (default: 0)
#       --alexinterval arg       alex* (default: 1)
#       --dataset arg            name of dataset (default: 0)
#       --workload arg           name of workload (default: 0)
#       --exp arg                name of workload (default: 0)
#       --range arg              use range query and specify length (default:
#                                0)

data=random_insertonly_uniform


# 0:level 1:tier 2:lazylevel
compaction_policy=1
keysize=24
valuesize=1000
SST=67108864
buffersize=${SST}
blocksize=${SST}
# blocksize=2097152
# inputlen=6400001
inputlen=0

modelmode=0
# 6:leveldb+learn 7:bourbon 8:wisckey
MOD=6
bpk=10
db_loc=~/db_${data}_bpk_${bpk}_block_${blocksize}_policy_${compaction_policy}
# db_loc=~/db_load_test

cd build
make -j4
cd ..

# rm -rf ${db_loc}
# cp -r ${db_loc}_copy ${db_loc}
# ./build/read_cold -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b ${bpk} -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode ${modelmode} --dataset ${data} --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read_cold -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --inputlen 64000001 --compactionpolicy ${compaction_policy} -b ${bpk} -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode ${modelmode} --dataset ${data} --exp 0 -w |& tee ./log/64Mlongitude.log
# cp -r ${db_loc} ${db_loc}_copy
# rm -rf ${db_loc}
# cp -r ${db_loc}_copy ${db_loc}
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 0 --dataset ${data} --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read_cold -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --inputlen 64000000 --compactionpolicy ${compaction_policy} -b ${bpk} -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize 1024 --buffersize ${buffersize} -m 0 --modelmode ${modelmode} --dataset ${data} --exp 0 -w |& tee ./log/64Mlongitude.log

# for block in 1024 4096 16384 65536 262144 1048576 4194304 16777216 67108864; do
# ./build/read_cold -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --inputlen 64000001 --compactionpolicy ${compaction_policy} -b ${bpk} -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${block} --buffersize ${buffersize} -m 0 --modelmode ${modelmode} --dataset ${data} --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b ${bpk} -e 10 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${block} --buffersize ${buffersize} -m 0 --modelmode ${modelmode} --dataset ${data} --exp 0 -w |& tee ./log/64Mlongitude.log
# done


if true; then
# PLR
for error in 1 5 10 50 100 500 1000 5000 10000; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e $error -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 0 --dataset ${data} --workload 0 --exp 0 -w
done

# LIPP
for i in 1 2 5 10 50; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 1 --lippgap $i -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 1 --dataset ${data} --workload 0 --exp 0 -w 
done

# Fitting-tree
for i in 1 5 10 50 100 500 1000 5000 10000; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e $i -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 2 --dataset ${data} --workload 0 --exp 0 -w 
done


# RMI
for i in 10 50 100 500 1000 5000 10000 50000 100000; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 3 --rmisize $i -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 4 --dataset ${data} --workload 0 --exp 0 -w 
done

# RS
for i in 4 ; do
for error in 1 5 10 50 100 500 1000 5000 10000; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e $error --RSbits $i -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 5 --dataset ${data} --workload 0 --exp 0 -w 
done
done

# PLEX
for error in 1 5 10 50 100 500 1000 5000 10000; do
    rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e $error -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 6 --dataset ${data} --workload 0 --exp 0 -w 
done

# DILI
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 1 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 7 --dataset ${data} --workload 0 --exp 0 -w 

# ALEX
for i in 1000; do
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 1 --alexnodesize $i -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 8 --dataset ${data} --workload 0 --exp 0 -w 
done





# PGM
rm -rf ${db_loc}
cp -r ${db_loc}_copy ${db_loc}
./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat --compactionpolicy ${compaction_policy} -b $bpk -e 3 -k ${keysize} -v ${valuesize} -d ${db_loc} --SST ${SST} --blocksize ${blocksize} --buffersize ${buffersize} -m $MOD --modelmode 3 --dataset ${data} --workload 0 --exp 0 -w 
fi


