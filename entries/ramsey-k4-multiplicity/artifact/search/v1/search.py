"""Local search for the AutoLab hill alejandrozu/clique-cluster-ramsey-multiplicity.

Objective: E = hom(K4, R) + hom(K4, B) over ordered 4-tuples with repeated
indices, R the red 0/1 matrix *with* its diagonal (block colour), B = 1 - R, and
P = E / Q^4 with Q = sum(w). E is affine in any single entry R_ab, so flipping it
changes E by (new - old) * (f1(R) - f1(B)), where f1 sums the other factors over
the tuples that use the pair {a,b} (or the loop a,a). float64 is exact here (all
values < 2^53). The final certificate is re-scored with the hill's own evaluator.

    python search.py SEED_DIR OUT_DIR --seed 1 --minutes 60 --temp 0.02
    python search.py --selftest
"""
from __future__ import annotations

import argparse
import json
import math
import random
import sys
import time
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
LEADER_PPT = 30141339127  # AutoLab #1 (a-hamdi), 2026-09-28 17:45 KST


def load(d: Path):
    data = json.loads((Path(d) / "solution.json").read_text())
    w = np.array(data["weights"], dtype=np.float64)
    A = np.array([[int(c) for c in row] for row in data["red_rows"]], dtype=np.float64)
    return w, A


def save(d: Path, w, A) -> None:
    d = Path(d)
    d.mkdir(parents=True, exist_ok=True)
    rows = ["".join("1" if x else "0" for x in r) for r in A.astype(int)]
    tmp = d / "solution.json.tmp"
    tmp.write_text(json.dumps({"schema": "weighted-two-color-blowup-v1",
                               "weights": [int(x) for x in w], "red_rows": rows}))
    tmp.replace(d / "solution.json")


def exact(w, A):
    """(E, density, reference_beaten, density_ppt) from the hill's evaluator."""
    sys.path.insert(0, str(HERE / "hill"))
    import eval as E
    rows = ["".join("1" if x else "0" for x in r) for r in A.astype(int)]
    red, blue, den = E._density([int(x) for x in w], rows)
    density, beaten, metrics = E._metrics(red, blue, den)
    return red + blue, density, bool(beaten), metrics[1]["value"]


class State:
    """A plus zero-diagonal copies of R and B and their diagonals, kept in sync."""

    def __init__(self, w, A):
        self.w = w
        self.A = A.copy()
        self.dR = np.diag(A).copy()
        self.dB = 1.0 - self.dR
        self.Rz = A - np.diag(self.dR)
        self.Bz = (1.0 - A) - np.diag(self.dB)

    @staticmethod
    def _f1_pair(Mz, d, w, a, b) -> float:
        u = w * Mz[a] * Mz[b]           # zero at a and b (zero diagonal)
        wa, wb = w[a], w[b]
        four = 12.0 * wa * wb * float(u @ (Mz @ u))
        three = 12.0 * wa * wb * (float(u.sum()) * (wa * d[a] + wb * d[b]) + float(u @ (w * d)))
        two = 4.0 * wa ** 3 * wb * d[a] + 4.0 * wa * wb ** 3 * d[b] + 6.0 * wa ** 2 * wb ** 2 * d[a] * d[b]
        return four + three + two

    @staticmethod
    def _f1_loop(Mz, d, w, a) -> float:
        v = w * Mz[a]
        wa = w[a]
        return (6.0 * wa ** 2 * float(v @ (Mz @ v)) + 6.0 * wa ** 2 * float(v @ (w * d))
                + 4.0 * wa ** 3 * float(v.sum()) + wa ** 4)

    def delta(self, a, b) -> float:
        if a == b:
            g = self._f1_loop(self.Rz, self.dR, self.w, a) - self._f1_loop(self.Bz, self.dB, self.w, a)
        else:
            g = (self._f1_pair(self.Rz, self.dR, self.w, a, b)
                 - self._f1_pair(self.Bz, self.dB, self.w, a, b))
        return (1.0 - 2.0 * self.A[a, b]) * g

    @staticmethod
    def _f1_pairs(Mz, d, w, a, b) -> np.ndarray:
        """_f1_pair for arrays of off-diagonal pairs at once (one BLAS-3 product)."""
        U = w[None, :] * Mz[a] * Mz[b]                  # K x n
        wa, wb, da, db = w[a], w[b], d[a], d[b]
        four = 12.0 * wa * wb * np.einsum("ij,ij->i", U @ Mz, U)
        three = 12.0 * wa * wb * (U.sum(1) * (wa * da + wb * db) + U @ (w * d))
        two = 4.0 * wa ** 3 * wb * da + 4.0 * wa * wb ** 3 * db + 6.0 * wa ** 2 * wb ** 2 * da * db
        return four + three + two

    def deltas(self, a: np.ndarray, b: np.ndarray) -> np.ndarray:
        """delta() for arrays of off-diagonal pairs (a != b)."""
        g = (self._f1_pairs(self.Rz, self.dR, self.w, a, b)
             - self._f1_pairs(self.Bz, self.dB, self.w, a, b))
        return (1.0 - 2.0 * self.A[a, b]) * g

    def flip(self, a, b) -> None:
        new = 1.0 - self.A[a, b]
        self.A[a, b] = self.A[b, a] = new
        if a == b:
            self.dR[a], self.dB[a] = new, 1.0 - new
        else:
            self.Rz[a, b] = self.Rz[b, a] = new
            self.Bz[a, b] = self.Bz[b, a] = 1.0 - new


