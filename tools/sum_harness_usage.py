#!/usr/bin/env python3
"""Sum Claude usage of an agent-harness run from its stream-json run logs.

Usage:
    python3 sum_harness_usage.py <project_dir> [--verify-runs DIR] [--tz-hours 9] [--json out.json]

Reads (plain or .gz):
    <project_dir>/workers/<name>/logs/round_*.log[.gz]     role "worker:<name>"
    <project_dir>/overnight/*.log[.gz]                      role from the file name
        (supervisor_round* -> supervisor, decomposer* -> decomposer, *review* -> reviewer,
         *audit* -> audit, *falsif* -> falsifier, other -> service)
    <verify-runs>/*/log.md[.gz]                             role "verify"

Each `claude -p --output-format stream-json` log ends with a `result` record that has
`modelUsage` (per model: inputTokens, outputTokens, cacheReadInputTokens,
cacheCreationInputTokens, costUSD) and `total_cost_usd` (API list-price equivalent).

* A run with a result record is counted from `modelUsage` ("final"). Results are
  de-duplicated by session id (the last record of a session wins).
* A log without a result record (run killed, timed out, still running) is counted
  from the `usage` of its assistant messages, de-duplicated by message id
  ("partial"): a LOWER BOUND, with no cost. Sub-agent and side-model usage is
  missing from such runs.
* Logs with no stream-json at all (e.g. codex/GPT workers, text logs) are listed
  as "not_claude" and not counted.
* The date of a run is the time stamp of its last stream record if present,
  otherwise the file modification time, in the --tz-hours zone.
* Only numbers and file names are written.

Standard library only.
"""
import argparse
import glob
import gzip
import json
import os
import re
import sys
from datetime import datetime, timedelta, timezone

F = ("input_tokens", "output_tokens", "cache_read_tokens", "cache_write_tokens")


def zero():
    d = {k: 0 for k in F}
    d.update(cost_usd=0.0, runs_final=0, runs_partial=0)
    return d


def role_of(path, project, verify):
    rel = os.path.relpath(path, project).replace("\\", "/")
    name = os.path.basename(path)
    if verify and os.path.abspath(path).startswith(os.path.abspath(verify)):
        return "verify"
    parts = rel.split("/")
    if parts[0] == "workers" and len(parts) > 2:
        return "worker:" + parts[1]
    if name.startswith("supervisor_round"):
        return "supervisor"
    if "decompos" in name:
        return "decomposer"
    if "review" in name:
        return "reviewer"
    if "audit" in name:
        return "audit"
    if "falsif" in name:
        return "falsifier"
    return "service"


def parse_ts(s):
    if not isinstance(s, str):
        return None
    s = s.replace("Z", "+00:00")
    m = re.match(r"^(.*T\d\d:\d\d:\d\d)(\.\d+)?(.*)$", s)
    if m:
        s = m.group(1) + (m.group(2) or "")[:7] + m.group(3)
    try:
        d = datetime.fromisoformat(s)
    except ValueError:
        return None
    return d if d.tzinfo else d.replace(tzinfo=timezone.utc)


