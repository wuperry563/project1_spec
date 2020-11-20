L1VALUES=(16 32 64 128 256) 
L1DVALUES=(16 32 64 128 256) 
ASSO=(1 2 4 8) 
BLOCK=(32 64 128) 
for i in "${L1VALUES[@]}"
do
	for j in "${L1DVALUES[@]}"
	do
		if [[ $j+$i -le 256 ]] 
		then
		 for k in "${ASSO[@]}"
		 do
			
		 for l in "${BLOCK[@]}"
		 do 
			./extract.sh $i $j "" $k $k "" $l
		 done
		 done 
		fi
	done
done
