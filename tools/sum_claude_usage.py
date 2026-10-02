#!/usr/bin/env python3
"""Sum token usage over Claude Code session transcripts.

Usage:
    python3 sum_claude_usage.py <dir> [--since ISO] [--until ISO] [--tz-hours 9]
                                [--rules rules.json] [--json out.json] [--files]

Walks <dir> recursively for *.jsonl (main sessions and <session>/subagents/*.jsonl),
reads the `usage` field of every assistant message and sums
input_tokens, output_tokens, cache_read_input_tokens, cache_creation_input_tokens.

* A message id that occurs several times (streamed content blocks, resumed or
  forked sessions) is counted once; the occurrence with the largest
  output_tokens is kept.
* --since / --until: ISO timestamps (e.g. 2026-09-27T00:00:00+09:00); a naive
  timestamp is read as UTC. since is inclusive, until exclusive.
* --tz-hours: offset used for the per-date split (default 9 = KST).
* --rules: JSON list of [regex, label]. A subagent transcript whose description
  (from its .meta.json next to it) matches a regex is put in that label's group;
  the first match wins. Everything else, and all main-session messages, go to
  the group "shared/steering".
* Claude Code writes some records when a response starts streaming
  (stop_reason null); their output_tokens is a placeholder. If no record of a
  message has a stop_reason, the message is counted in `no_final_usage` and its
  output_tokens is a LOWER BOUND. `content_chars` is the number of characters of
  visible assistant content (text, tool input; hidden reasoning is not stored),
  given so that the size of the under-count can be judged.
* Only numbers and file names are written; no transcript text is copied.
  Subagent descriptions appear in the output only with --files.

Standard library only.
"""
import argparse
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone

FIELDS = ("input_tokens", "output_tokens", "cache_read_input_tokens", "cache_creation_input_tokens")
DEFAULT_GROUP = "shared/steering"


def parse_ts(s):
    if not s:
        return None
    s = s.strip()
    if s.endswith("Z"):
        s = s[:-1] + "+00:00"
    # tolerate fractional seconds of any length
    m = re.match(r"^(.*T\d\d:\d\d:\d\d)(\.\d+)?(.*)$", s)
    if m:
        frac = (m.group(2) or "")[:7]
        s = m.group(1) + frac + m.group(3)
    try:
        d = datetime.fromisoformat(s)
    except ValueError:
        return None
    if d.tzinfo is None:
        d = d.replace(tzinfo=timezone.utc)
    return d


def zero():
    d = {f: 0 for f in FIELDS}
    d["messages"] = 0
    d["no_final_usage"] = 0
    d["content_chars"] = 0
    return d


def add(acc, usage, final=True, chars=0):
    acc["no_final_usage"] += 0 if final else 1
    acc["content_chars"] += chars
    for f in FIELDS:
        v = usage.get(f) or 0
        if isinstance(v, (int, float)):
            acc[f] += int(v)
    acc["messages"] += 1


def find_transcripts(root):
    out = []
    for dp, _dn, fns in os.walk(root):
        for fn in fns:
            if fn.endswith(".jsonl"):
                out.append(os.path.join(dp, fn))
    out.sort()
    return out


def describe(path):
    """(is_subagent, description) from the path and the .meta.json beside it."""
    parts = path.replace("\\", "/").split("/")
    is_sub = "subagents" in parts
    desc = ""
    meta = path[:-len(".jsonl")] + ".meta.json"
    if os.path.isfile(meta):
        try:
            with open(meta, encoding="utf-8") as fh:
                desc = str(json.load(fh).get("description") or "")
        except (OSError, ValueError):
            desc = ""
    return is_sub, desc


def read_messages(path):
    """Yield (message_id, timestamp, model, usage, final, chars) for assistant messages with usage."""
    try:
        fh = open(path, encoding="utf-8", errors="replace")
    except OSError as e:
        sys.stderr.write("skip %s: %s\n" % (path, e))
        return
    with fh:
        for n, line in enumerate(fh):
            line = line.strip()
            if not line or '"usage"' not in line:
                continue
            try:
                o = json.loads(line)
            except ValueError:
                continue
            if not isinstance(o, dict):
                continue
            msg = o.get("message")
            if not isinstance(msg, dict):
                continue
            usage = msg.get("usage")
            if not isinstance(usage, dict):
                continue
            model = msg.get("model") or "unknown"
            if model == "<synthetic>":
                continue
            mid = msg.get("id") or o.get("requestId") or "%s:%d" % (path, n)
            chars = 0
            content = msg.get("content")
            if isinstance(content, list):
                for c in content:
                    if not isinstance(c, dict):
                        continue
                    if c.get("type") == "tool_use":
                        chars += len(json.dumps(c.get("input", ""), ensure_ascii=False))
                    else:
                        chars += len(c.get("text") or "")
            elif isinstance(content, str):
                chars = len(content)
            yield mid, parse_ts(o.get("timestamp")), model, usage, msg.get("stop_reason") is not None, chars


