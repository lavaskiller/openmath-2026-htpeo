#!/bin/bash
# pack5 build: compile the pack5 modules against the pack3 oleans (pack3/build) and the Mathlib v4.33.1 cache
# (pack3/.lake/packages).  pack3 is only read.  Usage: bash build5.sh [Module ...]   (default: both modules)
# Output: build/<Module>.olean, logs/<Module>.out (compiler output incl. the `#print axioms` lines, last line rc=<n>).
# On the project server run it memory-capped:
#   cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 dmscor 7G -- /bin/bash <abs>/pack5/build5.sh
HERE="$(cd "$(dirname "$0")" && pwd)"
P3="${PACK3:-$HERE/../pack3}"
LEAN="${LEAN433:-$HOME/.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean}"
P="$HERE/build:$P3/build"
for d in "$P3"/.lake/packages/*/.lake/build/lib/lean; do P="$P:$d"; done
MODS="$*"
[ -z "$MODS" ] && MODS="Star6Bounded Star6Corollaries Star6Equiv Star6Simple"
mkdir -p "$HERE/build" "$HERE/logs"
cd "$HERE/src"
for m in $MODS; do
  LEAN_PATH="$P" timeout "${TMO:-1500}" nice -n 10 "$LEAN" -j 1 "$m.lean" \
    -o "$HERE/build/$m.olean" -i "$HERE/build/$m.ilean" > "$HERE/logs/$m.out" 2>&1
  echo "rc=$?" >> "$HERE/logs/$m.out"
done
exit 0
