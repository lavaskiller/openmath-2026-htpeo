#!/bin/bash
# Job L: designed splits (per base block of 4 near-twins) + compound SA, adaptive weights.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" --compound 0.15,0.35,0.5,0.1 > $R/logs/$name.log 2>&1 & }
$PY split3.py $R/out/G2/best.json soft.npy A $R/in/l1.json l1_soft.npy 1 >  $R/logs/splitL.log 2>&1
$PY split3.py $R/out/G2/best.json soft.npy N $R/in/l2.json l2_soft.npy 1 >> $R/logs/splitL.log 2>&1
$PY split3.py $R/out/G2/best.json soft.npy B $R/in/l3.json l3_soft.npy 1 >> $R/logs/splitL.log 2>&1
$PY split3.py $R/out/E5/best.json soft.npy A $R/in/l5.json l5_soft.npy 2 >> $R/logs/splitL.log 2>&1
cp $R/out/I5/best.json $R/in/l4.json
run L1 $R/in/l1.json $R/out/L1 --minutes 110 --phase 30 --seed 81 --thi 0.003  --tlo 0.0003 --soft l1_soft.npy --wopt 20 --eta 8
run L2 $R/in/l2.json $R/out/L2 --minutes 110 --phase 30 --seed 82 --thi 0.0015 --tlo 0.0002 --soft l2_soft.npy
run L3 $R/in/l3.json $R/out/L3 --minutes 110 --phase 30 --seed 83 --thi 0.0015 --tlo 0.0002 --soft l3_soft.npy
run L4 $R/in/l4.json $R/out/L4 --minutes 110 --phase 20 --seed 84 --thi 0.001  --tlo 0.0002 --soft i5_soft.npy --wopt 20 --eta 8 --wfirst
run L5 $R/in/l5.json $R/out/L5 --minutes 110 --phase 30 --seed 85 --thi 0.004  --tlo 0.0003 --soft l5_soft.npy --wopt 20 --eta 8
wait
exit 0
