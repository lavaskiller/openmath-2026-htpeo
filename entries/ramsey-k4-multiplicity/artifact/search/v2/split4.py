"""Designed split variants: 128 base blocks get one member halved; 64 base blocks get two members halved,
chosen as a closest-twin pair (orbit 1, mode T1) or a non-closest pair (mode T2).
    python split4.py IN768.json soft.npy T1|T2 OUT.json OUT_soft.npy [seed]"""
import json
import sys

import numpy as np

import core
from blocks import HERE, base_blocks

w, A = core.load(sys.argv[1])
pl = np.load(sys.argv[2])
mode = sys.argv[3]
rng = np.random.default_rng(int(sys.argv[6]) if len(sys.argv) > 6 else 0)
n = len(w)
assert n == 768 and np.all(w == w[0])
lab = base_blocks()
aut = json.loads((HERE / "aut_seed.json").read_text())
t1 = {}
for a, b in aut["pair_orbits"][1]:
    t1[a], t1[b] = b, a
nb = lab.max() + 1
members = [np.nonzero(lab == b)[0] for b in range(nb)]
order = rng.permutation(nb)
pick = []
for i, b in enumerate(order):
    x = int(rng.choice(members[b]))
    if i < 64:
        if mode == "T1":
            y = t1[x]
        else:
            y = int(rng.choice([v for v in members[b] if v != x and v != t1[x]]))
        pick += [x, y]
    else:
        pick.append(x)
assert len(pick) == 256 and len(set(pick)) == 256
idx = list(range(n)) + pick
A2 = A[np.ix_(idx, idx)].copy()
w2 = np.full(len(idx), 120, dtype=np.int64)
copy = {i: n + t for t, i in enumerate(pick)}
for i, c in copy.items():
    w2[i] = w2[c] = 60
out = []
for a, b in pl.tolist():
    out.append((a, b))
    if a in copy:
        out.append((copy[a], b))
    if b in copy:
        out.append((a, copy[b]))
    if a in copy and b in copy:
        out.append((copy[a], copy[b]))
for i, c in copy.items():
    out.append((i, c))
core.save(sys.argv[4], w2, A2)
np.save(sys.argv[5], np.array(out, dtype=np.int32))
x, y = w / w.mean(), w2 / w2.mean()
print("mode", mode, "blocks", len(w2), "soft pairs", len(out), "ppt", core.ppt_of(core.energy(y, A2), y))
