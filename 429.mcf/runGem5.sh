# -- an example to run SPEC 429.mcf on gem5, put it under 429.mcf folder --
export GEM5_DIR=/home/perry/dev/gem5
export BENCHMARK=./src/benchmark
export ARGUMENT=./data/inp.in
time $GEM5_DIR/build/X86/gem5.opt \
-d $GEM5_DIR/m5out $GEM5_DIR/configs/example/se.py \
-c $BENCHMARK \
-o $ARGUMENT \
-I 500000000 \
--cpu-type=TimingSimpleCPU \
--caches \
--l2cache \
--l1d_size=128kB \
--l1i_size=128kB \
--l2_size=1MB \
--l1d_assoc=2 \
--l1i_assoc=2 \
--l2_assoc=4 \
--cacheline_size=64

