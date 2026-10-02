#!/bin/bash
# usage: jc.sh Module   launch c.sh as a memory-capped job (6G) and wait (at most $WAIT s, default 100) for its output
HERE="$(cd "$(dirname "$0")" && pwd)"
m="$1"; rm -f "$HERE/build/$m.out"
( cd ~/m_harness/harness && ~/.venvs/mh/bin/python -m danus.ops.jobs star6 snarklean 6G -- /bin/bash "$HERE/c.sh" "$m" )
for i in $(seq 1 "${WAIT:-100}"); do [ -f "$HERE/build/$m.out" ] && break; sleep 1; done
if [ -f "$HERE/build/$m.out" ]; then head -c "${HEADC:-3500}" "$HERE/build/$m.out"; echo; tail -n 1 "$HERE/build/$m.out"; else echo "still running"; fi
