"""Exact score of certificates with the hill's own evaluator code (validate + density + metrics).

    python verify.py FILE.json [...]   -> appends to ~/ramsey/ledger.tsv and writes FILE.exact
"""
import sys
import time
import traceback
from pathlib import Path

import core

for f in sys.argv[1:]:
    try:
        t0 = time.time()
        w, A = core.load(f)
        dens, beaten, ppt = core.hill_exact(w, A)
        line = (f"{time.strftime('%m-%d %H:%M')}\t{ppt}\tbeaten={int(beaten)}\tn={len(w)}\t"
                f"vs_leader={ppt - core.LEADER_PPT}\t{f}\t{dens.numerator}/{dens.denominator}\t{time.time() - t0:.0f}s")
        print(line, flush=True)
        Path(f).with_suffix(".exact").write_text(line + "\n")
        with open(Path.home() / "ramsey" / "ledger.tsv", "a") as fh:
            fh.write(line + "\n")
    except Exception:
        traceback.print_exc()
