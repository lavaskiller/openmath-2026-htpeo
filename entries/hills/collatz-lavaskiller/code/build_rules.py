"""Target-agnostic optimal rule set for collatz-modular-descent.

Targets are hidden odd classes mod 2^kt, kt in 8..12. For every possible target we find
the valid rule (k<=kt, residue = t mod 2^k) with the maximum margin 1-3^s/2^E, at the
smallest valid k. The union of these rules gives, for ANY hidden target set, the maximum
possible coverage and the maximum possible min_descent. Then report counts.
"""
import json, sys
from fractions import Fraction
from collections import Counter


def v2(x):
    c = 0
    while x % 2 == 0:
        x //= 2
        c += 1
    return c


def rules_for(r, k):
    """All valid (exps, margin) for class r mod 2^k (r is the least representative)."""
    out = []
    cur, E, exps = r, 0, []
    for s in range(1, 25):
        num = 3 * cur + 1
        e = v2(num)
        if E + e > k - 1 or e > 32:
            break
        E += e
        exps.append(e)
        cur = num >> e
        if 3 ** s < (1 << E) and cur < r:
            out.append((tuple(exps), Fraction((1 << E) - 3 ** s, 1 << E)))
    return out


best_for = {}      # (kt, t) -> (margin, k, r, exps)
uncover = []
for kt in range(8, 13):
    for t in range(1, 1 << kt, 2):
        best = None
        for k in range(2, kt + 1):
            r = t % (1 << k)
            for exps, mg in rules_for(r, k):
                if best is None or mg > best[0]:
                    best = (mg, k, r, exps)   # smallest k wins on ties (k ascending)
        if best is None:
            uncover.append((kt, t))
        else:
            best_for[(kt, t)] = best

rules = {(b[1], b[2], b[3]): b[0] for b in best_for.values()}
# drop rules that are same-exps subclasses of another selected rule
keep = {}
for (k, r, exps), mg in rules.items():
    dom = any((k2, r % (1 << k2), exps) in rules for k2 in range(2, k))
    if not dom:
        keep[(k, r, exps)] = mg
print("targets", len(best_for), "uncoverable", len(uncover), "rules", len(rules), "kept", len(keep))
print("uncoverable by level", Counter(k for k, _ in uncover))
print("margin histogram of per-target best", sorted(Counter(float(b[0]) for b in best_for.values()).items())[:12])
json.dump({"rules": [{"modulus_power": k, "residue": r, "exponents": list(e)} for (k, r, e) in sorted(keep)]},
          open(sys.argv[1] if len(sys.argv) > 1 else "all_best_rules.json", "w"))
json.dump([[k, t] for k, t in uncover], open("uncoverable.json", "w"))
