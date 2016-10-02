#!/bin/bash
while read line
do
#IFS=. read -r a b c d <<< "$line"
printf "%08d\n" $(bc <<<"obase=2; ${line//./;}") >> binary.txt
done < $1
cat binary.txt | tr -d "\n"
