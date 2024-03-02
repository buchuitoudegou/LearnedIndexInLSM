rm -rf ../evaluation/nofence/

mkdir ../evaluation/nofence/

make -j

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 2 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 2 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 2 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 2 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 2 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err2_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 25 -e 4 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err4_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 37 -e 8 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err8_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 42 -e 16 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err16_hit100.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 43 -e 32 -k 128 -v 64 -d /root/Bourbon/testdb/ --blocksize 2097152 -m 7 -w > ../evaluation/nofence/err32_hit100.txt

