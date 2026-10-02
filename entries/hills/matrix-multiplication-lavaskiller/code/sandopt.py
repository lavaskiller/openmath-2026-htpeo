"""Sandwich optimisation of a <3,3,3> scheme: U'=P U Q, V'=adj(Q) V R, W'=adj(P)^T W adj(R)^T
(up to per-term scalars, which do not change support). Exhaustive over all classes of invertible
{-1,0,1} 3x3 matrices modulo monomial factors, iterated to a fixpoint.

usage: sandopt.py in.txt out.txt   (txt format: "R support" then R lines of 27 ints u|v|w)
"""
import sys, itertools, math
import numpy as np


def load(fn):
    L = open(fn).read().split("\n")
    R = int(L[0].split()[0])
    rows = [list(map(int, L[1 + t].split())) for t in range(R)]
    a = np.array(rows, dtype=np.int64)
    U = a[:, 0:9].reshape(R, 3, 3)
    V = a[:, 9:18].reshape(R, 3, 3)
    W = a[:, 18:27].reshape(R, 3, 3).transpose(0, 2, 1)  # w index 3*k+i -> W[i][k]
    return U.copy(), V.copy(), W.copy()


def dump(fn, U, V, W):
    R = len(U)
    sup = int((U != 0).sum() + (V != 0).sum() + (W != 0).sum())
    with open(fn, "w") as f:
        f.write(f"{R} {sup}\n")
        for t in range(R):
            row = list(U[t].reshape(9)) + list(V[t].reshape(9)) + list(W[t].T.reshape(9))
            f.write(" ".join(str(int(x)) for x in row) + "\n")
    return sup


def adj(M):
    M = np.asarray(M)
    c = np.zeros((3, 3), dtype=np.int64)
    for i in range(3):
        for j in range(3):
            m = np.delete(np.delete(M, i, 0), j, 1)
            c[j, i] = (-1) ** (i + j) * (m[0, 0] * m[1, 1] - m[0, 1] * m[1, 0])
    return c


def classes():
    vecs = []
    for v in itertools.product((-1, 0, 1), repeat=3):
        nz = [x for x in v if x]
        if nz and nz[0] > 0:
            vecs.append(v)
    out = []
    for tri in itertools.combinations(vecs, 3):
        M = np.array(tri, dtype=np.int64)
        if round(np.linalg.det(M)) != 0:
            out.append(M)
    return out


ROWS = classes()                       # row-sets: P modulo left monomial
COLS = [M.T.copy() for M in ROWS]      # column-sets: Q, R modulo right monomial
PA = np.array(ROWS)
QA = np.array(COLS)
PAT = np.array([adj(M).T for M in ROWS])      # adj(P)^T
QADJ = np.array([adj(M) for M in COLS])       # adj(Q)
RADJT = np.array([adj(M).T for M in COLS])    # adj(R)^T


def best_sandwich(U, V, W):
    fU = (np.einsum("pab,tbc,qcd->pqtad", PA, U, QA) != 0).sum(axis=(2, 3, 4))
    fV = (np.einsum("qab,tbc,rcd->qrtad", QADJ, V, QA) != 0).sum(axis=(2, 3, 4))
    fW = (np.einsum("pab,tbc,rcd->prtad", PAT, W, RADJT) != 0).sum(axis=(2, 3, 4))
    best = None
    for q in range(len(COLS)):
        tot = fU[:, q][:, None] + fW + fV[q, :][None, :]
        idx = np.unravel_index(np.argmin(tot), tot.shape)
        if best is None or tot[idx] < best[0]:
            best = (int(tot[idx]), int(idx[0]), q, int(idx[1]))
    return best


def apply(U, V, W, p, q, r):
    U2 = np.einsum("ab,tbc,cd->tad", PA[p], U, QA[q])
    V2 = np.einsum("ab,tbc,cd->tad", QADJ[q], V, QA[r])
    W2 = np.einsum("ab,tbc,cd->tad", PAT[p], W, RADJT[r])
    # exact rescale: overall factor det(Q)*det(P)*det(R) spread over terms; normalise each term to
    # primitive integer u, v and put the remaining rational scale on w (must end up integral or we keep rational)
    return U2, V2, W2


