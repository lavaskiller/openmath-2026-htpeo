"""Equalise weights inside each base block (near-twin class, copies included), keeping block totals.
    python reshape.py SOL.json SPLITFILE.json OUT.json"""
import sys

import numpy as np

import core
from blocks import base_blocks, origin_map

w, A = core.load(sys.argv[1])
_, A0 = core.load(sys.argv[2])
lab = base_blocks()
print("base blocks", lab.max() + 1, "sizes", np.unique(np.bincount(lab), return_counts=True))
om = origin_map(A0)
full = np.concatenate([lab, [lab[om[c]] for c in range(768, len(w))]])
x = w / w.mean()
y = x.copy()
for b in range(full.max() + 1):
    m = full == b
    y[m] = x[m].sum() / m.sum()
print("parts per base block:", np.unique(np.bincount(full), return_counts=True))
print("ppt before", core.ppt_of(core.energy(x, A), x), "after equalising", core.ppt_of(core.energy(y, A), y))
for lam in (0.25, 0.5, 0.75):
    z = (1 - lam) * x + lam * y
    print("  lam", lam, core.ppt_of(core.energy(z, A), z))
core.save(sys.argv[3], core.to_int(y), A)
