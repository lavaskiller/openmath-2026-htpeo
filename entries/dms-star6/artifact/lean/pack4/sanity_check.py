#!/usr/bin/env python3
"""sanity_check.py sanity.out — independent check (no Lean) of the edge lists printed by src/Sanity.lean:
J_5, J_7, G_5 as defined in pack4 are compared with the textbook edge lists, are cubic simple graphs of girth >= 5
without a proper 3-edge-colouring (i.e. snarks), GP(5,2) is the Petersen graph, and the colourings printed for J_5
and G_5 are star edge colourings by brute force over all 4-edge paths/cycles."""
import sys, ast, itertools
lines = [l for l in open(sys.argv[1], encoding='utf-8').read().splitlines() if l.startswith('[')]
J5, J7, G5, P = [ast.literal_eval(l) for l in lines[:4]]
cJ5, cG5 = [ast.literal_eval(l) for l in lines[4:6]]
M5, INF = [ast.literal_eval(l) for l in lines[6:8]]
def norm(E): return sorted(tuple(sorted(e)) for e in E)
def flower(n):
    a = lambda j: 4 * j; b = lambda j: 4 * j + 1; c = lambda j: 4 * j + 2; d = lambda j: 4 * j + 3
    E = []
    for j in range(n):
        E += [(a(j), b(j)), (a(j), c(j)), (a(j), d(j)), (b(j), b((j + 1) % n))]
        if j <= n - 2: E += [(c(j), c(j + 1)), (d(j), d(j + 1))]
    E += [(c(n - 1), d(0)), (d(n - 1), c(0))]
    return E
def goldberg(k):
    v = lambda a, t: 8 * (t % k) + a - 1
    E = []
    for t in range(k):
        for (x, y) in [(1, 2), (1, 7), (2, 8), (3, 4), (3, 8), (4, 7), (5, 6), (6, 7), (6, 8)]: E.append((v(x, t), v(y, t)))
        E += [(v(2, t), v(1, t + 1)), (v(4, t), v(3, t + 1)), (v(5, t), v(5, t + 1))]
    return E
def mobius(n):
    c = lambda i: 2 * (i % (2 * n)) if (i % (2 * n)) < n else 2 * ((i % (2 * n)) - n) + 1
    return [(c(i), c(i + 1)) for i in range(2 * n)] + [(c(i), c(i + n)) for i in range(n)]
def info(E):
    n = max(max(e) for e in E) + 1
    adj = [[] for _ in range(n)]
    for i, (x, y) in enumerate(E): adj[x].append((y, i)); adj[y].append((x, i))
    cubic = all(len(a) == 3 for a in adj); simple = len(set(norm(E))) == len(E) and all(x != y for x, y in E)
    g = 99
    for s in range(n):
        dist = {s: 0}; par = {s: -1}; q = [s]
        for u in q:
            for w, _ in adj[u]:
                if w not in dist: dist[w] = dist[u] + 1; par[w] = u; q.append(w)
                elif par[u] != w: g = min(g, dist[u] + dist[w] + 1)
    col = [-1] * len(E)
    def three(i):          # proper 3-edge-colouring by backtracking
        if i == len(E): return True
        x, y = E[i]
        used = {col[e] for _, e in adj[x] if col[e] >= 0} | {col[e] for _, e in adj[y] if col[e] >= 0}
        for c in range(3):
            if c not in used:
                col[i] = c
                if three(i + 1): return True
                col[i] = -1
        return False
    return n, len(E), cubic, simple, g, three(0)
def star(E, c):
    n = max(max(e) for e in E) + 1
    adj = [[] for _ in range(n)]
    for i, (x, y) in enumerate(E): adj[x].append((y, i)); adj[y].append((x, i))
    for v in range(n):
        cs = [c[e] for _, e in adj[v]]
        if len(set(cs)) != len(cs): return False
    for v1 in range(n):
        for v0, e1 in adj[v1]:
            for v2, e2 in adj[v1]:
                if e2 == e1: continue
                for v3, e3 in adj[v2]:
                    if e3 == e2 or v3 in (v0, v1): continue
                    for v4, e4 in adj[v3]:
                        if e4 == e3 or v4 in (v1, v2): continue
                        if c[e1] == c[e3] and c[e2] == c[e4]: return False
    return True
print('J5 = textbook edge list:', norm(J5) == norm(flower(5)), ' J7:', norm(J7) == norm(flower(7)), ' G5:', norm(G5) == norm(goldberg(5)))
print('M5 = textbook edge list (cycle c_0..c_9 + chords c_i c_{i+5}):', norm(M5) == norm(mobius(5)))
for name, E in [('J5', J5), ('J7', J7), ('G5', G5), ('GP(5,2)', P), ('M5', M5), ('inflation of the theta graph', INF)]:
    n, m, cubic, simple, g, c3 = info(E)
    print(f'{name}: {n} vertices, {m} edges, cubic={cubic}, simple={simple}, girth={g}, 3-edge-colourable={c3}')
print('printed colouring of J5 is a star colouring (brute force):', star(J5, cJ5), max(cJ5) + 1, 'colours')
print('printed colouring of G5 is a star colouring (brute force):', star(G5, cG5), max(cG5) + 1, 'colours')
