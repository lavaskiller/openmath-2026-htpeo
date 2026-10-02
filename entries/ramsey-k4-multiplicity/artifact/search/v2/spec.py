"""Is there hidden structure in the flip set? Spectrum of (flips in an orbit group) - fraction * (orbit pairs).

    python spec.py SEED.json SOL.json AUT.json
"""
import json
import sys

import numpy as np

import core

_, S = core.load(sys.argv[1])
_, B = core.load(sys.argv[2])
aut = json.loads(open(sys.argv[3]).read())
n = len(S)
D = (S != B).astype(float)
orb = np.full((n, n), -1)
for k, o in enumerate(aut["pair_orbits"]):
    o = np.array(o)
    orb[o[:, 0], o[:, 1]] = k
    orb[o[:, 1], o[:, 0]] = k
fr = {}
for k in range(len(aut["pair_orbits"])):
    m = orb == k
    fr[k] = D[m].mean()
groups = {"hi(55-59)": [55, 56, 57, 58, 59], "half": [k for k in fr if 0.4 < fr[k] < 0.6],
          "quarter": [k for k in fr if 0.15 < fr[k] < 0.32], "all": [k for k in fr if fr[k] > 0.02]}
for name, ks in groups.items():
    M = np.isin(orb, ks)
    R = np.zeros((n, n))
    for k in ks:
        m = orb == k
        R[m] = D[m] - fr[k]
    ev, V = np.linalg.eigh(R)
    p = float(np.mean([fr[k] for k in ks]))
    deg = M.sum(1).mean()
    bulk = 2 * np.sqrt(deg * p * (1 - p))
    print(f"{name}: orbits {len(ks)} deg {deg:.0f} frac {p:.3f} bulk~{bulk:.1f} top ev {np.round(ev[-6:], 1)} bottom {np.round(ev[:6], 1)}")
    for v in (V[:, -1], V[:, 0]):
        a = np.abs(v) * np.sqrt(n)
        print("   eigvec |entries| quantiles", np.round(np.quantile(a, [0.05, 0.25, 0.5, 0.75, 0.95]), 2),
              "kurtosis-ish", round(float((a ** 4).mean()), 2))
print("orbit fractions >0.02:", {k: round(float(v), 3) for k, v in fr.items() if v > 0.02})
print("seed colours of those:", {k: int(S[tuple(aut['pair_orbits'][k][0])]) for k, v in fr.items() if v > 0.02})
print("sizes:", {k: len(aut['pair_orbits'][k]) for k, v in fr.items() if v > 0.02})
