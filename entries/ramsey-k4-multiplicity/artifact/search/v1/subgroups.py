"""Find a small vertex-transitive subgroup H of the seed's automorphism group:
start from the second derived subgroup and greedily add random group elements,
at each step keeping the candidate that merges vertex orbits with the smallest
resulting group order. Smaller H means more pair orbits, so finer symmetric moves.

    python subgroups.py AUT.json OUT.json [--samples 40] [--seed 1]
"""
import argparse
import json
from pathlib import Path

from sympy.combinatorics import Permutation, PermutationGroup

p = argparse.ArgumentParser()
p.add_argument("aut")
p.add_argument("out")
p.add_argument("--samples", type=int, default=40)
p.add_argument("--seed", type=int, default=1)
a = p.parse_args()

aut = json.loads(Path(a.aut).read_text())
G = PermutationGroup([Permutation(g) for g in aut["generators"]])
D2 = G.derived_subgroup().derived_subgroup()
gens = list(D2.generators)
H = D2
print("start", H.order(), "orbits", len(H.orbits()), flush=True)
results = {}
while not H.is_transitive():
    best = None
    k0 = len(H.orbits())
    for _ in range(a.samples):
        x = G.random_pr()
        K = PermutationGroup(gens + [x])
        k = len(K.orbits())
        if k < k0 and (best is None or (K.order(), k) < (best[1].order(), best[2])):
            best = (x, K, k)
    if best is None:
        print("no merging element found in this round; retrying", flush=True)
        continue
    gens.append(best[0])
    H = best[1]
    print(f"  added element: order {H.order()}, vertex orbits {best[2]}", flush=True)
print(f"transitive H: order {H.order()}, {len(gens)} generators", flush=True)
Path(a.out).write_text(json.dumps({"order": int(H.order()),
                                   "generators": [list(g.array_form) for g in gens]}))
