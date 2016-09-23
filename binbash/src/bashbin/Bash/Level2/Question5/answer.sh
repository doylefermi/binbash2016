#!/bin/bash
i=1
for i in {1..20..1}
do
    cat $1 | awk -v pat="$i:00" 'match($0, pat) {print $0}' | awk '{$1=$2=$3=$4=$5=""; print "Step '$i':"substr($0,6)}'
done
