#!/bin/bash
# scratch runner: bash try.sh <file.lean>  -> <file>.out   (uses the oleans in build/ and Mathlib)
HERE="$(cd "$(dirname "$0")" && pwd)"
LEAN="$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean"
P="$HERE/build"
for d in "$HERE"/.lake/packages/*/.lake/build/lib/lean; do P="$P:$d"; done
for f in "$@"; do
  LEAN_PATH="$P" timeout 1500 nice -n 10 "$LEAN" "$f" > "${f%.lean}.out" 2>&1
  echo "rc=$?" >> "${f%.lean}.out"
done
exit 0
