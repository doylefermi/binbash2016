#!/bin/bash
 url="https://maps.googleapis.com/maps/api/geocode/json?address="
 while read add 
 do
 	new=$(echo $add | tr ' ' '+');
 	newurl=$(echo $url+$new);
 	curl -s $newurl | grep -A1 -A2 -w "location" | grep -v "location" | tr -d ','
 done < $1 > lat.txt
 latlng=$(cat lat.txt | awk '
 		BEGIN{
 			lat=0;
 			long=0;
 		}
 		/lat/ {lat+=$3;}
 		/lng/ {long+=$3;}
 		
 		END{
 			printf lat","long;
 		}')
 revurl="https://maps.googleapis.com/maps/api/geocode/json?latlng="$latlng
 curl -s $revurl > inter.txt 
 ans=$(cat inter.txt | head -n50 | awk -F "," '/long_name/{print}' | awk '!a[$0]++' | awk -F ":" '{print $2}' | tr -d '"\n"')
 echo ${ans::-1}
