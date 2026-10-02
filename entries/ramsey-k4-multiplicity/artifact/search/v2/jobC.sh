#!/bin/bash
# Round C/D: fast SA. Usage: jobC.sh u | w
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
run() { name=$1; shift; timeout 7000 $PY sa.py "$@" > $R/logs/$name.log 2>&1 & }
if [ "$1" = u ]; then
run C1 $R/in/seed.json $R/out/C1 --minutes 110 --phase 105 --seed 1 --thi 0.05  --tlo 0.001
run C2 $R/in/seed.json $R/out/C2 --minutes 110 --phase 52  --seed 2 --thi 0.03  --tlo 0.001
run C3 $R/in/r3u.json  $R/out/C3 --minutes 110 --phase 52  --seed 3 --thi 0.015 --tlo 0.001
run C4 $R/in/r3u.json  $R/out/C4 --minutes 110 --phase 25  --seed 4 --thi 0.008 --tlo 0.0005
run C5 $R/in/seed.json $R/out/C5 --minutes 110 --phase 105 --seed 5 --thi 0.02  --tlo 0.002
else
run C6 $R/in/w3.json   $R/out/C6 --minutes 110 --phase 25  --seed 6 --thi 0.01  --tlo 0.001  --wopt 10
run C7 $R/in/w3.json   $R/out/C7 --minutes 110 --phase 50  --seed 7 --thi 0.02  --tlo 0.001  --wopt 10
run C8 $R/in/w3.json   $R/out/C8 --minutes 110 --phase 12  --seed 8 --thi 0.005 --tlo 0.0005 --wopt 8
run C9 $R/in/r3u.json  $R/out/C9 --minutes 110 --phase 105 --seed 9 --thi 0.03  --tlo 0.001
run C10 $R/in/w3.json  $R/out/C10 --minutes 110 --phase 25 --seed 10 --thi 0.003 --tlo 0.0003 --wopt 8
fi
wait
exit 0
