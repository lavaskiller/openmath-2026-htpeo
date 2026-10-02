#!/bin/bash
# Job B: fast SA (O(1) proposals) with reheating cycles.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" > $R/logs/$name.log 2>&1 & }
run B1 $R/in/seed.json $R/out/B1 --minutes 105 --phase 100 --seed 1 --thi 0.05 --tlo 0.002
run B2 $R/in/seed.json $R/out/B2 --minutes 105 --phase 30  --seed 2 --thi 0.03 --tlo 0.002
run B3 $R/in/r3u.json  $R/out/B3 --minutes 105 --phase 30  --seed 3 --thi 0.02 --tlo 0.002
run B4 $R/in/r3u.json  $R/out/B4 --minutes 105 --phase 15  --seed 4 --thi 0.01 --tlo 0.001
run B5 $R/in/w3.json   $R/out/B5 --minutes 105 --phase 15  --seed 5 --thi 0.01 --tlo 0.001 --wopt 10
wait
exit 0
