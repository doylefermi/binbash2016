#!/bin/bash
ip=$(sed 's/\([01]\{8\}\)\([01]\{8\}\)\([01]\{8\}\)\([01]\{8\}\)/\1.\2.\3.\4/' $1)
var=$(printf "%d." $(bc <<<"ibase=2; ${ip//./;}")) 
echo "${var::-1}"
a=$(echo $var | awk -F "." '{print $1}')
if [ $a -ge 1 -a $a -le 127 ]
then 
	echo "Class A"
elif [ $a -ge 128 -a $a -lt 191 ]
then 
	echo "Class B"
elif [ $a -ge 192 -a $a -lt 223 ]
then 
	echo "Class C"
elif [ $a -ge 224 -a $a -lt 239 ]
then 
	echo "Class D"
elif [ $a -ge 240 -a $a -lt 254 ]
then 
	echo "Class E"
fi
