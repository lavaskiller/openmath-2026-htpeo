#!/usr/bin/env python3
"""Leaderboard figures and the hills table of the README, from the snapshot in archive/leaderboards/.

  python tools/make_leaderboard_charts.py [repo_root] [--check]

Input : archive/leaderboards/lb_*.json  (raw AutoLab leaderboard responses, one per hill, best result per account)
Output: assets/hills_overview_{light,dark}.svg      one row per board: accounts in rank order, ties grouped,
                                                    team members highlighted
        assets/ramsey_leaderboard_{light,dark}.svg  Ramsey validation board: improvement over the hill reference
        assets/leaderboard_data.json                the ranks computed here
        the table between <!-- HILLS:START --> and <!-- HILLS:END --> in README.md and README.ko.md

Ranks are computed HERE, not taken from the API: the platform's `rank` field numbers tied accounts consecutively
(tied accounts are listed alphabetically). We use standard competition ranking over the full metric tuple, in the
order and direction of the board's axes: accounts with identical metrics share a rank, and the next distinct
tuple gets rank 1 + (number of accounts strictly better).

The snapshot time is not stored in the JSON files; it is the SNAPSHOT constant below (from
archive/leaderboards/README.md). Python 3 standard library only.
`--check` writes nothing and exits 1 if a README would change.
"""
import glob
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import make_charts as mc  # noqa: E402  (palette, typography, Svg helper)

SNAPSHOT = "2026-10-02T16:23Z"
SNAPSHOT_KST = "2026-10-03 01:23 KST"
TEAM = ["lavaskiller", "hl728", "n0rang2", "thomasoh0408"]
HILLS = [   # organisers' list: (file stem, display name, Korean name, folder prefix under entries/hills/)
    ("kobon-triangles", "Kobon triangles", "Kobon 삼각형", "kobon-triangles"),
    ("clique-cluster-ramsey-multiplicity", "K4 Ramsey multiplicity", "K4 Ramsey 다중도", "ramsey"),
    ("matrix-multiplication-tensor-3x3", "3x3 matrix-multiplication tensor", "3x3 행렬곱 텐서", "matrix-multiplication"),
    ("grothendieck-constant-witnesses", "Grothendieck constant witnesses", "Grothendieck 상수 witness", "grothendieck"),
    ("collatz-modular-descent", "Collatz modular descent", "Collatz modular descent", "collatz"),
    ("busy-beaver-6-certificates", "Busy Beaver 6 certificates", "Busy Beaver 6 인증서", "busy-beaver-6"),
    ("erdos-3", "Erdős 3", "Erdős 3", "erdos-3"),
]
FULL_ENTRY = {"clique-cluster-ramsey-multiplicity": ("lavaskiller", "entries/ramsey-k4-multiplicity/")}
RAMSEY_REFERENCE_PPT = 30142273432      # 10486266368 / 768^4 as density_ppt (hill reference)
W = 720
NEUTRAL = {"light": "#9a9892", "dark": "#6e7681"}
BAND = {"light": "#ecebe6", "dark": "#21262d"}


# ------------------------------------------------------------------ data
def key_of(entry, axes):
    vals = {m["name"]: m["value"] for m in entry["metrics"]}
    return tuple((-vals[a["name"]] if a["direction"] == "max" else vals[a["name"]]) for a in axes)


def rank_group(group):
    """Standard competition ranking over the full metric tuple; returns rows sorted by (rank, owner)."""
    axes = group["axes"]
    rows = [{"owner": e["owner"], "key": key_of(e, axes), "metrics": {m["name"]: m["value"] for m in e["metrics"]},
             "timestamp": e.get("timestamp"), "api_rank": e.get("rank")} for e in group["entries"]]
    for r in rows:
        r["rank"] = 1 + sum(1 for o in rows if o["key"] < r["key"])
    for r in rows:
        r["tied"] = sum(1 for o in rows if o["rank"] == r["rank"])
    rows.sort(key=lambda r: (r["rank"], r["owner"]))
    return rows


