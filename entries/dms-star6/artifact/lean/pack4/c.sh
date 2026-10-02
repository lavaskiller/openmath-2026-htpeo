#!/bin/bash
# usage: c.sh Module [Module ...]   compile src/<Module>.lean with Lean 4.33.1 against pack3's oleans + Mathlib v4.33.1
# output: build/<Module>.olean, build/<Module>.out (compiler output, "peak_anon_kb=.. elapsed_s=..", "rc=<exit code>");
# always exits 0.  On the project server run it memory-capped:  bash jc.sh Module
#   (= danus.ops.jobs star6 snarklean 6G -- bash c.sh Module)
# Watchdog: the compiler is killed (rc=137) if its private (anonymous) memory exceeds $DLIM kB (default 3.5 GB)
# or after $TMO seconds (default 1500), so that it can never push the machine into swap.
HERE="$(cd "$(dirname "$0")" && pwd)"
P3="${PACK3:-$HERE/../pack3}"
LEAN="${LEAN433:-$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean}"
LP="$HERE/build:$P3/build"
for d in "$P3"/.lake/packages/*/.lake/build/lib/lean; do LP="$LP:$d"; done
mkdir -p "$HERE/build"
for m in "$@"; do
  rm -f "$HERE/build/$m.out"
  cd "$HERE/src" || exit 0
  t0=$(date +%s); peak=0
  LEAN_PATH="$LP" nice -n 10 "$LEAN" -j 1 -o "$HERE/build/$m.olean" -i "$HERE/build/$m.ilean" "$m.lean" \
      > "$HERE/build/$m.tmp" 2>&1 &
  pid=$!
  while kill -0 $pid 2>/dev/null; do
    anon=$(awk '/^RssAnon/{print $2}' /proc/$pid/status 2>/dev/null); anon=${anon:-0}
    [ "$anon" -gt "$peak" ] && peak=$anon
    if [ "$anon" -gt "${DLIM:-3500000}" ] || [ $(( $(date +%s) - t0 )) -gt "${TMO:-1500}" ]; then
      kill -9 $pid 2>/dev/null; echo "watchdog: killed (anon=${anon} kB, $(( $(date +%s) - t0 )) s)" >> "$HERE/build/$m.tmp"
    fi
    sleep 1
  done
  wait $pid; rc=$?
  echo "peak_anon_kb=$peak elapsed_s=$(( $(date +%s) - t0 ))" >> "$HERE/build/$m.tmp"
  echo "rc=$rc" >> "$HERE/build/$m.tmp"
  mv "$HERE/build/$m.tmp" "$HERE/build/$m.out"
done
exit 0
