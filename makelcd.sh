#!/bin/sh
for FILE in `cat pngs.txt`;
do
./img2lcd.pl $FILE
done