def distinguishing(group, siblings):
    """The 'name = value' parts of a group's label that differ from its sibling boards of the same mode."""
    mine = [tuple(p) for p in group["primary"]]
    others = [[tuple(p) for p in g["primary"]] for g in siblings if g is not group]
    diff = [p for p in mine if any(p not in o for o in others)]
    return ", ".join("%s = %s" % p for p in diff)


def read_boards(root):
    boards = []
    for stem, name, name_ko, prefix in HILLS:
        path = os.path.join(root, "archive", "leaderboards", "lb_%s.json" % stem)
        d = json.load(open(path, encoding="utf-8"))
        val = [g for g in d["groups"] if not g.get("final")]
        fin = [g for g in d["groups"] if g.get("final")]
        if not val:
            boards.append({"stem": stem, "name": name, "name_ko": name_ko, "prefix": prefix, "slug": d["slug"],
                           "label": "", "suffix": "", "rows": [], "final": [], "axes": []})
        for g in sorted(val, key=lambda g: -len(g["entries"])):
            suffix = distinguishing(g, val) if len(val) > 1 else ""
            finals = [rank_group(f) for f in fin if f["primary"] == g["primary"]]
            boards.append({"stem": stem, "name": name, "name_ko": name_ko, "prefix": prefix, "slug": d["slug"],
                           "label": g["label"], "suffix": suffix, "rows": rank_group(g),
                           "final": finals[0] if finals else [], "axes": g["axes"]})
    return boards


def rank_text(r):
    return ("T%d" % r["rank"]) if r["tied"] > 1 else ("#%d" % r["rank"])


def fmt_metrics(row, axes):
    return ", ".join("%s %s" % (a["name"], "{:,}".format(row["metrics"][a["name"]])) for a in axes)


# ------------------------------------------------------------------ figures
def circle(s, cx, cy, r, fill, stroke=None):
    s.parts.append('<circle cx="%.1f" cy="%.1f" r="%.1f" fill="%s"%s/>' % (
        cx, cy, r, fill, ' stroke="%s" stroke-width="1.5"' % stroke if stroke else ""))


def diamond(s, cx, cy, r, fill):
    s.parts.append('<path d="M%.1f %.1f L%.1f %.1f L%.1f %.1f L%.1f %.1f Z" fill="%s"/>' % (
        cx, cy - r, cx + r, cy, cx, cy + r, cx - r, cy, fill))


def place_label(s, x, y, text, lines):
    """Start-anchored label on the first of two lines where it does not collide with earlier labels of the row."""
    w = mc.tw(text, 11)
    for i, used in enumerate(lines):
        if all(x >= b or x + w <= a for a, b in used):
            used.append((x - 4, x + w + 4))
            s.text(x, y + 13 * i, text, 11, weight="600", check=False)
            return
    raise SystemExit("no room for label %r" % text)


