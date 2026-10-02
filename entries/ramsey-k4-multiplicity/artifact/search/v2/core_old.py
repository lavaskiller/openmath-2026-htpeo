"""Shared pieces: load/save, float energy and gradient, tabu state, exact check."""
from __future__ import annotations

import ctypes
import json
import math
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
REF_PPT = 30142273432      # ceil(1e12 * 10486266368/768^4)
LEADER_PPT = 30141720824   # snapshot 27 Sep (second-hand)


def load(path):
    p = Path(path)
    if p.is_dir():
        p = p / "solution.json"
    data = json.loads(p.read_text())
    w = np.array(data["weights"], dtype=np.int64)
    A = np.array([[int(c) for c in row] for row in data["red_rows"]], dtype=np.int8)
    return w, A


def save(path, w, A) -> None:
    p = Path(path)
    p.parent.mkdir(parents=True, exist_ok=True)
    rows = ["".join("1" if x else "0" for x in r) for r in np.asarray(A).astype(int)]
    tmp = p.with_suffix(".tmp")
    tmp.write_text(json.dumps({"schema": "weighted-two-color-blowup-v1",
                               "weights": [int(x) for x in w], "red_rows": rows}))
    tmp.replace(p)


def hill_exact(w, A):
    """(density Fraction, beaten, ppt) from the hill's own evaluator code."""
    for cand in (HERE / "hill", HERE.parent / "hill"):
        if (cand / "eval.py").exists():
            sys.path.insert(0, str(cand))
            break
    import eval as E
    rows = ["".join("1" if x else "0" for x in r) for r in np.asarray(A).astype(int)]
    ww, rows = E._validate({"schema": "weighted-two-color-blowup-v1",
                            "weights": [int(x) for x in w], "red_rows": rows})
    red, blue, den = E._density(ww, rows)
    density, beaten, metrics = E._metrics(red, blue, den)
    return density, bool(beaten), metrics[1]["value"]


def rooted(x, A) -> np.ndarray:
    """t_a = sum_{j,k,l} x_j x_k x_l [a,j,k,l monochromatic], loops included. E = x.t, dE/dx = 4t."""
    n = len(x)
    t = np.zeros(n)
    Af = A.astype(np.float64)
    for M in (Af, 1.0 - Af):
        for a in range(n):
            idx = np.nonzero(M[a])[0]
            if idx.size == 0:
                continue
            S = M[np.ix_(idx, idx)] * x[idx][None, :]
            t[a] += float(np.einsum("ij,ji->", S @ S, S))
    return t


def energy(x, A) -> float:
    return float(x @ rooted(x, A))


def ppt_of(E, x) -> float:
    return E / float(np.sum(x)) ** 4 * 1e12


def brute(x, A) -> float:
    n, tot = len(x), 0.0
    for M in (A, 1 - A):
        for i in range(n):
            for j in range(n):
                if not M[i, j]:
                    continue
                for k in range(n):
                    if not (M[i, k] and M[j, k]):
                        continue
                    for l in range(n):
                        if M[i, l] and M[j, l] and M[k, l]:
                            tot += x[i] * x[j] * x[k] * x[l]
    return tot


class State:
    def __init__(self, x, A):
        self.n = n = len(x)
        self.x = np.ascontiguousarray(x, dtype=np.float64)
        self.A = np.ascontiguousarray(A, dtype=np.int8).copy()
        self.col = []
        Af = self.A.astype(np.float64)
        for M in (Af, 1.0 - Af):
            d = np.diag(M).copy()
            Z = M - np.diag(d)
            S = (Z * self.x[None, :]) @ Z
            zw = Z @ self.x
            T = np.zeros((n, n))
            V = np.zeros(n)
            for a in range(n):
                idx = np.nonzero(Z[a])[0]
                if idx.size == 0:
                    continue
                B = Z[:, idx]
                C = self.x[idx][:, None] * M[np.ix_(idx, idx)] * self.x[idx][None, :]
                T[a] = np.einsum("ij,ij->i", B @ C, B)
                V[a] = C.sum()
            self.col.append([np.ascontiguousarray(v) for v in (Z, d, T, S, V, zw)])
        self.tabu = np.zeros((n, n), dtype=np.int32)
        self.it = 0
        self.bestA = self.A.copy()

    def arrays(self):
        if self.col is not None:
            (Zr, dr, Tr, Sr, Vr, zr), (Zb, db, Tb, Sb, Vb, zb) = self.col
            self.tab = [np.ascontiguousarray(v) for v in (Tr - Tb, Sr, Sb, Vr - Vb, zr - zb)]
            self.col = None
        return self.tab

    def diff(self, other) -> float:
        m = 0.0
        for i, (u, v) in enumerate(zip(self.arrays(), other.arrays())):
            if i < 3:   # the diagonals of D and S are unused
                u = u - np.diag(np.diag(u))
                v = v - np.diag(np.diag(v))
            m = max(m, float(np.max(np.abs(u - v)) / (1.0 + np.max(np.abs(v)))))
        return m


_lib = None


