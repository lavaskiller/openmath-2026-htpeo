"""Every few minutes: hill-exact check of the best float-scored certificate under ~/ramsey/out, kept as
~/ramsey/cand/best_<exact ppt>.json; ledger in ~/ramsey/ledger.tsv.   python verify_loop.py MINUTES"""
import shutil
import sys
import time
import traceback
from pathlib import Path

import core

R = Path.home() / "ramsey"
(R / "cand").mkdir(exist_ok=True)
t_end = time.time() + float(sys.argv[1]) * 60
last = float("inf")
lf = R / "cand" / "last_verified.txt"
if lf.exists():
    last = float(lf.read_text())
while time.time() < t_end:
    try:
        best = None
        for bp in (R / "out").glob("*/best.ppt"):
            v = float(bp.read_text())
            if best is None or v < best[0]:
                best = (v, bp.parent)
        if best and best[0] < last - 2000 and time.time() < t_end - 900:
            tmp = R / "cand" / "tmp.json"
            shutil.copy(best[1] / "best.json", tmp)
            t0 = time.time()
            w, A = core.load(tmp)
            dens, beaten, ppt = core.hill_exact(w, A)
            dst = R / "cand" / f"best_{ppt}.json"
            tmp.replace(dst)
            line = (f"{time.strftime('%m-%d %H:%M')}\t{ppt}\tbeaten={int(beaten)}\tn={len(w)}\tfrom={best[1].name}\t"
                    f"float={best[0]:.1f}\t{dst}\t{dens.numerator}/{dens.denominator}\t{time.time() - t0:.0f}s")
            print(line, flush=True)
            with open(R / "ledger.tsv", "a") as fh:
                fh.write(line + "\n")
            last = best[0]
            lf.write_text(str(last))
    except Exception:
        traceback.print_exc()
    time.sleep(120)
