rm -rf ../evaluation/nofenceli/

mkdir ../evaluation/nofenceli/

make -j

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 1 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 3 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 5 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 6 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 7 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 9 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 10 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 11 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 12 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 24 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 2028 -m 6 -w > ../evaluation/nofenceli/err2_hit0.txt
