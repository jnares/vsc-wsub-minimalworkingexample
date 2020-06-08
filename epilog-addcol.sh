#!/bin/bash


dumpf() {
    echo $1 > tmp; cat $1 >> tmp;
    nl=($(wc -l tmp))
    cat tmp >> $2 ; echo $nl >> "l${2}";
}

# time it
start_time="$(date -u +%s.%N)"


if {}; then
#for i in *.sol; do
    name=${i%.*}
    nf=$(awk -F- '{print $1}' <<< $name)
    isof="job-getJchars-${nf}"
    statsf="job-all.stats"
    # retrieve number of solutions
    ns=$(grep "\-1" $i | wc -l)
    if ((ns>0)); then
	dumpf "${name}.des" $isof
	dumpf "${name}.jchar" $isof
	dumpf $i $isof
	echo ${ns} >> "nsols-${nf}"
    fi 
    echo "${name}.des" >> $statsf
    cat "${name}.stats" >> $statsf
    # clean up
    if [[ -s "${name}.sol" ]]; then
        rm "${name}.sol"
    fi
    rm "${name}.des" "${name}.jchar" $i
    rm "${name}.gen" "${name}.fix" "${name}.mps"
#done
fi

end_time="$(date -u +%s.%N)"
elapsed="$(bc <<<"$end_time-$start_time")"
echo "epilog time: ${elapsed}"
echo "epilog end_time: ${end_time}"
