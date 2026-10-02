#!/usr/bin/env python3
"""Regenerate src/ from the Lean 4.20 originals plus the recorded edits.

  base of a module = base/<M>.lean if present (the pack2 Lean-4.33.1 core port of that module: StarCert, hole,
                     layers 2, 4, 5; its edits are documented in pack2/lean433/patches and ../patches), else orig/<M>.lean
  src/<M>.lean     = base, plus (if M is listed in patches/compat.txt) the line
                     `set_option backward.isDefEq.respectTransparency false` after the imports
                     (and, if M is also listed in patches/recdepth.txt, `set_option maxRecDepth 200000`),
                     plus every hunk of patches/<M>.patch.

Patch format (plain text, UTF-8), any number of hunks:
    @@ [count=N] why: <reason>
    <<<<
    old text (must occur exactly N times in the current text, default 1)
    ====
    new text
    >>>>
Usage: python3 apply3.py [Module ...]   -> prints one line per patched module and a total; exit 0 always.
"""
import os, re, sys
H = os.path.dirname(os.path.abspath(__file__))
HUNK = re.compile(r"(?ms)^@@(.*?)\n<<<<\n(.*?)\n====\n(.*?)\n>>>>$")
mods = sys.argv[1:] or open(f"{H}/orig/order.txt").read().split()
tot = bad = ncompat = 0
OPT = "set_option backward.isDefEq.respectTransparency false"
cf = f"{H}/patches/compat.txt"
compat = set(open(cf).read().split()) if os.path.exists(cf) else set()
OPT2 = "set_option maxRecDepth 200000"
rf = f"{H}/patches/recdepth.txt"
recd = set(open(rf).read().split()) if os.path.exists(rf) else set()
for m in mods:
    b = f"{H}/base/{m}.lean"
    s = open(b if os.path.exists(b) else f"{H}/orig/{m}.lean", encoding="utf-8").read()
    p = f"{H}/patches/{m}.patch"
    n = 0
    if m in compat:
        # compatibility option (see README): inserted as one line after the import block
        L = s.split(chr(10))
        k = max(i for i, l in enumerate(L) if l.startswith("import "))
        L.insert(k + 1, OPT)
        if m in recd:
            L.insert(k + 2, OPT2)
        s = chr(10).join(L)
        ncompat += 1
    if os.path.exists(p):
        for i, h in enumerate(HUNK.finditer(open(p, encoding="utf-8").read())):
            head, old, new = h.group(1), h.group(2), h.group(3)
            c = re.search(r"count=(\d+)", head)
            c = int(c.group(1)) if c else 1
            k = s.count(old)
            if k != c:
                print(f"!! {m} hunk {i}: expected {c} occurrence(s), found {k}: {old[:90]!r}")
                bad += 1
                continue
            s = s.replace(old, new)
            n += 1
        print(f"{m}: {n} hunks")
    tot += n
    open(f"{H}/src/{m}.lean", "w", encoding="utf-8").write(s)
print(f"TOTAL {tot} hunks applied, {bad} failed; compat option line inserted in {ncompat} modules")
