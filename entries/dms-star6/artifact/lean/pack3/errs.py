#!/usr/bin/env python3
"""Show only the error messages of failed modules: python3 errs.py [Module ...] [-n MAXERR] [-c CTX]"""
import json, os, re, sys
H = os.path.dirname(os.path.abspath(__file__))
args = sys.argv[1:]
mx, ctx, w = 12, 0, 700
for fl in ("-n", "-c", "-w"):
    if fl in args:
        i = args.index(fl); v = int(args[i + 1]); del args[i:i + 2]
        if fl == "-n": mx = v
        elif fl == "-c": ctx = v
        else: w = v
r = json.load(open(f"{H}/build/build_report.json"))
for m, f in r["files"].items():
    if f["ok"] or f.get("blocked") or (args and m not in args):
        continue
    p = f"{H}/build/{m}.out"
    o = open(p).read() if os.path.exists(p) else f["output"]
    msgs = re.split(r"(?m)^(?=\S*\.lean:\d+:\d+: )", o)
    errs = [x for x in msgs if re.match(r"\S*\.lean:\d+:\d+: error", x)]
    print(f"##### {m}: {len(errs)} errors, {f['seconds']}s")
    src = open(f"{H}/src/{m}.lean", encoding="utf-8").read().split("\n")
    for e in errs[:mx]:
        mm = re.match(r"\S*\.lean:(\d+):(\d+): (.*)", e, re.S)
        ln = int(mm.group(1))
        print(f"L{ln}:{mm.group(2)} {mm.group(3).strip()[:w]}")
        for k in range(max(1, ln - ctx), ln + 1):
            print(f"   {k}| {src[k-1][:220]}")
    if not errs:
        print(o[-800:])
