"""Tabu over colour flips, optionally alternating with weight optimisation.

    python run.py IN OUT --minutes 110 --phase 20 --seed 1 --tlo 20 --thi 60 [--wopt 25] [--eta 2]

OUT/best.json is the best certificate so far (float score in OUT/best.ppt); always exits 0.
"""
from __future__ import annotations

import argparse
import math
import time
import traceback
from pathlib import Path

import numpy as np

import core


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("inp")
    p.add_argument("out")
    p.add_argument("--minutes", type=float, default=110)
    p.add_argument("--phase", type=float, default=20)
    p.add_argument("--chunk", type=float, default=120, help="seconds per C call")
    p.add_argument("--seed", type=int, default=1)
    p.add_argument("--tlo", type=int, default=20)
    p.add_argument("--thi", type=int, default=60)
    p.add_argument("--wopt", type=int, default=0, help="EG iterations after each phase (0 = keep weights)")
    p.add_argument("--wfirst", action="store_true", help="optimise weights before the first phase")
    p.add_argument("--eta", type=float, default=2.0)
    p.add_argument("--restart", action="store_true", help="each phase restarts from the best colouring")
    a = p.parse_args()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)

    def log(msg):
        print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)

    w, A = core.load(a.inp)
    t_end = time.time() + a.minutes * 60
    gbest = math.inf
    bp = out / "best.ppt"
    if bp.exists():
        gbest = float(bp.read_text())

    def record(wi, Ab, ppt, tag):
        nonlocal gbest
        if ppt < gbest - 1e-3:
            gbest = ppt
            core.save(out / "best.json", wi, Ab)
            bp.write_text(f"{ppt:.3f}")
            log(f"NEW BEST {ppt:.1f} ({tag}) vs_ref={ppt - core.REF_PPT:.0f} vs_leader={ppt - core.LEADER_PPT:.0f}")

    x = w / w.mean()
    if a.wfirst and a.wopt:
        x, _ = core.optimise_weights(x, A, a.wopt, a.eta, log)
        w = core.to_int(x)
        x = w / w.mean()
    phase = 0
    while time.time() < t_end - 60:
        phase += 1
        t0 = time.time()
        st = core.State(x, A)
        E0 = core.energy(x, A)
        Q4 = float(x.sum()) ** 4
        tol = max(0.5 if np.all(w == w[0]) else 0.0, 1e-13 * E0)
        cur = best = E0
        log(f"phase {phase}: start ppt={E0 / Q4 * 1e12:.1f} init={time.time() - t0:.0f}s uniform={bool(np.all(w == w[0]))}")
        record(w, A, E0 / Q4 * 1e12, "phase start")
        p_end = min(t_end - 30, time.time() + a.phase * 60)
        while time.time() < p_end:
            done, cur, best, nb = core.tabu_run(st, cur, best, 10 ** 9, min(a.chunk, max(1.0, p_end - time.time())),
                                                a.tlo, a.thi, a.seed * 1000003 + st.it, tol)
            log(f"  it={st.it} cur={cur / Q4 * 1e12:.1f} best={best / Q4 * 1e12:.1f} newbest={nb}")
            if nb:
                core.save(out / "work.json", w, st.bestA)
                record(w, st.bestA, best / Q4 * 1e12, "tabu")
            if done == 0:
                break
        chk = core.energy(x, st.bestA)
        if abs(chk - best) > 1e-9 * chk:
            log(f"  WARNING drift: tracked {best} recomputed {chk}")
        if time.time() > t_end - 60:
            break
        if a.wopt:
            Aw = st.bestA.copy()
            x2, _ = core.optimise_weights(x, Aw, a.wopt, a.eta, log)
            w2 = core.to_int(x2)
            x2 = w2 / w2.mean()
            P2 = core.ppt_of(core.energy(x2, Aw), x2)
            log(f"  weights: rounded ppt={P2:.1f}")
            if P2 < best / Q4 * 1e12:
                w, x = w2, x2
                record(w, Aw, P2, "weights")
            A = Aw
        else:
            A = st.bestA.copy() if a.restart else st.A.copy()
    log(f"done gbest={gbest:.1f}")


if __name__ == "__main__":
    try:
        main()
    except Exception:
        traceback.print_exc()
