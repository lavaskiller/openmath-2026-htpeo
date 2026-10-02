"""Symmetric search: flip whole orbits of vertex pairs under a vertex-transitive
subgroup H of the seed's automorphism group.

An H-invariant colouring with uniform weights has the same rooted K4 count t at
every vertex, so E = n * t(0), where t(0) = tr((diag(M_0) M)^3) for red and blue.
That costs one ~deg x deg matrix product per colour instead of a full recount.
The final certificate is re-scored with the hill's evaluator.

    python sym_search.py SEED_DIR AUT.json OUT_DIR --gens 6 --tries 40 --minutes 30 --temp 0.02 --seed 1
"""
from __future__ import annotations

import argparse
import json
import math
import random
import time
from pathlib import Path

import numpy as np

from search import LEADER_PPT, exact, load, save


def transitive(gens, n) -> bool:
    seen, stack = {0}, [0]
    while stack:
        x = stack.pop()
        for p in gens:
            y = p[x]
            if y not in seen:
                seen.add(y)
                stack.append(y)
    return len(seen) == n


def pair_orbits(gens, n):
    """Orbits of unordered pairs {i,j}, i <= j, as arrays of (i,j)."""
    idx = np.full((n, n), -1, dtype=np.int64)
    iu = np.triu_indices(n)
    idx[iu] = np.arange(len(iu[0]))
    idx = np.maximum(idx, idx.T)          # symmetric pair index

    I, J = iu
    imgs = [idx[np.asarray(p)[I], np.asarray(p)[J]] for p in gens]
    # label propagation: every pair takes the minimum label over its images until stable
    roots = np.arange(len(I))
    while True:
        before = roots.copy()
        for img in imgs:
            np.minimum.at(roots, img, roots)          # push labels forward
            roots = np.minimum(roots, roots[img])     # pull labels back
        if np.array_equal(before, roots):
            break
    orbits = {}
    for a, r in enumerate(roots):
        orbits.setdefault(r, []).append(a)
    return [(I[np.array(o)], J[np.array(o)]) for o in orbits.values()]


def rooted0(A) -> float:
    t = 0.0
    for M in (A, 1.0 - A):
        v = M[0]
        idx = np.nonzero(v)[0]
        S = M[np.ix_(idx, idx)]
        t += float(np.einsum("ij,ji->", S @ S, S))
    return t


def energy(A) -> float:
    return len(A) * rooted0(A)


def run(seed_dir, aut_path, out, k, tries, minutes, temp, seed, subgroup=None) -> None:
    rng = random.Random(seed)
    w, A = load(seed_dir)
    n = len(w)
    assert np.all(w == w[0]), "symmetric search needs uniform weights"
    aut = json.loads(Path(aut_path).read_text())
    gens_all = aut["generators"]
    if subgroup:
        sub = json.loads(Path(subgroup).read_text())["generators"]
        assert transitive(sub, n), "the given subgroup is not vertex-transitive"
        tries = 0
    # a vertex-transitive subgroup with as many pair orbits as we can find
    best_sub, best_orbits = None, None
    G = [np.asarray(p) for p in gens_all]

    def random_element():
        x = np.arange(n)
        for _ in range(30):
            x = G[rng.randrange(len(G))][x]
        return x

    for _ in range(tries):
        sub = [random_element() for _ in range(k)]
        if not transitive(sub, n):
            continue
        orbs = pair_orbits(sub, n)
        if best_orbits is None or len(orbs) > len(best_orbits):
            best_sub, best_orbits = sub, orbs
    if subgroup:
        best_sub, best_orbits = sub, pair_orbits(sub, n)
    if best_orbits is None:
        best_sub, best_orbits = gens_all, pair_orbits(gens_all, n)
    orbits = best_orbits
    print(f"subgroup: {len(best_sub)} generators, {len(orbits)} pair orbits", flush=True)
    # every colouring reachable here is invariant: the seed is Aut-invariant
    E0, _, _, ppt0 = exact(w, A)
    e = energy(A)
    assert abs(e - E0) < 1.0, f"symmetric energy {e} != exact {E0}"
    Q4 = float(w.sum()) ** 4
    cur = best = e
    bestA = A.copy()
    sample = []
    for _ in range(min(40, len(orbits))):
        o = rng.randrange(len(orbits))
        I, J = orbits[o]
        A[I, J] = A[J, I] = 1.0 - A[I, J]
        sample.append(abs(energy(A) - cur))
        A[I, J] = A[J, I] = 1.0 - A[I, J]
    T0 = temp * float(np.median(sample))
    t0 = time.time()
    t_end = t0 + minutes * 60
    it = acc = 0
    last = t0
    print(f"start ppt={ppt0} T0={T0:.3g}", flush=True)
    while time.time() < t_end:
        T = T0 * (1.0 - (time.time() - t0) / (t_end - t0))
        o = rng.randrange(len(orbits))
        I, J = orbits[o]
        A[I, J] = A[J, I] = 1.0 - A[I, J]
        e = energy(A)
        d = e - cur
        it += 1
        if d < 0 or (T > 0 and rng.random() < math.exp(-d / T)):
            cur = e
            acc += 1
            if cur < best - 0.5:
                best, bestA = cur, A.copy()
        else:
            A[I, J] = A[J, I] = 1.0 - A[I, J]
        if time.time() - last > 60:
            bp = math.ceil(best / Q4 * 1e12)
            print(f"t={(time.time() - t0) / 60:.0f}m it={it} acc={acc} cur={math.ceil(cur / Q4 * 1e12)} "
                  f"best~{bp} vs_leader={bp - LEADER_PPT}", flush=True)
            save(Path(out) / "work", w, bestA)
            last = time.time()
    E2, dens, beaten, ppt = exact(w, bestA)
    assert abs(E2 - best) < 1.0, "symmetric energy disagrees with the exact count"
    save(Path(out) / "best", w, bestA)
    print(f"done exact ppt={ppt} beaten={beaten} vs_leader={ppt - LEADER_PPT} P={dens}", flush=True)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("seed_dir")
    p.add_argument("aut")
    p.add_argument("out")
    p.add_argument("--gens", type=int, default=6)
    p.add_argument("--tries", type=int, default=40)
    p.add_argument("--minutes", type=float, default=30)
    p.add_argument("--temp", type=float, default=0.02)
    p.add_argument("--seed", type=int, default=1)
    p.add_argument("--subgroup", default=None, help="JSON with generators of a transitive subgroup")
    a = p.parse_args()
    run(a.seed_dir, a.aut, a.out, a.gens, a.tries, a.minutes, a.temp, a.seed, a.subgroup)
