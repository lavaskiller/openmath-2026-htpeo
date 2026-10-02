#!/bin/bash
# Job K: verify loop + weight experiments on 1024-block solutions.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
timeout 7000 $PY verify_loop.py 112 > $R/logs/V.log 2>&1 &
cp $R/out/I5/best.json $R/in/k1.json; cp $R/out/I2/best.json $R/in/k2.json
( $PY reshape.py $R/in/k1.json $R/in/i5.json $R/in/k1eq.json > $R/logs/reshape.log 2>&1 ; timeout 6000 $PY wopt.py $R/in/k1eq.json $R/out/KW3 --minutes 90 --pert 0 --eta 8 > $R/logs/KW3.log 2>&1 ) &
timeout 7000 $PY wopt.py $R/in/k1.json $R/out/KW1 --minutes 100 --pert 0 --eta 8 > $R/logs/KW1.log 2>&1 &
timeout 7000 $PY wopt.py $R/in/k2.json $R/out/KW2 --minutes 100 --pert 0 --eta 32 > $R/logs/KW2.log 2>&1 &
timeout 7000 $PY sa.py $R/in/s2.json $R/out/S2 --minutes 100 --phase 25 --seed 77 --thi 0.001 --tlo 0.0002 --soft s2_soft.npy --compound 0.15,0.35,0.5,0.1 > $R/logs/S2b.log 2>&1 &
wait
exit 0
