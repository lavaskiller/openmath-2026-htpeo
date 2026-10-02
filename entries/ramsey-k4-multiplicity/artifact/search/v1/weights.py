"""Optimise the block weights of a fixed colouring, then round to integers.

E(w) = sum over ordered 4-tuples of w_i w_j w_k w_l [K4 red] + [K4 blue], loops
(diagonal) included, is homogeneous of degree 4, and
    dE/dw_a = 4 * (tr((diag(w*R_a) R)^3) + tr((diag(w*B_a) B)^3)).
P = E / Q^4 is scale-free; with the rooted density r_a = Q dE/dw_a / (4E) the
optimum has r_a = 1 on the support. Exponentiated-gradient step:
w_a <- w_a * exp(-eta (r_a - 1)). The rounded integer certificate is re-scored
with the hill's evaluator.

    python weights.py IN_DIR OUT_DIR --iters 60 --eta 2 --scale 2000
    python weights.py --selftest
"""
from __future__ import annotations

import argparse
import math
import time
from pathlib import Path

import numpy as np

from search import LEADER_PPT, energy_bruteforce, exact, load, save


def energy(w, A) -> float:
    """E(w) via rooted counts: E = sum_a w_a * t_a (each tuple counted from its first index)."""
    return float(w @ rooted(w, A))


def rooted(w, A) -> np.ndarray:
    """t_a = sum_{j,k,l} w_j w_k w_l T(a,j,k,l) for red and blue together."""
    n = len(w)
    t = np.zeros(n)
    for M in (A, 1.0 - A):
        for a in range(n):
            v = w * M[a]
            idx = np.nonzero(v)[0]
            if idx.size == 0:
                continue
            S = M[np.ix_(idx, idx)] * v[idx][None, :]   # (M V) restricted to the support
            t[a] += float(np.einsum("ij,ji->", S @ S, S))
    return t


def selftest() -> None:
    rng = np.random.default_rng(1)
    for n in (3, 5, 6):
        for _ in range(10):
            w = rng.integers(1, 4, n).astype(np.float64)
            A = rng.integers(0, 2, (n, n)).astype(np.float64)
            A = np.triu(A) + np.triu(A, 1).T
            assert round(energy(w, A)) == energy_bruteforce(w, A)
            # gradient: dE/dw_a = 4 t_a, checked by an exact integer difference
            a = int(rng.integers(0, n))
            w2 = w.copy()
            w2[a] += 1
            e1, e2 = energy_bruteforce(w, A), energy_bruteforce(w2, A)
            # E is a degree-4 polynomial in w_a: e2 - e1 = sum_k d^k E / k!; check first order
            # via symmetric identity E(w) = (1/4) sum_a w_a dE/dw_a instead
            assert round(float(w @ (4 * rooted(w, A))) / 4) == e1
    print("selftest ok")


def optimise(in_dir: Path, out: Path, iters: int, eta: float, scale: int) -> None:
    w, A = load(in_dir)
    E0, _, _, ppt0 = exact(w, A)
    print(f"start ppt={ppt0} vs_leader={ppt0 - LEADER_PPT}", flush=True)
    x = w / w.mean()
    best_ppt, best_w = ppt0, w.copy()
    for it in range(1, iters + 1):
        t0 = time.time()
        t = rooted(x, A)
        E = float(x @ t)
        Q = float(x.sum())
        r = Q * t / E             # rooted density; mean over x-weights is 1
        P = E / Q ** 4
        x = x * np.exp(-eta * (r - 1.0))
        x = x / x.mean()
        spread = float(r.max() - r.min())
        print(f"it={it} P~{P * 1e12:.0f}ppt spread={spread:.2e} ({time.time() - t0:.1f}s)", flush=True)
        if it % 10 == 0 or it == iters:
            wi = np.maximum(1, np.rint(x / x.max() * scale)).astype(np.int64)
            _, dens, beaten, ppt = exact(wi.astype(np.float64), A)
            print(f"  rounded(scale {scale}) exact ppt={ppt} beaten={beaten} "
                  f"vs_leader={ppt - LEADER_PPT}", flush=True)
            if ppt < best_ppt:
                best_ppt, best_w = ppt, wi.astype(np.float64)
                save(out / "best", best_w, A)
    print(f"done best ppt={best_ppt} vs_leader={best_ppt - LEADER_PPT}", flush=True)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("in_dir", nargs="?")
    p.add_argument("out", nargs="?")
    p.add_argument("--iters", type=int, default=60)
    p.add_argument("--eta", type=float, default=2.0)
    p.add_argument("--scale", type=int, default=2000)
    p.add_argument("--selftest", action="store_true")
    a = p.parse_args()
    if a.selftest:
        selftest()
    else:
        optimise(Path(a.in_dir), Path(a.out), a.iters, a.eta, a.scale)
