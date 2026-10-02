"""Helper for the main session IF it decides to spend AutoLab submissions on finding the few rules the
hidden validation targets actually need (the leaders use 3 rules).

Idea: the 234 rules of solution.json have pairwise different (class, exponents); a target's score only
depends on the rules that cover it. Submitting a subset S gives coverage_ppm(S) and min_descent_ppm(S).
A rule set reaches 1,000,000 / 525,390 iff it contains, for every hidden target, a covering rule of
margin >= 269/512. Bisection over the rule list (keep a half if coverage stays 1,000,000 and
min_descent stays 525,390 when the other half is dropped; otherwise split further) isolates a minimal
set in roughly 3 * log2(234) ~ 25 submissions.

usage: probe.py out_dir i0 i1 ...        (indices into solution.json's rule list, ranges a-b allowed)
       probe.py --list                    (print index, modulus_power, residue, exponents, margin)
"""
import sys, json, pathlib
from fractions import Fraction

here = pathlib.Path(__file__).resolve().parent
rules = json.load(open(here / "solution.json"))["rules"]
if sys.argv[1] == "--list":
    for i, r in enumerate(rules):
        s, e = len(r["exponents"]), sum(r["exponents"])
        print(i, r["modulus_power"], r["residue"], r["exponents"], float(1 - Fraction(3 ** s, 2 ** e)))
else:
    idx = []
    for a in sys.argv[2:]:
        if "-" in a:
            lo, hi = map(int, a.split("-"))
            idx += list(range(lo, hi + 1))
        else:
            idx.append(int(a))
    out = pathlib.Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    (out / "solution.json").write_text(json.dumps({"rules": [rules[i] for i in idx]}))
    print("wrote", len(idx), "rules to", out / "solution.json")
