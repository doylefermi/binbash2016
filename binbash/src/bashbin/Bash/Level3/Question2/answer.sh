#!/bin/bash
curl -s $1 | tr "\t\r\n'" '   "' | grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | sed -e 's/^.*"\([^"]\+\)".*$/\1/g' | grep -v google | grep -v youtube | grep -v blogger | awk -F "/" '{print $3}' | sort -d | uniq
#while read line
#do
#ping -c1 $line | awk '/PING/ {print $3}' | tr -d \(\)
#done < file4.txt
