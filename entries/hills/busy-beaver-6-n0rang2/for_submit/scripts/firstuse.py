"""First-use time of every entry of a machine (dev tool), treating H entries as unused slots.

Usage: python firstuse.py machine.json [max_steps]
"""
import json
import sys

from check import load


def main():
    tr = load(sys.argv[1])
    max_steps = int(sys.argv[2]) if len(sys.argv) > 2 else 10**6
    tape, pos, state, t = {}, 0, "A", 0
    first = {}
    while t < max_steps:
        b = tape.get(pos, 0)
        key = state + str(b)
        if key not in first:
            first[key] = t
        w, m, n = tr[state][str(b)]
        if n == "H":
            break
        tape[pos] = w
        pos += 1 if m == "R" else -1
        state = n
        t += 1
    for k, v in sorted(first.items(), key=lambda kv: kv[1]):
        print("%s first used after %d transitions" % (k, v))


if __name__ == "__main__":
    main()
