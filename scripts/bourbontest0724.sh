rm -rf ../evaluation/bourbontest0724/
mkdir ../evaluation/bourbontest0724/

make -j


# budget = 1280KB

echo 'Without Fence' -w >> ../evaluation/bourbontest0724/readres0718-bourbontest0724.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 9 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

echo 'Original Bourbon' >> ../evaluation/bourbontest0724/readres0718-bourbontest0724.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

echo 'With Fence' >> ../evaluation/bourbontest0724/readres0718-bourbontest0724.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 6 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 7 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 7 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 -w > ../evaluation/bourbontest0724/err2_hit0.txt