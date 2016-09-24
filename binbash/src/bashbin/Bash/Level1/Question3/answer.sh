#!/bin/bash

total=0
count=0
for n in $*
	do
		count=$((count+1))
		total=$((total+n))
	done
echo "scale=2;$total/$count" | bc -l

