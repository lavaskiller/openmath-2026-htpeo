#!/bin/bash
# Fetch Mathlib v4.33.1 and its prebuilt olean cache (download only, no compilation of Mathlib).
HERE="$(cd "$(dirname "$0")" && pwd)"
export PATH="$HOME/.elan/bin:$PATH"
cd "$HERE"
{
  date
  lake --version
  timeout 3000 lake update 2>&1
  echo "lake update rc=$?"
  timeout 3000 lake exe cache get 2>&1 | tail -n 40
  echo "cache get rc=${PIPESTATUS[0]}"
  ls .lake/packages
  find .lake/packages/mathlib/.lake/build/lib -name '*.olean' | wc -l
  du -sh .lake
  date
} > "$HERE/setup.log" 2>&1
echo done >> "$HERE/setup.log"
exit 0
