#!/usr/bin/env python3
"""Regenerate the generated tables of README.md and README.ko.md.

  python tools/make_results_table.py [repo_root] [--check]

Blocks rewritten (text between the marker comments is replaced, everything else is left alone):

  <!-- RESULTS:START --> ... <!-- RESULTS:END -->      one row per entries/*/ENTRY.yaml that has a `readme:` block,
                                                       plus the rows of entries/PENDING.yaml
  <!-- RESOURCES:START --> ... <!-- RESOURCES:END -->  per-entry resource numbers from archive/stats/*.yaml and
                                                       entries/*/STATS.yaml (rows with `counted_in:` are copies
                                                       and are skipped, as in summarize_stats.py)

Every link target of the results table is checked to exist; the script stops with an error otherwise.
`--check` writes nothing and exits 1 if a file would change.  Python 3 standard library only.
"""
import glob
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from summarize_stats import load, aslist  # noqa: E402  (tiny YAML reader of this repository)

KINDS = ("new result", "partial results", "formalization of known results", "reported by its owner")
KIND_KO = {"new result": "새 결과", "partial results": "부분 결과",
           "formalization of known results": "알려진 결과의 형식화", "reported by its owner": "담당 팀원 보고"}
HEAD = {
    "en": ("Entry", "Problem", "Kind", "Result", "Verification", "Links"),
    "ko": ("항목", "대상 문제", "종류", "결과", "검증", "링크"),
}
RES_HEAD = {
    "en": ("Entry", "Output tokens", "Uncached input", "Cache tokens", "Sessions",
           "Recorded wall hours", "Lean lines", "Claimed theorems"),
    "ko": ("항목", "출력 토큰", "입력(캐시 제외)", "캐시 토큰", "세션 수", "기록된 wall 시간", "Lean 줄 수", "주장 정리 수"),
}


def num(x):
    return x if isinstance(x, (int, float)) and not isinstance(x, bool) else None


def results_rows(root, lang):
    rows = []
    sfx = "_ko" if lang == "ko" else ""
    for path in sorted(glob.glob(os.path.join(root, "entries", "*", "ENTRY.yaml"))):
        if "_TEMPLATE" in path:
            continue
        d = load(path)
        r = d.get("readme") if isinstance(d, dict) else None
        if not r:
            continue
        eid = d["id"]
        if r["kind"] not in KINDS:
            raise SystemExit("%s: kind %r not in the fixed vocabulary %r" % (path, r["kind"], KINDS))
        base = "entries/%s/" % eid
        links = []
        for item in aslist(r.get("links")):
            text, target = item.split("|", 1)
            target_path = os.path.join(root, base, target.split("#", 1)[0])
            if not os.path.exists(target_path):
                raise SystemExit("%s: link target does not exist: %s" % (path, base + target))
            links.append("[%s](%s%s)" % (text, base, target))
        kind = KIND_KO[r["kind"]] if lang == "ko" else r["kind"]
        rows.append((r.get("order", 99), "[`%s`](%s)" % (eid, base), r.get("problem" + sfx) or r["problem"], kind,
                     r.get("result" + sfx) or r["result"], r.get("verification" + sfx) or r["verification"],
                     " · ".join(links)))
    pend = os.path.join(root, "entries", "PENDING.yaml")
    if os.path.exists(pend):
        for r in aslist(load(pend).get("pending")):
            rows.append((r.get("order", 99), "`%s`" % r["id"], r.get("problem" + sfx) or r["problem"],
                         r.get("kind" + sfx) or r["kind"], r.get("result" + sfx) or r["result"],
                         r.get("verification" + sfx) or r["verification"],
                         r.get("links_text" + sfx) or r["links_text"]))
    rows.sort(key=lambda t: t[0])
    return [t[1:] for t in rows]


def results_block(root, lang):
    out = ["| " + " | ".join(HEAD[lang]) + " |", "|---|---|---|---|---|---|"]
    for row in results_rows(root, lang):
        out.append("| " + " | ".join(c.replace("|", "\\|") for c in row) + " |")
    return "\n".join(out)


