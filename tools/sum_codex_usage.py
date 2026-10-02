#!/usr/bin/env python3
"""Sum token usage over codex CLI session rollouts.

Usage:
    python3 sum_codex_usage.py [<dir>] [--since ISO] [--until ISO] [--tz-hours 9]
                               [--rules rules.json] [--json out.json] [--sessions]

<dir> defaults to ~/.codex/sessions; every **/*.jsonl below it is one session.

A rollout carries `event_msg` records with payload.type == "token_count" whose
`info.total_token_usage` is CUMULATIVE for the session
(input_tokens, cached_input_tokens, output_tokens, reasoning_output_tokens, total_tokens).

* Session total = the last cumulative record (if the counter ever goes down,
  e.g. after a restart inside one file, the segments are added).
* Per-date and --since/--until figures use the increments between consecutive
  cumulative records, placed at the time stamp of the record. Without a date
  filter the increments add up to the session totals.
* codex `input_tokens` INCLUDES cached input. This script reports
  `input_uncached` (= input_tokens - cached_input_tokens) and `cached_input`
  separately; `output` includes `reasoning_output`.
* Model: the model of the last `turn_context` record of the session
  (increments are attributed to the model current at that point).
* --rules: JSON list of [regex, label] matched against the session's cwd
  (from `session_meta`); first match wins; otherwise "unattributed".
* Only numbers, cwd and file names are written; no prompt or reply text.

Standard library only.
"""
import argparse
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone

KEYS = ("input_tokens", "cached_input_tokens", "output_tokens", "reasoning_output_tokens", "total_tokens")
OUT = ("input_uncached", "cached_input", "output", "reasoning_output", "total")
DEFAULT_GROUP = "unattributed"


def parse_ts(s):
    if not s:
        return None
    s = str(s).strip()
    if s.endswith("Z"):
        s = s[:-1] + "+00:00"
    m = re.match(r"^(.*T\d\d:\d\d:\d\d)(\.\d+)?(.*)$", s)
    if m:
        s = m.group(1) + (m.group(2) or "")[:7] + m.group(3)
    try:
        d = datetime.fromisoformat(s)
    except ValueError:
        return None
    if d.tzinfo is None:
        d = d.replace(tzinfo=timezone.utc)
    return d


def zero():
    d = {k: 0 for k in OUT}
    d["sessions"] = 0
    return d


def add(acc, delta):
    inp, cached, out, reas, tot = delta
    acc["input_uncached"] += inp - cached
    acc["cached_input"] += cached
    acc["output"] += out
    acc["reasoning_output"] += reas
    acc["total"] += tot


def read_session(path):
    """Return dict(cwd, id, start, events=[(ts, model, delta5)], last_model)."""
    cwd = sid = None
    start = None
    model = "unknown"
    prev = None
    events = []
    try:
        fh = open(path, encoding="utf-8", errors="replace")
    except OSError as e:
        sys.stderr.write("skip %s: %s\n" % (path, e))
        return None
    with fh:
        for line in fh:
            if not line.strip():
                continue
            try:
                o = json.loads(line)
            except ValueError:
                continue
            if not isinstance(o, dict):
                continue
            p = o.get("payload")
            if not isinstance(p, dict):
                continue
            t = o.get("type")
            ts = parse_ts(o.get("timestamp"))
            if start is None and ts is not None:
                start = ts
            if t == "session_meta":
                cwd = p.get("cwd") or cwd
                sid = p.get("id") or sid
                start = parse_ts(p.get("timestamp")) or start
            elif t == "turn_context":
                model = p.get("model") or model
                cwd = cwd or p.get("cwd")
            elif t == "event_msg" and p.get("type") == "token_count":
                info = p.get("info")
                if not isinstance(info, dict):
                    continue
                tot = info.get("total_token_usage")
                if not isinstance(tot, dict):
                    continue
                cur = tuple(int(tot.get(k) or 0) for k in KEYS)
                if prev is None or cur[4] < prev[4]:
                    delta = cur                      # first record, or the counter restarted
                else:
                    delta = tuple(c - q for c, q in zip(cur, prev))
                prev = cur
                if any(delta):
                    events.append((ts, model, delta))
    return {"cwd": cwd or "", "id": sid or os.path.basename(path), "start": start,
            "events": events, "model": model}


