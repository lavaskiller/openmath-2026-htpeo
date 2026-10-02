#!/bin/bash
# Job H: resume the best weighted/uniform runs, 1024-block split tests, exact-verification loop.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" > $R/logs/$name.log 2>&1 & }
timeout 7000 $PY verify_loop.py 112 > $R/logs/V.log 2>&1 &
$PY split2.py $R/out/E4/best.json soft.npy 256 heavy  $R/in/s1.json s1_soft.npy   > $R/logs/split.log 2>&1
$PY split2.py $R/out/E5/best.json soft.npy 256 random $R/in/s2.json s2_soft.npy 1 >> $R/logs/split.log 2>&1
run E4 $R/in/e4a.json $R/out/E4 --minutes 110 --phase 25 --seed 54 --thi 0.002  --tlo 0.0003 --soft soft.npy    --compound 0.15,0.35,0.5,0.1 --wopt 10
run E5 $R/in/e5a.json $R/out/E5 --minutes 110 --phase 25 --seed 55 --thi 0.0015 --tlo 0.0002 --soft soft.npy    --compound 0.15,0.35,0.5,0.1
run S1 $R/in/s1.json  $R/out/S1 --minutes 110 --phase 25 --seed 56 --thi 0.002  --tlo 0.0003 --soft s1_soft.npy --compound 0.15,0.35,0.5,0.1 --wopt 10
run S2 $R/in/s2.json  $R/out/S2 --minutes 110 --phase 25 --seed 57 --thi 0.0015 --tlo 0.0002 --soft s2_soft.npy --compound 0.15,0.35,0.5,0.1
wait
exit 0
