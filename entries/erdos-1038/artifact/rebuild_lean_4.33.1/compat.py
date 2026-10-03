#!/usr/bin/env python3
"""compat.py [CLOSER] -- regenerate LeanProject/ from ../orig_LeanProject with the mechanical
Lean 4.34.1/Mathlib v4.34.1 -> Lean 4.33.1/Mathlib v4.33.1 compatibility edits, then re-apply the
hand edits listed in compat_manual.py (if present).  Files whose text does not change keep their
mtime (so make does not rebuild them).

 (1) rename: `ite_eq_left` -> `if_pos`, `ite_eq_right` -> `if_neg` (term-mode uses `ite_eq_left h`).
 (2) convert shim: a line that consists of `convert <term> using <n>` (or `convert <term>`, one line) becomes
     `(convert <term> using <n> <;> first | CLOSER | skip)`.
     Reason: with Mathlib v4.33.1 `convert` leaves instance-equality side goals
     (e.g. `instAddCommMonoid = normedCommRing.toAddCommMonoid`) that v4.34.1 closes itself.
     (2b) one-line `convert ... <;> tac` -> `(convert ... <;> first | CLOSER | skip) <;> tac`;
     (2c) multi-line `convert ...` whose last continuation line ends in `using <n>` -> wrapped as in (2).
"""
import os, re, sys, pathlib
CLOSER = sys.argv[1] if len(sys.argv) > 1 else "with_reducible_and_instances rfl"
here = pathlib.Path(__file__).resolve().parent
orig = here.parent / "orig_LeanProject"
dst = here / "LeanProject"
stats = {"rename": 0, "convert": 0, "files": 0}
pat = re.compile(r"^(\s*(?:·\s*)?)(convert\s+(?!_to)[^;\n]*?)\s*$")
def bal(s):
    return all(s.count(a) == s.count(b) for a, b in ("()", "[]", "{}", "⟨⟩"))
for f in sorted(orig.glob("*.lean")):
    s = f.read_text(encoding="utf8")
    s2, n = re.subn(r"\bite_eq_left\b", "if_pos", s); stats["rename"] += n
    s2, n = re.subn(r"\bite_eq_right\b", "if_neg", s2); stats["rename"] += n
    lines = s2.split("\n")
    for i, l in enumerate(lines):
        m = pat.match(l)
        if not m: continue
        body = m.group(2)
        if "<;>" in body or not bal(body) or body.rstrip().endswith(("by", "fun", "=>", "↦", ",", "(", "<|", "$", "using", "with")):
            continue
        nxt = lines[i + 1] if i + 1 < len(lines) else ""
        ind = len(m.group(1).replace("·", " "))
        # skip if the term visibly continues on the next line (deeper indentation, not a bullet/tactic at same level)
        if nxt.strip() and (len(nxt) - len(nxt.lstrip())) > ind and not nxt.lstrip().startswith(("·", "--")):
            continue
        lines[i] = "%s(%s <;> first | %s | skip)" % (m.group(1), body, CLOSER)
        stats["convert"] += 1
    # (2b) `convert <term> using <n> <;> tac` (start of a line) becomes
    #      `(convert <term> using <n> <;> first | CLOSER | skip) <;> tac`
    pat2 = re.compile(r"^(\s*(?:·\s*)?)(convert\s+(?!_to)[^;\n]*?)\s*<;>\s*(.*)$")
    for i, l in enumerate(lines):
        m = pat2.match(l)
        if m and bal(m.group(2)):
            lines[i] = "%s(%s <;> first | %s | skip) <;> %s" % (m.group(1), m.group(2), CLOSER, m.group(3))
            stats["convert2"] = stats.get("convert2", 0) + 1
    # (2c) a `convert` whose term continues on deeper-indented lines, the last one ending in `using <n>`:
    #      wrap the whole tactic in `( ... <;> first | CLOSER | skip)` as in (2)
    for i, l in enumerate(lines):
        m = re.match(r"^(\s*(?:·\s*)?)(convert\s+(?!_to).*)$", l)
        if not m or "<;>" in l:
            continue
        ind = len(m.group(1).replace("·", " "))
        for k in range(i + 1, min(i + 6, len(lines))):
            lk = lines[k]
            if not lk.strip() or (len(lk) - len(lk.lstrip())) <= ind:
                break
            if re.search(r"\busing \d+\s*$", lk) and "<;>" not in lk:
                if bal("\n".join([m.group(2)] + lines[i + 1:k + 1])):
                    lines[i] = m.group(1) + "(" + m.group(2)
                    lines[k] = lk.rstrip() + " <;> first | %s | skip)" % CLOSER
                    stats["convert3"] = stats.get("convert3", 0) + 1
                break
    s2 = "\n".join(lines)
    out = dst / f.name
    if not out.exists() or out.read_text(encoding="utf8") != s2:
        out.write_text(s2, encoding="utf8"); stats["files"] += 1
print(stats)
if (here / "compat_manual.py").exists():
    exec((here / "compat_manual.py").read_text(encoding="utf8"))
