#!/usr/bin/env python3
"""Build archive/stats/SUMMARY.md from entries/*/STATS.yaml and archive/stats/*.yaml.

Usage (from the repository root, or pass the root):
    python3 tools/summarize_stats.py [repo_root] [--out archive/stats/SUMMARY.md] [--check]

Columns (archive/STATS_REQUEST.md, section 4): entry, model, input tokens, output
tokens, cache tokens, sessions, cost, compute CPU-hours, human hours, Lean lines,
theorems claimed.

Counting rule (so that nothing is counted twice):
* AI usage is taken from every `ai_usage` row of every file, EXCEPT rows that
  have a non-empty `counted_in:` key (such a row repeats numbers whose original
  is in the file named there).
* The entry of a usage row is its own `entry:` key if present, otherwise the
  `entry:` of the file, otherwise "shared/steering".
* compute, human_time and outputs are taken from entries/*/STATS.yaml and from
  archive/stats/*.yaml rows (compute / human_time rows may carry `entry:` too).
* A value that is not a number (e.g. "TODO ...") is shown as TODO and is not
  added; the totals then carry a "+TODO" mark.

Input files may be YAML (the simple subset used by entries/_TEMPLATE: nested
mappings, block lists, one-line flow lists/maps, quoted or plain scalars,
comments) or JSON (file extension .json). Standard library only.
"""
import json
import os
import re
import sys


# ----------------------------------------------------------------- tiny YAML
class YamlError(ValueError):
    pass


def _strip_comment(s):
    out, q = [], None
    for i, ch in enumerate(s):
        if q:
            if ch == q and not (q == '"' and i > 0 and s[i - 1] == "\\"):
                q = None
        elif ch in "\"'":
            q = ch
        elif ch == "#" and (i == 0 or s[i - 1] in " \t"):
            break
        out.append(ch)
    return "".join(out).rstrip()


def _split_flow(s):
    parts, depth, q, cur = [], 0, None, []
    for i, ch in enumerate(s):
        if q:
            cur.append(ch)
            if ch == q and not (q == '"' and s[i - 1] == "\\"):
                q = None
            continue
        if ch in "\"'":
            q = ch
        elif ch in "[{":
            depth += 1
        elif ch in "]}":
            depth -= 1
        elif ch == "," and depth == 0:
            parts.append("".join(cur))
            cur = []
            continue
        cur.append(ch)
    if "".join(cur).strip():
        parts.append("".join(cur))
    return [p.strip() for p in parts]


def _key_split(s):
    """Split 'key: value' at the first ': ' outside quotes; None if not a mapping line."""
    q = None
    for i, ch in enumerate(s):
        if q:
            if ch == q:
                q = None
        elif ch in "\"'":
            q = ch
        elif ch == ":" and (i + 1 == len(s) or s[i + 1] in " \t"):
            return s[:i].strip().strip("\"'"), s[i + 1:].strip()
    return None


def _scalar(s):
    s = s.strip()
    if s == "" or s in ("~", "null", "Null", "NULL"):
        return None
    if s[0] == "[" and s[-1] == "]":
        return [_scalar(p) for p in _split_flow(s[1:-1])]
    if s[0] == "{" and s[-1] == "}":
        d = {}
        for p in _split_flow(s[1:-1]):
            kv = _key_split(p)
            if kv is None:
                raise YamlError("bad flow mapping item: %r" % p)
            d[kv[0]] = _scalar(kv[1])
        return d
    if len(s) >= 2 and s[0] == s[-1] == '"':
        try:
            return json.loads(s)
        except ValueError:
            return s[1:-1]
    if len(s) >= 2 and s[0] == s[-1] == "'":
        return s[1:-1].replace("''", "'")
    if s in ("true", "True"):
        return True
    if s in ("false", "False"):
        return False
    if re.match(r"^[-+]?\d+$", s):
        return int(s)
    if re.match(r"^[-+]?(\d+\.\d*|\.\d+|\d+)([eE][-+]?\d+)?$", s):
        return float(s)
    return s


