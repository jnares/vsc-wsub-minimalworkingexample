#/bin/bash

nf=$(awk -F- '{print $3}' <<< $1)
reverse="${1}-filenames"
for i in `cat $1 | grep des`; do
    echo "\"$i\"" >> $reverse
done

