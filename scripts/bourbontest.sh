rm -rf ../evaluation/bourbontest2/
mkdir ../evaluation/bourbontest2/

make -j




echo 'Without Fence' -w >> ../evaluation/bourbontest2/readres0718-bourbontest2.txt 
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 4 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 16 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 20 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 20 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 20 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

echo 'Original Bourbon' >> ../evaluation/bourbontest2/readres0718-bourbontest2.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

echo 'With Fence' >> ../evaluation/bourbontest2/readres0718-bourbontest2.txt 

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 2 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 14 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 14 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 15 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2048 -m 7 -w > ../evaluation/bourbontest2/err2_hit0.txt

