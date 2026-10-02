"""Simulated annealing over colour flips with O(1) proposals (all flip deltas are kept in tables),
in reheating cycles, optionally re-optimising the weights between cycles.

    python sa.py IN OUT --minutes 112 --phase 25 --thi 0.03 --tlo 0.003 --seed 1 [--wopt 12] [--fresh]

Temperatures are fractions of the mean |delta| at the start of each cycle, cooled geometrically.
Each cycle starts from the best colouring so far (--fresh: from the cycle's own end state).
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
    p.add_argument("--minutes", type=float, default=112)
    p.add_argument("--phase", type=float, default=25)
    p.add_argument("--chunk", type=float, default=5)
    p.add_argument("--seed", type=int, default=1)
    p.add_argument("--thi", type=float, default=0.03)
    p.add_argument("--tlo", type=float, default=0.003)
    p.add_argument("--wopt", type=int, default=0)
    p.add_argument("--wfirst", action="store_true")
    p.add_argument("--eta", type=float, default=2.0)
    p.add_argument("--fresh", action="store_true")
    p.add_argument("--wend", action="store_true",
                   help="basin hopping: re-optimise weights on the END state of each cycle, keep it if it beats the best")
    p.add_argument("--soft", default=None, help="npy int32 (m,2) list of pairs to propose preferentially")
    p.add_argument("--pmix", type=float, default=0.9)
    p.add_argument("--compound", default=None, help="p_single,p_rotation,p_4cycle: compound moves on the soft pairs")
    a = p.parse_args()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)

    def log(msg):
        print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)

    w, A = core.load(a.inp)
    pl = None
    if a.soft:
        pl = np.ascontiguousarray(np.load(a.soft), dtype=np.int32)
        assert pl.max() < len(w)
        (out / "soft.txt").write_text(str(Path(a.soft).resolve()))
    soft = pm = None
    if a.compound:
        pm = tuple(float(t) for t in a.compound.split(","))
        soft = core.Soft(pl, len(w))
    stats = np.zeros(8, dtype=np.int64)
    t_end = time.time() + a.minutes * 60
    gbest = math.inf
    bp = out / "best.ppt"
    if bp.exists():
        gbest = float(bp.read_text())
        w, A = core.load(out / "best.json")
        log(f"resuming from {out}/best.json ({gbest:.1f})")

    def record(wi, Ab, ppt, tag):
        nonlocal gbest
        if ppt < gbest - 1e-3:
            gbest = ppt
            core.save(out / "best.json", wi, Ab)
            bp.write_text(f"{ppt:.3f}")
            log(f"NEW BEST {ppt:.1f} ({tag}) vs_ref={ppt - core.REF_PPT:.0f} vs_leader={ppt - core.LEADER_PPT:.0f}")
            return True
        return False

    x = w / w.mean()
    if a.wfirst and a.wopt:
        x, _ = core.optimise_weights(x, A, a.wopt, a.eta, log)
        w = core.to_int(x)
        x = w / w.mean()
    gA, gw = A.copy(), w.copy()
    phase = 0
    while time.time() < t_end - 90:
        phase += 1
        t0 = time.time()
        st = core.State(x, A)
        E0 = core.energy(x, A)
        Q4 = float(x.sum()) ** 4
        uniform = bool(np.all(w == w[0]))
        tol = max(0.5 if uniform else 0.0, 1e-13 * E0)
        cur = best = E0
        mad = core.mean_abs_delta(st, a.seed + phase)
        log(f"phase {phase}: start ppt={E0 / Q4 * 1e12:.1f} init={time.time() - t0:.0f}s uniform={uniform} "
            f"mean|d|={mad / Q4 * 1e12:.1f}ppt")
        if record(w, A, E0 / Q4 * 1e12, "phase start"):
            gA, gw = A.copy(), w.copy()
        p0 = time.time()
        p_end = min(t_end - 45, p0 + a.phase * 60)
        last = p0
        tacc = tpr = k = 0
        while time.time() < p_end:
            f = (time.time() - p0) / (p_end - p0)
            T = mad * a.thi * (a.tlo / a.thi) ** f
            k += 1
            dt = min(a.chunk, max(0.2, p_end - time.time()))
            if soft is not None and k % 4:
                acc, cur, best, nb, stats = core.sa2_run(st, cur, best, T, dt, a.seed * 1000003 + phase * 7919 + k,
                                                         tol, soft, pm, stats)
                pr = 0
            else:
                acc, cur, best, nb, pr = core.sa_run(st, cur, best, T, dt,
                                                     a.seed * 1000003 + phase * 7919 + k, tol, pl, a.pmix)
            tacc += acc
            tpr += pr
            if time.time() - last > 60:
                last = time.time()
                log(f"  f={f:.2f} T={T / mad:.4f} acc={tacc} props={tpr:.2e} cur={cur / Q4 * 1e12:.1f} "
                    f"best={best / Q4 * 1e12:.1f}"
                    + (f" c[prop s/r/4, acc s/r/4, undo, tot]={stats.tolist()}" if soft is not None else ""))
                if best / Q4 * 1e12 < gbest - 1e-3:
                    chk = core.energy(x, st.bestA)
                    if abs(chk - best) > 1e-9 * chk:
                        log(f"  WARNING drift: tracked {best} recomputed {chk}")
                    elif record(w, st.bestA, chk / Q4 * 1e12, "sa"):
                        gA, gw = st.bestA.copy(), w.copy()
        # quench at T=0 from the end state
        acc, cur, best, nb, pr = core.sa_run(st, cur, best, 0.0, 20.0, a.seed + 17 * phase, tol, pl, 0.5)
        chk = core.energy(x, st.bestA)
        log(f"  end of cycle: best={best / Q4 * 1e12:.1f} recomputed={chk / Q4 * 1e12:.1f}")
        if abs(chk - best) > 1e-9 * chk:
            log(f"  WARNING drift: tracked {best} recomputed {chk}")
        if record(w, st.bestA, chk / Q4 * 1e12, "sa"):
            gA, gw = st.bestA.copy(), w.copy()
        if time.time() > t_end - 90:
            break
        if a.wend and a.wopt and time.time() < t_end - 400:
            Aend = st.A.copy()
            x2, _ = core.optimise_weights(x, Aend, a.wopt, a.eta, log)
            w2 = core.to_int(x2)
            x2 = w2 / w2.mean()
            P2 = core.ppt_of(core.energy(x2, Aend), x2)
            log(f"  end state {cur / Q4 * 1e12:.1f} -> weights refit {P2:.1f} (best {gbest:.1f})")
            if record(w2, Aend, P2, "end-state refit"):
                gA, gw = Aend.copy(), w2.copy()
            A = gA.copy()
            w = gw.copy()
            x = w / w.mean()
            continue
        A = st.bestA.copy() if a.fresh else gA.copy()
        if not a.fresh:
            w = gw.copy()
            x = w / w.mean()
        if a.wopt and time.time() < t_end - 400:
            x2, _ = core.optimise_weights(x, A, a.wopt, a.eta, log)
            w2 = core.to_int(x2)
            x2 = w2 / w2.mean()
            P2 = core.ppt_of(core.energy(x2, A), x2)
            P1 = core.ppt_of(core.energy(x, A), x)
            log(f"  weights: {P1:.1f} -> rounded {P2:.1f}")
            if P2 < P1:
                w, x = w2, x2
                if record(w, A, P2, "weights"):
                    gA, gw = A.copy(), w.copy()
    log(f"done gbest={gbest:.1f}")


if __name__ == "__main__":
    try:
        main()
    except Exception:
        traceback.print_exc()
