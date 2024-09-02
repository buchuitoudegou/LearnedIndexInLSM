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

app=./build/read
data=random_readonly_uniform
# data=longitude_readonly_uniform
data=random_ycsba
modelmode=1
MOD=7
file_model_error=4
bpk=10

cd build
make -j4
cd ..

# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w 
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 2 --dataset 0 --workload 0 --exp 0 -w 
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 3 --dataset 0 --workload 0 --exp 0 -w 
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 5 --dataset 0 --workload 0 --exp 0 -w 
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 6 --dataset 0 --workload 0 --exp 0 -w 

# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 3 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 3 --dataset 0 --workload 0 --exp 0 -w 

# RMI
# for j in `seq 1 5`; do
# for i in 50 100 500 1000 5000 10000 50000 100000; do
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 3 --rmisize $i -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 4 --dataset 0 --workload 0 --exp 0 -w 
# done
# done


# PGM
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 3 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 3 --dataset 0 --workload 0 --exp 0 -w 

# RS
# for error in 5000; do
# for i in 4; do
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e $error --RSbits $i -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 5 --dataset 0 --workload 0 --exp 0 -w 
# done
# done

# LIPP
# for i in 20; do
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1 --lippgap $i -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 1 --dataset 0 --workload 0 --exp 0 -w 
# done

# Fitting-tree
# for i in 1 2 4 8; do
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e $i -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 2 --dataset 0 --workload 0 --exp 0 -w 
# done

# DILI
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 7 --dataset 0 --workload 0 --exp 0 -w 

# ALEX
# for i in 1000000 10000000 100000000 ; do
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1 --alexnodesize $i -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 8 --dataset 0 --workload 0 --exp 0 -w 
# done

# for i in 0 5 6; do
#     for j in 1 10 100 1000 10000; do
#         ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e $j -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode $i --dataset 0 --workload 0 --exp 0 -w 
#     done
# done

# PLR
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 10 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 100 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1000 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
valgrind --log-file="valgrind_log.txt" --leak-check=yes ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 10 -k 16 -v 64 -d ~/db/ --blocksize 2097152 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w | tee ./log/64Mlongitude.log


# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 1 -k 16 -v 64 -d ~/db/ --blocksize 2097152 --buffersize 4194304 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 10 -k 16 -v 64 -d ~/db/ --blocksize 2097152 --buffersize 269177824 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
# ./build/read -f ~/DataGenerator/output_dat/${data}_datset.dat -r ~/DataGenerator/output_dat/${data}_query.dat -b $bpk -e 100 -k 16 -v 64 -d ~/db/ --blocksize 2097152 --buffersize 280159624 -m $MOD --modelmode 0 --dataset 0 --workload 0 --exp 0 -w |& tee ./log/64Mlongitude.log
