#!/usr/bin/env python3
"""Build a flat directory of Lean modules in import order and audit axioms.

  python3 build_pkg.py --lean <lean binary> --src <dir with *.lean and order.txt> --out <build dir>
                       [--extra <olean root>[:<root>...]] [--jobs 2] [--timeout 1500] [--only Mod ...]

Every module is compiled with `lean -o`. A module is skipped when its olean is up to date (source hash and
the hashes of its local imports unchanged). Results: <out>/build.log (human), <out>/build_report.json;
then Main.lean (if present in --src) is run and its output kept in <out>/axioms.log, and a full audit of
every theorem (collectAxioms) is written to <out>/audit_all.tsv.  Always exits 0; read the report.
"""
import argparse, hashlib, json, os, re, resource, subprocess, sys, time
from concurrent.futures import ThreadPoolExecutor, FIRST_COMPLETED, wait

AUDIT = """import Lean
{imports}
open Lean Elab Command in
#eval show CommandElabM Unit from do
  let env ← getEnv
  let mods : Array Name := #[{mods}]
  let mut out : Array String := #[]
  for (n, ci) in env.constants.map₁.toList do
    if n.isInternal then continue
    let some idx := env.getModuleIdxFor? n | continue
    let some modName := env.header.moduleNames[idx.toNat]? | continue
    if !mods.contains modName then continue
    match ci with
    | .thmInfo _ =>
      let axs ← liftCoreM <| Lean.collectAxioms n
      let axStr := ",".intercalate (axs.toList.map toString)
      out := out.push s!"AXIOMS\\t{{modName}}\\t{{n}}\\t{{axStr}}"
    | _ => pure ()
  for line in out do
    IO.println line
"""


