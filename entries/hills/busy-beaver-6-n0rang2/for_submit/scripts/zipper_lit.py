"""Zipper configuration of a machine after n steps, printed as a Lean `Z` literal (dev tool).

Zipper convention (matches the Lean development): l = cells left of the head, nearest first;
a = scanned cell; r = cells right of the head, nearest first; moving onto an unmaterialised cell
materialises it with 0. Halting entries still write and move.

Usage: python zipper_lit.py <machine-string> <n> [<n2> ...]
"""
import sys

LET = "ABCDEFH"


def parse(ms):
    parts = ms.split("_")
    tab = {}
    for si, part in enumerate(parts):
        for b in range(2):
            e = part[3 * b: 3 * b + 3]
            tab[(LET[si], b)] = (int(e[0]), e[1], e[2])
    return tab


def lean_list(xs):
    return "[" + ", ".join("true" if x else "false" for x in xs) + "]"


def main():
    tab = parse(sys.argv[1])
    targets = sorted(int(x) for x in sys.argv[2:])
    l, a, r, s = [], 0, [], "A"
    t = 0
    for n in targets:
        while t < n:
            if s == "H":
                break
            w, d, nx = tab[(s, a)]
            if d == "R":
                l.insert(0, w)
                a = r.pop(0) if r else 0
            else:
                r.insert(0, w)
                a = l.pop(0) if l else 0
            s = nx
            t += 1
        print("-- after %d steps: |l|=%d |r|=%d ones=%d state=%s" % (n, len(l), len(r), sum(l) + a + sum(r), s))
        print("⟨%s, %s, %s, .%s⟩" % (lean_list(l), "true" if a else "false", lean_list(r), s))


if __name__ == "__main__":
    main()
