"""Neutral split of K blocks into halves (same neighbourhood, twin pair = loop colour), with the soft-pair list
extended to the copies and the twin pairs.   python split2.py IN.json soft.npy K heavy|random OUT.json OUT_soft.npy [seed]"""
import sys

import numpy as np

import core

w, A = core.load(sys.argv[1])
pl = np.load(sys.argv[2])
k = int(sys.argv[3])
mode = sys.argv[4]
rng = np.random.default_rng(int(sys.argv[7]) if len(sys.argv) > 7 else 0)
n = len(w)
k = min(k, 1024 - n)
if np.all(w == w[0]):
    w = np.full(n, 2, dtype=np.int64)
order = np.argsort(-w, kind="stable") if mode == "heavy" else rng.permutation(n)
pick = [int(i) for i in order if w[i] >= 2][:k]
idx = list(range(n)) + pick
A2 = A[np.ix_(idx, idx)].copy()
w2 = w[idx].copy()
copy = {}
for t, i in enumerate(pick):
    h = int(w[i]) // 2
    w2[i], w2[n + t] = int(w[i]) - h, h
    copy[i] = n + t
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
core.save(sys.argv[5], w2, A2)
np.save(sys.argv[6], np.array(out, dtype=np.int32))
x, y = w / w.mean(), w2 / w2.mean()
print("blocks", len(w2), "soft pairs", len(out), "ppt before", core.ppt_of(core.energy(x, A), x), "after", core.ppt_of(core.energy(y, A2), y))