def parse_yaml(text):
    lines = []
    for raw in text.splitlines():
        if raw.strip() in ("---", "..."):
            continue
        s = _strip_comment(raw.replace("\t", "    "))
        if s.strip():
            lines.append((len(s) - len(s.lstrip(" ")), s.strip()))
    pos = [0]

    def block(indent):
        if pos[0] >= len(lines):
            return None
        ind, s = lines[pos[0]]
        if s.startswith("- ") or s == "-":
            out = []
            while pos[0] < len(lines) and lines[pos[0]][0] == ind and (
                    lines[pos[0]][1].startswith("- ") or lines[pos[0]][1] == "-"):
                item = lines[pos[0]][1][1:].strip()
                if item == "":
                    pos[0] += 1
                    out.append(block(ind + 1))
                elif _key_split(item) is not None and item[0] not in "[{\"'":
                    # mapping that starts on the dash line: re-read it as a line indented by 2
                    lines[pos[0]] = (ind + 2, item)
                    out.append(mapping(ind + 2))
                else:
                    pos[0] += 1
                    out.append(_scalar(item))
            return out
        return mapping(ind)

    def mapping(ind):
        d = {}
        while pos[0] < len(lines) and lines[pos[0]][0] == ind:
            s = lines[pos[0]][1]
            kv = _key_split(s)
            if kv is None:
                raise YamlError("expected 'key: value', got %r" % s)
            key, val = kv
            pos[0] += 1
            if val in ("|", ">", "|-", ">-"):
                buf = []
                while pos[0] < len(lines) and lines[pos[0]][0] > ind:
                    buf.append(lines[pos[0]][1])
                    pos[0] += 1
                d[key] = ("\n" if val[0] == "|" else " ").join(buf)
            elif val == "":
                if pos[0] < len(lines) and (lines[pos[0]][0] > ind or (
                        lines[pos[0]][0] == ind and lines[pos[0]][1].startswith("- "))):
                    d[key] = block(lines[pos[0]][0])
                else:
                    d[key] = None
            else:
                d[key] = _scalar(val)
        if pos[0] < len(lines) and lines[pos[0]][0] > ind:
            raise YamlError("unexpected indentation at %r" % lines[pos[0]][1])
        return d

    doc = block(0)
    if pos[0] < len(lines):
        raise YamlError("could not parse from %r" % lines[pos[0]][1])
    return doc if doc is not None else {}


def load(path):
    with open(path, encoding="utf-8") as fh:
        text = fh.read()
    if path.endswith(".json"):
        return json.loads(text)
    return parse_yaml(text)


# ----------------------------------------------------------------- summary
class Num:
    """A sum that remembers whether some addend was missing (TODO)."""

    def __init__(self):
        self.v = 0
        self.todo = False
        self.seen = False

    def add(self, x):
        if x is None or x == "":
            return
        self.seen = True
        if isinstance(x, bool) or not isinstance(x, (int, float)):
            self.todo = True
        else:
            self.v += x

    def merge(self, other):
        self.v += other.v
        self.todo = self.todo or other.todo
        self.seen = self.seen or other.seen

    def __str__(self):
        if not self.seen:
            return ""
        if self.todo and self.v == 0:
            return "TODO"
        s = ("{:,}".format(self.v) if isinstance(self.v, int) else "{:,.1f}".format(self.v))
        return s + (" +TODO" if self.todo else "")


def aslist(x):
    if x is None:
        return []
    return x if isinstance(x, list) else [x]


USAGE_COLS = ("input_tokens", "output_tokens", "cache_read_tokens", "cache_write_tokens", "sessions", "cost_usd")
SHARED = "shared/steering"


