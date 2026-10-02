#!/usr/bin/env python3
"""prior_art.py -- duplicate / prior-art record for every theorem in m2/verified.json.
(i) FC main on GitHub: formal_proof tag / non-sorry proof / statement drift vs pinned commit
(ii) plby/lean-proofs clone: files named after the problem, occurrences of the theorem name
Writes m2/PRIOR_ART.tsv and m2/prior_art.json. Read-only except under m2/."""
import json, re, subprocess, pathlib, sys
sys.path.insert(0, str(pathlib.Path(__file__).parent))
from verify_all import find_decl, strip_comments, norm, FC, M2, ROOT

PLBY = ROOT / "plby"
MAIN = M2 / "fcmain"; MAIN.mkdir(exist_ok=True)
URL = "https://raw.githubusercontent.com/google-deepmind/formal-conjectures/main/FormalConjectures/ErdosProblems/%s.lean"
import urllib.request, urllib.parse, time
JC = M2 / "jsp_cache.json"
jc = json.loads(JC.read_text()) if JC.exists() else {}
def jsp(n):
    """PR/issue titles in TheJustinSunPrize/awards mentioning Erdos problem n (GitHub search API, cached)."""
    if n in jc: return jc[n]
    q = urllib.parse.quote("repo:TheJustinSunPrize/awards Erdős %s in:title" % n)
    try:
        req = urllib.request.Request("https://api.github.com/search/issues?per_page=30&q=" + q, headers={"User-Agent": "m2-check", "Accept": "application/vnd.github+json"})
        j = json.loads(urllib.request.urlopen(req, timeout=30).read().decode())
        jc[n] = ["#%d [%s] %s" % (i["number"], i["created_at"][:10], i["title"][:140]) for i in j.get("items", []) if re.search(r"(?<!\d)%s(?!\d)" % n, i["title"])]
        JC.write_text(json.dumps(jc, indent=1)); time.sleep(7)
        return jc[n]
    except Exception as e:
        time.sleep(7); return ["SEARCH_FAILED %r" % e]
rows = json.loads((M2 / "verified.json").read_text())
out = {}
fetched = {}
for r in rows:
    n = r["problem"]; short = re.sub(r"^Erdos\d+\.", "", r["theorem"])
    key = "%s %s" % (n, short)
    if key in out: continue
    d = dict(problem=n, theorem=short)
    if n not in fetched:
        p = MAIN / ("%s.lean" % n)
        rc = subprocess.run(["curl", "-sSfL", "--max-time", "30", "-o", str(p), URL % n], capture_output=True, text=True)
        fetched[n] = p.read_text() if rc.returncode == 0 and p.exists() else None
    main = fetched[n]
    if main is None:
        d["fc_main"] = "FETCH_FAILED"
    else:
        fd = find_decl(main, short)
        if not fd: d["fc_main"] = "target_not_found_on_main"
        else:
            a0, d0, e0, _ = fd
            attr = norm(main[a0:d0]); decl = strip_comments(main[a0:e0]).rstrip()
            has_tag = "formal_proof" in attr
            sorry = bool(re.search(r"\bsorry\b", decl[decl.find(":="):] if ":=" in decl else decl))
            stmt_main = norm(re.sub(r":=\s*(?:by\s+)?sorry\s*\Z", "", decl))
            drift = r["fc_stmt"] and not stmt_main.startswith(r["fc_stmt"]) and not norm(decl).startswith(r["fc_stmt"])
            d["fc_main"] = ("formal_proof_TAG" if has_tag else "no_tag") + ("" if sorry else "+proof_present_on_main") + ("+statement_differs_from_pinned" if drift else "")
            d["fc_main_attr"] = attr
    names = [x.name for x in PLBY.rglob("*") if x.is_file() and ".git" not in x.parts and re.search(r"(?<!\d)%s(?!\d)" % n, x.name) and re.search(r"erd", str(x), re.I)]
    d["plby_files"] = sorted(set(names))[:8]
    g = subprocess.run(["grep", "-rlF", "--exclude-dir=.git", short, str(PLBY)], capture_output=True, text=True).stdout.split()
    d["plby_name_hits"] = [x.replace(str(PLBY) + "/", "") for x in g][:8]
    g2 = subprocess.run(["grep", "-rlE", "--exclude-dir=.git", r"(erdosproblems\.com/%s([^0-9]|$)|Erd[oő]s (Problem )?#?%s([^0-9]|$)|ErdosProblems/%s\.lean)" % (n, n, n), str(PLBY)],
                        capture_output=True, text=True).stdout.split()
    d["plby_number_hits"] = [x.replace(str(PLBY) + "/", "") for x in g2][:8]
    d["jsp"] = jsp(n)
    out[key] = d
(M2 / "prior_art.json").write_text(json.dumps(out, indent=1))
with open(M2 / "PRIOR_ART.tsv", "w") as fh:
    fh.write("problem\ttheorem\tfc_main\tplby_files\tplby_name_hits\tplby_number_hits\tjsp_pr_titles\n")
    for k, d in out.items():
        line = "\t".join([d["problem"], d["theorem"], d.get("fc_main", "?"), ",".join(d["plby_files"]) or "-", ",".join(d["plby_name_hits"]) or "-", ",".join(d["plby_number_hits"]) or "-"])
        fh.write(line + "\t" + " ; ".join(d["jsp"]) + "\n")
print("prior art rows:", len(out))
