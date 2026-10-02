#!/usr/bin/env python3
"""Statement check for the Lean 4.33.1 + Mathlib port (pack3).

For every module of orig/order.txt: every declaration header (from the keyword up to the first `:=` / `where` /
blank line) of src/<M>.lean must equal the one of the Lean 4.20 original.  The original is orig/<M>.lean (verbatim
pack2/lean420/src, sha256 in pack2/lean420/SHA256SUMS), except for the baseline modules whose 4.20 text lives in
../orig (the 09-28 port) or ../pack2/lean433/orig.  Also checks orig/<M>.lean == live library ../../lean/<M>.lean,
counts `axiom` declarations and occurrences of the words sorry / native_decide in src/, and lists the option lines
that the port inserts.  Writes check_headers.out.   Usage: python3 check_headers3.py   (exit 0 always)"""
import os, re
HERE = os.path.dirname(os.path.abspath(__file__))
PAT = re.compile(r"(?ms)^(?:private |protected |noncomputable |@\[[^\]]*\]\s*)*(theorem|lemma|def|abbrev|structure|"
                 r"inductive|instance|class|axiom|opaque)\b.*?(?::=|\bwhere\b|\n\n)")


def heads(p):
    return [m.group(0) for m in PAT.finditer(open(p, encoding="utf-8").read())]


out, tot, changed, stale, axioms, srcdiff, sorry, nd, opts = [], 0, 0, 0, 0, 0, 0, 0, {}
for m in open(f"{HERE}/orig/order.txt").read().split():
    o = f"{HERE}/orig/{m}.lean"
    s = f"{HERE}/src/{m}.lean"
    a, b = heads(o), heads(s)
    live = f"{HERE}/../../lean/{m}.lean"
    same_live = os.path.exists(live) and open(live, "rb").read() == open(o, "rb").read()
    stale += 0 if same_live else 1
    sa, sb = set(a), set(b)
    ch = [h for h in a if h not in sb]
    new = [h for h in b if h not in sa]
    txt = open(s, encoding="utf-8").read()
    axioms += sum(1 for h in b if h.lstrip().startswith("axiom"))
    sorry += len(re.findall(r"\bsorry\b", txt))
    nd += len(re.findall(r"\bnative_decide\b", txt))
    for l in txt.split("\n"):
        if l.startswith("set_option ") and l not in open(o, encoding="utf-8").read().split("\n"):
            opts[l] = opts.get(l, 0) + 1
    ident = open(o, "rb").read() == open(s, "rb").read()
    srcdiff += 0 if ident else 1
    tot += len(a)
    changed += len(ch)
    out.append(f"{m}: {len(a)} headers, {len(ch)} changed/removed, {len(new)} new, "
               f"src == original: {ident}, original == lean/: {same_live}")
    out += [f"   CHANGED: {h[:160]!r}" for h in ch] + [f"   NEW: {h[:160]!r}" for h in new]
out.append(f"TOTAL: {tot} declaration headers, {changed} changed, {srcdiff} modules differ from the 4.20 original, "
           f"{stale} originals differing from lean/, {axioms} `axiom` declarations, "
           f"word counts in src: sorry={sorry} native_decide={nd} (comments included)")
out += [f"OPTION LINE inserted in {n} modules: {l}" for l, n in sorted(opts.items())]
open(f"{HERE}/check_headers.out", "w", encoding="utf-8").write("\n".join(out) + "\n")
print("\n".join(l for l in out if "CHANGED" in l or "NEW" in l or "TOTAL" in l or "OPTION" in l or ": False" in l.split("lean/")[-1]))
