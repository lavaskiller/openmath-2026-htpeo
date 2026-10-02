"""Soft-pair list for an existing split: extend a 768-vertex pair list to the copies (and add the twin pairs).
    python mk_soft.py SPLITFILE.json BASE_SOFT.npy OUT.npy"""
import sys

import numpy as np

import core
from blocks import origin_map

_, A0 = core.load(sys.argv[1])
pl = np.load(sys.argv[2])
om = origin_map(A0)
copies = {}
for c, i in om.items():
    copies.setdefault(i, []).append(c)
out = []
for a, b in pl.tolist():
    for x in [a] + copies.get(a, []):
        for y in [b] + copies.get(b, []):
            out.append((x, y))
for i, cs in copies.items():
    for c in cs:
        out.append((i, c))
np.save(sys.argv[3], np.array(out, dtype=np.int32))
print("pairs", len(out))
