"""Which automorphisms of the seed (nearly) preserve the flip set F = seed XOR solution?

    python symprobe.py SEED.json SOL.json AUT.json [samples] [out_generators.json] [threshold]
"""
import json
import sys

import numpy as np

import core

_, S = core.load(sys.argv[1])
_, B = core.load(sys.argv[2])
aut = json.loads(open(sys.argv[3]).read())
gens = [np.array(g) for g in aut["generators"]]
gens += [np.argsort(g) for g in gens]
n = len(S)
D = (S != B)
I, J = np.nonzero(np.triu(D))
m = len(I)
samples = int(sys.argv[4]) if len(sys.argv) > 4 else 3000
rng = np.random.default_rng(0)
x = np.arange(n)
res = []
seen = set()
for s in range(samples):
    for _ in range(12):
        x = gens[rng.integers(len(gens))][x]
    key = x.tobytes()
    if key in seen:
        continue
    seen.add(key)
    ov = int(D[x[I], x[J]].sum())
    res.append((ov / m, x.copy()))
res.sort(key=lambda t: -t[0])
ov = np.array([r[0] for r in res])
print("flips", m, "distinct elements sampled", len(res))
print("overlap quantiles:", " ".join(f"{q:.3f}" for q in np.quantile(ov, [0, .5, .9, .99, .999, 1])))
print("top overlaps:", " ".join(f"{v:.3f}" for v in ov[:30]))
hist, edges = np.histogram(ov, bins=20, range=(0, 1))
print("hist:", list(hist))
if len(sys.argv) > 6:
    thr = float(sys.argv[6])
    keep = [r[1].tolist() for r in res if r[0] >= thr and not np.array_equal(r[1], np.arange(n))]
    json.dump({"generators": keep[:40], "threshold": thr, "count": len(keep)}, open(sys.argv[5], "w"))
    print("kept", len(keep), "elements with overlap >=", thr)