def chart_overview(boards, theme, path):
    row_h, top = 64, 96
    s = mc.Svg(top + row_h * len(boards) + 8, theme,
               "Competition hills and team standings (read %s)" % SNAPSHOT,
               "validation boards, best result per account; ranks can change until the deadline")
    s.text(0, 49, "ties share a rank: the platform lists accounts with identical metrics alphabetically", 12,
           ink="ink2")
    team_c, plain = s.t["series"][0], NEUTRAL[theme]
    # legend
    x = 0
    circle(s, x + 6, 68, 5, plain)
    s.text(x + 16, 72, "account", 12, ink="ink2")
    x += 16 + mc.tw("account", 12) + 18
    circle(s, x + 7, 68, 7, team_c)
    s.text(x + 19, 72, "team member", 12, ink="ink2")
    x += 19 + mc.tw("team member", 12) + 18
    s.rect(x, 60, 34, 16, BAND[theme], rx=8)
    circle(s, x + 10, 68, 5, plain)
    circle(s, x + 24, 68, 5, plain)
    s.text(x + 40, 72, "tied: identical metrics", 12, ink="ink2")
    x += 40 + mc.tw("tied: identical metrics", 12) + 18
    diamond(s, x + 6, 68, 6, plain)
    s.text(x + 17, 72, "final (held-out) board", 12, ink="ink2")
    x0, step = 232, 22
    for i, b in enumerate(boards):
        y = top + i * row_h
        if i:
            s.line(0, y - 8, W, y - 8, "grid")
        s.text(0, y + 24, b["name"], 13, weight="600")
        if b["suffix"]:
            s.text(0, y + 40, "board " + b["suffix"], 11, ink="ink2")
        rows = b["rows"]
        if not rows:
            s.text(x0, y + 24, "no entries on the board in this snapshot", 12, ink="ink2")
            continue
        cy = y + 20
        lines = [[], []]
        # tie bands first, then markers
        j = 0
        while j < len(rows):
            k = rows[j]["tied"]
            if k > 1:
                xa, xb = x0 + j * step - 10, x0 + (j + k - 1) * step + 10
                s.rect(xa, cy - 11, xb - xa, 22, BAND[theme], rx=11)
                s.text((xa + xb) / 2, cy - 15, "%d tied" % k, 10, anchor="middle", ink="ink2")
            j += k
        team_labels, first_cx = [], None
        for j, r in enumerate(rows):
            cx = x0 + j * step
            if r["owner"] in TEAM:
                circle(s, cx, cy, 7, team_c)
                team_labels.append("%s %s" % (rank_text(r), r["owner"]))
                if first_cx is None:
                    first_cx = cx
            else:
                circle(s, cx, cy, 5, plain)
        if team_labels:
            # one label line per row, in rank order, so no label drops to a second line
            text = "  ·  ".join(team_labels)
            lx = min(first_cx - 7, W - mc.tw(text, 11) - 4)
            lines[0].append((lx - 4, lx + mc.tw(text, 11) + 4))
            s.text(lx, cy + 24, text, 11, weight="600", check=False)
        xe = x0 + len(rows) * step
        s.text(xe, cy + 4, "%d accounts" % len(rows), 11, ink="ink2")
        if b["final"]:
            xf = xe + mc.tw("%d accounts" % len(rows), 11) + 22
            for j, r in enumerate(b["final"]):
                cx = xf + j * step
                mine = r["owner"] in TEAM
                sole = len(b["final"]) == 1       # a one-account board has no rank: neutral marker, "only entry"
                diamond(s, cx, cy, 7 if mine else 5.5, team_c if mine else plain)   # a team result is always marked as ours
                if mine and sole:
                    s.text(W, cy + 24, "final (held-out) board: %s, only entry (1 account)" % r["owner"], 11,
                           anchor="end", weight="600", check=False)
                elif mine:
                    place_label(s, cx - 7, cy + 24, "%s %s (final)" % (rank_text(r), r["owner"]), lines)
            if not (len(b["final"]) == 1 and b["final"][0]["owner"] in TEAM):
                s.text(xf + len(b["final"]) * step - 6, cy + 4,
                       "%d on final board" % len(b["final"]), 11, ink="ink2")
    s.write(path, "Competition hills: accounts per board in rank order, ties grouped, team members highlighted")


