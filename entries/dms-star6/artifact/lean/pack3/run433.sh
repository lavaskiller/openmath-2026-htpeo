#!/bin/bash
# Build the star6 modules under Lean 4.33.1 + Mathlib v4.33.1 (prebuilt cache in .lake/packages, see setup.sh).
# Usage: bash run433.sh [Module ...]     (no argument: all modules, then Main.lean and the axiom audit)
# Each module is compiled with `lean -o` in import order, $JOBS (default 2) at a time; always exits 0,
# real status in build/build.log and build/build_report.json.
HERE="$(cd "$(dirname "$0")" && pwd)"
LEAN="${LEAN433:-$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean}"
EXTRA=""
for d in "$HERE"/.lake/packages/*/.lake/build/lib/lean; do EXTRA="$EXTRA:$d"; done
EXTRA="${EXTRA#:}"
ONLY=""
[ $# -gt 0 ] && ONLY="--only $*"
# deep kernel reductions (decide +kernel on the larger certificates) need more stack than the 8 MB default
ulimit -s 1048576 2>/dev/null
timeout "${WALL:-7000}" nice -n 10 python3 "$HERE/build_pkg.py" --lean "$LEAN" --src "$HERE/src" \
  --out "$HERE/build" --extra "$EXTRA" --jobs "${JOBS:-2}" --timeout "${TMO:-1500}" --leanargs "${LEANARGS:--j 1 --tstack=1048576}" $ONLY
exit 0