def lib():
    global _lib
    if _lib is None:
        _lib = ctypes.CDLL(str(HERE / "tabu.so"))
        _lib.tabu_run.restype = ctypes.c_long
    return _lib


def tabu_run(st: State, cur: float, best: float, steps: int, seconds: float,
             tlo: int, thi: int, seed: int, tol: float):
    P = lambda a: a.ctypes.data_as(ctypes.c_void_p)
    c_cur, c_best, c_nb = ctypes.c_double(cur), ctypes.c_double(best), ctypes.c_long(0)
    done = lib().tabu_run(ctypes.c_int(st.n), P(st.x), P(st.A), *[P(a) for a in st.arrays()],
                          P(st.tabu), ctypes.c_long(st.it), ctypes.c_long(steps),
                          ctypes.c_double(seconds), ctypes.c_int(tlo), ctypes.c_int(thi),
                          ctypes.c_uint64(seed), ctypes.c_double(tol),
                          ctypes.byref(c_cur), ctypes.byref(c_best), P(st.bestA), ctypes.byref(c_nb))
    st.it += done
    return done, c_cur.value, c_best.value, c_nb.value


def optimise_weights(x, A, iters: int, eta: float, log=print):
    """Adaptive exponentiated gradient on P = E/Q^4 (step grows while P falls, shrinks on a rise)."""
    def PR(x):
        t = rooted(x, A)
        E = float(x @ t)
        Q = float(x.sum())
        return E / Q ** 4 * 1e12, Q * t / E

    x = x / x.mean()
    P, r = PR(x)
    P0 = P
    for it in range(iters):
        x2 = x * np.exp(-eta * (r - 1.0))
        x2 = x2 / x2.mean()
        P2, r2 = PR(x2)
        if P2 < P:
            x, P, r = x2, P2, r2
            eta = min(eta * 1.25, 64.0)
        else:
            eta *= 0.4
    log(f"  weights: {iters} its, P {P0:.1f} -> {P:.1f}, eta={eta:.3g}, x range {x.min():.3f}..{x.max():.3f}")
    return x, P


def to_int(x, scale: int = 65535):
    return np.maximum(1, np.rint(x / x.max() * scale)).astype(np.int64)


def selftest() -> None:
    rng = np.random.default_rng(0)
    for n in (4, 6, 9, 12):
        for trial in range(6):
            x = rng.integers(1, 5, n).astype(np.float64) if trial % 2 else np.ones(n)
            A = rng.integers(0, 2, (n, n)).astype(np.int8)
            A = np.triu(A) + np.triu(A, 1).T
            e0 = brute(x, A)
            assert abs(energy(x, A) - e0) < 1e-6, "rooted energy"
            st = State(x, A)
            done, cur, best, nb = tabu_run(st, e0, e0, 25, 10.0, 1, 3, trial + 1, 1e-9)
            assert done == 25
            assert abs(brute(x, st.A) - cur) < 1e-6, ("cur", n, trial)
            assert abs(brute(x, st.bestA) - best) < 1e-6, ("best", n, trial)
            assert st.diff(State(x, st.A)) < 1e-9, ("state drift", n, trial)
    print("selftest ok")


def sa_run(st: State, cur: float, best: float, temp: float, seconds: float, seed: int, tol: float,
           pl=None, pmix: float = 0.0):
    P = lambda a: a.ctypes.data_as(ctypes.c_void_p)
    L = lib()
    L.sa_run.restype = ctypes.c_long
    c_cur, c_best, c_nb, c_pr = ctypes.c_double(cur), ctypes.c_double(best), ctypes.c_long(0), ctypes.c_long(0)
    acc = L.sa_run(ctypes.c_int(st.n), P(st.x), P(st.A), *[P(a) for a in st.arrays()],
                   ctypes.c_double(temp), ctypes.c_double(seconds), ctypes.c_uint64(seed), ctypes.c_double(tol),
                   ctypes.byref(c_cur), ctypes.byref(c_best), P(st.bestA), ctypes.byref(c_nb), ctypes.byref(c_pr),
                   P(pl) if pl is not None else ctypes.c_void_p(0), ctypes.c_long(0 if pl is None else len(pl)),
                   ctypes.c_double(pmix))
    return acc, c_cur.value, c_best.value, c_nb.value, c_pr.value


def mean_abs_delta(st: State, seed: int = 1) -> float:
    P = lambda a: a.ctypes.data_as(ctypes.c_void_p)
    L = lib()
    L.mean_abs_delta.restype = ctypes.c_double
    return L.mean_abs_delta(ctypes.c_int(st.n), P(st.x), P(st.A), *[P(a) for a in st.arrays()], ctypes.c_uint64(seed))