def energy_bruteforce(w, A) -> int:
    n, tot = len(w), 0
    for M in (A, 1 - A):
        for i in range(n):
            for j in range(n):
                for k in range(n):
                    for l in range(n):
                        if M[i, j] and M[i, k] and M[i, l] and M[j, k] and M[j, l] and M[k, l]:
                            tot += int(w[i] * w[j] * w[k] * w[l])
    return tot


def selftest() -> None:
    rng = np.random.default_rng(0)
    for n in (3, 5, 7):
        for _ in range(20):
            w = rng.integers(1, 4, n).astype(np.float64)
            A = rng.integers(0, 2, (n, n)).astype(np.float64)
            A = np.triu(A) + np.triu(A, 1).T
            s = State(w, A)
            for _ in range(3):  # several flips in a row: the kept copies stay in sync
                e0 = energy_bruteforce(w, s.A)
                a, b = (int(x) for x in rng.integers(0, n, 2))
                d = s.delta(a, b)
                s.flip(a, b)
                assert energy_bruteforce(w, s.A) - e0 == round(d), (n, a, b)
            aa, bb = np.array([0, 1, 2]), np.array([1, 2, 0])
            batch = s.deltas(aa, bb)
            assert all(round(batch[i]) == round(s.delta(aa[i], bb[i])) for i in range(3))
    print("selftest ok")


