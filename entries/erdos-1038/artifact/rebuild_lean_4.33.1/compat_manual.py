# compat_manual.py -- executed by compat.py after the mechanical edits (variables `dst`, `re` in scope).
# Each entry: a hand-made compatibility edit for Lean 4.33.1 / Mathlib v4.33.1, with the reason.
manual_log = []

def add_import(fname, imp, why):
    p = dst / fname
    s = p.read_text(encoding="utf8")
    line = "import " + imp
    if line in s:
        return
    i = s.index("import ")
    s = s[:i] + line + "\n" + s[i:]
    p.write_text(s, encoding="utf8")
    manual_log.append("%s: +%s  (%s)" % (fname, line, why))

def replace(fname, old, new, why, count=1):
    p = dst / fname
    s = p.read_text(encoding="utf8")
    if new in s and old not in s:
        return
    assert s.count(old) == count, (fname, old, s.count(old))
    s = s.replace(old, new)
    p.write_text(s, encoding="utf8")
    manual_log.append("%s: %r -> %r  (%s)" % (fname, old[:80], new[:80], why))

# (M1) lemma lives in a file that is not transitively imported under Mathlib v4.33.1
for f in sorted(dst.glob("*.lean")):
    if "intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le" in f.read_text(encoding="utf8"):
        add_import(f.name, "Mathlib.Analysis.Calculus.ParametricIntervalIntegral",
                   "intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le not in scope")

for l in manual_log:
    print("manual:", l)
