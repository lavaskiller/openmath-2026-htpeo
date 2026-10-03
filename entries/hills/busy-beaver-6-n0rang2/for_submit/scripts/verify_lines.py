"""Replay "T machine-string" lines (from hunt.c) with check.run and compare (dev tool).

Usage: python verify_lines.py <file> [max_lines]
"""
import sys

from check import run

LET = "ABCDEF"


def parse(ms):
    parts = ms.split("_")
    tr = {}
    for si, part in enumerate(parts):
        tr[LET[si]] = {}
        for b in range(2):
            e = part[3 * b: 3 * b + 3]
            tr[LET[si]][str(b)] = [int(e[0]), e[1], e[2]]
    return tr


def main():
    path = sys.argv[1]
    limit = int(sys.argv[2]) if len(sys.argv) > 2 else 10**9
    ok = bad = 0
    with open(path, encoding="utf-8") as f:
        for i, line in enumerate(f):
            if i >= limit:
                break
            t_str, ms = line.split()
            res = run(parse(ms), int(t_str) + 10)
            good = res["halted"] and res["steps"] == int(t_str) and res["all_states_visited"]
            ok += good
            bad += not good
            if not good:
                print("MISMATCH", line.strip(), res)
    print("ok=%d bad=%d" % (ok, bad))


if __name__ == "__main__":
    main()
