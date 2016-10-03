#!/bin/bash
echo "CALL LOG OF $2"
cat $1 | awk -v number="$2" '{
		if($1==number)
			print $2 " OUTGOING " $3
		else if($2==number)
			print $1 " INCOMING " $3
		}' | sort -k3 -n

