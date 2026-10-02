#!/usr/bin/env python3
"""Write the resource charts of the README as static SVG files (light and dark variant of each).

  python tools/make_charts.py [repo_root]

Input : archive/stats/*.yaml, entries/*/STATS.yaml (rows with `counted_in:` are copies and are skipped)
Output: assets/tokens_by_entry_{light,dark}.svg   output tokens per entry, stacked by agent family
        assets/tokens_per_day_{light,dark}.svg    output tokens per day (KST), stacked by agent family, milestones
        assets/compute_by_purpose_{light,dark}.svg recorded wall-clock hours by purpose (estimates)
        assets/chart_data.json                    the plotted numbers

Only OUTPUT tokens are plotted. Cache-read tokens are about 130 times larger (10.6 billion against 81 million)
and uncached input is dominated by one tool; putting them on the same scale would hide everything else. They
are in the table under the charts in README.md.

Python 3 standard library only. The SVGs have a transparent background and no scripts, so they render through
<img>/<picture> on GitHub in both colour schemes.
"""
import glob
import json
import os
import sys
from xml.dom import minidom
from xml.sax.saxutils import escape

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from summarize_stats import load, aslist  # noqa: E402

W = 560
FONT = "-apple-system, 'Segoe UI', Helvetica, Arial, sans-serif"
THEMES = {
    "light": {"ink": "#1f2328", "ink2": "#52514e", "grid": "#e1e0d9", "axis": "#c3c2b7",
              "series": ["#2a78d6", "#eb6834", "#1baf7a"]},
    "dark": {"ink": "#f0f6fc", "ink2": "#c3c2b7", "grid": "#30363d", "axis": "#484f58",
             "series": ["#3987e5", "#d95926", "#199e70"]},
}
FAMILIES = ["Claude, server harness", "Claude, laptop sessions", "GPT (codex CLI)"]   # fixed order = fixed colour
ENTRY_ORDER_HINT = "shared/steering"
MILESTONES = [   # (date, text) - from archive/timeline.md
    ("2026-09-28", "state freeze 01:00 KST; star6 run moved to the server"),
    ("2026-09-30", "reduction chain (Hyp, II imply DMS) complete in Lean"),
    ("2026-10-01", "Claude workers stopped at the weekly limit; GPT workers continue"),
    ("2026-10-02", "Ramsey hill evaluation passed; Lean packs and packets finished"),
    ("2026-10-03", "deadline 13:00 KST (data collected about 01:00 KST)"),
]
PURPOSES = [     # (keyword in the purpose text, label) - first match wins
    ("GPT cross-check audit", "GPT cross-check audit jobs (DMS)"),
    ("review / decompose", "Review / decompose / consult (DMS)"),
    ("worker computations", "Worker computations, SAT (DMS)"),
    ("search (", "Ramsey search (server)"),
    ("candidate proofs by the codex", "Erdős proving sessions (codex)"),
    ("evaluation", "Hill metric re-run (laptop)"),
    ("Lean", "Lean builds and checks, all entries"),
]


def num(x):
    return x if isinstance(x, (int, float)) and not isinstance(x, bool) else None


def tw(text, size):
    """Rough text width in px (average glyph 0.56 em; good enough to catch overlaps)."""
    return 0.56 * size * len(text)


