#!/bin/bash

function fun()
{
	if [ $1 == 0 ]
	then
		echo 1
	elif [ $1 == 1 ]
	then
		echo 2
	else
		echo $[`fun $[$1-2]` * `fun $[$1 - 1]` ]
	fi
}

fun $1
exit 1





