rm -rf ../evaluation/bpktest/

mkdir ../evaluation/bpktest/

make -j

sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'

echo 'leveldb: b=1 e=2' > ../evaluation/bpktest/readres0620-bpktest.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err2_hit100.txt


sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
echo 'leveldb: b=6 e=4' >> ../evaluation/bpktest/readres0620-bpktest.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 6 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err4_hit100.txt


sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
echo 'leveldb: b=20 e=8' >> ../evaluation/bpktest/readres0620-bpktest.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 20 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err8_hit100.txt


sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
echo 'leveldb: b=23 e=16' >> ../evaluation/bpktest/readres0620-bpktest.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 23 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit100.txt


sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
echo 'leveldb: b=24 e=32' >> ../evaluation/bpktest/readres0620-bpktest.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 24 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 6 -w > ../evaluation/bpktest/err16_hit100.txt

