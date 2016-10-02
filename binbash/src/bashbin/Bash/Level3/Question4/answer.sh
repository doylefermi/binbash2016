#!/bin/bash
for i in {1..32..1}
do
i=$((i*10))
awk -F "" -v p="$i" '{print $p}' $1 | tr -d '\n' 
done
