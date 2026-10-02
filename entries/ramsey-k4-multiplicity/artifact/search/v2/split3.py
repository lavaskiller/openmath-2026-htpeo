"""Designed split: every base block (4 near-twins) gets extra parts: copies of distinct members.
    python split3.py IN768.json soft.npy MODE OUT.json OUT_soft.npy [seed]
MODE A: 128 base blocks get 1 copy, 64 get 2 copies, weights equal inside each base block (5 or 6 parts).
MODE N: same choice of copies but neutral weights (copied member halved).
MODE B: 64 base blocks get all 4 members halved (neutral)."""
import sys

import numpy as np

import core
from blocks import base_blocks

w, A = core.load(sys.argv[1])
pl = np.load(sys.argv[2])
mode = sys.argv[3]
rng = np.random.default_rng(int(sys.argv[6]) if len(sys.argv) > 6 else 0)
n = len(w)
assert n == 768 and np.all(w == w[0])
lab = base_blocks()
nb = lab.max() + 1
members = [np.nonzero(lab == b)[0] for b in range(nb)]
order = rng.permutation(nb)
pick = []
if mode in ("A", "N"):
    for i, b in enumerate(order):
        k = 2 if i < 64 else 1
        pick += [int(v) for v in rng.choice(members[b], k, replace=False)]
else:
    for b in order[:64]:
        pick += [int(v) for v in members[b]]
assert len(pick) == 256
idx = list(range(n)) + pick
A2 = A[np.ix_(idx, idx)].copy()
U = 120
w2 = np.full(len(idx), U, dtype=np.int64)
copy = {i: n + t for t, i in enumerate(pick)}
if mode == "A":
    lab2 = np.concatenate([lab, lab[pick]])
    for b in range(nb):
        m = lab2 == b
        w2[m] = 4 * U // m.sum()
else:
    for i, c in copy.items():
        w2[i] = w2[c] = U // 2
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
print("mode", mode, "blocks", len(w2), "weights", np.unique(w2, return_counts=True), "soft pairs", len(out),
      "ppt before", core.ppt_of(core.energy(x, A), x), "after", core.ppt_of(core.energy(y, A2), y))
