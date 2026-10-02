"""Split k blocks into two halves (same neighbourhood, cross colour = loop colour): same density,
more blocks for the flip search.   python split.py IN.json OUT.json K [heavy|random] [seed]"""
import sys

import numpy as np

import core

w, A = core.load(sys.argv[1])
k = int(sys.argv[3])
mode = sys.argv[4] if len(sys.argv) > 4 else "heavy"
rng = np.random.default_rng(int(sys.argv[5]) if len(sys.argv) > 5 else 0)
n = len(w)
k = min(k, 1024 - n)
if 2 * int(w.max()) <= 65535 * 2 and np.all(w == w[0]):
    w = np.full(n, 2, dtype=np.int64)
order = np.argsort(-w, kind="stable") if mode == "heavy" else rng.permutation(n)
pick = [int(i) for i in order if w[i] >= 2][:k]
idx = list(range(n)) + pick
A2 = A[np.ix_(idx, idx)].copy()          # copy j of block i: same row; cross entry = A[i,i]
w2 = w[idx].copy()
for t, i in enumerate(pick):
    a, b = int(w[i]) // 2, int(w[i]) - int(w[i]) // 2
    w2[i], w2[n + t] = b, a
core.save(sys.argv[2], w2, A2)
x, y = w / w.mean(), w2 / w2.mean()
print("blocks", len(w2), "ppt before", core.ppt_of(core.energy(x, A), x), "after", core.ppt_of(core.energy(y, A2), y))
