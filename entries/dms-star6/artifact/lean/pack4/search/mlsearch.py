#!/usr/bin/env python3
"""Search (SAT) for star 5-edge-colourings of the Moebius ladders M_n (n rungs, 2n vertices), all n >= 4, of the form
'periodic part of period p + seam of length (n mod p) + p'.  Writes ml.json; the Lean file generated from it
(gen_ml.py) is the proof.  M_n: vertices t_i = i, b_i = n + i; edges of block i: t_i t_{i+1}, t_i b_i, b_i b_{i+1}
for i <= n-2, and t_{n-1} b_0, t_{n-1} b_{n-1}, b_{n-1} t_0 for the last block."""
import sys, json, os, time
from pysat.solvers import Cadical153
from gpsearch import walks, check, K
HERE = os.path.dirname(os.path.abspath(__file__))

def ML(n):
    E = []; own = []
    for i in range(n):
        t, b = i, n + i
        if i < n - 1: E += [(t, t + 1), (t, b), (b, b + 1)]
        else: E += [(t, n), (t, b), (b, 0)]
        own += [(i, 0), (i, 1), (i, 2)]
    return 2 * n, E, own

def solve(ns, pat):
    nv = [0]; var = {}
    def V(key):
        if key not in var:
            nv[0] += 1; var[key] = nv[0]
        return var[key]
    S = Cadical153()
    for n in ns:
        N, E, own = ML(n)
        if len(set(tuple(sorted(e)) for e in E)) != len(E): return None
        X = lambda e, a: V((pat(n, own[e][0]), own[e][1], a))
        adj, W = walks(N, E)
        for e in range(len(E)):
            S.add_clause([X(e, a) for a in range(K)])
            for a in range(K):
                for b in range(a + 1, K): S.add_clause([-X(e, a), -X(e, b)])
        for v in range(N):
            es = [e for _, e in adj[v]]
            for a in range(K):
                for i in range(3):
                    for j in range(i + 1, 3): S.add_clause([-X(es[i], a), -X(es[j], a)])
        for (e1, e2, e3, e4) in W:
            for a in range(K):
                for b in range(K):
                    if a != b: S.add_clause([-X(e1, a), -X(e2, b), -X(e3, a), -X(e4, b)])
    if not S.solve(): return None
    m = set(l for l in S.get_model() if l > 0)
    res = {}
    for (pid, slot, a), x in var.items():
        if x in m: res[(pid, slot)] = a
    for n in ns:
        N, E, own = ML(n)
        assert check(N, E, [res[(pat(n, own[e][0]), own[e][1])] for e in range(len(E))]), n
    return res

def run():
    extra = 1
    for p in [2, 3, 4, 5, 6, 7, 8]:
        q0 = -(-(p + 3) // p); c0 = p * (q0 + extra); N = c0 + p
        n0 = max(p, 3) + p * (extra + 1)
        if n0 >= N: n0 = N - 1
        def pat(n, i):
            s = n % p + p * extra
            return ('P', i % p) if i < n - s else ('S', n % p, i - (n - s))
        ns = list(range(n0, N + 2 * p))
        res = solve(ns, pat)
        print('p', p, 'ns', ns[0], ns[-1], 'FOUND' if res else 'none', flush=True)
        if not res: continue
        P = [[res[(('P', i), s)] for s in range(3)] for i in range(p)]
        Sm = {r: [[res[(('S', r, j), s)] for s in range(3)] for j in range(r + p * extra)] for r in range(p)}
        small = {}; bad = []
        for n in range(3, n0):
            r1 = solve([n], lambda n_, i: ('X', i))
            if r1 is None: bad.append(n); small[n] = None
            else: small[n] = [[r1[(('X', i), s)] for s in range(3)] for i in range(n)]
        json.dump({'p': p, 'extra': extra, 'q0': q0, 'c0': c0, 'N': N, 'n0': n0, 'P': P,
                   'S': {str(r): v for r, v in Sm.items()}, 'small': {str(n): v for n, v in small.items()}, 'bad': bad},
                  open(os.path.join(HERE, 'ml.json'), 'w'))
        print('written; small n without colouring:', bad, flush=True)
        return
    print('NOTHING FOUND')

if __name__ == '__main__':
    run()