def selftest_sa() -> None:
    rng = np.random.default_rng(5)
    for n in (5, 8, 12):
        for trial in range(6):
            x = rng.integers(1, 5, n).astype(np.float64) if trial % 2 else np.ones(n)
            A = rng.integers(0, 2, (n, n)).astype(np.int8)
            A = np.triu(A) + np.triu(A, 1).T
            e0 = brute(x, A)
            st = State(x, A)
            T = 0.3 * mean_abs_delta(st)
            acc, cur, best, nb, pr = sa_run(st, e0, e0, T, 0.02, trial + 1, 1e-9)
            assert acc > 10
            assert abs(brute(x, st.A) - cur) < 1e-6 * e0, ("cur", n, trial)
            assert abs(brute(x, st.bestA) - best) < 1e-6 * e0, ("best", n, trial)
            assert st.diff(State(x, st.A)) < 1e-9, ("state drift", n, trial)
    print("sa selftest ok")


class Soft:
    """Soft-pair structure for compound moves: neighbour lists and indicator matrix."""

    def __init__(self, pl, n):
        pl = np.asarray(pl)
        sm = np.zeros((n, n), dtype=np.int8)
        m = pl[:, 0] != pl[:, 1]
        sm[pl[m, 0], pl[m, 1]] = 1
        sm[pl[m, 1], pl[m, 0]] = 1
        self.sm = np.ascontiguousarray(sm)
        self.cnt = np.ascontiguousarray(sm.sum(1), dtype=np.int32)
        self.maxd = int(self.cnt.max())
        nb = np.zeros((n, self.maxd), dtype=np.int32)
        for a in range(n):
            idx = np.nonzero(sm[a])[0]
            nb[a, :len(idx)] = idx
        self.nb = np.ascontiguousarray(nb)


def sa2_run(st: State, cur, best, temp, seconds, seed, tol, soft: Soft, pm=(0.2, 0.4, 0.4), stats=None):
    P = lambda a: a.ctypes.data_as(ctypes.c_void_p)
    L = lib()
    L.sa2_run.restype = ctypes.c_long
    if stats is None:
        stats = np.zeros(8, dtype=np.int64)
    pmv = np.ascontiguousarray(list(pm) + [1.0] * (4 - len(pm)), dtype=np.float64)
    c_cur, c_best, c_nb = ctypes.c_double(cur), ctypes.c_double(best), ctypes.c_long(0)
    acc = L.sa2_run(ctypes.c_int(st.n), P(st.x), P(st.A), *[P(a) for a in st.arrays()],
                    ctypes.c_double(temp), ctypes.c_double(seconds), ctypes.c_uint64(seed), ctypes.c_double(tol),
                    ctypes.byref(c_cur), ctypes.byref(c_best), P(st.bestA), ctypes.byref(c_nb),
                    P(soft.nb), P(soft.cnt), ctypes.c_int(soft.maxd), P(soft.sm), P(pmv), P(stats))
    return acc, c_cur.value, c_best.value, c_nb.value, stats


def selftest_sa2() -> None:
    rng = np.random.default_rng(7)
    L = lib()
    L.coupl_x.restype = ctypes.c_double
    L.pair_delta_x.restype = ctypes.c_double
    P = lambda a: a.ctypes.data_as(ctypes.c_void_p)
    for n in (5, 8, 11):
        for trial in range(6):
            x = rng.integers(1, 5, n).astype(np.float64) if trial % 2 else np.ones(n)
            A = rng.integers(0, 2, (n, n)).astype(np.int8)
            A = np.triu(A) + np.triu(A, 1).T
            e0 = brute(x, A)
            st = State(x, A)
            for _ in range(5):
                v, p_, q = (int(t) for t in rng.choice(n, 3, replace=False))
                d1 = L.pair_delta_x(ctypes.c_int(n), P(st.x), P(st.A), *[P(a) for a in st.arrays()], ctypes.c_int(v), ctypes.c_int(p_))
                d2 = L.pair_delta_x(ctypes.c_int(n), P(st.x), P(st.A), *[P(a) for a in st.arrays()], ctypes.c_int(v), ctypes.c_int(q))
                J = L.coupl_x(ctypes.c_int(n), P(st.x), P(st.A), ctypes.c_int(v), ctypes.c_int(p_), ctypes.c_int(q))
                B = A.copy()
                B[v, p_] ^= 1; B[p_, v] ^= 1; B[v, q] ^= 1; B[q, v] ^= 1
                assert abs(brute(x, B) - e0 - (d1 + d2 + J)) < 1e-6, ("coupl", n, trial)
            pl = np.array([(i, j) for i in range(n) for j in range(i + 1, n)])
            soft = Soft(pl, n)
            T = 0.3 * mean_abs_delta(st)
            acc, cur, best, nb, stats = sa2_run(st, e0, e0, T, 0.03, trial + 1, 1e-9, soft)
            assert acc > 10 and stats[4] > 0 and stats[5] > 0, stats
            assert abs(brute(x, st.A) - cur) < 1e-6 * e0, ("cur", n, trial)
            assert abs(brute(x, st.bestA) - best) < 1e-6 * e0, ("best", n, trial)
            assert st.diff(State(x, st.A)) < 1e-9, ("state drift", n, trial)
    print("sa2 selftest ok")


if __name__ == "__main__":
    selftest()
    selftest_sa()
    selftest_sa2()
