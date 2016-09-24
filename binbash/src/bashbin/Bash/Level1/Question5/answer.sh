#!/bin/bash

status="AM"
IFS=':' read -a time <<< "$1"
if [ ${time[0]} -ge 24 ] || [ ${time[1]} -ge 60 ]
then 
	echo "Invalid time"
	exit 1
elif [ ${time[0]} -gt 12 ]
then
	time[0]=`expr ${time[0]} - 12 `
	status="PM"
elif [ ${time[0]} == 12 ]
then 
	status="PM"
fi
while [[ ${#time[0]} -lt 2 ]] ; do
    time[0]="0${time[0]}"
done
echo "${time[0]}:${time[1]} $status"