def chart_ramsey(board, theme, path):
    rows = board["rows"][:12]
    row_h, top = 26, 62
    s = mc.Svg(top + row_h * len(rows) + 26, theme,
               "K4 Ramsey multiplicity hill, validation board (read %s)" % SNAPSHOT,
               "improvement over the hill reference: 30,142,273,432 minus the account's density_ppt (larger is "
               "better)")
    team_c, plain = s.t["series"][0], NEUTRAL[theme]
    vals = [RAMSEY_REFERENCE_PPT - r["metrics"]["density_ppt"] for r in rows]
    lo, hi = min(0, min(vals)), max(vals)
    xl, xr = 250, 610
    zero = xl + (xr - xl) * (0 - lo) / (hi - lo)
    s.text(zero, top - 8, "reference", 11, anchor="middle", ink="ink2")
    ours = next((r["owner"] for r in rows if r["owner"] in TEAM), None)   # best team account = this repository's entry
    for i, (r, v) in enumerate(zip(rows, vals)):
        y = top + i * row_h
        mine = r["owner"] == ours
        s.text(138, y + 15, "%s %s" % (rank_text(r), r["owner"]), 12, anchor="end", weight="600" if mine else None)
        w = (xr - xl) * abs(v) / (hi - lo)
        txt = ("+" if v > 0 else "−" if v < 0 else "") + "{:,}".format(abs(v))
        if v >= 0:
            s.rect(zero, y + 3, max(w, 1), 16, team_c if mine else plain, rx=3)
            s.text(zero + max(w, 1) + 6, y + 15, txt, 12, weight="600" if mine else None)
        else:
            s.rect(zero - w, y + 3, w, 16, plain, rx=3)
            s.text(zero - w - 6, y + 15, txt, 12, anchor="end")
    s.line(zero, top - 2, zero, top + row_h * len(rows) - 4, "axis")
    s.text(0, s.h - 4, "Blue: the entry of this repository. Bars left of the line do not beat the reference "
           "(reference_beaten = 0).", 11, ink="ink2")
    s.write(path, "Ramsey validation board: improvement over the hill reference per account")


# ------------------------------------------------------------------ README table
def ordinal(n):
    return "%d%s" % (n, "th" if 10 <= n % 100 <= 20 else {1: "st", 2: "nd", 3: "rd"}.get(n % 10, "th"))


def standing(r, n, lang, final=False):
    """Always with the board size: '1st of 12', 'tied for 1st, 3 of 12 accounts', 'only entry'. Never a bare rank."""
    if lang == "ko":
        if n == 1:
            return "%s 순위표의 유일한 기록(1명)" % ("최종 모드" if final else "검증 모드")
        if r["tied"] > 1:
            return "공동 %d위 (%d계정 중 %d계정 동률)" % (r["rank"], n, r["tied"])
        return "%d계정 중 %d위" % (n, r["rank"])
    if n == 1:
        return "only entry on the %s board (1 account)" % ("final (held-out)" if final else "validation")
    if r["tied"] > 1:
        return "tied for %s, %d of %d accounts" % (ordinal(r["rank"]), r["tied"], n)
    return "%s of %d" % (ordinal(r["rank"]), n)


def hills_block(root, boards, lang):
    ko = lang == "ko"
    head = (("Hill (board)", "Accounts", "Leader's result", "Team standing", "Tied with the leader?", "Files")
            if not ko else ("hill (보드)", "계정 수", "선두 기록", "팀 순위", "선두와 동률?", "파일"))
    out = ["| " + " | ".join(head) + " |", "|---|---:|---|---|---|---|"]
    for b in boards:
        name = b["name_ko"] if ko else b["name"]
        if b["suffix"]:
            name += " (%s)" % b["suffix"]
        rows = b["rows"]
        if not rows:
            out.append("| %s | 0 | %s | — | — | — |" % (name, "보드에 기록 없음" if ko else "no entries on the board"))
            continue
        top_n = rows[0]["tied"]
        leader = fmt_metrics(rows[0], b["axes"])
        if top_n > 1:
            leader += (" (%d계정 동률)" % top_n) if ko else (" (%d accounts tied)" % top_n)
        mine = [r for r in rows if r["owner"] in TEAM]
        st = ["%s — @%s" % (standing(r, len(rows), lang), r["owner"]) for r in mine]
        for r in b["final"]:
            if r["owner"] in TEAM:
                st.append("%s — @%s" % (standing(r, len(b["final"]), lang, final=True), r["owner"]))
        tied = "—"
        if mine:
            t = [r["owner"] for r in mine if r["rank"] == 1 and r["tied"] > 1]
            alone = [r["owner"] for r in mine if r["rank"] == 1 and r["tied"] == 1]
            if t:
                tied = ("예: " if ko else "yes: ") + ", ".join("@" + o for o in t)
            elif alone:
                tied = ("단독 선두: " if ko else "sole leader: ") + ", ".join("@" + o for o in alone)
            else:
                tied = "아니오" if ko else "no"
        files = []
        full = FULL_ENTRY.get(b["stem"])
        if full and any(r["owner"] == full[0] for r in mine):
            files.append("[`%s`](%s)" % (full[1].rstrip("/").split("/")[-1], full[1]))
        owners = [r["owner"] for r in mine] + [r["owner"] for r in b["final"] if r["owner"] in TEAM]
        for o in dict.fromkeys(owners):
            folder = "entries/hills/%s-%s/" % (b["prefix"], o)
            if os.path.isdir(os.path.join(root, folder)):
                files.append("[`hills/%s-%s`](%s)" % (b["prefix"], o, folder))
        out.append("| %s | %d | %s | %s | %s | %s |" % (
            name, len(rows), leader, "<br/>".join(st) if st else "—", tied, " · ".join(files) if files else "—"))
    return "\n".join(out)


