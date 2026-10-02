"""Continuation round: pick the best lineages under ~/ramsey/out (one per soft-pair file), continue each with
compound SA + adaptive weights in a fresh output dir. Always exits 0.

    python cont.py TAG IDX MINUTES     (IDX 0: verify loop + ranks 1,1',3,5 ; IDX 1: ranks 2,2',4 + fresh seed splits)
"""
import os
import shutil
import subprocess
import sys
import time
import traceback
from pathlib import Path

R = Path.home() / "ramsey"
PY = str(Path.home() / ".venvs/mh/bin/python")
V2 = R / "v2"


def lineages():
    best = {}
    for bp in (R / "out").glob("*/best.ppt"):
        d = bp.parent
        if not (d / "soft.txt").exists():
            continue
        try:
            v = float(bp.read_text())
        except ValueError:
            continue
        soft = (d / "soft.txt").read_text().strip()
        if soft not in best or v < best[soft][0]:
            best[soft] = (v, d, soft)
    return sorted(best.values())


def main():
    tag, idx, minutes = sys.argv[1], int(sys.argv[2]), float(sys.argv[3])
    env = dict(os.environ, OMP_NUM_THREADS="1", OPENBLAS_NUM_THREADS="1", MKL_NUM_THREADS="1")
    L = lineages()
    procs = []
    secs = int(minutes * 60 + 300)

    def sa(name, src, soft, *args):
        inp = R / "in" / f"{name}.json"
        shutil.copy(src, inp)
        log = open(R / "logs" / f"{name}.log", "w")
        cmd = ["timeout", str(secs), PY, "sa.py", str(inp), str(R / "out" / name), "--minutes", str(minutes),
               "--soft", soft, "--compound", "0.15,0.35,0.5,0.1", *args]
        procs.append(subprocess.Popen(cmd, cwd=V2, env=env, stdout=log, stderr=subprocess.STDOUT))

    W = ["--wopt", "60", "--eta", "8", "--wfirst"]
    seed = int(time.time()) % 100000
    if idx == 0:
        log = open(R / "logs" / "V.log", "a")
        procs.append(subprocess.Popen(["timeout", str(secs), PY, "verify_loop.py", str(minutes + 2)], cwd=V2, env=env,
                                      stdout=log, stderr=subprocess.STDOUT))
        picks = [(0, "a", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (0, "b", ["--phase", "30", "--thi", "0.008", "--tlo", "0.0004"]),
                 (1, "c", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (2, "d", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"])]
    else:
        picks = [(0, "e", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (0, "f", ["--phase", "40", "--thi", "0.006", "--tlo", "0.0003"]),
                 (1, "g", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (2, "h", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (3, "i", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"])]
    if tag == "N4" and idx == 1:
        # design experiment: which two members to split in the 6-part base blocks (closest twins or not)
        picks = [(0, "e", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (1, "g", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"]),
                 (2, "h", ["--phase", "30", "--thi", "0.004", "--tlo", "0.0003"])]
        for mode in ("T1", "T2"):
            try:
                name = f"X{mode}"
                subprocess.run([PY, "split4.py", str(R / "out" / "E5" / "best.json"), "soft.npy", mode,
                                str(R / "in" / f"{name}.json"), f"{name}_soft.npy", "11"], cwd=V2, env=env)
                log = open(R / "logs" / f"{name}.log", "w")
                cmd = ["timeout", str(secs), PY, "sa.py", str(R / "in" / f"{name}.json"), str(R / "out" / name),
                       "--minutes", str(minutes), "--soft", str(V2 / f"{name}_soft.npy"), "--compound", "0.15,0.35,0.5,0.1",
                       "--seed", "111", "--phase", "22", "--thi", "0.002", "--tlo", "0.0002", "--wopt", "50", "--eta", "8"]
                procs.append(subprocess.Popen(cmd, cwd=V2, env=env, stdout=log, stderr=subprocess.STDOUT))
            except Exception:
                traceback.print_exc()
    for k, (rank, suffix, targs) in enumerate(picks):
        if not L:
            break
        v, d, soft = L[min(rank, len(L) - 1)]
        sa(f"{tag}{suffix}", d / "best.json", soft, "--seed", str(seed + k), *targs, *W)
    if False and idx == 1 and L:
        # experiment: wider soft set (orbits with seed delta < 25k) on the best lineage
        try:
            v, d, soft = L[0]
            stem = Path(soft).stem.replace("_soft", "").replace("_wide", "")
            wide = V2 / f"{stem}_wide_soft.npy"
            if not wide.exists():
                subprocess.run([PY, "mk_soft.py", str(R / "in" / f"{stem}.json"), "soft2.npy", str(wide)], cwd=V2, env=env)
            if wide.exists():
                sa(f"{tag}h", d / "best.json", str(wide), "--seed", str(seed + 7), "--phase", "30", "--thi", "0.002",
                   "--tlo", "0.0002", *W)
        except Exception:
            traceback.print_exc()
        # fresh designed split of the best 768-block base, new random choice of split members
        try:
            name = f"{tag}i"
            subprocess.run([PY, "split3.py", str(R / "out" / "E5" / "best.json"), "soft.npy", "N",
                            str(R / "in" / f"{name}.json"), f"{name}_soft.npy", str(seed)], cwd=V2, env=env)
            log = open(R / "logs" / f"{name}.log", "w")
            cmd = ["timeout", str(secs), PY, "sa.py", str(R / "in" / f"{name}.json"), str(R / "out" / name),
                   "--minutes", str(minutes), "--soft", str(V2 / f"{name}_soft.npy"), "--compound", "0.15,0.35,0.5,0.1",
                   "--seed", str(seed + 9), "--phase", "30", "--thi", "0.002", "--tlo", "0.0002", "--wopt", "40", "--eta", "8"]
            procs.append(subprocess.Popen(cmd, cwd=V2, env=env, stdout=log, stderr=subprocess.STDOUT))
        except Exception:
            traceback.print_exc()
    for p in procs:
        p.wait()


if __name__ == "__main__":
    try:
        main()
    except Exception:
        traceback.print_exc()
    sys.exit(0)
