#!/bin/bash
# Job W: weight optimisation alone (is uniform a saddle on the seed colouring?)
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY wopt.py "$@" > $R/logs/$name.log 2>&1 & }
cp $R/out/C3/best.json $R/in/c3u.json
run W1 $R/in/seed.json $R/out/W1 --minutes 100 --pert 0.01 --seed 1
run W2 $R/in/seed.json $R/out/W2 --minutes 100 --pert 0.1  --seed 2
run W3 $R/in/seed.json $R/out/W3 --minutes 100 --pert 0.3  --seed 3
run W4 $R/in/c3u.json  $R/out/W4 --minutes 100 --pert 0    --seed 4
run W5 $R/in/seed.json $R/out/W5 --minutes 100 --pert 0.03 --seed 5 --eta 1 --fixed
wait
exit 0
