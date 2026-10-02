#!/usr/bin/env python3
"""jsp_scan4.py -- like jsp_scan.py/jsp_scan2.py, for the advanced families (508 138 942 770 273 617) and for
Schoenberger/Petersen (perfect matchings in bridgeless cubic graphs). Output: m2/final/jsp_scan4.json"""
import subprocess, re, json, pathlib, collections
J = pathlib.Path.home()/"erdos-fc/jsp"
def git(*a): return subprocess.run(["git","-C",str(J),*a],capture_output=True).stdout.decode("utf-8","replace")
NUMS = "508 138 942 770 273 617".split()
num = lambda n: r"(Erd[oő\\\"{}]*s[^\n|]{0,40}?(#|No\.?\s*|[Pp]roblem\s*)%s(?!\d)|erdosproblems\.com/(latex/)?%s(?!\d)|ErdosProblems/%s\.lean|[Ee]rdos_?%s(?!\d)|Erd[oő]s\s+%s(?!\d)|EP\s?%s(?!\d))" % ((n,)*6)
KW = {
 "508seven": r"AtMostSeven|Isbell|[Hh]exagonal (tiling|colou?ring)|seven.colou?r|7.colou?ring of the plane|chromaticNumber[^\n]{0,60}≤ 7",
 "649tong": r"\bTong\b|variants\.tong|erdos_649|[Ee]rdos649|maxPrimeFac",
 "942limsup": r"variants\.limsup|erdos_942|[Pp]owerful[^\n]{0,80}limsup|limsup[^\n]{0,80}[Pp]owerful|squarefull",
 "617": r"r_eq_3|erdos_617|[Ee]rdos617|balanced colou?ring|Erd[oő]s.Gy[aá]rf[aá]s",
 "1136": r"variants\.mueller|muellerSet|M[uü]e?ller",
}
pat = {n: re.compile(v) for n, v in KW.items()}
main = set(l.split()[2] for l in git("ls-tree","-r","origin/HEAD").splitlines())
refs = [l.split() for l in git("for-each-ref","--format=%(refname) %(objectname)","refs/pr").splitlines()]
blobs = collections.defaultdict(list); subj = {}
for ref, sha in refs:
    pr = ref.split("/")[-1]; subj[pr] = git("log","-1","--format=%cI %s",sha).strip()
    for l in git("ls-tree","-r",sha).splitlines():
        meta, path = l.split("\t",1); b = meta.split()[2]
        if b not in main and not re.match(r"problems/(catalog-.*|README)\.md$", path) and not path.endswith((".json",".png",".pdf",".olean")): blobs[b].append((pr, path))
out = {n: {} for n in KW}
p = subprocess.Popen(["git","-C",str(J),"cat-file","--batch"],stdin=subprocess.PIPE,stdout=subprocess.PIPE)
for b, where in blobs.items():
    p.stdin.write((b+"\n").encode()); p.stdin.flush()
    hdr = p.stdout.readline().split(); size = int(hdr[2]); data = p.stdout.read(size+1)[:-1].decode("utf-8","replace")
    for n in KW:
        ms = list(pat[n].finditer(data))
        if ms:
            kws = sorted(set(m.group(0)[:40] for m in ms))[:8]
            for pr, path in where[:60]:
                out[n].setdefault(pr, {"subject": subj[pr], "files": {}})["files"][path] = kws
json.dump(out, open(pathlib.Path.home()/"erdos-fc/m2/final/jsp_scan4.json","w"), indent=1, ensure_ascii=False)
print("refs", len(refs), "blobs scanned", len(blobs))
# also main tree
for n in KW:
    r = subprocess.run(["git","-C",str(J),"grep","-l","-E",KW[n].replace("(?!\d)","\b"),"origin/HEAD"],capture_output=True,text=True).stdout.splitlines()
    print("== %s main-tree files: %d %s" % (n, len(r), r[:6]))
for n in KW:
    print("==", n, "PRs:", len(out[n]))
    for pr, d in sorted(out[n].items(), key=lambda x:int(x[0]))[:30]:
        fs = list(d["files"].items()); lean = [f for f,_ in fs if f.endswith(".lean")]
        allk = sorted(set(k for _,ks in fs for k in ks))
        print("  #%s %s | lean=%d/%d %s | kw=%s" % (pr, d["subject"][26:110], len(lean), len(fs), (lean or [fs[0][0]])[0][-60:], ",".join(allk)[:140]))
