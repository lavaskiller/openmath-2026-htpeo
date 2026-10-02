#!/bin/bash
# Job F: compound-move SA at low temperature, wider soft sets, weighted variants.
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" > $R/logs/$name.log 2>&1 & }
cp $R/out/E5/best.json $R/in/e5a.json; cp $R/out/E4/best.json $R/in/e4a.json
run F1 $R/in/c3u.json $R/out/F1 --minutes 110 --phase 35 --seed 31 --thi 0.002  --tlo 0.0002 --soft soft2.npy --compound 0.2,0.4,0.4
run F2 $R/in/c3u.json $R/out/F2 --minutes 110 --phase 35 --seed 32 --thi 0.002  --tlo 0.0002 --soft soft3.npy --compound 0.2,0.4,0.4
run F3 $R/in/e5a.json $R/out/F3 --minutes 110 --phase 25 --seed 33 --thi 0.0015 --tlo 0.0002 --soft soft2.npy --compound 0.15,0.35,0.5 --wopt 10 --wfirst
run F4 $R/in/e4a.json $R/out/F4 --minutes 110 --phase 25 --seed 34 --thi 0.003  --tlo 0.0003 --soft soft.npy  --compound 0.2,0.4,0.4 --wopt 10
run F5 $R/in/seed.json $R/out/F5 --minutes 110 --phase 55 --seed 35 --thi 0.004 --tlo 0.0003 --soft soft2.npy --compound 0.2,0.4,0.4
wait
exit 0
