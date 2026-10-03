"""Offline search for Kobon triangle arrangements.
The hill's evaluator only reads ``solution.json`` (a list of integer triples
``[a, b, c]`` meaning ``a*x + b*y + c = 0``).  This script builds such an
arrangement of ``n`` lines offline, counting bounded empty triangular faces with
exact integer arithmetic, and writes the best arrangement found.
Usage:
    python search/kobon.py --n 18 --seconds 120 --out solution.json
"""
import argparse
import json
import math
import os
import random
import sys
from math import gcd
# ---------------------------------------------------------------- exact counter
def normalize(line):
    """Reduce an integer line (a, b, c) to a canonical primitive form."""
    a, b, c = (int(line[0]), int(line[1]), int(line[2]))
    g = gcd(gcd(abs(a), abs(b)), abs(c))
    if g:
        a, b, c = a // g, b // g, c // g
    # canonical sign: first nonzero coefficient positive
    for v in (a, b, c):
        if v != 0:
            if v < 0:
                a, b, c = -a, -b, -c
            break
    return (a, b, c)
def count_triangles(lines, want_triples=False):
    """Count bounded triangular faces of an arrangement of integer lines.
    A triple of lines contributes iff the three lines pairwise meet in three
    distinct points (nonzero area) and no other line of the arrangement crosses
    the open interior of that triangle.  Lines through a vertex are allowed.
    """
    n = len(lines)
    A = [l[0] for l in lines]
    B = [l[1] for l in lines]
    C = [l[2] for l in lines]
    # homogeneous intersection points, plus the sign of every line evaluated
    # at every intersection point (normalised so that w > 0).
    pt = {}
    sgn = [[0] * (n * n) for _ in range(n)]
    for i in range(n):
        ai, bi, ci = A[i], B[i], C[i]
        for j in range(i + 1, n):
            aj, bj, cj = A[j], B[j], C[j]
            w = ai * bj - aj * bi
            if w == 0:
                continue  # parallel
            x = bi * cj - bj * ci
            y = ci * aj - cj * ai
            if w < 0:
                w, x, y = -w, -x, -y
            pt[(i, j)] = (x, y, w)
            for m in range(n):
                if m == i or m == j:
                    continue
                v = A[m] * x + B[m] * y + C[m] * w
                s = 1 if v > 0 else (-1 if v < 0 else 0)
                sgn[m][i * n + j] = s
    total = 0
    triples = []
    for i in range(n):
        for j in range(i + 1, n):
            pij = pt.get((i, j))
            if pij is None:
                continue
            for k in range(j + 1, n):
                pik = pt.get((i, k))
                if pik is None:
                    continue
                pjk = pt.get((j, k))
                if pjk is None:
                    continue
                # degenerate (concurrent) iff the three points coincide
                if (pij[0] * pik[2] == pik[0] * pij[2]
                        and pij[1] * pik[2] == pik[1] * pij[2]):
                    continue
                ok = True
                kij = i * n + j
                kik = i * n + k
                kjk = j * n + k
                for m in range(n):
                    if m == i or m == j or m == k:
                        continue
                    row = sgn[m]
                    s1 = row[kij]
                    s2 = row[kik]
                    s3 = row[kjk]
                    if s1 > 0:
                        if s2 < 0 or s3 < 0:
                            ok = False
                            break
                    elif s1 < 0:
                        if s2 > 0 or s3 > 0:
                            ok = False
                            break
                    else:
                        if (s2 > 0 and s3 < 0) or (s2 < 0 and s3 > 0):
                            ok = False
                            break
                if ok:
                    total += 1
                    if want_triples:
                        triples.append((i, j, k))
    if want_triples:
        return total, triples
    return total
def valid(lines):
    """Exactly n distinct lines, each with (a, b) != (0, 0)."""
    norm = [normalize(l) for l in lines]
    if any(a == 0 and b == 0 for a, b, _ in norm):
        return False
    return len(set(norm)) == len(norm)
# ------------------------------------------------------------- initial configs
def circle_tangents(n, scale, jitter, rng, offset=0.0):
    """n near-tangent lines of a circle, directions spread over 180 degrees."""
    lines = []
    for i in range(n):
        th = math.pi * (i + offset) / n + jitter * (rng.random() - 0.5)
        a = int(round(scale * math.cos(th)))
        b = int(round(scale * math.sin(th)))
        r = 1.0 + jitter * (rng.random() - 0.5)
        c = -int(round(scale * r))
        if a == 0 and b == 0:
            a = 1
        lines.append(normalize((a, b, c)))
    return lines
def random_lines(n, scale, rng):
    lines = []
    while len(lines) < n:
        a = rng.randint(-scale, scale)
        b = rng.randint(-scale, scale)
        c = rng.randint(-scale, scale)
        if a == 0 and b == 0:
            continue
        lines.append(normalize((a, b, c)))
    return lines
def rotational(n, fold, scale, rng, jitter):
    """Arrangement with approximate `fold`-fold rotational symmetry."""
    assert n % fold == 0
    base = n // fold
    lines = []
    for i in range(base):
        th = math.pi * (i + 0.5) / base + jitter * (rng.random() - 0.5)
        r = 1.0 + jitter * (rng.random() - 0.5)
        ca, sa = math.cos(th), math.sin(th)
        for f in range(fold):
            phi = 2 * math.pi * f / fold
            cx, sx = math.cos(phi), math.sin(phi)
            a = ca * cx - sa * sx
            b = ca * sx + sa * cx
            lines.append(normalize((int(round(scale * a)),
                                    int(round(scale * b)),
                                    -int(round(scale * r)))))
    return lines
