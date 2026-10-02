#!/usr/bin/env python3
"""jsp_scan2.py -- keyword scan (theorem names / statement vocabulary) of every non-main blob in every PR head of TheJustinSunPrize/awards,
excluding problems/catalog-*.md and problems/README.md for number-only hits. Output: m2/final/jsp_scan2.json"""
import subprocess, re, json, pathlib, collections
J = pathlib.Path.home()/"erdos-fc/jsp"
def git(*a): return subprocess.run(["git","-C",str(J),*a],capture_output=True).stdout.decode("utf-8","replace")
KW = {
 "36": r"MinOverlapQuotient|minimum_overlap|[Mm]inimum overlap",
 "44": r"greedy_sidon|IsSidon|Sidon",
 "123": r"powers_2_3|IsDComplete|[dD]-complete|erdosproblems\.com/123(?!\d)|Erd[oő]s\s*#?123(?!\d)|[Ee]rdos_?123(?!\d)",
 "261": r"borwein_loring|Borwein|Erdos261Prop|erdos_261",
 "292": r"erdos_292|Erd[oő]s\s*#?292(?!\d)|IsPrimePow.*unit|[Ee]rdos292(?!\d)",
 "295": r"erdos_295|[Ee]rdos295|exists_k\b",
 "395": r"signedSumCount|erdos_395|Carnielli|[Ee]rdos395|Reverse Littlewood|reverse Littlewood",
 "649": r"maxPrimeFac|sampaio|Sampaio|erdos_649|[Ee]rdos649",
 "698": r"erdos_szekeres|erdos_698|[Ee]rdos698",
 "703": r"erdos_703|[Ee]rdos703|Frankl.R[oö]dl",
 "748": r"erdos_748|[Ee]rdos748|Cameron.Erd",
 "757": r"erdos_757|[Ee]rdos757|IsAdmissible|Gy[aá]rf[aá]s|Ma.Tang|distinct sums.*4/7|2602\.23282",
 "835": r"property_iff_chromaticNumber|erdos_835|[Ee]rdos835|Johnson graph|J\(2 \* k",
 "859": r"DivisorSumSet|erdos_859|[Ee]rdos859|positive_density",
 "918": r"erdos_918|[Ee]rdos918|chromaticCardinal|eq_aleph_0",
 "939": r"Erdos939Sums|erdos_939|[Ee]rdos939|variants\.seven|variants\.eight",
 "1063": r"exists_exception|monier|Monier|erdos_1063|[Ee]rdos1063",
 "1074": r"EHSNumbers|PillaiPrimes|erdos_1074|[Ee]rdos1074|Pillai prime",
 "1136": r"AvoidsPowersOfTwo|erdos_1136|[Ee]rdos1136|multiples_of_three|erdosproblems\.com/1136|Erd[oő]s\s*#?1136",
 "1193": r"sumRep|erdos_1193|[Ee]rdos1193(?!\d)|erdosproblems\.com/1193|Erd[oő]s\s*#?1193",
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
            kws = sorted(set(m.group(0) for m in ms))[:8]
            for pr, path in where[:60]:
                out[n].setdefault(pr, {"subject": subj[pr], "files": {}})["files"][path] = kws
json.dump(out, open(pathlib.Path.home()/"erdos-fc/m2/final/jsp_scan2.json","w"), indent=1, ensure_ascii=False)
print("blobs scanned", len(blobs))
for n in KW:
    print("==", n, "PRs:", len(out[n]))
    for pr, d in sorted(out[n].items(), key=lambda x:int(x[0]))[:14]:
        fs = [(f,k) for f,k in d["files"].items()]
        lean = [f for f,_ in fs if f.endswith(".lean")]
        allk = sorted(set(k for _,ks in fs for k in ks))
        print("  #%s %s | lean=%d/%d %s | kw=%s" % (pr, d["subject"][26:120], len(lean), len(fs), (lean or [fs[0][0]])[0][-50:], ",".join(allk)[:110]))
