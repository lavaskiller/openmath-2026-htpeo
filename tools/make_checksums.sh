#!/usr/bin/env bash
# Write or verify SHA256SUMS for one entry's artifact.
#
#   tools/make_checksums.sh write  entries/<name>     # (re)writes entries/<name>/artifact/SHA256SUMS
#   tools/make_checksums.sh verify entries/<name>     # sha256sum -c, prints only failures and a summary
#
# The list covers every regular file under artifact/ except SHA256SUMS itself,
# with paths relative to artifact/, sorted bytewise (LC_ALL=C), binary mode.
# `write` refuses to overwrite an existing SHA256SUMS unless FORCE=1 is set:
# a list that came with a submitted artifact must not be replaced silently.
# Nested SHA256SUMS files (written by the original build machine, possibly
# relative to another directory) are treated as ordinary files.
set -euo pipefail
export LC_ALL=C

usage() { sed -n '2,12p' "$0" | sed 's/^# \{0,1\}//'; exit 2; }
[ $# -eq 2 ] || usage
mode=$1
dir=${2%/}
[ -d "$dir/artifact" ] && dir="$dir/artifact"
[ -d "$dir" ] || { echo "no such directory: $dir" >&2; exit 2; }
cd "$dir"

case "$mode" in
  write)
    if [ -e SHA256SUMS ] && [ "${FORCE:-0}" != 1 ]; then
      echo "SHA256SUMS exists in $dir; set FORCE=1 to overwrite" >&2; exit 1
    fi
    tmp=$(mktemp)
    find . -type f ! -path ./SHA256SUMS -print0 | sort -z | while IFS= read -r -d '' f; do
      sha256sum -b -- "${f#./}"
    done > "$tmp"
    mv "$tmp" SHA256SUMS
    echo "wrote $dir/SHA256SUMS ($(wc -l < SHA256SUMS | tr -d ' ') files)"
    ;;
  verify)
    [ -f SHA256SUMS ] || { echo "no SHA256SUMS in $dir" >&2; exit 1; }
    out=$(sha256sum -c SHA256SUMS 2>&1) && rc=0 || rc=$?
    ok=$(printf '%s\n' "$out" | grep -c ': OK$' || true)
    printf '%s\n' "$out" | grep -v ': OK$' || true
    listed=$(grep -c . SHA256SUMS || true)
    # files present but not listed
    extra=$(find . -type f ! -path ./SHA256SUMS | sed 's|^\./||' | sort | \
            comm -23 - <(sed -E 's/^[0-9a-f]{64} [ *]//' SHA256SUMS | sort) | wc -l | tr -d ' ')
    echo "$dir: $ok OK of $listed listed; files not listed: $extra"
    [ "$rc" -eq 0 ] && [ "$extra" -eq 0 ]
    ;;
  *) usage ;;
esac