class Svg:
    def __init__(self, h, theme, title, subtitle):
        self.h, self.t, self.parts, self.boxes = h, THEMES[theme], [], []
        self.text(0, 16, title, 15, weight="600")
        self.text(0, 34, subtitle, 12, ink="ink2")

    def text(self, x, y, s, size=12, anchor="start", ink="ink", weight=None, check=True):
        w = tw(s, size)
        x0 = x if anchor == "start" else (x - w if anchor == "end" else x - w / 2)
        if x0 < -1 or x0 + w > W + 1:
            raise SystemExit("label outside the canvas: %r" % s)
        if check:
            box = (x0, y - size, x0 + w, y + 2)
            for b in self.boxes:
                if box[0] < b[2] and b[0] < box[2] and box[1] < b[3] and b[1] < box[3]:
                    raise SystemExit("labels overlap: %r" % s)
            self.boxes.append(box)
        self.parts.append('<text x="%.1f" y="%.1f" font-size="%d" text-anchor="%s" fill="%s"%s>%s</text>' % (
            x, y, size, anchor, self.t[ink], ' font-weight="%s"' % weight if weight else "", escape(s)))

    def rect(self, x, y, w, h, fill, rx=0):
        if w <= 0 or h <= 0:
            return
        self.parts.append('<rect x="%.2f" y="%.2f" width="%.2f" height="%.2f" fill="%s"%s/>' % (
            x, y, w, h, fill, ' rx="%g"' % min(rx, w / 2, h / 2) if rx else ""))

    def line(self, x1, y1, x2, y2, colour="grid"):
        self.parts.append('<line x1="%.1f" y1="%.1f" x2="%.1f" y2="%.1f" stroke="%s" stroke-width="1"/>' % (
            x1, y1, x2, y2, self.t[colour]))

    def legend(self, y):
        x = 0
        for i, name in enumerate(FAMILIES):
            self.rect(x, y - 9, 10, 10, self.t["series"][i], rx=2)
            self.text(x + 14, y, name, 12, ink="ink2")
            x += 14 + tw(name, 12) + 16

    def write(self, path, label):
        doc = ('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 %d %d" width="%d" height="%d" role="img" '
               'aria-label="%s" font-family="%s">\n%s\n</svg>\n' % (
                   W, self.h, W, self.h, escape(label, {'"': "&quot;"}), FONT, "\n".join(self.parts)))
        minidom.parseString(doc.encode("utf-8"))          # well-formedness check
        with open(path, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(doc)


# ------------------------------------------------------------------ data
def family_of(path):
    name = os.path.basename(path)
    if "harness" in name:
        return 0
    if "claude" in name:
        return 1
    if "codex" in name:
        return 2
    return None


def read_data(root):
    by_entry, by_day, compute = {}, {}, {}
    for path in sorted(glob.glob(os.path.join(root, "archive", "stats", "*.yaml"))):
        fam = family_of(path)
        d = load(path)
        if fam is None:
            continue
        for r in aslist(d.get("ai_usage")):
            if r.get("counted_in"):
                continue
            row = by_entry.setdefault(r.get("entry") or "shared/steering", [0, 0, 0])
            row[fam] += num(r.get("output_tokens")) or 0
        days = d.get("by_date_kst_transcripts") or d.get("by_date_kst") or []
        for r in aslist(days):
            v = num(r.get("output_tokens")) if "output_tokens" in r else num(r.get("output"))
            by_day.setdefault(r["date"], [0, 0, 0])[fam] += v or 0
    rows = []
    for path in sorted(glob.glob(os.path.join(root, "archive", "stats", "*.yaml")) +
                       glob.glob(os.path.join(root, "entries", "*", "STATS.yaml"))):
        if "_TEMPLATE" in path:
            continue
        for r in aslist(load(path).get("compute")):
            if not r.get("counted_in"):
                rows.append(r)
    for r in rows:
        w = num(r.get("wall_hours"))
        if w is None:
            continue
        label = next((lab for key, lab in PURPOSES if key in str(r.get("purpose", ""))), "Other")
        compute[label] = compute.get(label, 0) + w
    return by_entry, by_day, compute


def mil(v):
    m = v / 1e6
    return ("%.1f M" % m) if m >= 10 else ("%.2f M" % m)


# ------------------------------------------------------------------ charts
def chart_entries(by_entry, theme, path):
    names = sorted(by_entry, key=lambda e: -sum(by_entry[e]))
    row_h, top = 46, 78
    s = Svg(top + row_h * len(names) + 22, theme, "Output tokens by entry and agent family",
            "millions of output tokens; input and cache tokens are not on this scale (see table)")
    s.legend(58)
    x0, x1 = 172, 478
    vmax = max(sum(v) for v in by_entry.values())
    for i, name in enumerate(names):
        y = top + i * row_h
        s.text(x0 - 8, y + 16, name, 12, anchor="end")
        x = x0
        for f, v in enumerate(by_entry[name]):
            w = (x1 - x0) * v / vmax
            if w >= 0.4:
                s.rect(x, y + 2, max(w - (2 if w > 6 else 0), 0.4), 20, s.t["series"][f])
                if w > 30:
                    s.text(x + w / 2, y + 36, mil(v).replace(" M", ""), 11, anchor="middle", ink="ink2")
                x += w
        s.text(x + 6, y + 16, mil(sum(by_entry[name])), 12, weight="600")
    s.line(x0, top - 4, x0, top + row_h * len(names) - 14, "axis")
    s.text(0, s.h - 4, "Output of Claude laptop subagents is a lower bound (stream-start records only).", 11,
           ink="ink2")
    s.write(path, "Output tokens by entry, stacked by agent family")


def chart_days(by_day, theme, path):
    days = sorted(by_day)
    top, base = 80, 250
    s = Svg(base + 30 + 17 * len(MILESTONES) + 6, theme, "Output tokens per day (KST) by agent family",
            "millions of output tokens; numbered days are explained below")
    s.legend(58)
    x0, x1 = 30, W - 4
    vmax = max(sum(v) for v in by_day.values())
    top_tick = 5 * (int(vmax / 5e6) + 1)
    for t in range(0, top_tick + 1, 5):
        y = base - (base - top) * t / top_tick
        s.line(x0, y, x1, y, "axis" if t == 0 else "grid")
        s.text(x0 - 6, y + 4, str(t), 11, anchor="end", ink="ink2")
    slot = (x1 - x0) / len(days)
    bw = min(40, slot * 0.6)
    marks = {d: i + 1 for i, (d, _) in enumerate(MILESTONES)}
    for i, day in enumerate(days):
        cx = x0 + slot * (i + 0.5)
        y = base
        for f, v in enumerate(by_day[day]):
            h = (base - top) * (v / 1e6) / top_tick
            if h >= 0.4:
                s.rect(cx - bw / 2, y - h + (2 if h > 6 else 0), bw, h - (2 if h > 6 else 0), s.t["series"][f])
                y -= h
        total = sum(by_day[day])
        s.text(cx, y - 6, mil(total).replace(" M", ""), 12, anchor="middle", weight="600")
        tag = day[5:] + (" [%d]" % marks[day] if day in marks else "")
        s.text(cx, base + 17, tag, 11, anchor="middle", ink="ink2")
    for i, (day, text) in enumerate(MILESTONES):
        s.text(0, base + 42 + 17 * i, "[%d] %s  %s" % (i + 1, day[5:], text), 11, ink="ink2")
    s.write(path, "Output tokens per day, stacked by agent family, with milestones")


def chart_compute(compute, theme, path):
    names = sorted(compute, key=lambda k: -compute[k])
    row_h, top = 28, 52
    s = Svg(top + row_h * len(names) + 22, theme, "Recorded wall-clock hours by purpose",
            "estimates from job records and artifacts; jobs ran in parallel; not CPU time")
    x0, x1 = 252, 500
    vmax = max(compute.values())
    for i, name in enumerate(names):
        y = top + i * row_h
        v = compute[name]
        s.text(x0 - 8, y + 15, name, 12, anchor="end")
        w = max((x1 - x0) * v / vmax, 1.0)
        s.rect(x0, y + 3, w, 16, s.t["series"][0], rx=3)
        s.text(x0 + w + 6, y + 15, ("%.1f h" % v) if v >= 1 else ("%.2f h" % v), 12, weight="600")
    s.line(x0, top - 2, x0, top + row_h * len(names) - 4, "axis")
    s.text(0, s.h - 4, "Audit and agent-run jobs mostly wait on the model; they are not CPU hours.", 11, ink="ink2")
    s.write(path, "Recorded wall-clock hours by purpose")


def main(argv):
    root = argv[0] if argv else os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out = os.path.join(root, "assets")
    os.makedirs(out, exist_ok=True)
    by_entry, by_day, compute = read_data(root)
    for theme in THEMES:
        chart_entries(by_entry, theme, os.path.join(out, "tokens_by_entry_%s.svg" % theme))
        chart_days(by_day, theme, os.path.join(out, "tokens_per_day_%s.svg" % theme))
        chart_compute(compute, theme, os.path.join(out, "compute_by_purpose_%s.svg" % theme))
    data = {"unit": "output tokens; wall hours", "families": FAMILIES, "output_tokens_by_entry": by_entry,
            "output_tokens_by_day_kst": by_day, "wall_hours_by_purpose": compute,
            "totals": {"output_tokens_by_family": [sum(v[i] for v in by_entry.values()) for i in range(3)],
                       "output_tokens": sum(sum(v) for v in by_entry.values()),
                       "output_tokens_by_day_sum": sum(sum(v) for v in by_day.values())}}
    with open(os.path.join(out, "chart_data.json"), "w", encoding="utf-8", newline="\n") as fh:
        json.dump(data, fh, indent=1, ensure_ascii=False, sort_keys=True)
        fh.write("\n")
    print(json.dumps(data["totals"]))
    print(json.dumps(compute))
    print("6 SVG files written to assets/ (well-formed XML, no label overlaps by the width estimate)")


if __name__ == "__main__":
    main(sys.argv[1:])
