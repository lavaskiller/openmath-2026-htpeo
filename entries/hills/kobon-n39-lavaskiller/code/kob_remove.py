"""Build 39-line arrangements from the public gallery certificates (ud1/kobon-solutions,
Parpalak & Utkin) by deleting lines, counting exactly with the hill's eval.py.

usage: kob_remove.py <certificate.json> <target_n> <out_prefix> [exhaustive|greedy]
"""
import sys, json, math, importlib.util, pathlib, itertools
from fractions import Fraction

HERE = pathlib.Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("kev", HERE / "eval.py" if (HERE / "eval.py").exists() else HERE / "hill" / "eval.py")
kev = importlib.util.module_from_spec(spec)
spec.loader.exec_module(kev)


def load_cert(fn):
    d = json.load(open(fn))
    rows = []
    for a, b, c in d["lines_frac"]:
        a, b, c = Fraction(a), Fraction(b), Fraction(c)
        den = math.lcm(a.denominator, b.denominator, c.denominator)
        rows.append([int(a * den), int(b * den), int(-c * den)])
    return rows, d.get("triangle_count")


def count(rows):
    return len(kev.count_triangles([kev._normalize(r) for r in rows]))


def write(prefix, rows, cnt):
    json.dump({"lines": rows}, open(f"{prefix}_{cnt}.json", "w"))
    with open(f"{prefix}_{cnt}.txt", "w") as f:
        f.write(f"{len(rows)}\n")
        for a, b, c in rows:
            r = math.hypot(a, b)
            f.write(f"{math.atan2(b / r, a / r)!r} {(-c / r)!r}\n")


if __name__ == "__main__":
    rows, tc = load_cert(sys.argv[1])
    target = int(sys.argv[2])
    prefix = sys.argv[3]
    mode = sys.argv[4] if len(sys.argv) > 4 else "greedy"
    n = len(rows)
    print("loaded", n, "declared", tc, "exact", count(rows), flush=True)
    k = n - target
    if mode == "exhaustive":
        res = []
        for comb in itertools.combinations(range(n), k):
            sub = [r for i, r in enumerate(rows) if i not in comb]
            res.append((count(sub), comb))
        res.sort(reverse=True)
        print("top", res[:10], flush=True)
        for cnt, comb in res[:3]:
            sub = [r for i, r in enumerate(rows) if i not in comb]
            write(prefix + "_" + "-".join(map(str, comb)), sub, cnt)
    else:
        cur = rows
        for step in range(k):
            best = max(((count(cur[:i] + cur[i + 1:]), i) for i in range(len(cur))))
            print("remove", best, flush=True)
            cur = cur[:best[1]] + cur[best[1] + 1:]
        write(prefix, cur, count(cur))
