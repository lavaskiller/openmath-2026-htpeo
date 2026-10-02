"""Heule-Kauers-Seidl database of 3x3 rank-23 schemes (17376 schemes, JKU Linz,
http://www.algebra.uni-linz.ac.at/research/matrix-multiplication/): fetch the .exp files,
convert to the hill's coordinates (Brent-checked), write txt seeds + a support table.

hks.py fetch            -> hks/<family>/<name>.exp      (threaded, polite: 6 connections)
hks.py convert          -> hks_txt/<name>.txt for every scheme passing the exact Brent check,
                           hks_support.tsv (name, support)
"""
import sys, os, re, json, urllib.request, concurrent.futures as cf

BASE = "http://www.algebra.uni-linz.ac.at/research/matrix-multiplication/"
HERE = os.path.dirname(os.path.abspath(__file__))


def get(u):
    for _ in range(3):
        try:
            return urllib.request.urlopen(urllib.request.Request(u, headers={"User-Agent": "Mozilla/5.0"}), timeout=30).read().decode("utf-8", "replace")
        except Exception as e:
            err = e
    return None


def index():
    t = open(os.path.join(HERE, "jku_index.html")).read()
    fams = re.findall(r"<option value=\"([^\"]+)\"", t)
    ent = re.findall(r"entries\.push\(\[([^\]]*)\]\)", t)
    # the first len(ent) option values are the family names (select 'solution'); the rest belong to the scheme select
    fams = fams[:len(ent)]
    out = []
    for fam, e in zip(fams, ent):
        for name in re.findall(r"\"([^\"]+)\"", e):
            out.append((fam, name))
    return out


def fetch():
    items = index()
    def wkey(it):
        m = re.search(r"w(\d+)", it[1])
        return int(m.group(1)) if m else 0
    items.sort(key=wkey)
    print("schemes in index", len(items), flush=True)
    os.makedirs(os.path.join(HERE, "hks"), exist_ok=True)

    def one(it):
        fam, name = it
        fn = os.path.join(HERE, "hks", fam + "__" + name + ".exp")
        if os.path.exists(fn) and os.path.getsize(fn) > 100:
            return 1
        t = get(BASE + "schemes/" + fam + "/" + name + ".exp")
        if t is None or "*" not in t:
            return 0
        open(fn, "w").write(t)
        return 1
    with cf.ThreadPoolExecutor(10) as ex:
        ok = 0
        for i, r in enumerate(ex.map(one, items)):
            ok += r
            if i % 2000 == 0:
                print(i, ok, flush=True)
    print("fetched", ok, "of", len(items), flush=True)


TERM = re.compile(r"([+-]?)\s*(\d*)\s*\*?\s*([abc])(\d)(\d)")


def parse(text):
    rows = []
    for line in text.strip().split("\n"):
        line = line.strip()
        if not line:
            continue
        parts = re.findall(r"\(([^()]*)\)", line)
        if len(parts) != 3:
            return None
        vecs = {}
        for p in parts:
            v = [0] * 9
            letter = None
            for sg, num, let, i, j in TERM.findall(p):
                letter = let
                v[3 * (int(i) - 1) + (int(j) - 1)] += (-1 if sg == "-" else 1) * (int(num) if num else 1)
            vecs[letter] = v
        if set(vecs) != {"a", "b", "c"}:
            return None
        rows.append((vecs["a"], vecs["b"], vecs["c"]))
    return rows


def brent(U, V, W):
    R = len(U)
    for a in range(9):
        for b in range(9):
            ua = [(t, U[t][a] * V[t][b]) for t in range(R) if U[t][a] and V[t][b]]
            i, j, j2, k = a // 3, a % 3, b // 3, b % 3
            for c in range(9):
                s = sum(x * W[t][c] for t, x in ua)
                if s != (1 if (j == j2 and c == 3 * k + i) else 0):
                    return False
    return True


def convert():
    os.makedirs(os.path.join(HERE, "hks_txt"), exist_ok=True)
    d = os.path.join(HERE, "hks")
    res = []
    bad = 0
    for fn in sorted(os.listdir(d)):
        rows = parse(open(os.path.join(d, fn)).read())
        if not rows:
            bad += 1
            continue
        U = [r[0] for r in rows]
        V = [r[1] for r in rows]
        C = [r[2] for r in rows]
        Ct = [[c[3 * (x % 3) + x // 3] for x in range(9)] for c in C]
        W = None
        for cand in (C, Ct):
            if brent(U, V, cand):
                W = cand
                break
        if W is None:
            bad += 1
            continue
        sup = sum(x != 0 for M in (U, V, W) for r in M for x in r)
        name = fn[:-4]
        with open(os.path.join(HERE, "hks_txt", name + ".txt"), "w") as f:
            f.write(f"{len(U)} {sup}\n" + "\n".join(" ".join(map(str, U[t] + V[t] + W[t])) for t in range(len(U))) + "\n")
        res.append((sup, name, len(U)))
    res.sort()
    with open(os.path.join(HERE, "hks_support.tsv"), "w") as f:
        for sup, name, r in res:
            f.write(f"{name}\t{r}\t{sup}\n")
    print("converted", len(res), "bad", bad, "min support", res[:5])


if __name__ == "__main__":
    {"fetch": fetch, "convert": convert}[sys.argv[1]]()
