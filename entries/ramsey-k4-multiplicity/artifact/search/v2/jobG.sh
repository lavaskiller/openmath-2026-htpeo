#!/bin/bash
# Job G: compound-move SA, alternating-cycle filter (10% of non-alternating kept), low temperatures.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" --soft soft.npy > $R/logs/$name.log 2>&1 & }
run F3 $R/in/e5a.json  $R/out/F3 --minutes 110 --phase 25 --seed 43 --thi 0.0015 --tlo 0.0002 --compound 0.15,0.35,0.5,0.1 --wopt 10
run F4 $R/in/e4a.json  $R/out/F4 --minutes 110 --phase 25 --seed 44 --thi 0.003  --tlo 0.0003 --compound 0.2,0.4,0.4,0.1 --wopt 10
run G1 $R/in/seed.json $R/out/G1 --minutes 110 --phase 36 --seed 45 --thi 0.004  --tlo 0.0002 --compound 0.2,0.4,0.4,0.1
run G2 $R/in/seed.json $R/out/G2 --minutes 110 --phase 36 --seed 46 --thi 0.003  --tlo 0.0002 --compound 0.1,0.3,0.6,0.05
run G3 $R/in/seed.json $R/out/G3 --minutes 110 --phase 36 --seed 47 --thi 0.006  --tlo 0.0003 --compound 0.2,0.4,0.4,0.1 --wopt 10
wait
exit 0
