rm -rf ../evaluation/blocksize/

mkdir ../evaluation/blocksize/

make -j


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/2048.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/2048.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/2048.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/2048.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1024 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/1024.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 4096 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/2048.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 16384 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/4096.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 65536 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 262144 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 1048576 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/8192.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 --blocksize 2097152 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/blocksize/16384.txt