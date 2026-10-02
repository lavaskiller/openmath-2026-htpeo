#!/bin/bash
# Job D: SA with proposals concentrated on the soft orbits (those where flips happen).
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" > $R/logs/$name.log 2>&1 & }
cp $R/out/C3/best.json $R/in/c3u.json; cp $R/out/C2/best.json $R/in/c2u.json; cp $R/out/W4/best.json $R/in/w4.json
timeout 3000 $PY fracs.py $R/in/seed.json $R/in/r3u.json soft.npy soft_orbit.npy > $R/logs/D1.log 2>&1 &
run D2 $R/in/c3u.json $R/out/D2 --minutes 110 --phase 52 --seed 12 --thi 0.006 --tlo 0.0008 --soft soft.npy
run D3 $R/in/c2u.json $R/out/D3 --minutes 110 --phase 52 --seed 13 --thi 0.004 --tlo 0.0005 --soft soft.npy
run D4 $R/in/w4.json  $R/out/D4 --minutes 110 --phase 30 --seed 14 --thi 0.004 --tlo 0.0005 --soft soft.npy --wopt 10
run D5 $R/in/w4.json  $R/out/D5 --minutes 110 --phase 20 --seed 15 --thi 0.002 --tlo 0.0003 --soft soft.npy --wopt 10
wait
exit 0
