#!/bin/bash
# Job M: mode-N designed splits from other bases, weighted continuation of L2, verify loop.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" --compound 0.15,0.35,0.5,0.1 > $R/logs/$name.log 2>&1 & }
timeout 7000 $PY verify_loop.py 112 > $R/logs/V.log 2>&1 &
$PY split3.py $R/out/E5/best.json soft.npy N $R/in/m1.json m1_soft.npy 3 >  $R/logs/splitM.log 2>&1
$PY split3.py $R/out/G1/best.json soft.npy N $R/in/m2.json m2_soft.npy 4 >> $R/logs/splitM.log 2>&1
$PY split3.py $R/in/seed.json     soft.npy N $R/in/m3.json m3_soft.npy 5 >> $R/logs/splitM.log 2>&1
cp $R/out/L2/best.json $R/in/m4.json
run M1 $R/in/m1.json $R/out/M1 --minutes 110 --phase 30 --seed 91 --thi 0.0015 --tlo 0.0002 --soft m1_soft.npy
run M2 $R/in/m2.json $R/out/M2 --minutes 110 --phase 30 --seed 92 --thi 0.0015 --tlo 0.0002 --soft m2_soft.npy
run M3 $R/in/m3.json $R/out/M3 --minutes 110 --phase 55 --seed 93 --thi 0.004  --tlo 0.0002 --soft m3_soft.npy
run M4 $R/in/m4.json $R/out/M4 --minutes 110 --phase 20 --seed 94 --thi 0.001  --tlo 0.0002 --soft l2_soft.npy --wopt 25 --eta 8 --wfirst
wait
exit 0
