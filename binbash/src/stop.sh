redis-cli shutdown
for i in $(ps aux | grep manage | awk '{print $2}');do sudo kill -9 $i; done
