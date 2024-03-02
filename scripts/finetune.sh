rm -rf ../evaluation/finetune/

mkdir ../evaluation/finetune/

make -j

echo 'tuned: b=1 e=2' > ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 1 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit100.txt


echo 'untuned: b=10 e=2' -w >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 2 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err2_hit100.txt


echo 'tuned: b=10 e=4' >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit100.txt

echo 'untuned: b=10 e=4' -w >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 4 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err4_hit100.txt

echo 'tuned: b=21 e=8' >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 21 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit100.txt

echo 'untuned: b=10 e=8' -w >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 8 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err8_hit100.txt

echo 'tuned: b=26 e=16' >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 26 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit100.txt

echo 'untuned: b=10 e=16' -w >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 16 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit100.txt

echo 'tuned: b=26 e=32' >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 26 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit100.txt

echo 'untuned: b=10 e=32' -w >> ../evaluation/finetune/readres0611-finetune.txt

./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate0_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit0.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate20_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit20.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate40_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit40.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate60_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit60.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate80_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit80.txt
./read_cold -f /root/Bourbon/dataset/seg10/10%_1000000_write.txt -r /root/Bourbon/dataset/seg10/10%_1000000_rate100_read.txt -b 10 -e 32 -k 16 -v 64 -d /root/Bourbon/testdb/ -m 7 -w > ../evaluation/finetune/err16_hit100.txt