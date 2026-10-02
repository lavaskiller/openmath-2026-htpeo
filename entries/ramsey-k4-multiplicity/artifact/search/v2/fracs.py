"""Diagnostic: random flip sets with the per-orbit flip fractions of a reference solution.
    python fracs.py SEED.json REF.json soft.npy soft_orbit.npy
Prints the density of random samples (independent flips with the orbit's fraction), and after a T=0 quench."""
import sys
import time

import numpy as np

import core

w, S = core.load(sys.argv[1])
_, B = core.load(sys.argv[2])
pl = np.load(sys.argv[3])
lab = np.load(sys.argv[4])
x = w / w.mean()
Q4 = float(x.sum()) ** 4
D = S != B
fl = D[pl[:, 0], pl[:, 1]]
fr = {k: fl[lab == k].mean() for k in np.unique(lab)}
print("fractions", {int(k): round(float(v), 3) for k, v in fr.items()}, flush=True)
print("ref ppt", core.ppt_of(core.energy(x, B), x), flush=True)
rng = np.random.default_rng(1)
for s in range(4):
    A = S.copy()
    p = np.array([fr[k] for k in lab])
    pick = rng.random(len(pl)) < p
    for a, b in pl[pick]:
        A[a, b] ^= 1
        if a != b:
            A[b, a] ^= 1
    E = core.energy(x, A)
    print(f"sample {s}: flips {int(pick.sum())} ppt {E / Q4 * 1e12:.0f}", flush=True)
    st = core.State(x, A)
    t = time.time()
    acc, cur, best, nb, pr = core.sa_run(st, E, E, 0.0, 60.0, s + 1, 0.5,
                                         np.ascontiguousarray(pl, dtype=np.int32), 0.9)
    print(f"   quench 60s: acc {acc} ppt {best / Q4 * 1e12:.0f}", flush=True)