def main(argv=None):
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8", errors="replace")
        except (AttributeError, ValueError):
            pass
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("root", nargs="?", default=os.path.join(os.path.expanduser("~"), ".codex", "sessions"))
    ap.add_argument("--since")
    ap.add_argument("--until")
    ap.add_argument("--tz-hours", type=float, default=9.0)
    ap.add_argument("--rules", help="JSON list of [regex, label] applied to the session cwd")
    ap.add_argument("--json", dest="json_out")
    ap.add_argument("--sessions", action="store_true", help="include a per-session table")
    a = ap.parse_args(argv)
    since = parse_ts(a.since) if a.since else None
    until = parse_ts(a.until) if a.until else None
    if (a.since and not since) or (a.until and not until):
        ap.error("cannot parse --since/--until")
    rules = []
    if a.rules:
        with open(a.rules, encoding="utf-8") as fh:
            rules = [(re.compile(r), lab) for r, lab in json.load(fh)]
    tz = timezone(timedelta(hours=a.tz_hours))

    files = []
    for dp, _dn, fns in os.walk(a.root):
        files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".jsonl")]
    files.sort()

    total = zero()
    by_model, by_date, by_group, by_group_date, rows = {}, {}, {}, {}, []
    tmin = tmax = None
    empty = 0
    for path in files:
        s = read_session(path)
        if s is None:
            continue
        group = DEFAULT_GROUP
        for rx, lab in rules:
            if rx.search(s["cwd"]):
                group = lab
                break
        sess = zero()
        models = set()
        for ts, model, delta in s["events"]:
            if ts is None:
                if since or until:
                    continue
                day = "undated"
            else:
                if since and ts < since:
                    continue
                if until and ts >= until:
                    continue
                tmin = ts if tmin is None or ts < tmin else tmin
                tmax = ts if tmax is None or ts > tmax else tmax
                day = ts.astimezone(tz).strftime("%Y-%m-%d")
            models.add(model)
            for acc in (total, sess,
                        by_model.setdefault(model, zero()),
                        by_date.setdefault(day, {}).setdefault(model, zero()),
                        by_group.setdefault(group, {}).setdefault(model, zero()),
                        by_group_date.setdefault(group, {}).setdefault(day, zero())):
                add(acc, delta)
        if not models:
            empty += 1
            continue
        total["sessions"] += 1
        # a session is counted once per table, under its last model / its start date
        by_model[s["model"] if s["model"] in models else sorted(models)[0]]["sessions"] += 1
        by_group[group][s["model"] if s["model"] in models else sorted(models)[0]]["sessions"] += 1
        sd = s["start"].astimezone(tz).strftime("%Y-%m-%d") if s["start"] else "undated"
        d = by_date.setdefault(sd, {}).setdefault(s["model"], zero())
        d["sessions"] += 1
        by_group_date[group].setdefault(sd, zero())["sessions"] += 1
        sess["sessions"] = 1
        rows.append({"file": os.path.relpath(path, a.root).replace("\\", "/"), "cwd": s["cwd"],
                     "group": group, "model": s["model"],
                     "start": s["start"].isoformat() if s["start"] else None, **sess})

    result = {"root": os.path.abspath(a.root), "since": a.since, "until": a.until, "tz_hours": a.tz_hours,
              "rollouts_found": len(files), "sessions_with_usage": total["sessions"],
              "sessions_without_usage_in_range": empty,
              "first_timestamp": tmin.isoformat() if tmin else None,
              "last_timestamp": tmax.isoformat() if tmax else None,
              "total": total, "by_model": by_model, "by_date": by_date,
              "by_group": by_group, "by_group_date": by_group_date}
    if a.sessions:
        result["sessions"] = rows

    def row(label, d):
        return "%-46s %14d %15d %13d %13d %15d %6d" % (
            label[:46], d["input_uncached"], d["cached_input"], d["output"], d["reasoning_output"],
            d["total"], d["sessions"])

    head = "%-46s %14s %15s %13s %13s %15s %6s" % (
        "", "input_uncached", "cached_input", "output", "(reasoning)", "total", "sess")
    print("root: %s" % result["root"])
    print("rollouts: %d, with usage in range: %d" % (len(files), total["sessions"]))
    print("range: %s .. %s" % (result["first_timestamp"], result["last_timestamp"]))
    print("\n== by model\n" + head)
    for m in sorted(by_model):
        print(row(m, by_model[m]))
    print(row("TOTAL", total))
    for title, table in (("by date (UTC%+g; sessions counted at their start date)" % a.tz_hours, by_date),
                         ("by group (cwd rules)", by_group)):
        print("\n== %s\n%s" % (title, head))
        for k in sorted(table):
            for m in sorted(table[k]):
                print(row("%s | %s" % (k, m), table[k][m]))
    print("\n== by group and date\n" + head)
    for g in sorted(by_group_date):
        for day in sorted(by_group_date[g]):
            print(row("%s | %s" % (g, day), by_group_date[g][day]))
    if a.sessions:
        print("\n== sessions\n" + head)
        for r in rows:
            print(row("[%s] %s" % (r["group"], r["cwd"][-30:]), r))
    if a.json_out:
        with open(a.json_out, "w", encoding="utf-8") as fh:
            json.dump(result, fh, indent=1, sort_keys=True)
        print("\nwrote %s" % a.json_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
