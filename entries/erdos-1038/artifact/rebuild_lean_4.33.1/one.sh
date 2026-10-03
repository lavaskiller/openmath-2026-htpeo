#!/bin/bash
# usage: one.sh Module   -- compile LeanProject/Module.lean to build/LeanProject/Module.olean
# against the existing Mathlib v4.33.1 build of /home/lead/ramsey/lean/final (read-only).
# Memory: Lean's own -M check counts file-mapped .olean pages (about 3.3 GB here for Mathlib imports), so it is
# set high (LEANMEM) and the real limit is a watchdog on the process's anonymous memory (ANONMAX MB, default
# 3300): the process is killed (rc 137, "E3_ANON_LIMIT" in the log) before the job's 4G cgroup would OOM.
# Threads: LEANTHREADS (default 2) to stay within the CPU share given to this helper.
m=$1
cd "$(dirname "$(readlink -f "$0")")" || exit 1
export PATH=$HOME/.elan/bin:$PATH
[ -f .leanpath ] || (cd /home/lead/ramsey/lean/final && lake env printenv LEAN_PATH) > .leanpath
export LEAN_PATH="$PWD/build:$(cat .leanpath)"
mkdir -p logs build/LeanProject
for _ in $(seq 120); do
  [ "$(awk '/MemAvailable/ {print int($2/1024)}' /proc/meminfo)" -ge 4000 ] && break
  sleep 5
done
/usr/bin/time -f "TIME %es MAXRSS %MKB" nice -n 10 timeout ${TMO:-7200} \
  lean +leanprover/lean4:v4.33.1 -j ${LEANTHREADS:-2} -M ${LEANMEM:-12000} \
  -DrelaxedAutoImplicit=false -DmaxSynthPendingDepth=3 -Dpp.unicode.fun=true \
  -Dweak.linter.mathlibStandardSet=true \
  -o "build/LeanProject/$m.olean" "LeanProject/$m.lean" > "logs/$m.log" 2>&1 &
bg=$!
peak=0
while kill -0 $bg 2>/dev/null; do
  lp=$(pgrep -f -- "-o build/LeanProject/$m.olean LeanProject/$m.lean" | while read p; do
         [ "$(cat /proc/$p/comm 2>/dev/null)" = "lean" ] && echo $p; done | head -1)
  if [ -n "$lp" ]; then
    a=$(awk '/RssAnon/ {print int($2/1024)}' /proc/$lp/status 2>/dev/null)
    [ -n "$a" ] && [ "$a" -gt "$peak" ] && peak=$a
    if [ -n "$a" ] && [ "$a" -gt "${ANONMAX:-3300}" ]; then
      kill "$lp"; echo "E3_ANON_LIMIT: killed at RssAnon=${a}MB > ${ANONMAX:-3300}MB" >> "logs/$m.log.watchdog"
    fi
  fi
  sleep 2
done
wait $bg
rc=$?
echo "$m rc=$rc $(tail -1 logs/$m.log) PEAKANON ${peak}MB $(cat logs/$m.log.watchdog 2>/dev/null | tail -1) $(date -u +%FT%TZ)" >> build_status.txt
rm -f "logs/$m.log.watchdog"
if [ $rc -ne 0 ]; then rm -f "build/LeanProject/$m.olean"; fi
exit $rc
