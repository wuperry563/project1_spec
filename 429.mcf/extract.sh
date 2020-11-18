INPUT_FILE=./m5out/stats.txt

DMISS=$(grep "system.cpu.dcache.overall_miss_rate::cpu.data" $INPUT_FILE | awk '{print $2}')
IMISS=$(grep "system.cpu.icache.overall_miss_rate::total" $INPUT_FILE | awk '{print $2}')
L2MISS=$(grep "system.l2.overall_miss_rate::total" $INPUT_FILE | awk '{print $2}')
INSR=$(grep "sim_insts" $INPUT_FILE | awk '{print $2}')

echo $DMISS
echo $IMISS
echo $L2MISS
echo $INSR

echo "1+((($DMISS + $IMISS)*6 + ($L2MISS*50))/$INSR)" | bc -l

exit
