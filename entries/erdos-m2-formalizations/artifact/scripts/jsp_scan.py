#!/usr/bin/env python3
"""jsp_scan.py -- exhaustive grep of every PR head tree of TheJustinSunPrize/awards (shallow-fetched to refs/pr/*)
for the Erdos problem numbers of the candidate M2 families. Output: m2/final/jsp_scan.json"""
import subprocess, re, json, pathlib, collections
J = pathlib.Path.home()/"erdos-fc/jsp"
def git(*a): return subprocess.run(["git","-C",str(J),*a],capture_output=True).stdout.decode("utf-8","replace")
NUMS = "36 44 123 261 292 295 395 649 698 703 748 757 835 859 918 939 1063 1074 1136 1193".split()
main = set(l.split()[2] for l in git("ls-tree","-r","origin/HEAD").splitlines())
refs = [l.split() for l in git("for-each-ref","--format=%(refname) %(objectname)","refs/pr").splitlines()]
blobs = collections.defaultdict(list)   # sha -> [(pr, path)]
subj = {}
for ref, sha in refs:
    pr = ref.split("/")[-1]
    subj[pr] = git("log","-1","--format=%cI %s",sha).strip()
    for l in git("ls-tree","-r",sha).splitlines():
        meta, path = l.split("\t",1); b = meta.split()[2]
        if b not in main: blobs[b].append((pr, path))
print("refs", len(refs), "unique non-main blobs", len(blobs))
pat = {n: re.compile(r"(Erd[oő\\\"{}]*s[^\n|]{0,40}?(#|No\.?\s*|[Pp]roblem\s*)%s(?!\d)|erdosproblems\.com/(latex/)?%s(?!\d)|ErdosProblems/%s\.lean|[Ee]rdos_?%s(?!\d)|Erd[oő]s\s+%s(?!\d)|EP\s?%s(?!\d))" % ((n,)*6)) for n in NUMS}
out = {n: {} for n in NUMS}
p = subprocess.Popen(["git","-C",str(J),"cat-file","--batch"],stdin=subprocess.PIPE,stdout=subprocess.PIPE)
for b, where in blobs.items():
    p.stdin.write((b+"\n").encode()); p.stdin.flush()
    hdr = p.stdout.readline().split(); size = int(hdr[2]); data = p.stdout.read(size+1)[:-1].decode("utf-8","replace")
    for n in NUMS:
        ms = [m for m in pat[n].finditer(data)]
        if ms:
            lines = []
            for m in ms[:6]:
                s = data.rfind("\n",0,m.start())+1; e = data.find("\n",m.end()); lines.append(data[s:e if e>0 else None][:500])
            for pr, path in where[:40]:
                out[n].setdefault(pr, {"subject": subj[pr], "files": {}})["files"][path] = lines
json.dump(out, open(pathlib.Path.home()/"erdos-fc/m2/final/jsp_scan.json","w"), indent=1, ensure_ascii=False)
for n in NUMS:
    print("==", n, "PRs:", len(out[n]))
    for pr, d in sorted(out[n].items(), key=lambda x:int(x[0]))[:25]:
        print("  #%s %s | %s" % (pr, d["subject"][:150], ",".join(list(d["files"])[:3])[:120]))
