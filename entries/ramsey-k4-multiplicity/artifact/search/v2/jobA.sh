#!/bin/bash
# Job A: uniform-weight tabu from the old best and from the seed, plus one weighted alternation.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY run.py "$@" > $R/logs/$name.log 2>&1 & }
run A1 $R/in/r3u.json  $R/out/A1 --minutes 112 --phase 200 --seed 1 --tlo 10 --thi 30
run A2 $R/in/r3u.json  $R/out/A2 --minutes 112 --phase 200 --seed 2 --tlo 50 --thi 150
run A3 $R/in/seed.json $R/out/A3 --minutes 112 --phase 200 --seed 3 --tlo 20 --thi 60
run A4 $R/in/seed.json $R/out/A4 --minutes 112 --phase 200 --seed 4 --tlo 100 --thi 300
run A5 $R/in/w3.json   $R/out/A5 --minutes 112 --phase 15 --seed 5 --tlo 20 --thi 60 --wopt 12 --restart
wait
exit 0
