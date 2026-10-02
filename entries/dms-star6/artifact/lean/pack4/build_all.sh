#!/bin/bash
# Build every module of order.txt in order (one compiler process at a time, see c.sh), then copy the output of
# All.lean to axioms.log and write build/summary.txt.  Always exits 0.  On the project server:
#   cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 snarklean 6G -- /bin/bash <abs>/pack4/build_all.sh
HERE="$(cd "$(dirname "$0")" && pwd)"
bash "$HERE/c.sh" $(cat "$HERE/order.txt")
: > "$HERE/build/summary.txt"
for m in $(cat "$HERE/order.txt"); do
  echo "$m $(tail -n 2 "$HERE/build/$m.out" | tr '\n' ' ') errors=$(grep -c 'error' "$HERE/build/$m.out") sorry=$(grep -c 'sorry' "$HERE/build/$m.out")" >> "$HERE/build/summary.txt"
done
cp "$HERE/build/All.out" "$HERE/axioms.log"
exit 0
