#!/bin/bash
# Job I: 1024-block (768 + 256 twin halves) compound SA variants.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" --compound 0.15,0.35,0.5,0.1 > $R/logs/$name.log 2>&1 & }
$PY split2.py $R/out/F4/best.json soft.npy 256 heavy  $R/in/i1.json i1_soft.npy   > $R/logs/splitI.log 2>&1
$PY split2.py $R/out/G2/best.json soft.npy 256 random $R/in/i2.json i2_soft.npy 2 >> $R/logs/splitI.log 2>&1
cp $R/out/S2/best.json $R/in/i3.json
$PY split2.py $R/in/seed.json     soft.npy 256 random $R/in/i4.json i4_soft.npy 4 >> $R/logs/splitI.log 2>&1
$PY split2.py $R/out/E5/best.json soft.npy 256 random $R/in/i5.json i5_soft.npy 5 >> $R/logs/splitI.log 2>&1
run I1 $R/in/i1.json $R/out/I1 --minutes 110 --phase 25 --seed 61 --thi 0.002  --tlo 0.0003 --soft i1_soft.npy --wopt 10
run I2 $R/in/i2.json $R/out/I2 --minutes 110 --phase 35 --seed 62 --thi 0.0015 --tlo 0.0002 --soft i2_soft.npy
run I3 $R/in/i3.json $R/out/I3 --minutes 110 --phase 20 --seed 63 --thi 0.001  --tlo 0.0002 --soft s2_soft.npy --wopt 12 --wfirst
run I4 $R/in/i4.json $R/out/I4 --minutes 110 --phase 55 --seed 64 --thi 0.004  --tlo 0.0002 --soft i4_soft.npy
run I5 $R/in/i5.json $R/out/I5 --minutes 110 --phase 35 --seed 65 --thi 0.003  --tlo 0.0002 --soft i5_soft.npy
wait
exit 0
