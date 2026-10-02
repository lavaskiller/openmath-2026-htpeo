"""Greedy set cover: fewest rules such that every coverable target class (odd, mod 2^8..2^12)
has a matching rule with margin >= min(T, best margin available for that target).
Usage: cover_rules.py T_num T_den out.json
"""
import json, sys
from fractions import Fraction
from collections import defaultdict
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



T = Fraction(int(sys.argv[1]), int(sys.argv[2]))
match = {}
for kt in range(8, 13):
    for t in range(1, 1 << kt, 2):
        lst = []
        for k in range(2, kt + 1):
            r = t % (1 << k)
            for exps, mg in rules_for(r, k):
                lst.append(((k, r, exps), mg))
        if lst:
            match[(kt, t)] = lst
covers = defaultdict(set); skip=set(); MODE=sys.argv[4] if len(sys.argv)>4 else 'C'
for tg, lst in match.items():
    bm = max(mg for _, mg in lst)
    if MODE=='A' and bm < T: skip.add(tg); continue
    need = T if bm >= T else (0 if MODE=='B' else bm)
    for rule, mg in lst:
        if mg >= need:
            covers[rule].add(tg)
todo = set(match)-skip
chosen = []
while todo:
    rule = max(covers, key=lambda q: (len(covers[q] & todo), -q[0]))
    got = covers[rule] & todo
    chosen.append(rule)
    todo -= got
# reverse-delete redundant rules
def ok(rs):
    s = set()
    for q in rs:
        s |= covers[q]
    return len(s) >= len(match)-len(skip) and (set(match)-skip) <= s
for q in list(chosen)[::-1]:
    rest = [x for x in chosen if x != q]
    if ok(rest):
        chosen = rest
print(MODE, "T", float(T), "skipped", len(skip), "targets", len(match), "rules", len(chosen))
json.dump({"rules": [{"modulus_power": k, "residue": r, "exponents": list(e)} for (k, r, e) in sorted(chosen)]}, open(sys.argv[3], "w"))
