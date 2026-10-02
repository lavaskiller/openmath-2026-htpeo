#!/bin/bash
# `lake build` of the whole project (98 modules + Main) with one worker; output in lake_build.log. Exit 0 always.
# Mathlib must already be fetched (setup.sh); this script refuses to continue if lake starts compiling Mathlib.
HERE="$(cd "$(dirname "$0")" && pwd)"
export PATH="$HOME/.elan/bin:$PATH"
export LEAN_NUM_THREADS="${LEAN_NUM_THREADS:-1}"
cd "$HERE"
{
  date; lake --version
  timeout "${WALL:-7000}" nice -n 10 lake build 2>&1 &
  PID=$!
  while kill -0 $PID 2>/dev/null; do
    sleep 5
    if grep -q -E "Built (Mathlib|Batteries|Aesop|Qq)\." "$HERE/lake_build.log" 2>/dev/null; then
      echo "ABORT: lake started to compile a dependency from source"; pkill -P $PID; kill $PID; break
    fi
  done
  wait $PID; echo "lake build rc=$?"
  date
} > "$HERE/lake_build.log" 2>&1
exit 0
