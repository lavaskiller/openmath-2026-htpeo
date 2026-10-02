#!/bin/bash
# usage: build.sh PROJECT_DIR LIB JOBS [first_layer] [last_layer] [scope|noscope]
# Compiles the modules listed in LIB/layers.txt layer by layer with JOBS parallel `lean` processes.
# Per-module log: PROJECT_DIR/logs/<module>.log (last line: time/memory); status: PROJECT_DIR/build_status.txt. Exit 0 always.
P=$(readlink -f "$1"); LIB=$2; J=${3:-4}; F=${4:-1}; L=${5:-99}
# 6th arg "noscope": do not wrap each lean in its own systemd scope (use inside a memory-capped job)
if [ "${6:-scope}" = scope ]; then export WRAP="systemd-run --user --scope -q -p MemoryMax=${MEM:-4G} -p MemorySwapMax=0"; else export WRAP=""; fi
export PATH=$HOME/.elan/bin:$PATH
cd "$P" || exit 0
mkdir -p logs .lake/build/lib/lean
LP=$(lake env printenv LEAN_PATH)
export LEAN_PATH="$LP"
one() {
  m=$1; f=${m//.//}; o=.lake/build/lib/lean/$f.olean
  mkdir -p "$(dirname "$o")"
  if [ -f "$o" ] && [ "$o" -nt "$f.lean" ]; then return 0; fi
  /usr/bin/time -f "TIME %es MAXRSS %MKB" $WRAP nice -n 10 timeout 3000 lean -o "$o" "$f.lean" > "logs/$m.log" 2>&1
  rc=$?
  echo "$m rc=$rc $(tail -1 logs/$m.log)" >> build_status.txt
  if [ $rc -ne 0 ]; then rm -f "$o"; fi
  return 0
}
export -f one
i=0
while read -r line; do
  i=$((i+1))
  [ $i -lt $F ] && continue
  [ $i -gt $L ] && break
  echo "layer $i start $(date -u +%H:%M:%S)" >> build_status.txt
  echo $line | tr ' ' '\n' | xargs -P "$J" -I{} bash -c 'one {}'
done < "$LIB/layers.txt"
echo "done layers $F..$L $(date -u +%H:%M:%S)" >> build_status.txt
exit 0
