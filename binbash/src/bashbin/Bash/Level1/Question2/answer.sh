#!/bin/bash

#Level1_Question2
#Print the no of even integers in between 0 and n
#0 and n are included in the range
#User is required to enter the value of n as a comand line argument
if [ -z ${1+x} ];
	then echo "No Input."
elif [[ $1 -lt 0 ]];
	then 
		ans=$(($1/2))
		ans=$((ans*-1))
		ans=$((ans+1))
		echo $ans
		
elif [[ $1 -ge 0 ]];
	then
		ans=$(($1/2))
		ans=$((ans+1))
		echo $ans
else
    echo "Invalid Input."
fi
