rm -rf ../evaluation/tune/

mkdir ../evaluation/tune/

make -j

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 6 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err2_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 15 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err4_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 26 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err8_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err16_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err32_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err64_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 128 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err128_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 256 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err256_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 512 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err512_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 31 -e 1024 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/tune/err1024_hit100.txt