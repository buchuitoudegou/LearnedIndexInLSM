rm -rf ../evaluation/bourbontest0723/
mkdir ../evaluation/bourbontest0723/

make -j


# budget = 640KB

echo 'Without Fence' -w >> ../evaluation/bourbontest0723/readres0718-bourbontest0723.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 4 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 5 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

echo 'Original Bourbon' >> ../evaluation/bourbontest0723/readres0718-bourbontest0723.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 2 -e 14 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

echo 'With Fence' >> ../evaluation/bourbontest0723/readres0718-bourbontest0723.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 2 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 2 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 3 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest0723/err2_hit0.txt