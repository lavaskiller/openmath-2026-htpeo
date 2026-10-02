"""Base blocks of the seed: classes of near-twins (Aut pair-orbits 1,2,3: blue pairs with symmetric difference 22/26)."""
import json
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent


def base_blocks(n=768, orbits=(1, 2, 3)):
    aut = json.loads((HERE / "aut_seed.json").read_text())
    parent = list(range(n))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    for k in orbits:
        for a, b in aut["pair_orbits"][k]:
            parent[find(a)] = find(b)
    lab = np.array([find(i) for i in range(n)])
    _, lab = np.unique(lab, return_inverse=True)
    return lab


def origin_map(split_file_A, n0=768):
    """copy index -> original index, from the pre-search split file (copies have identical rows)."""
    A0 = split_file_A
    out = {}
    for c in range(n0, len(A0)):
        m = np.nonzero((A0[:n0] == A0[c]).all(1))[0]
        out[c] = int(m[0])
    return out