def replace_block(text, name, body):
    a, b = "<!-- %s:START -->" % name, "<!-- %s:END -->" % name
    i, j = text.find(a), text.find(b)
    if i < 0 or j < i:
        return text
    return text[:i + len(a)] + "\n" + body + "\n" + text[j:]


def main(argv):
    check = "--check" in argv
    args = [a for a in argv if not a.startswith("--")]
    root = args[0] if args else os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    boards = read_boards(root)
    changed = False
    if not check:
        out = os.path.join(root, "assets")
        os.makedirs(out, exist_ok=True)
        mc.W = W
        ramsey = next(b for b in boards if b["stem"] == "clique-cluster-ramsey-multiplicity")
        for theme in mc.THEMES:
            chart_overview(boards, theme, os.path.join(out, "hills_overview_%s.svg" % theme))
            chart_ramsey(ramsey, theme, os.path.join(out, "ramsey_leaderboard_%s.svg" % theme))
        data = {"snapshot": SNAPSHOT, "ranking": "standard competition ranking over the full metric tuple",
                "boards": [{"hill": b["slug"], "label": b["label"],
                            "validation": [{k: r[k] for k in ("owner", "rank", "tied", "api_rank", "metrics",
                                                              "timestamp")} for r in b["rows"]],
                            "final": [{k: r[k] for k in ("owner", "rank", "tied", "api_rank", "metrics",
                                                         "timestamp")} for r in b["final"]]} for b in boards]}
        with open(os.path.join(out, "leaderboard_data.json"), "w", encoding="utf-8", newline="\n") as fh:
            json.dump(data, fh, indent=1, ensure_ascii=False)
            fh.write("\n")
        print("4 SVG files and leaderboard_data.json written to assets/ (well-formed XML, labels inside the canvas)")
    for fname, lang in (("README.md", "en"), ("README.ko.md", "ko")):
        p = os.path.join(root, fname)
        if not os.path.exists(p):
            continue
        old = open(p, encoding="utf-8").read()
        new = replace_block(old, "HILLS", hills_block(root, boards, lang))
        if new != old:
            changed = True
            if not check:
                with open(p, "w", encoding="utf-8", newline="\n") as fh:
                    fh.write(new)
        print("%s: %s" % (fname, "unchanged" if new == old else ("would change" if check else "updated")))
    for b in boards:
        for r in b["rows"]:
            if r["owner"] in TEAM:
                print("  %-34s %-14s %s of %d (API rank %s)" % (
                    b["name"][:34], r["owner"], rank_text(r), len(b["rows"]), r["api_rank"]))
    return 1 if (check and changed) else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
