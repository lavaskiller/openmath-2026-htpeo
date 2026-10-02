#!/bin/bash
# Job E: SA with compound moves (rotations, 4-cycle switches) on the soft pairs.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" --soft soft.npy --compound 0.2,0.4,0.4 > $R/logs/$name.log 2>&1 & }
run E1 $R/in/c3u.json  $R/out/E1 --minutes 110 --phase 50  --seed 21 --thi 0.006 --tlo 0.0005
run E2 $R/in/c3u.json  $R/out/E2 --minutes 110 --phase 50  --seed 22 --thi 0.02  --tlo 0.001
run E3 $R/in/seed.json $R/out/E3 --minutes 110 --phase 105 --seed 23 --thi 0.03  --tlo 0.001
run E4 $R/in/w4.json   $R/out/E4 --minutes 110 --phase 30  --seed 24 --thi 0.006 --tlo 0.0005 --wopt 10
run E5 $R/in/c3u.json  $R/out/E5 --minutes 110 --phase 25  --seed 25 --thi 0.002 --tlo 0.0002
wait
exit 0
