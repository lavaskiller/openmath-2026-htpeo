"""Twin split: block a (weight w, loop colour c) -> two halves with the cross pair coloured opposite.
Exact change of E:  delta_a = 3 w^2 (V_o - V_c) - 3 w^3 zw_c - (7/8) w^4   (o = other colour),
V_c(a) = sum_{k,l in N_c(a)} w_k w_l M_c[k,l] (loops included), zw_c(a) = weight of N_c(a).

    python twin.py IN.json                 -> statistics
    python twin.py IN.json OUT.json K      -> split the K best blocks (twin pair flipped when that gains,
                                              otherwise a neutral split), heaviest blocks to fill up
"""
import sys

import numpy as np

import core


def twin_deltas(x, A):
    n = len(x)
    Af = A.astype(np.float64)
    V, zw = [], []
    for M in (Af, 1.0 - Af):
        Z = M - np.diag(np.diag(M))
        ZW = Z * x[None, :]
        V.append(np.einsum("ak,ak->a", ZW @ M, ZW))
        zw.append(Z @ x)
    Vr, Vb = V
    loop = np.diag(A).astype(bool)          # True: red loop
    Vc, Vo = np.where(loop, Vr, Vb), np.where(loop, Vb, Vr)
    zc, zo = np.where(loop, zw[0], zw[1]), np.where(loop, zw[1], zw[0])
    d_twin = 3 * x ** 2 * (Vo - Vc) - 3 * x ** 3 * zc - 0.875 * x ** 4
    d_loop = 6 * x ** 2 * (Vo - Vc) + 4 * x ** 3 * (zo - zc)
    return d_twin, d_loop, Vo - Vc, zc


if __name__ == "__main__":
    w, A = core.load(sys.argv[1])
    x = w / w.mean()
    n = len(x)
    Q4 = float(x.sum()) ** 4
    d_twin, d_loop, dV, zc = twin_deltas(x, A)
    u = 1e12 / Q4
    q = lambda v: " ".join(f"{t:.0f}" for t in np.quantile(v, [0, .1, .25, .5, .75, .9, 1]))
    print("n", n, "red loops", int(np.diag(A).sum()))
    print("twin delta ppt quantiles:", q(d_twin * u))
    print("loop delta ppt quantiles:", q(d_loop * u))
    print("Vo-Vc quantiles:", q(dV), " zc:", q(zc))
    order = np.argsort(d_twin)
    neg = d_twin[order] < 0
    print("blocks with twin gain:", int(neg.sum()), " total gain ppt (all):", float(d_twin[d_twin < 0].sum() * u),
          " best 256:", float(np.minimum(d_twin[order][:256], 0).sum() * u))
    if len(sys.argv) > 3:
        k = min(int(sys.argv[3]), 1024 - n)
        wi = w.copy()
        if 2 * int(wi.max()) <= 65535:
            wi = wi * 2                      # keep halves integral
        cand = [int(i) for i in order if d_twin[i] < 0 and wi[i] >= 2][:k]
        if len(cand) < k:
            rest = [int(i) for i in np.argsort(-wi, kind="stable") if i not in set(cand) and wi[i] >= 2]
            cand += rest[:k - len(cand)]
        idx = list(range(n)) + cand
        A2 = A[np.ix_(idx, idx)].copy()
        w2 = wi[idx].copy()
        flipped = 0
        for t, i in enumerate(cand):
            h = int(wi[i]) // 2
            w2[i], w2[n + t] = int(wi[i]) - h, h
            if d_twin[i] < 0:
                A2[i, n + t] = A2[n + t, i] = 1 - A[i, i]
                flipped += 1
        core.save(sys.argv[2], w2, A2)
        y = w2 / w2.mean()
        print("split", len(cand), "flipped twins", flipped, "ppt before", core.ppt_of(core.energy(x, A), x),
              "after", core.ppt_of(core.energy(y, A2), y))