def main(argv=None):
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except (AttributeError, ValueError):
            pass
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("root")
    ap.add_argument("--since")
    ap.add_argument("--until")
    ap.add_argument("--tz-hours", type=float, default=9.0)
    ap.add_argument("--rules", help="JSON list of [regex, label] applied to subagent descriptions")
    ap.add_argument("--json", dest="json_out", help="write the result as JSON to this file")
    ap.add_argument("--files", action="store_true", help="include a per-transcript table")
    a = ap.parse_args(argv)

    since = parse_ts(a.since) if a.since else None
    until = parse_ts(a.until) if a.until else None
    if (a.since and not since) or (a.until and not until):
        ap.error("cannot parse --since/--until")
    rules = []
    if a.rules:
        with open(a.rules, encoding="utf-8") as fh:
            rules = [(re.compile(r, re.I), lab) for r, lab in json.load(fh)]
    tz = timezone(timedelta(hours=a.tz_hours))

    files = find_transcripts(a.root)
    best = {}  # message id -> [output_tokens, path, ts, model, usage, final, chars]
    dup = 0
    for p in files:
        chars_here = {}
        for mid, ts, model, usage, final, chars in read_messages(p):
            out = usage.get("output_tokens") or 0
            chars_here[mid] = chars_here.get(mid, 0) + chars
            old = best.get(mid)
            if old is None:
                best[mid] = [out, p, ts, model, usage, final, 0]
            else:
                dup += 1
                old[5] = old[5] or final
                if out > old[0]:
                    # keep first-seen file and timestamp, take the fuller usage record
                    old[0], old[4], old[3] = out, usage, model
                    old[2] = old[2] or ts
        for mid, n in chars_here.items():   # the same message in a forked session: count its text once
            best[mid][6] = max(best[mid][6], n)

    info = {}
    for p in files:
        is_sub, desc = describe(p)
        group = DEFAULT_GROUP
        if is_sub:
            for rx, lab in rules:
                if rx.search(desc):
                    group = lab
                    break
        info[p] = (is_sub, desc, group)

    by_model, by_date, by_group, by_kind, by_file = {}, {}, {}, {}, {}
    total = zero()
    tmin = tmax = None
    undated = 0
    for mid, (_o, p, ts, model, usage, final, chars) in best.items():
        if ts is None:
            undated += 1
            if since or until:
                continue
        else:
            if since and ts < since:
                continue
            if until and ts >= until:
                continue
            tmin = ts if tmin is None or ts < tmin else tmin
            tmax = ts if tmax is None or ts > tmax else tmax
        is_sub, _desc, group = info[p]
        day = ts.astimezone(tz).strftime("%Y-%m-%d") if ts else "undated"
        kind = "subagent" if is_sub else "main"
        add(total, usage, final, chars)
        add(by_model.setdefault(model, zero()), usage, final, chars)
        add(by_date.setdefault(day, {}).setdefault(model, zero()), usage, final, chars)
        add(by_group.setdefault(group, {}).setdefault(model, zero()), usage, final, chars)
        add(by_kind.setdefault(kind, {}).setdefault(model, zero()), usage, final, chars)
        add(by_file.setdefault(p, zero()), usage, final, chars)

    sessions = {}
    for p in by_file:
        g = info[p][2]
        sessions[g] = sessions.get(g, 0) + 1

    result = {
        "root": os.path.abspath(a.root),
        "since": a.since, "until": a.until, "tz_hours": a.tz_hours,
        "transcripts_found": len(files),
        "transcripts_with_usage": len(by_file),
        "main_transcripts": sum(1 for p in by_file if not info[p][0]),
        "subagent_transcripts": sum(1 for p in by_file if info[p][0]),
        "unique_messages": total["messages"],
        "duplicate_records_skipped": dup,
        "undated_messages": undated,
        "first_timestamp": tmin.isoformat() if tmin else None,
        "last_timestamp": tmax.isoformat() if tmax else None,
        "total": total,
        "by_model": by_model,
        "by_date": by_date,
        "by_group": by_group,
        "sessions_by_group": sessions,
        "by_kind": by_kind,
    }
    if a.files:
        result["by_file"] = [
            {"file": os.path.relpath(p, a.root).replace("\\", "/"), "subagent": info[p][0],
             "description": info[p][1], "group": info[p][2], **by_file[p]}
            for p in sorted(by_file)]

    def row(label, d):
        return "%-44s %12d %12d %15d %14d %7d %8d %11d" % (
            label[:44], d["input_tokens"], d["output_tokens"],
            d["cache_read_input_tokens"], d["cache_creation_input_tokens"], d["messages"],
            d["no_final_usage"], d["content_chars"])

    head = "%-44s %12s %12s %15s %14s %7s %8s %11s" % (
        "", "input", "output", "cache_read", "cache_write", "msgs", "nofinal", "chars")
    print("root: %s" % result["root"])
    print("transcripts: %d with usage (%d main, %d subagent); unique messages %d; duplicates skipped %d" % (
        result["transcripts_with_usage"], result["main_transcripts"], result["subagent_transcripts"],
        result["unique_messages"], dup))
    print("range: %s .. %s" % (result["first_timestamp"], result["last_timestamp"]))
    print("\n== by model\n" + head)
    for m in sorted(by_model):
        print(row(m, by_model[m]))
    print(row("TOTAL", total))
    for title, table in (("by date (UTC%+g)" % a.tz_hours, by_date), ("by group", by_group), ("by kind", by_kind)):
        print("\n== %s\n%s" % (title, head))
        for k in sorted(table):
            for m in sorted(table[k]):
                print(row("%s | %s" % (k, m), table[k][m]))
    if a.files:
        print("\n== by file\n" + head)
        for r in result["by_file"]:
            print(row(("[%s] %s" % (r["group"], r["description"] or r["file"])), r))
    if a.json_out:
        with open(a.json_out, "w", encoding="utf-8") as fh:
            json.dump(result, fh, indent=1, sort_keys=True)
        print("\nwrote %s" % a.json_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
