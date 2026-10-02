"""Furedi-Palasti arrangement for n lines as (theta, d) with line cos(theta) x + sin(theta) y = d,
after a projective map chosen to keep triangles bounded. Also exact conversion + check via eval.py.

fp.py gen n variant out.txt          -> write float start file
fp.py check n in.txt out_solution.json [scale]  -> rationalise, count exactly with eval.py
"""
import sys, math, json, importlib.util, pathlib
from fractions import Fraction

HERE = pathlib.Path(__file__).resolve().parent


def ev():
    for p in (HERE / "hill" / "eval.py", HERE / "eval.py"):
        if p.exists():
            s = importlib.util.spec_from_file_location("kev", p)
            m = importlib.util.module_from_spec(s)
            s.loader.exec_module(m)
            return m


def fp_lines(n, variant):
    """Homogeneous (a,b,c) float lines. L(alpha): through P(alpha) and P(pi-2alpha)."""
    out = []
    for i in range(n):
        al = 2 * math.pi * i / n + (math.pi / n if variant % 2 else 0.0)
        be = math.pi - 2 * al
        p = (math.cos(al), math.sin(al))
        q = (math.cos(be), math.sin(be))
        if math.hypot(p[0] - q[0], p[1] - q[1]) < 1e-9:   # tangent
            a, b, c = p[0], p[1], -1.0
        else:
            a, b = q[1] - p[1], p[0] - q[0]
            c = -(a * p[0] + b * p[1])
        out.append((a, b, c))
    return out


def projective(lines, M):
    """Apply point map x -> M x; lines transform by inverse transpose. M 3x3 list. Line vector (a,b,c)."""
    import numpy as np
    Mi = np.linalg.inv(np.array(M, dtype=float))
    return [tuple(np.array(l) @ Mi) for l in lines]


def to_td(lines):
    res = []
    for a, b, c in lines:
        r = math.hypot(a, b)
        res.append((math.atan2(b / r, a / r), -c / r))
    return res


def rationalise(td, scale):
    rows = []
    for t, d in td:
        rows.append([round(math.cos(t) * scale), round(math.sin(t) * scale), -round(d * scale)])
    return rows


if __name__ == "__main__":
    cmd = sys.argv[1]
    n = int(sys.argv[2])
    if cmd == "gen":
        variant = int(sys.argv[3])
        lines = fp_lines(n, variant)
        if variant >= 2:
            # move the line at infinity: random-ish projective map
            eps = [0.0, 0.11, 0.23, 0.37][variant // 2 % 4]
            lines = projective(lines, [[1, 0, 0], [0, 1, 0], [eps, eps * 0.618, 1]])
        td = to_td(lines)
        open(sys.argv[4], "w").write(f"{n}\n" + "\n".join(f"{t!r} {d!r}" for t, d in td) + "\n")
    elif cmd == "check":
        L = open(sys.argv[3]).read().split("\n")
        td = [tuple(map(float, L[1 + i].split())) for i in range(n)]
        scale = int(float(sys.argv[5])) if len(sys.argv) > 5 else 10 ** 12
        rows = rationalise(td, scale)
        m = ev()
        lines = [m._normalize(r) for r in rows]
        cnt = len(m.count_triangles(lines))
        print("exact triangles", cnt)
        json.dump({"lines": rows}, open(sys.argv[4], "w"))
