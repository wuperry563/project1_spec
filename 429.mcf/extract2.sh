sh ./runGem52.sh $1 $2 $3 $4 $5 $6 $7

INPUT_FILE=./m5out/stats.txt

DMISS=$(grep "system.cpu.dcache.overall_misses::total" $INPUT_FILE | awk '{print $2}')
IMISS=$(grep "system.cpu.icache.overall_misses::total" $INPUT_FILE | awk '{print $2}')
L2MISS=$(grep "system.l2.overall_misses::total" $INPUT_FILE | awk '{print $2}')
INSR=$(grep "sim_insts" $INPUT_FILE | awk '{print $2}')

echo $DMISS
echo $IMISS
echo $L2MISS
echo $INSR

L1CYCLE=`python -c "print(($IMISS+$DMISS)*6)"`
L2CYCLE=`python -c "print($L2MISS*50)"`
CPICACHE=`python -c "print(($L1CYCLE+$L2CYCLE)/$INSR.0)"`
echo $L1CYCLE lmao
echo $L2CYCLE lmao
echo $CPICACHE lmao

CPI=`python -c "print(1.0 + $CPICACHE)"`

echo "DMISS:$DMISS
l1d_size ${1:-128}kB 
l1i_size ${2:-128}kB 
l2_size ${3:-1}MB 
l1d_assoc ${4:-2} 
l1i_assoc ${5:-2} 
l2_assoc ${6:-4} 
cacheline_size ${7:-64}
CPI $CPI" >> out2.txt


exit
