#!/bin/sh
if [ $# -eq 0 ]; then
    echo "Usage: gif2an1 filename.gif [miliseconds between frames]\nExample: gif2an1 nyancat.gif 50"
    exit 1
fi
if [ $# -eq 1 ]; then
    echo "Number of miliseconds to wait between frames is missing!\nUsage: gif2an1 filename.gif [miliseconds between frames]\nExample: gif2an1 "$1" 50"
    exit 1
fi
sh ./makepngs.sh $1
ls $1*.png | cat > pngs.txt
sh ./makelcd.sh
rm pngs.txt
rm $1*.png
ls $1*.lcd | cat > lcds.txt
tr '\n' ' ' < lcds.txt | cat > makean1.tmp
sed -i 's/ / '$2' /g' makean1.tmp
echo './lcd2an1.pl -v '$1'.an1 \' > makean1prep.sh
cat makean1.tmp >> makean1prep.sh
echo ' && rm '$1'*.lcd && rm lcds.txt && rm makean1prep.sh
find . -type f -name '*.gif.*' | while read FILE ; do
  newfile="$(echo ${FILE} |sed -e 's/.gif//')" ;
  mv "${FILE}" "${newfile}" ;
done' >> makean1prep.sh
rm makean1.tmp
echo "Now edit and then run sh makean1prep.sh"
