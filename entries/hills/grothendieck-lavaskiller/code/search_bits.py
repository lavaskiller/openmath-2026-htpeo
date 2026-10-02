"""Exhaustive search: min certificate_bits for the 2x2 CHSH witness with gap_ppm >= 1414213.

matrix [[1,1],[1,-1]], d=2. objective = v1.(u1+u2) + v2.(u1-u2) >= 2*1.414213.
Points = rational points on the unit circle with denominator <= N.
"""
import sys, math, json, bisect
from fractions import Fraction

N = int(sys.argv[1]) if len(sys.argv) > 1 else 1 << 16
BEST = int(sys.argv[2]) if len(sys.argv) > 2 else 80   # report everything <= BEST
T = 2 * 1.414213
W = 2.2e-3
bl = int.bit_length

pts = []  # (angle, x, y, cost, (xn, xd, yn, yd))
for s in ((1, 0), (0, 1), (-1, 0), (0, -1)):
    pts.append((math.atan2(s[1], s[0]), float(s[0]), float(s[1]), 3, (s[0], 1, s[1], 1)))
m = 2
while m * m + 1 <= N:
    for n in range(1 + (m % 2), m, 2):
        if math.gcd(m, n) != 1:
            continue
        c = m * m + n * n
        if c > N:
            break
        a, b = m * m - n * n, 2 * m * n
        cost = bl(a) + bl(b) + 2 * bl(c)
        if cost > BEST - 9:
            continue
        for p, q in ((a, b), (b, a)):
            for sx in (1, -1):
                for sy in (1, -1):
                    x, y = sx * p / c, sy * q / c
                    pts.append((math.atan2(y, x), x, y, cost, (sx * p, c, sy * q, c)))
    m += 1
pts.sort()
n0 = len(pts)
TWO = 2 * math.pi
ext = [(a - TWO, x, y, c, r) for (a, x, y, c, r) in pts] + pts + [(a + TWO, x, y, c, r) for (a, x, y, c, r) in pts]
angs = [p[0] for p in ext]
print("points", n0, file=sys.stderr)


def window(center):
    while center > math.pi:
        center -= TWO
    while center < -math.pi:
        center += TWO
    lo = bisect.bisect_left(angs, center - W)
    hi = bisect.bisect_right(angs, center + W)
    return ext[lo:hi]


def exact(u1, u2, v1, v2):
    f = lambda r: (Fraction(r[0], r[1]), Fraction(r[2], r[3]))
    a, b, c, d = f(u1), f(u2), f(v1), f(v2)
    dot = lambda p, q: p[0] * q[0] + p[1] * q[1]
    return dot(a, c) + dot(a, d) + dot(b, c) - dot(b, d)


best = BEST
found = []
for (a1, x1, y1, c1, r1) in pts:
    if not (-1e-12 <= a1 <= math.pi / 4 + 1e-12):
        continue
    if c1 > best - 9:
        continue
    for sgn in (1, -1):
        for (a2, x2, y2, c2, r2) in window(a1 + sgn * math.pi / 2):
            if c1 + c2 > best - 6:
                continue
            sx, sy, dx, dy = x1 + x2, y1 + y2, x1 - x2, y1 - y2
            ns, nd = math.hypot(sx, sy), math.hypot(dx, dy)
            if ns + nd < T - 1e-12:
                continue
            rem = best - c1 - c2
            l1 = [(c, x * sx + y * sy, r) for (_, x, y, c, r) in window(math.atan2(sy, sx)) if c <= rem - 3 and x * sx + y * sy + nd >= T - 1e-12]
            if not l1:
                continue
            l2 = [(c, x * dx + y * dy, r) for (_, x, y, c, r) in window(math.atan2(dy, dx)) if c <= rem - 3 and x * dx + y * dy + ns >= T - 1e-12]
            for (ca, va, ra) in l1:
                for (cb, vb, rb) in l2:
                    tot = c1 + c2 + ca + cb
                    if tot <= best and va + vb >= T - 1e-12:
                        ob = exact(r1, r2, ra, rb)
                        if ob >= 2 * Fraction(1414213, 1000000):
                            found.append((tot, float(ob) / 2, r1, r2, ra, rb))
                            if tot < best:
                                best = tot
                                print("new best", tot, float(ob) / 2, r1, r2, ra, rb, file=sys.stderr, flush=True)
found.sort()
print(json.dumps({"N": N, "min_bits": found[0][0] if found else None, "count_at_min": sum(1 for f in found if f[0] == found[0][0]) if found else 0, "top": found[:12]}))
