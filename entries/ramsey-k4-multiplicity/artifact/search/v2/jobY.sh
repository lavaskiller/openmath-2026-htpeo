#!/bin/bash
# Job Y: basin hopping (SA phase -> quench -> L-BFGS weight refit of the end state). Usage: jobY.sh 0|1
export OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1
R=$HOME/ramsey; PY=$HOME/.venvs/mh/bin/python
cd $R/v2
M=${2:-95}
run() { name=$1; shift; timeout 6300 $PY sa.py "$@" --minutes $M --compound 0.15,0.35,0.5,0.1 --wopt 40 --eta 8 --wend > $R/logs/$name.log 2>&1 & }
if [ "$1" = 0 ]; then
cp $R/out/N3a/best.json $R/in/y_m1.json; cp $R/out/N3c/best.json $R/in/y_m2.json; cp $R/out/N4h/best.json $R/in/y_l2.json; cp $R/out/XT2/best.json $R/in/y_x2.json
timeout 6300 $PY verify_loop.py $((M+4)) >> $R/logs/V.log 2>&1 &
run Y1 $R/in/y_m1.json $R/out/Y1 --soft m1_soft.npy --seed 201 --phase 15 --thi 0.004 --tlo 0.0003
run Y2 $R/in/y_m1.json $R/out/Y2 --soft m1_soft.npy --seed 202 --phase 10 --thi 0.002 --tlo 0.0003
run Y3 $R/in/y_m1.json $R/out/Y3 --soft m1_soft.npy --seed 203 --phase 20 --thi 0.006 --tlo 0.0003
run Y4 $R/in/y_m2.json $R/out/Y4 --soft m2_soft.npy --seed 204 --phase 15 --thi 0.004 --tlo 0.0003
else
sleep 20
run Y5 $R/in/y_m1.json $R/out/Y5 --soft m1_soft.npy --seed 205 --phase 12 --thi 0.003 --tlo 0.0003
run Y6 $R/in/y_m2.json $R/out/Y6 --soft m2_soft.npy --seed 206 --phase 10 --thi 0.002 --tlo 0.0003
run Y7 $R/in/y_l2.json $R/out/Y7 --soft l2_soft.npy --seed 207 --phase 15 --thi 0.004 --tlo 0.0003
run Y8 $R/in/y_l2.json $R/out/Y8 --soft l2_soft.npy --seed 208 --phase 10 --thi 0.002 --tlo 0.0003
run Y9 $R/in/y_x2.json $R/out/Y9 --soft XT2_soft.npy --seed 209 --phase 15 --thi 0.004 --tlo 0.0003
fi
wait
exit 0
