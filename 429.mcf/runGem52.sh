# -- an example to run SPEC 429.mcf on gem5, put it under 429.mcf folder --
export GEM5_DIR=/usr/local/gem5
export BENCHMARK=./src/benchmark
export ARGUMENT=./data/inp.in
time $GEM5_DIR/build/X86/gem5.opt \
-d ./m5out $GEM5_DIR/configs/example/se.py \
-c $BENCHMARK \
-o $ARGUMENT \
-I 5000000 \
--cpu-type=TimingSimpleCPU \
--caches \
--l2cache \
--l1d_size=${1:-128}kB \
--l1i_size=${2:-128}kB \
--l2_size=${3:-1}MB \
--l1d_assoc=${4:-2} \
--l1i_assoc=${5:-2} \
--l2_assoc=${6:-1} \
--cacheline_size=${7:-64}