def collect_usage(root):
    """Per-entry sums of the non-copy usage rows of archive/stats/*.yaml (the entries' STATS.yaml rows are copies)."""
    use = {}
    for path in sorted(glob.glob(os.path.join(root, "archive", "stats", "*.yaml"))):
        d = load(path)
        for r in aslist(d.get("ai_usage")):
            if r.get("counted_in"):
                continue
            u = use.setdefault(r.get("entry") or "shared/steering",
                               {"out": 0, "in": 0, "cache": 0, "sessions": 0})
            u["out"] += num(r.get("output_tokens")) or 0
            u["in"] += num(r.get("input_tokens")) or 0
            u["cache"] += (num(r.get("cache_read_tokens")) or 0) + (num(r.get("cache_write_tokens")) or 0)
            u["sessions"] += num(r.get("sessions")) or 0
    return use


def collect_entry_stats(root):
    """Per-entry wall hours (numeric rows only), flag for missing values, Lean lines, claimed theorems.

    Compute rows come from entries/*/STATS.yaml and archive/stats/*.yaml; copies (`counted_in:`) are skipped.
    """
    st = {}
    paths = sorted(glob.glob(os.path.join(root, "entries", "*", "STATS.yaml")) +
                   glob.glob(os.path.join(root, "archive", "stats", "*.yaml")))
    for path in paths:
        if "_TEMPLATE" in path:
            continue
        d = load(path)
        for r in aslist(d.get("compute")):
            if r.get("counted_in"):
                continue
            s = st.setdefault(r.get("entry") or d.get("entry"),
                              {"wall": 0.0, "missing": False, "lines": None, "theorems": None})
            w = num(r.get("wall_hours"))
            if w is None:
                s["missing"] = True
            else:
                s["wall"] += w
        if d.get("outputs"):
            s = st.setdefault(d["entry"], {"wall": 0.0, "missing": False, "lines": None, "theorems": None})
            s["lines"] = num(d["outputs"].get("lean_lines"))
            s["theorems"] = num(d["outputs"].get("theorems_claimed"))
    return st


def fmt(n):
    return "{:,}".format(n) if n is not None else ""


def resources_block(root, lang):
    use, st = collect_usage(root), collect_entry_stats(root)
    out = ["| " + " | ".join(RES_HEAD[lang]) + " |", "|---|---:|---:|---:|---:|---:|---:|---:|"]
    tot = {"out": 0, "in": 0, "cache": 0, "sessions": 0}
    for eid in sorted(use, key=lambda e: (e.startswith("shared"), -use[e]["out"])):
        u, s = use[eid], st.get(eid, {})
        for k in tot:
            tot[k] += u[k]
        wall = ""
        if s:
            wall = "%.1f" % s["wall"] + (" +" if s["missing"] else "")
        name = "`%s`" % eid if eid in st else eid
        out.append("| %s | %s | %s | %s | %s | %s | %s | %s |" % (
            name, fmt(u["out"]), fmt(u["in"]), fmt(u["cache"]), fmt(u["sessions"]), wall,
            fmt(s.get("lines")), fmt(s.get("theorems"))))
    label = "**합계**" if lang == "ko" else "**Total**"
    out.append("| %s | **%s** | **%s** | **%s** | **%s** | | **%s** | **%s** |" % (
        label, fmt(tot["out"]), fmt(tot["in"]), fmt(tot["cache"]), fmt(tot["sessions"]),
        fmt(sum(s["lines"] or 0 for s in st.values())), fmt(sum(s["theorems"] or 0 for s in st.values()))))
    return "\n".join(out)


def replace_block(text, name, body):
    a, b = "<!-- %s:START -->" % name, "<!-- %s:END -->" % name
    i, j = text.find(a), text.find(b)
    if i < 0 or j < 0 or j < i:
        return text
    return text[:i + len(a)] + "\n" + body + "\n" + text[j:]


def main(argv):
    check = "--check" in argv
    args = [a for a in argv if not a.startswith("--")]
    root = args[0] if args else os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    changed = False
    for fname, lang in (("README.md", "en"), ("README.ko.md", "ko")):
        path = os.path.join(root, fname)
        if not os.path.exists(path):
            continue
        with open(path, encoding="utf-8") as fh:
            old = fh.read()
        new = replace_block(old, "RESULTS", results_block(root, lang))
        new = replace_block(new, "RESOURCES", resources_block(root, lang))
        if new != old:
            changed = True
            if not check:
                with open(path, "w", encoding="utf-8", newline="\n") as fh:
                    fh.write(new)
        print("%s: %s" % (fname, "unchanged" if new == old else ("would change" if check else "updated")))
    return 1 if (check and changed) else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