# -------------------------------------------------------------------- annealing
def perturb(lines, rng, scale, strength):
    n = len(lines)
    out = list(lines)
    t = rng.randrange(n)
    a, b, c = out[t]
    kind = rng.random()
    if kind < 0.45:
        # nudge the direction
        da = rng.randint(-strength, strength)
        db = rng.randint(-strength, strength)
        a, b = a + da, b + db
    elif kind < 0.9:
        # slide the line
        c = c + rng.randint(-strength, strength)
    else:
        # resample from scratch
        a = rng.randint(-scale, scale)
        b = rng.randint(-scale, scale)
        c = rng.randint(-scale, scale)
    if a == 0 and b == 0:
        return None
    if max(abs(a), abs(b), abs(c)) > 50 * scale:
        return None
    out[t] = normalize((a, b, c))
    if len(set(out)) != n:
        return None
    return out
def anneal(lines, seconds, rng, scale, t0=1.2, t1=0.03, log=None):
    import time
    cur = list(lines)
    cur_score = count_triangles(cur)
    best, best_score = list(cur), cur_score
    start = time.time()
    it = 0
    while True:
        el = time.time() - start
        if el >= seconds:
            break
        frac = el / seconds
        temp = t0 * (t1 / t0) ** frac
        strength = max(1, int(scale * 0.05 * (1.0 - frac) ** 2) + 1)
        cand = perturb(cur, rng, scale, strength)
        it += 1
        if cand is None:
            continue
        s = count_triangles(cand)
        d = s - cur_score
        if d >= 0 or rng.random() < math.exp(d / temp):
            cur, cur_score = cand, s
            if s > best_score:
                best, best_score = list(cand), s
                if log:
                    log(best_score, it, el)
    return best, best_score, it
# ------------------------------------------------------------------------- main
def main(argv=None):
    p = argparse.ArgumentParser()
    p.add_argument("--n", type=int, default=int(os.environ.get("KOBON_N", 18)))
    p.add_argument("--seconds", type=float,
                   default=float(os.environ.get("KOBON_SECONDS", 120)))
    p.add_argument("--restarts", type=int,
                   default=int(os.environ.get("KOBON_RESTARTS", 8)))
    p.add_argument("--scale", type=int,
                   default=int(os.environ.get("KOBON_SCALE", 400)))
    p.add_argument("--seed", type=int, default=int(os.environ.get("KOBON_SEED", 0)))
    p.add_argument("--out", default="solution.json")
    p.add_argument("--start", default=None,
                   help="optional json file whose lines seed the search")
    p.add_argument("--check", action="store_true", help="only verify --start")
    p.add_argument("--jobs", type=int, default=int(os.environ.get("KOBON_JOBS", 1)),
                   help="run this many independent searches in parallel processes")
    args = p.parse_args(argv)
    n, scale = args.n, args.scale
    rng = random.Random(args.seed)
    if args.check:
        with open(args.start) as fh:
            lines = [tuple(l) for l in json.load(fh)["lines"]]
        cnt, tri = count_triangles(lines, want_triples=True)
        print("lines=%d valid=%s triangles=%d" % (len(lines), valid(lines), cnt))
        print("triples:", tri)
        return 0
    seeds = []
    if args.start:
        with open(args.start) as fh:
            seeds.append([normalize(l) for l in json.load(fh)["lines"]])
    if args.jobs > 1:
        import multiprocessing as mp
        tasks = [(args.n, args.scale, args.seconds, args.restarts,
                  args.seed + 1000 * w, list(seeds)) for w in range(args.jobs)]
        with mp.Pool(args.jobs) as pool:
            results = pool.map(_worker, tasks)
        best, best_score = None, -1
        for cand, score in results:
            if score > best_score:
                best, best_score = cand, score
        print("parallel best over %d workers: %d triangles"
              % (args.jobs, best_score), flush=True)
    else:
        best, best_score = _search(args.n, args.scale, args.seconds,
                                   args.restarts, args.seed, seeds, verbose=True)
    assert valid(best) and len(best) == args.n
    exact = count_triangles(best)
    assert exact == best_score
    with open(args.out, "w") as fh:
        json.dump({"lines": [list(l) for l in best]}, fh)
    print("wrote %s with %d lines, %d triangles" % (args.out, args.n, best_score))
    return 0
def _worker(task):
    n, scale, seconds, restarts, seed, seeds = task
    return _search(n, scale, seconds, restarts, seed, seeds, verbose=False)
def _search(n, scale, seconds, restarts, seed, seeds, verbose=False):
    rng = random.Random(seed)
    seeds = list(seeds)
    best, best_score = None, -1
    per = seconds / max(1, restarts)
    for r in range(restarts):
        if seeds:
            init = seeds.pop(0)
        elif r % 3 == 0:
            init = circle_tangents(n, scale, 0.35, rng)
        elif r % 3 == 1 and n % 3 == 0:
            init = rotational(n, 3, scale, rng, 0.3)
        else:
            init = random_lines(n, scale, rng)
        if not valid(init):
            init = random_lines(n, scale, rng)
        logger = None
        if verbose:
            logger = lambda s, i, e: print(
                "  restart %d: %d triangles (it=%d, %.1fs)" % (r, s, i, e),
                flush=True)
        cand, score, it = anneal(init, per, rng, scale, log=logger)
        if verbose:
            print("restart %d: final %d triangles (%d iters)" % (r, score, it),
                  flush=True)
        if score > best_score:
            best, best_score = cand, score
    return best, best_score
if __name__ == "__main__":
    sys.exit(main())
