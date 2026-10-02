#!/bin/bash
# usage: leancheck.sh /abs/path/File.lean   -- compiles one file against formal-conjectures (Lean 4.33.1 + Mathlib)
# at most 3 compilations at a time on this shared server; 20 min cap each
export PATH=$HOME/.elan/bin:$PATH
f=$(readlink -f "$1")
cd ~/erdos-fc/formal-conjectures || exit 2
for i in $(seq 1 600); do
  for s in 1 2 3; do
    exec 9>~/erdos-fc/.slot$s
    if flock -n 9; then
      nice -n 5 timeout 1200 lake env lean "$f"; rc=$?
      echo "leancheck rc=$rc"; exit $rc
    fi
  done
  sleep 5
done
echo "leancheck: no free slot"; exit 3
