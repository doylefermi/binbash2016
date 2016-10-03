#!/bin/bash



eval number_array=($(cat $1 | awk '{
					if($1!="CALL")
						print $1
					}'
			))

eval num_array_unique=($(echo "${number_array[@]}" | tr ' ' '\n' | sort -u)) 

#for each in "${num_array_unique[@]}"
#do
#	echo $each			
#done
#cat $1 | sed -e '1d;'

for each in "${num_array_unique[@]}"
do
  cat $1 | sed -e '1d;' | awk -v num="$each" '
  
  			BEGIN{
  				tm=0;
  				ts=0;
  				th=0;
  			}
  			{
  					if($1==num)
  					{
  						#print $1 " " $3;
  						split($3,t,":");
  						#print t[1]"\t"t[2];
  						tm=t[1]+tm;
  						ts=ts+t[2];
  						}
  			}
  			END{
  				
  				if(ts>59){
  					m=int(ts/60);
  					ts=ts%60;
  					tm=tm+m;
  				}
  				if(tm>59){
  					th=int(tm/60);
  					tm=tm%60;
  					
  				}
				printf num " ";
				if(th<10){
					printf  "0" th;
				}
				else{
					printf  th;
				}
				if(tm<10){
					printf ":" "0" tm;
				}
				else{
					printf ":" tm;
				}
				if(ts<10){
					printf ":" "0" ts;
				}
				else{
					printf ":" ts;
				}

  				
				printf "\n";
							
  			}'
done | sort -r -k2 | head -n5



