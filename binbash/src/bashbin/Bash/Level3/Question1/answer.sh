#!/bin/bash
curl -s $1 | awk '/<p>/ {print $0}' > page.txt
grep "<a href" page.txt | sed "s:<a href:\\n<a href:g" | sed 's:\":\"><\/a>\n:2'  | grep href | uniq | awk -F "\"" '/<a href="\/wiki\/.*"/ {print $2}'  > link.txt
cat link.txt | sed 's_\/wiki\/_https:\/\/en.wikipedia.org\/wiki\/_g' 