def imports(path):
    return [l.split()[1] for l in open(path, encoding="utf-8") if l.startswith("import ")]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lean", required=True)
    ap.add_argument("--src", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--extra", default="")
    ap.add_argument("--jobs", type=int, default=2)
    ap.add_argument("--timeout", type=int, default=1500)
    ap.add_argument("--only", nargs="*")
    ap.add_argument("--no-audit", action="store_true")
    ap.add_argument("--leanargs", default="")
    a = ap.parse_args()
    src, out = os.path.abspath(a.src), os.path.abspath(a.out)
    os.makedirs(out, exist_ok=True)
    order = [l.strip() for l in open(f"{src}/order.txt") if l.strip()]
    loc = {m: [i for i in imports(f"{src}/{m}.lean") if i in order] for m in order}
    if a.only:
        need = set()

        def v(m):
            if m not in need:
                need.add(m)
                for i in loc[m]:
                    v(i)
        for m in a.only:
            v(m)
        order = [m for m in order if m in need]
    env = dict(os.environ, LEAN_PATH=os.pathsep.join([out] + [p for p in a.extra.split(os.pathsep) if p]))
    sha = {m: hashlib.sha256(open(f"{src}/{m}.lean", "rb").read()).hexdigest() for m in order}
    memo = {}

    def key(m):
        if m not in memo:
            memo[m] = hashlib.sha256((sha[m] + "".join(key(i) for i in loc[m])).encode()).hexdigest()
        return memo[m]
    log = open(f"{out}/build.log", "a", encoding="utf-8")
    ver = subprocess.run([a.lean, "--version"], capture_output=True, text=True).stdout.strip()

    def say(s):
        log.write(s + "\n")
        log.flush()
    say(f"=== {time.strftime('%Y-%m-%d %H:%M:%S')} build of {len(order)} modules, jobs={a.jobs}\n=== {ver}\n"
        f"=== LEAN_PATH={env['LEAN_PATH']}")
    res, failed = {}, set()

    def build(m):
        kf = f"{out}/{m}.key"
        if os.path.exists(f"{out}/{m}.olean") and os.path.exists(kf) and open(kf).read() == key(m):
            return m, dict(ok=True, seconds=0, cached=True, output="", warnings=0)
        t0 = time.time()
        try:
            p = subprocess.run([a.lean] + a.leanargs.split() + ["-o", f"{out}/{m}.olean", "-i", f"{out}/{m}.ilean", f"{src}/{m}.lean"],
                               cwd=src, env=env, capture_output=True, text=True, timeout=a.timeout)
            o, rc = (p.stdout + p.stderr).strip(), p.returncode
            open(f"{out}/{m}.out", "w", encoding="utf-8").write(o)
        except subprocess.TimeoutExpired:
            o, rc = f"TIMEOUT after {a.timeout}s", -1
        ok = rc == 0
        if ok:
            open(kf, "w").write(key(m))
        else:
            for ext in ("olean", "ilean", "key"):
                if os.path.exists(f"{out}/{m}.{ext}"):
                    os.remove(f"{out}/{m}.{ext}")
        return m, dict(ok=ok, rc=rc, seconds=round(time.time() - t0, 1), cached=False, output=o[-6000:],
                       errors=len(re.findall(r": error", o)), warnings=o.count("warning:"),
                       declares_sorry="declaration uses 'sorry'" in o)
    pending, running = list(order), {}
    with ThreadPoolExecutor(a.jobs) as ex:
        while pending or running:
            for m in list(pending):
                if any(i in failed for i in loc[m]):
                    res[m] = dict(ok=False, seconds=0, output="not built: an import failed", blocked=True)
                    failed.add(m)
                    pending.remove(m)
                    say(f"BLOCKED {m}")
                elif all(i in res for i in loc[m]) and len(running) < a.jobs:
                    running[ex.submit(build, m)] = m
                    pending.remove(m)
            if not running:
                continue
            done, _ = wait(list(running), return_when=FIRST_COMPLETED)
            for f in done:
                m, r = f.result()
                running.pop(f)
                res[m] = r
                if not r["ok"]:
                    failed.add(m)
                say(f"{'ok  ' if r['ok'] else 'FAIL'} {m} {r['seconds']}s{' (cached)' if r.get('cached') else ''} "
                    f"warnings={r.get('warnings', 0)}" + ("" if r["ok"] else "\n" + r["output"]))
    built = [m for m in order if res[m]["ok"]]
    rep = dict(lean=ver, order=order, files=res, all_built=len(built) == len(order), failed=sorted(failed),
               seconds=round(sum(r["seconds"] for r in res.values())),
               maxrss_children_mb=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss // 1024)
    say(f"=== built {len(built)}/{len(order)}; failed: {sorted(failed)}; cpu-seconds {rep['seconds']}; "
        f"max child RSS {rep['maxrss_children_mb']} MB")
    json.dump(rep, open(f"{out}/build_report.json", "w"), indent=1)
    if os.path.exists(f"{src}/Main.lean") and not a.only:
        p = subprocess.run([a.lean, f"{src}/Main.lean"], cwd=src, env=env, capture_output=True, text=True,
                           timeout=a.timeout)
        open(f"{out}/axioms.log", "w", encoding="utf-8").write(
            f"-- {ver}\n-- lean Main.lean ; exit code {p.returncode}\n" + p.stdout + p.stderr)
        rep["main_rc"] = p.returncode
        say(f"=== Main.lean exit {p.returncode}, output in axioms.log")
    if built and not a.no_audit and not a.only:
        open(f"{out}/_Audit.lean", "w", encoding="utf-8").write(AUDIT.format(
            imports="\n".join(f"import {m}" for m in built), mods=", ".join(f"`{m}" for m in built)))
        p = subprocess.run([a.lean, f"{out}/_Audit.lean"], cwd=out, env=env, capture_output=True, text=True,
                           timeout=a.timeout)
        rows = sorted(l.split("\t")[1:] for l in p.stdout.splitlines() if l.startswith("AXIOMS\t"))
        open(f"{out}/audit_all.tsv", "w", encoding="utf-8").write("".join("\t".join(r) + "\n" for r in rows))
        std = {"propext", "Classical.choice", "Quot.sound"}
        bad = [r for r in rows if set(x for x in r[2].split(",") if x) - std]
        rep["audit"] = dict(theorems=len(rows), nonstandard=len(bad), rc=p.returncode,
                            nonstandard_names=[r[1] + " :: " + r[2] for r in bad][:200], stderr=p.stderr[-2000:])
        say(f"=== audit: {len(rows)} theorems, {len(bad)} with axioms beyond propext/Classical.choice/Quot.sound "
            f"(exit {p.returncode})")
    json.dump(rep, open(f"{out}/build_report.json", "w"), indent=1)
    say("=== done")


if __name__ == "__main__":
    try:
        main()
    except Exception:
        import traceback
        traceback.print_exc()
    sys.exit(0)
