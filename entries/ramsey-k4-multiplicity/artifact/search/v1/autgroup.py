"""Automorphism group of a certificate's colouring (red graph plus block colours).

Writes aut.json: generators (as permutation lists), group order, vertex orbits,
and the orbits of unordered vertex pairs, i.e. edge orbits including loops.

    python autgroup.py SOLUTION_DIR OUT.json
"""
import json
import sys
from pathlib import Path

import numpy as np
import pynauty

d = Path(sys.argv[1])
data = json.loads((d / "solution.json").read_text())
A = np.array([[int(c) for c in r] for r in data["red_rows"]], dtype=np.int8)
n = len(A)
adj = {i: [int(j) for j in np.nonzero(A[i])[0] if j != i] for i in range(n)}
# diagonal (block colour) as a vertex colouring
red_blocks = {i for i in range(n) if A[i, i]}
parts = [s for s in (red_blocks, set(range(n)) - red_blocks) if s]
g = pynauty.Graph(n, directed=False, adjacency_dict=adj, vertex_coloring=parts)
gens, grpsize1, grpsize2, orbits, numorbits = pynauty.autgrp(g)
order = grpsize1 * 10 ** grpsize2
print(f"n={n} |Aut|={order:.6g} generators={len(gens)} vertex orbits={numorbits}")

# orbits of unordered pairs {i,j} (i<=j) under the group: union-find over generator images
parent = {}


def find(x):
    while parent.setdefault(x, x) != x:
        parent[x] = parent[parent[x]]
        x = parent[x]
    return x


for i in range(n):
    for j in range(i, n):
        parent[(i, j)] = (i, j)
for p in gens:
    for i in range(n):
        for j in range(i, n):
            a, b = p[i], p[j]
            key = (a, b) if a <= b else (b, a)
            ri, rk = find((i, j)), find(key)
            if ri != rk:
                parent[ri] = rk
orb = {}
for i in range(n):
    for j in range(i, n):
        orb.setdefault(find((i, j)), []).append([i, j])
pair_orbits = list(orb.values())
sizes = sorted(len(o) for o in pair_orbits)
print(f"pair orbits: {len(pair_orbits)} (sizes {sizes[:5]} ... {sizes[-5:]})")
Path(sys.argv[2]).write_text(json.dumps({
    "n": n, "order": order, "generators": [list(p) for p in gens],
    "vertex_orbits": numorbits, "pair_orbits": pair_orbits}))
