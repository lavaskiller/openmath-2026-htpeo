#!/usr/bin/env python3
"""Regenerate the generated tables of README.md and README.ko.md.

  python tools/make_results_table.py [repo_root] [--check]

Blocks rewritten (text between the marker comments is replaced, everything else is left alone):

  <!-- RESULTS:START --> ... <!-- RESULTS:END -->      one row per entries/*/ENTRY.yaml that has a `readme:` block,
                                                       plus the rows of entries/PENDING.yaml; then one row per
                                                       team member on a hill board (archive/leaderboards/, ranks
                                                       with ties computed by make_leaderboard_charts.py)
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
import make_leaderboard_charts as lb  # noqa: E402  (ranks with ties from archive/leaderboards/)

KINDS = ("new result", "partial results", "formalization of known results", "reported by its owner")
KIND_KO = {"new result": "새 결과", "partial results": "부분 결과",
           "formalization of known results": "알려진 결과의 형식화", "reported by its owner": "담당 팀원 보고"}
HEAD = {
    "en": ("Entry", "Problem", "Kind", "Result", "Standing", "Verification", "Links"),
    "ko": ("항목", "대상 문제", "종류", "결과", "순위", "검증", "링크"),
}
HILL_HEAD = {
    "en": ("Hill (board)", "Member", "Kind", "Result", "Standing", "Verification", "Files"),
    "ko": ("hill (보드)", "팀원", "종류", "결과", "순위", "검증", "파일"),
}
SUB = {
    "en": ("**Lean-checked entries**", "**Hill results by team members** (best result per account on the "
           "AutoLab boards; ranks computed with ties sharing a rank)"),
    "ko": ("**Lean으로 검증한 항목**", "**팀원의 hill 결과** (AutoLab 보드의 계정별 최고 기록; 동률은 같은 순위)"),
}


def entry_standing(root, spec, lang, boards):
    if not spec:
        return "—"
    stem, owner = spec.split("|")
    out = []
    for b in boards:
        if b["stem"] != stem:
            continue
        for r in b["rows"]:
            if r["owner"] == owner:
                out.append(lb.standing(r, len(b["rows"]), lang) +
                           (" (검증 보드, 단독 선두)" if lang == "ko" else ", alone, on the validation board"))
    if not out:
        raise SystemExit("hill standing %r not found in archive/leaderboards/" % spec)
    return "; ".join(out)


def hill_rows(root, lang, boards):
    ko = lang == "ko"
    rows = []
    for i, b in enumerate(boards):
        owners = [r["owner"] for r in b["rows"] + b["final"] if r["owner"] in lb.TEAM]
        for o in dict.fromkeys(owners):
            full = lb.FULL_ENTRY.get(b["stem"])
            if full and full[0] == o:
                continue                      # shown as a Lean-checked entry
            v = next((r for r in b["rows"] if r["owner"] == o), None)
            f = next((r for r in b["final"] if r["owner"] == o), None)
            res, st = [], []
            if f:
                res.append(lb.fmt_metrics(f, b["axes"]) + (" (최종 보드)" if ko else " (final board)"))
                st.append(lb.standing(f, len(b["final"]), lang, final=True) if len(b["final"]) == 1 else
                          lb.standing(f, len(b["final"]), lang) + (" (최종 보드)" if ko else " on the final (held-out) board"))
            if v:
                res.append(lb.fmt_metrics(v, b["axes"]) + ((" (검증 보드)" if ko else " (validation board)") if f else ""))
                st.append(lb.standing(v, len(b["rows"]), lang) +
                          ((" (검증 보드)" if ko else " on the validation board") if f else ""))
            if v and v["rank"] == 1 and v["tied"] > 1:
                res.append("보드의 최고값을 재현한 것이며 새 수학으로 주장하지 않음" if ko else
                           "reproduces the board's best value; not claimed as new mathematics")
            name = (b["name_ko"] if ko else b["name"]) + (" (%s)" % b["suffix"] if b["suffix"] else "")
            pre = lb.folder_prefix(b)
            folder = "entries/hills/%s-%s/" % (pre, o)
            if not os.path.isdir(os.path.join(root, folder)):
                raise SystemExit("missing folder for a hill result: " + folder)
            extra = {}
            if os.path.exists(os.path.join(root, folder, "HILL.yaml")):     # owner-written wording for this row
                extra = load(os.path.join(root, folder, "HILL.yaml"))
            if extra.get("result"):
                res = [extra.get("result_ko") if ko and extra.get("result_ko") else extra["result"]]
            if os.path.exists(os.path.join(root, folder, "report.json")) or extra.get("files"):
                what = extra.get("files_ko" if ko else "files") or ("해, 서명된 보고서" if ko else "solution, signed report")
            else:
                what = "담당 팀원이 파일 추가 예정" if ko else "files to be added by its owner"
            files = "[`hills/%s-%s`](%s) — %s" % (pre, o, folder, what)
            best = min(r["rank"] for r in (v, f) if r)
            lead = 0 if (v and v["rank"] == 1 and v["tied"] == 1) else (1 if (v and v["rank"] == 1) else 2)
            rows.append(((lead, best, i),
                         (name, "@" + o, "hill 결과" if ko else "hill result", "; ".join(res), "; ".join(st),
                          (extra.get("verification_ko") if ko and extra.get("verification_ko") else extra.get("verification"))
                          or ("hill 평가기(Python), Lean 산출물 없음" if ko else "hill evaluator (Python), no Lean artifact"),
                          files)))
    rows.sort(key=lambda t: t[0])
    return [t[1] for t in rows]

RES_HEAD = {
    "en": ("Entry", "Output tokens", "Uncached input", "Cache tokens", "Sessions",
           "Recorded wall hours", "Lean lines", "Claimed theorems"),
    "ko": ("항목", "출력 토큰", "입력(캐시 제외)", "캐시 토큰", "세션 수", "기록된 wall 시간", "Lean 줄 수", "주장 정리 수"),
}


def num(x):
    return x if isinstance(x, (int, float)) and not isinstance(x, bool) else None


def results_rows(root, lang, boards):
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
                     r.get("result" + sfx) or r["result"], entry_standing(root, r.get("hill"), lang, boards),
                     r.get("verification" + sfx) or r["verification"], " · ".join(links)))
    pend = os.path.join(root, "entries", "PENDING.yaml")
    if os.path.exists(pend):
        for r in aslist(load(pend).get("pending")):
            rows.append((r.get("order", 99), "`%s`" % r["id"], r.get("problem" + sfx) or r["problem"],
                         r.get("kind" + sfx) or r["kind"], r.get("result" + sfx) or r["result"], "—",
                         r.get("verification" + sfx) or r["verification"],
                         r.get("links_text" + sfx) or r["links_text"]))
    rows.sort(key=lambda t: t[0])
    return [t[1:] for t in rows]


def results_block(root, lang):
    boards = lb.read_boards(root)

    def line(row):
        return "| " + " | ".join(c.replace("|", "&#124;") for c in row) + " |"

    out = [SUB[lang][0], "", "| " + " | ".join(HEAD[lang]) + " |", "|---|---|---|---|---|---|---|"]
    out += [line(row) for row in results_rows(root, lang, boards)]
    out += ["", SUB[lang][1], "", "| " + " | ".join(HILL_HEAD[lang]) + " |", "|---|---|---|---|---|---|---|"]
    out += [line(row) for row in hill_rows(root, lang, boards)]
    return chr(10).join(out)


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
