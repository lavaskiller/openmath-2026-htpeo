#!/bin/bash
# usage: build.sh PROJECT_DIR [JOBS] [module ...]
# Compiles the KobonCert modules with plain `lean -o` against an existing Mathlib build
# (no `lake build`, Mathlib is never rebuilt).  MATHLIB_PROJECT = a lake project directory whose
# .lake already contains Mathlib v4.33.1 (default: this project, after `lake exe cache get`).
# Run it inside a memory-capped job.  Per-module log: logs/<module>.log (last line: time, max RSS);
# status lines are appended to build_status.txt.  Exit code is always 0.
P=$(readlink -f "$1"); J=${2:-2}; shift; shift
export PATH=$HOME/.elan/bin:$PATH
MP=${MATHLIB_PROJECT:-$P}
LP=$(cd "$MP" && lake env printenv LEAN_PATH)
cd "$P" || exit 0
mkdir -p logs build
export LEAN_PATH="$P/build:$LP"
one() {
  m=$1; f=${m//.//}; o=build/$f.olean
  mkdir -p "$(dirname "$o")"
  # back off while the machine has less than MINAVAIL MB of available memory (at most 10 minutes)
  for _ in $(seq 120); do
    [ "$(awk '/MemAvailable/ {print int($2/1024)}' /proc/meminfo)" -ge "${MINAVAIL:-4000}" ] && break
    sleep 5
  done
  /usr/bin/time -f "TIME %es MAXRSS %MKB" nice -n 10 timeout ${TMO:-3400} lean -M ${LEANMEM:-2800} -o "$o" "$f.lean" > "logs/$m.log" 2>&1
  rc=$?
  echo "$m rc=$rc $(tail -1 logs/$m.log) $(date -u +%FT%TZ)" >> build_status.txt
  if [ $rc -ne 0 ]; then rm -f "$o"; fi
  return 0
}
export -f one
if [ $# -gt 0 ]; then
  for m in "$@"; do one "$m"; done
else
  one KobonCert.Defs
  one KobonCert.Data
  mods="$(cat KobonCert/chunks.txt) KobonCert.Geom"
  [ -f KobonCert/Simple.lean ] && mods="$mods KobonCert.Simple"
  echo $mods | tr ' ' '\n' | xargs -P "$J" -I{} bash -c 'one {}'
  one KobonCert.Faces
  one KobonCert.Cert
  one KobonCert.Main
  one KobonCert.Sanity
  one KobonCert.SanityB1
  one KobonCert.SanityB2
fi
echo "done $(date -u +%FT%TZ)" >> build_status.txt
exit 0