def main(argv=None):
    args = list(sys.argv[1:] if argv is None else argv)
    check = "--check" in args
    if check:
        args.remove("--check")
    out = None
    if "--out" in args:
        i = args.index("--out")
        out = args[i + 1]
        del args[i:i + 2]
    root = args[0] if args else os.getcwd()
    if not os.path.isdir(os.path.join(root, "entries")):
        sys.exit("run from the repository root (entries/ not found in %s)" % root)
    out = out or os.path.join(root, "archive", "stats", "SUMMARY.md")

    files = []
    ed = os.path.join(root, "entries")
    for name in sorted(os.listdir(ed)):
        for fn in ("STATS.yaml", "STATS.json"):
            p = os.path.join(ed, name, fn)
            if name != "_TEMPLATE" and os.path.isfile(p):
                files.append(p)
    sd = os.path.join(root, "archive", "stats")
    if os.path.isdir(sd):
        for fn in sorted(os.listdir(sd)):
            if fn.endswith((".yaml", ".yml")):
                files.append(os.path.join(sd, fn))

    usage = {}     # (entry, provider, model, interface) -> {col: Num}
    per_entry = {}  # entry -> dict of Num
    notes, problems, skipped = [], [], 0

    def ent(e):
        return per_entry.setdefault(e, {k: Num() for k in (
            "cpu_hours", "wall_hours", "human_hours", "lean_lines", "lean_files", "theorems_claimed")})

    for p in files:
        rel = os.path.relpath(p, root).replace("\\", "/")
        try:
            d = load(p)
        except (YamlError, ValueError, OSError) as e:
            problems.append("%s: %s" % (rel, e))
            continue
        if not isinstance(d, dict):
            problems.append("%s: top level is not a mapping" % rel)
            continue
        file_entry = d.get("entry") or SHARED
        for r in aslist(d.get("ai_usage")):
            if not isinstance(r, dict):
                continue
            if r.get("counted_in"):
                skipped += 1
                continue
            if not (r.get("model") or r.get("provider")):
                continue
            key = (r.get("entry") or file_entry, str(r.get("provider") or ""), str(r.get("model") or ""),
                   str(r.get("interface") or ""))
            acc = usage.setdefault(key, {c: Num() for c in USAGE_COLS})
            for c in USAGE_COLS:
                acc[c].add(r.get(c))
            ent(key[0])
        for r in aslist(d.get("compute")):
            if isinstance(r, dict) and r.get("counted_in") in (None, ""):
                e = ent(r.get("entry") or file_entry)
                e["cpu_hours"].add(r.get("cpu_hours"))
                e["wall_hours"].add(r.get("wall_hours"))
        for r in aslist(d.get("human_time")):
            if isinstance(r, dict):
                ent(r.get("entry") or file_entry)["human_hours"].add(r.get("hours"))
        o = d.get("outputs")
        if isinstance(o, dict) and rel.startswith("entries/"):
            e = ent(file_entry)
            for k in ("lean_lines", "lean_files", "theorems_claimed"):
                e[k].add(o.get(k))
        if d.get("notes"):
            notes.append((rel, str(d["notes"])))

    L = []
    L.append("# Statistics summary")
    L.append("")
    L.append("This file is written by `tools/summarize_stats.py`. Do not edit it by hand. "
             "Sources: `entries/*/STATS.yaml`, `archive/stats/*.yaml`.")
    L.append("")
    L.append("- `TODO` means the source has no number yet; `+TODO` means a term is missing from the sum.")
    L.append("- Cache tokens = cache read + cache write. Sources, and whether a figure is an estimate, are in the "
             "`source` and `notes` fields of each source file.")
    L.append("- %d rows marked `counted_in` (copies of figures held in another file) were not counted." % skipped)
    L.append("")
    L.append("## 1. AI usage (entry × model)")
    L.append("")
    L.append("| Entry | Model | Interface | Input tokens | Output tokens | Cache tokens | Sessions | Cost (USD) |")
    L.append("|---|---|---|---:|---:|---:|---:|---:|")
    by_model = {}
    for key in sorted(usage):
        a = usage[key]
        cache = Num()
        cache.merge(a["cache_read_tokens"])
        cache.merge(a["cache_write_tokens"])
        L.append("| %s | %s | %s | %s | %s | %s | %s | %s |" % (
            key[0], key[2] or key[1], key[3], a["input_tokens"], a["output_tokens"], cache, a["sessions"], a["cost_usd"]))
        m = by_model.setdefault(key[2] or key[1], {c: Num() for c in USAGE_COLS})
        for c in USAGE_COLS:
            m[c].merge(a[c])
    L.append("")
    L.append("## 2. Totals per model")
    L.append("")
    L.append("| Model | Input tokens | Output tokens | Cache read | Cache write | Sessions | Cost (USD) |")
    L.append("|---|---:|---:|---:|---:|---:|---:|")
    for m in sorted(by_model):
        a = by_model[m]
        L.append("| %s | %s | %s | %s | %s | %s | %s |" % (
            m, a["input_tokens"], a["output_tokens"], a["cache_read_tokens"], a["cache_write_tokens"],
            a["sessions"], a["cost_usd"]))
    L.append("")
    L.append("## 3. Totals per entry")
    L.append("")
    L.append("| Entry | Input tokens | Output tokens | Cache tokens | Sessions | Cost (USD) | Compute CPU hours | Human time | Lean lines | Claimed theorems |")
    L.append("|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
    for e in sorted(per_entry):
        tot = {c: Num() for c in USAGE_COLS}
        for key, a in usage.items():
            if key[0] == e:
                for c in USAGE_COLS:
                    tot[c].merge(a[c])
        cache = Num()
        cache.merge(tot["cache_read_tokens"])
        cache.merge(tot["cache_write_tokens"])
        pe = per_entry[e]
        L.append("| %s | %s | %s | %s | %s | %s | %s | %s | %s | %s |" % (
            e, tot["input_tokens"], tot["output_tokens"], cache, tot["sessions"], tot["cost_usd"],
            pe["cpu_hours"], pe["human_hours"], pe["lean_lines"], pe["theorems_claimed"]))
    L.append("")
    L.append("## 4. Files read")
    L.append("")
    for p in files:
        L.append("- `%s`" % os.path.relpath(p, root).replace("\\", "/"))
    if notes:
        L.append("")
        L.append("## 5. Notes of the source files")
        L.append("")
        for rel, n in notes:
            L.append("- `%s`: %s" % (rel, " ".join(n.split())))
    if problems:
        L.append("")
        L.append("## Files that could not be read")
        L.append("")
        for pr in problems:
            L.append("- %s" % pr)
    text = "\n".join(L) + "\n"
    if check:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace") if hasattr(sys.stdout, "reconfigure") else None
        print(text)
    else:
        with open(out, "w", encoding="utf-8", newline="\n") as fh:
            fh.write(text)
        print("wrote %s (%d files, %d usage rows, %d problems)" % (out, len(files), len(usage), len(problems)))
    for pr in problems:
        sys.stderr.write("PROBLEM %s\n" % pr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