def search_batch(seed_dir, out, seed: int, minutes: float, temp: float, k: int) -> None:
    """Each step scores k random off-diagonal flips at once and takes the best one
    (Metropolis on it); every 50th step also tries a random diagonal flip."""
    rng = np.random.default_rng(seed)
    w, A = load(seed_dir)
    n = len(w)
    E0, _, beaten, ppt = exact(w, A)
    s = State(w, A)
    Q4 = float(w.sum()) ** 4
    cur = best = float(E0)
    bestA = s.A.copy()
    print(f"start ppt={ppt} beaten={beaten} n={n} seed={seed} temp={temp} k={k}", flush=True)
    a0 = rng.integers(0, n, 300)
    b0 = (a0 + rng.integers(1, n, 300)) % n
    T0 = temp * float(np.median(np.abs(s.deltas(a0, b0))))
    t0 = time.time()
    t_end = t0 + minutes * 60
    it = acc = 0
    last = t0
    while True:
        now = time.time()
        if now >= t_end:
            break
        T = T0 * (1.0 - (now - t0) / (t_end - t0))
        it += 1
        if it % 50 == 0:
            a = b = int(rng.integers(0, n))
            d = s.delta(a, b)
        else:
            aa = rng.integers(0, n, k)
            bb = (aa + rng.integers(1, n, k)) % n
            ds = s.deltas(aa, bb)
            i = int(np.argmin(ds))
            a, b, d = int(aa[i]), int(bb[i]), float(ds[i])
        if d < 0 or (T > 0 and rng.random() < math.exp(-d / T)):
            s.flip(a, b)
            cur += d
            acc += 1
            if cur < best - 0.5:
                best, bestA = cur, s.A.copy()
        if now - last > 60:
            bp = math.ceil(best / Q4 * 1e12)
            print(f"t={(now - t0) / 60:.0f}m it={it} ({it / (now - t0):.0f}/s) acc={acc} "
                  f"cur={math.ceil(cur / Q4 * 1e12)} best~{bp} vs_leader={bp - LEADER_PPT}", flush=True)
            save(Path(out) / "work", w, bestA)
            last = now
    E2, dens, beaten, ppt = exact(w, bestA)
    # exact for small weights; with large weights float64 rounds, so compare relatively
    assert abs(E2 - best) <= max(1.0, 1e-9 * E2), "incremental energy drifted from the exact count"
    save(Path(out) / "best", w, bestA)
    print(f"done exact ppt={ppt} beaten={beaten} vs_leader={ppt - LEADER_PPT} P={dens}", flush=True)


def search(seed_dir, out, seed: int, minutes: float, temp: float) -> None:
    rng = random.Random(seed)
    w, A = load(seed_dir)
    n = len(w)
    E0, _, beaten, ppt = exact(w, A)
    s = State(w, A)
    Q4 = float(w.sum()) ** 4
    cur = best = float(E0)
    bestA = s.A.copy()
    print(f"start ppt={ppt} beaten={beaten} n={n} seed={seed} temp={temp}", flush=True)
    sample = [abs(s.delta(rng.randrange(n), rng.randrange(n))) for _ in range(300)]
    T0 = temp * float(np.median(sample))
    t0 = time.time()
    t_end = t0 + minutes * 60
    it = acc = 0
    last = t0
    while True:
        now = time.time()
        if now >= t_end:
            break
        T = T0 * (1.0 - (now - t0) / (t_end - t0))
        a, b = rng.randrange(n), rng.randrange(n)
        d = s.delta(a, b)
        it += 1
        if d < 0 or (T > 0 and rng.random() < math.exp(-d / T)):
            s.flip(a, b)
            cur += d
            acc += 1
            if cur < best - 0.5:
                best, bestA = cur, s.A.copy()
        if now - last > 60:
            bp = math.ceil(best / Q4 * 1e12)
            print(f"t={(now - t0) / 60:.0f}m it={it} ({it / (now - t0):.0f}/s) acc={acc} "
                  f"cur={math.ceil(cur / Q4 * 1e12)} best~{bp} vs_leader={bp - LEADER_PPT}", flush=True)
            save(Path(out) / "work", w, bestA)
            last = now
    E2, dens, beaten, ppt = exact(w, bestA)
    # exact for small weights; with large weights float64 rounds, so compare relatively
    assert abs(E2 - best) <= max(1.0, 1e-9 * E2), "incremental energy drifted from the exact count"
    save(Path(out) / "best", w, bestA)
    print(f"done exact ppt={ppt} beaten={beaten} vs_leader={ppt - LEADER_PPT} P={dens}", flush=True)


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("seed_dir", nargs="?")
    p.add_argument("out", nargs="?")
    p.add_argument("--seed", type=int, default=1)
    p.add_argument("--minutes", type=float, default=60)
    p.add_argument("--temp", type=float, default=0.02)
    p.add_argument("--batch", type=int, default=0, help="score this many flips per step")
    p.add_argument("--selftest", action="store_true")
    a = p.parse_args()
    if a.selftest:
        selftest()
    elif a.batch:
        search_batch(a.seed_dir, a.out, a.seed, a.minutes, a.temp, a.batch)
    else:
        search(a.seed_dir, a.out, a.seed, a.minutes, a.temp)
