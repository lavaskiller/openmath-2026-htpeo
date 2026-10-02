#!/usr/bin/env python3
"""gh_check.py -- for every GitHub code-search hit (ghsearch.txt: "## query" then "owner/repo path" lines) fetch the raw file
and decide whether the target declaration is proved there (declaration body has no `sorry`). Output gh_check.tsv."""
import re, sys, urllib.request, urllib.parse, pathlib, hashlib
sys.path.insert(0, str(pathlib.Path.home()/"erdos-fc/m2"))
from verify_all import strip_comments
F = pathlib.Path.home()/"erdos-fc/m2/final"
C = F/"ghcache"; C.mkdir(exist_ok=True)
SKIP = {"google-deepmind/formal-conjectures"}
rows = []; q = None
for l in (F/"ghsearch.txt").read_text().splitlines():
    if l.startswith("## "): q = l[3:]; continue
    if " " not in l: continue
    repo, path = l.split(" ", 1)
    if repo in SKIP: continue
    name = q.split()[-1].split(".")[-1] if not q.startswith("Erdos295") else "exists_k"
    full = q if " " not in q else "exists_k"
    key = hashlib.md5((repo+path).encode()).hexdigest()
    cf = C/key
    if not cf.exists():
        try:
            url = "https://raw.githubusercontent.com/%s/HEAD/%s" % (repo, urllib.parse.quote(path))
            cf.write_bytes(urllib.request.urlopen(url, timeout=30).read())
        except Exception as e:
            rows.append((q, repo, path, "FETCH_FAIL %s" % e)); continue
    txt = cf.read_text(errors="replace")
    if not path.endswith(".lean") and not path.endswith(".lean.txt"):
        rows.append((q, repo, path, "non-lean")); continue
    s = strip_comments(txt)
    res = []
    for m in re.finditer(r"(?:theorem|lemma)\s+([\w.]*%s)\b" % re.escape(full.split(".")[-1] if "." in full else full), s):
        nxt = re.search(r"\n(?:@\[|theorem\b|lemma\b|def\b|end\b|namespace\b|/--|#|example\b|noncomputable\b|private\b|abbrev\b|instance\b)", s[m.end():])
        body = s[m.start(): m.end() + (nxt.start() if nxt else len(s))]
        pf = body.split(":=", 1)[1] if ":=" in body else ""
        res.append("%s:%s(%d chars)" % (m.group(1), "SORRY" if re.search(r"\bsorry\b", pf) or not pf.strip() else "PROVED", len(pf.strip())))
    rows.append((q, repo, path, ";".join(res) or "decl-not-found(mention only)"))
with open(F/"gh_check.tsv", "w") as fh:
    for r in rows: fh.write("\t".join(r) + "\n")
import collections
agg = collections.defaultdict(set)
for q, repo, path, r in rows:
    tag = "PROVED" if "PROVED" in r else ("sorry" if "SORRY" in r else r.split("(")[0][:20])
    agg[(q, repo)].add(tag)
for (q, repo), t in sorted(agg.items()):
    if "PROVED" in t: print("PROVED?", q, repo)
print("checked", len(rows), "files; proved-hits", sum(1 for t in agg.values() if "PROVED" in t))
