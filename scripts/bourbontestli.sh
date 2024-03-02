rm -rf ../evaluation/bourbontestli/

mkdir ../evaluation/bourbontestli/

make -j


./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 8 -e 64 -k 16 -v 64 -d /root/Bourbon/testdb/ --blocksize 4096 -m 7 --nofence 2 -w > ../evaluation/bourbontest0725/err2_hit0.txt