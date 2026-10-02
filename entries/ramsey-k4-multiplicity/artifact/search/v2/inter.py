"""Diagnostic: single-flip deltas at the seed per Aut-orbit, and how one flip changes the other deltas.
    python inter.py SEED.json AUT.json soft.npy soft_orbit.npy [REF.json]"""
import json
import sys

import numpy as np

import core

w, S = core.load(sys.argv[1])
aut = json.loads(open(sys.argv[2]).read())
pl = np.load(sys.argv[3])
lab = np.load(sys.argv[4])
n = len(w)
x = np.ones(n)
u = 1e12 / n ** 4


def all_deltas(A):
    st = core.State(x, A)
    D, Sr, Sb, Vd, zd = st.arrays()
    d = np.diag(A).astype(float)
    e = 1 - d
    da, db_ = d[:, None], d[None, :]
    ea, eb = e[:, None], e[None, :]
    G = 12 * (D + Sr * (da + db_) - Sb * (ea + eb)) + 4 * (da - ea) + 4 * (db_ - eb) + 6 * (da * db_ - ea * eb)
    return (1 - 2 * A) * G


d0 = all_deltas(S)
orb = np.full((n, n), -1)
for k, o in enumerate(aut["pair_orbits"]):
    o = np.array(o)
    orb[o[:, 0], o[:, 1]] = k
    orb[o[:, 1], o[:, 0]] = k
print("single-flip delta at seed (ppt) per orbit, negative ones:")
for k, o in enumerate(aut["pair_orbits"]):
    a, b = o[0]
    if a != b and d0[a, b] < 200 / u:
        print(f"  orbit {k} size {len(o)} seedcol {S[a, b]} delta {d0[a, b] * u:.0f}")
soft = set(np.unique(lab).tolist())
for k in (59, 55, 77, 60):
    a, b = aut["pair_orbits"][k][0]
    A = S.copy()
    A[a, b] ^= 1
    A[b, a] ^= 1
    d1 = all_deltas(A)
    J = (d1 - d0) * u
    iu = np.triu_indices(n, 1)
    Jv, ov = J[iu], orb[iu]
    share = (iu[0] == a) | (iu[0] == b) | (iu[1] == a) | (iu[1] == b)
    m = np.isin(ov, list(soft)) & ~((iu[0] == a) & (iu[1] == b))
    print(f"flip one pair of orbit {k} (delta {d0[a, b] * u:.0f}): effect on other soft pairs' deltas")
    for sh in (True, False):
        mm = m & (share == sh)
        v = Jv[mm]
        print(f"   share-vertex={sh}: pairs {mm.sum()} nonzero {(np.abs(v) > 1).sum()} sum {v.sum():.0f} "
              f"max {v.max():.0f} min {v.min():.0f} #J>1000: {(v > 1000).sum()} #J<-1000: {(v < -1000).sum()}")
    big = np.argsort(-np.abs(Jv * m))[:12]
    print("   largest:", [(int(ov[i]), int(share[i]), int(Jv[i])) for i in big])
if len(sys.argv) > 5:
    _, B = core.load(sys.argv[5])
    dB = all_deltas(B) * u
    F = (S != B)
    iu = np.triu_indices(n, 1)
    m = np.isin(orb[iu], list(soft))
    v = dB[iu][m]
    f = F[iu][m]
    print("at REF: soft-pair deltas quantiles (flipped pairs = cost to unflip):", np.round(np.quantile(v[f], [0, .1, .5, .9, 1])),
          " unflipped:", np.round(np.quantile(v[~f], [0, .1, .5, .9, 1])))
    deg = F.sum(1)
    print("flips per vertex histogram:", np.bincount(deg).tolist())
    for k in (55, 56, 57, 58, 59, 60, 64, 71, 72, 77):
        mk = (orb == k)
        dk = (F & mk).sum(1)
        print(f"   orbit {k}: per-vertex pairs {mk.sum(1)[0]} flipped-per-vertex histogram {np.bincount(dk).tolist()}")