def normalise(U, V, W, scale_num, scale_den):
    """Scheme sum = (scale_num/scale_den) * T. Make u,v primitive, w absorbs scale. Returns Fractions for w."""
    from fractions import Fraction
    R = len(U)
    Wf = []
    for t in range(R):
        gu = int(np.gcd.reduce(np.abs(U[t]).reshape(9)))
        gv = int(np.gcd.reduce(np.abs(V[t]).reshape(9)))
        U[t] //= gu
        V[t] //= gv
        Wf.append([[Fraction(int(W[t][i][k]) * gu * gv * scale_den, scale_num) for k in range(3)] for i in range(3)])
    return U, V, Wf


def optimise(U, V, W, verbose=False):
    """Iterate to fixpoint. Returns integer U, V and Fraction W (exact)."""
    from fractions import Fraction
    cur = int((U != 0).sum() + (V != 0).sum() + (W != 0).sum())
    Wf = [[[Fraction(int(x)) for x in row] for row in W[t]] for t in range(len(W))]
    while True:
        # integer image of W for support computations
        Wi = np.array([[[1 if x != 0 else 0 for x in row] for row in m] for m in Wf], dtype=np.int64)
        # need true values (cancellations) -> scale each term's W to integers
        Wint = np.zeros_like(Wi)
        dens = []
        for t, m in enumerate(Wf):
            d = 1
            for row in m:
                for x in row:
                    d = d * x.denominator // math.gcd(d, x.denominator)
            dens.append(d)
            for i in range(3):
                for k in range(3):
                    Wint[t][i][k] = int(m[i][k] * d)
        s, p, q, r = best_sandwich(U, V, Wint)
        if verbose:
            print("sandwich", cur, "->", s, file=sys.stderr)
        if s >= cur:
            break
        U2, V2, W2 = apply(U, V, Wint, p, q, r)
        det = int(round(np.linalg.det(PA[p]))) * int(round(np.linalg.det(QA[q]))) * int(round(np.linalg.det(QA[r])))
        # U2 V2 W2 (with Wint = d_t * W) sums to: det(Q)*det(P)*det(R) * T  per-term factor d_t
        newW = []
        for t in range(len(U2)):
            gu = int(np.gcd.reduce(np.abs(U2[t]).reshape(9)))
            gv = int(np.gcd.reduce(np.abs(V2[t]).reshape(9)))
            U2[t] //= gu
            V2[t] //= gv
            newW.append([[Fraction(int(W2[t][i][k]) * gu * gv, det * dens[t]) for k in range(3)] for i in range(3)])
        U, V, Wf, cur = U2, V2, newW, s
    return U, V, Wf, cur


def brent(U, V, Wf):
    from fractions import Fraction
    R = len(U)
    for i in range(3):
        for j in range(3):
            for j2 in range(3):
                for k in range(3):
                    for i2 in range(3):
                        for k2 in range(3):
                            s = sum(int(U[t][i][j]) * int(V[t][j2][k]) * Wf[t][i2][k2] for t in range(R))
                            if s != (1 if (j == j2 and i == i2 and k == k2) else 0):
                                return False
    return True


def to_solution(U, V, Wf):
    def enc(x):
        from fractions import Fraction
        x = Fraction(x)
        return int(x) if x.denominator == 1 else [x.numerator, x.denominator]
    R = len(U)
    return {
        "u": [[int(U[t][i][j]) for i in range(3) for j in range(3)] for t in range(R)],
        "v": [[int(V[t][j][k]) for j in range(3) for k in range(3)] for t in range(R)],
        "w": [[enc(Wf[t][i][k]) for k in range(3) for i in range(3)] for t in range(R)],
    }


if __name__ == "__main__":
    import json
    U, V, W = load(sys.argv[1])
    U, V, Wf, s = optimise(U, V, W, verbose=True)
    ok = brent(U, V, Wf)
    print("classes", len(ROWS), "support", s, "brent", ok)
    if ok:
        json.dump(to_solution(U, V, Wf), open(sys.argv[2], "w"))
