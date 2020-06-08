#!/bin/bash

start_time="$(date -u +%s.%N)"
echo "prolog start_time: ${start_time}"
python disentangle-files.py inputaddcol
# and here prepare the files for PBS batch submission
#desfiles="desfiles.txt"
#> $desfiles
#echo "desfile" > $desfiles
cnt=0
for i in *.des; do
#    echo "\"$i"\" >> $desfiles
    cnt=$((cnt+1))
done
echo $cnt > njobs
end_time="$(date -u +%s.%N)"
elapsed="$(bc <<<"$end_time-$start_time")"
echo "prolog time: ${elapsed}"