def read_log(path):
    """-> (results{session: record}, msgs{id: (model, usage)}, last_ts, n_json)"""
    results, msgs, last_ts, n_json = {}, {}, None, 0
    opener = gzip.open if path.endswith(".gz") else open
    try:
        with opener(path, "rt", encoding="utf-8", errors="replace") as fh:
            for line in fh:
                if not line.startswith("{"):
                    continue
                try:
                    o = json.loads(line)
                except ValueError:
                    continue
                if not isinstance(o, dict):
                    continue
                t = o.get("type")
                if t not in ("result", "assistant", "system", "user"):
                    continue
                n_json += 1
                ts = parse_ts(o.get("timestamp"))
                if ts:
                    last_ts = ts
                if t == "result" and isinstance(o.get("modelUsage"), dict):
                    results[o.get("session_id") or "%s#%d" % (path, len(results))] = o
                elif t == "assistant":
                    m = o.get("message")
                    if isinstance(m, dict) and isinstance(m.get("usage"), dict) and m.get("id"):
                        u = m["usage"]
                        old = msgs.get(m["id"])
                        if old is None or (u.get("output_tokens") or 0) >= (old[1].get("output_tokens") or 0):
                            msgs[m["id"]] = (m.get("model") or "unknown", u)
    except (OSError, EOFError) as e:
        sys.stderr.write("warn %s: %s\n" % (path, e))
    return results, msgs, last_ts, n_json


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("project")
    ap.add_argument("--verify-runs")
    ap.add_argument("--tz-hours", type=float, default=9.0)
    ap.add_argument("--json", dest="json_out")
    a = ap.parse_args(argv)
    tz = timezone(timedelta(hours=a.tz_hours))
    P = a.project
    files = []
    for pat in ("workers/*/logs/round_*.log", "workers/*/logs/round_*.log.gz", "overnight/*.log", "overnight/*.log.gz"):
        files += glob.glob(os.path.join(P, pat))
    if a.verify_runs:
        for pat in ("*/log.md", "*/log.md.gz"):
            files += glob.glob(os.path.join(a.verify_runs, pat))
    files.sort()

    by_role, by_model, by_date, by_role_model = {}, {}, {}, {}
    total = zero()
    cover = {}          # role -> [final, partial, not_claude]
    seen_sessions = set()
    tmin = tmax = None
    for path in files:
        role = role_of(path, P, a.verify_runs)
        c = cover.setdefault(role, [0, 0, 0])
        results, msgs, last_ts, n_json = read_log(path)
        if not results and not msgs:
            c[2] += 1
            continue
        ts = last_ts or datetime.fromtimestamp(os.path.getmtime(path), timezone.utc)
        tmin = ts if tmin is None or ts < tmin else tmin
        tmax = ts if tmax is None or ts > tmax else tmax
        day = ts.astimezone(tz).strftime("%Y-%m-%d")
        rows = []      # (model, in, out, cr, cw, cost)
        if results:
            fresh = False
            for sid, r in results.items():
                if sid in seen_sessions:
                    continue
                seen_sessions.add(sid)
                fresh = True
                for model, mu in r["modelUsage"].items():
                    if isinstance(mu, dict):
                        rows.append((model, mu.get("inputTokens") or 0, mu.get("outputTokens") or 0,
                                     mu.get("cacheReadInputTokens") or 0, mu.get("cacheCreationInputTokens") or 0,
                                     mu.get("costUSD") or 0.0))
            if not fresh:
                continue
            c[0] += 1
            kind = "runs_final"
        else:
            agg = {}
            for model, u in msgs.values():
                x = agg.setdefault(model, [0, 0, 0, 0])
                x[0] += u.get("input_tokens") or 0
                x[1] += u.get("output_tokens") or 0
                x[2] += u.get("cache_read_input_tokens") or 0
                x[3] += u.get("cache_creation_input_tokens") or 0
            rows = [(m, x[0], x[1], x[2], x[3], 0.0) for m, x in agg.items()]
            c[1] += 1
            kind = "runs_partial"
        for acc in (total, by_role.setdefault(role, zero()), by_date.setdefault(day, zero())):
            acc[kind] += 1
        first = True
        for model, i, o, cr, cw, cost in rows:
            for acc in (total, by_role.setdefault(role, zero()), by_date.setdefault(day, zero()),
                        by_model.setdefault(model, zero()),
                        by_role_model.setdefault(role, {}).setdefault(model, zero())):
                acc["input_tokens"] += i
                acc["output_tokens"] += o
                acc["cache_read_tokens"] += cr
                acc["cache_write_tokens"] += cw
                acc["cost_usd"] += cost
            if first:
                by_model[model][kind] += 1          # a run is counted under its first (main) model
                by_role_model[role][model][kind] += 1
                first = False

    for d in [total] + list(by_role.values()) + list(by_model.values()) + list(by_date.values()) + [
            m for r in by_role_model.values() for m in r.values()]:
        d["cost_usd"] = round(d["cost_usd"], 2)
    res = {"project": os.path.abspath(P), "verify_runs": a.verify_runs, "tz_hours": a.tz_hours,
           "log_files": len(files),
           "coverage": {r: {"final": c[0], "partial_no_result_record": c[1], "not_claude_stream": c[2]}
                        for r, c in sorted(cover.items())},
           "first_timestamp": tmin.isoformat() if tmin else None,
           "last_timestamp": tmax.isoformat() if tmax else None,
           "total": total, "by_role": by_role, "by_model": by_model, "by_date": by_date,
           "by_role_model": by_role_model}

    def row(lab, d):
        return "%-34s %10d %11d %14d %13d %10.2f %6d %6d" % (
            lab[:34], d["input_tokens"], d["output_tokens"], d["cache_read_tokens"], d["cache_write_tokens"],
            d["cost_usd"], d["runs_final"], d["runs_partial"])
    head = "%-34s %10s %11s %14s %13s %10s %6s %6s" % ("", "input", "output", "cache_read", "cache_write", "cost_usd", "final", "part")
    print("log files: %d; range %s .. %s" % (len(files), res["first_timestamp"], res["last_timestamp"]))
    print("coverage (final / partial / not claude):")
    for r, c in sorted(cover.items()):
        print("  %-22s %5d %5d %5d" % (r, c[0], c[1], c[2]))
    for title, table in (("by role", by_role), ("by model", by_model), ("by date (UTC%+g)" % a.tz_hours, by_date)):
        print("\n== %s\n%s" % (title, head))
        for k in sorted(table):
            print(row(k, table[k]))
    print(row("TOTAL", total))
    print("\n== by role and model\n" + head)
    for r in sorted(by_role_model):
        for m in sorted(by_role_model[r]):
            print(row("%s | %s" % (r, m), by_role_model[r][m]))
    if a.json_out:
        with open(a.json_out, "w", encoding="utf-8") as fh:
            json.dump(res, fh, indent=1, sort_keys=True)
        print("\nwrote %s" % a.json_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
