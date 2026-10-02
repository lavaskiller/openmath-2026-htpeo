#!/bin/bash
# usage: bash ./lc.sh Name   -- compile ./Name.lean (Lean 4.33.1) against Mathlib + the star6 library oleans; olean -> ./build
HERE="$(cd "$(dirname "$0")" && pwd)"
P3=$HOME/danus-projects/star6/lean433/pack3
P4=$HOME/danus-projects/star6/lean433/pack4
LEAN=$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean
LP="$HERE/build:$P4/build:$P3/build"
for d in "$P3"/.lake/packages/*/.lake/build/lib/lean; do LP="$LP:$d"; done
mkdir -p "$HERE/build"
m="$1"
exec 9>"$HERE/.lock"; flock 9
cd "$HERE" && LEAN_PATH="$LP" timeout 1200 nice -n 10 "$LEAN" -j 1 -o "$HERE/build/$m.olean" -i "$HERE/build/$m.ilean" "$m.lean" 2>&1 | head -c 20000
echo "rc=${PIPESTATUS[0]}"
