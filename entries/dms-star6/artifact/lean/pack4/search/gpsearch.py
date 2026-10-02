#!/usr/bin/env python3
"""Search (SAT, pysat/CaDiCaL) for star 5-edge-colourings of GP(n,k), k fixed, all n >= 2k+1, of the form
'periodic part of period p followed by a seam of length (n mod p) + p*extra', plus explicit colourings for small n.
usage: gpsearch.py k [k ...]   -> writes gp<k>.json next to this script.  The output is only a candidate:
the Lean files generated from it (gen_gpk.py) are the proof."""
import sys, json, os, time
from pysat.solvers import Cadical153
K = 5
HERE = os.path.dirname(os.path.abspath(__file__))

def GP(n, k):
    E = []; own = []
    for i in range(n):
        E += [(i, (i + 1) % n), (i, n + i), (n + i, n + (i + k) % n)]; own += [(i, 0), (i, 1), (i, 2)]
    return 2 * n, E, own

def walks(n, E):
    adj = [[] for _ in range(n)]
    for i, (a, b) in enumerate(E):
        adj[a].append((b, i)); adj[b].append((a, i))
    W = set()
    for v1 in range(n):
        for v0, e1 in adj[v1]:
            for v2, e2 in adj[v1]:
                if e2 == e1: continue
                for v3, e3 in adj[v2]:
                    if e3 == e2 or v3 == v1 or v3 == v0: continue
                    for v4, e4 in adj[v3]:
                        if e4 == e3 or v4 in (v1, v2): continue
                        w = (e1, e2, e3, e4); W.add(min(w, w[::-1]))
    return adj, W

def check(n, E, col):
    adj, W = walks(n, E)
    for v in range(n):
        cs = [col[e] for _, e in adj[v]]
        if len(cs) != len(set(cs)): return False
    return not any(col[a] == col[c] and col[b] == col[d] for a, b, c, d in W)

def solve(k, ns, pat):
    nv = [0]; var = {}
    def V(key):
        if key not in var:
            nv[0] += 1; var[key] = nv[0]
        return var[key]
    S = Cadical153()
    for n in ns:
        N, E, own = GP(n, k)
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
        N, E, own = GP(n, k)
        col = [res[(pat(n, own[e][0]), own[e][1])] for e in range(len(E))]
        assert check(N, E, col), n
    return res

def run(k):
    t0 = time.time()
    for extra in [1, 0, 2]:
        for p in [4, 5, 3, 6, 7, 8, 2, 9, 10, 1]:
            q0 = -(-(p + 3 * k) // p)
            c0 = p * (q0 + extra)          # rep target n' = c0 + n % p
            N = c0 + p                     # all n < N are checked directly
            n0 = max(p, 2 * k + 1) + p * (extra + 1)
            n0 = max(n0, 2 * k + 1)
            if n0 >= N: continue
            seam = lambda n: n % p + p * extra
            def pat(n, i):
                s = seam(n)
                return ('P', i % p) if i < n - s else ('S', n % p, i - (n - s))
            ns = list(range(n0, N + 2 * p))
            res = solve(k, ns, pat)
            print(k, 'p', p, 'extra', extra, 'ns', ns[0], ns[-1], 'FOUND' if res else 'none', round(time.time() - t0, 1), flush=True)
            if not res: continue
            P = [[res[(('P', i), s)] for s in range(3)] for i in range(p)]
            Sm = {r: [[res[(('S', r, j), s)] for s in range(3)] for j in range(r + p * extra)] for r in range(p)}
            small = {}; bad = []
            for n in range(2 * k + 1, n0):
                r1 = solve(k, [n], lambda n_, i: ('X', i))
                if r1 is None: bad.append(n); small[n] = None
                else: small[n] = [[r1[(('X', i), s)] for s in range(3)] for i in range(n)]
            out = {'k': k, 'p': p, 'extra': extra, 'q0': q0, 'c0': c0, 'N': N, 'n0': n0, 'P': P,
                   'S': {str(r): v for r, v in Sm.items()}, 'small': {str(n): v for n, v in small.items()}, 'bad': bad}
            json.dump(out, open(os.path.join(HERE, 'gp%d.json' % k), 'w'))
            print(k, 'written; small n without colouring:', bad, flush=True)
            return
    print(k, 'NOTHING FOUND', flush=True)

if __name__ == '__main__':
    for a in sys.argv[1:]: run(int(a))
