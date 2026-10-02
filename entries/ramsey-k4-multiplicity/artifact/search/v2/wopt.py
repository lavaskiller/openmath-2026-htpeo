"""Weight optimisation alone on a fixed colouring, from perturbed weights, adaptive exponentiated gradient.

    python wopt.py IN.json OUT_DIR --minutes 100 --pert 0.05 --seed 1 [--eta 2]

OUT_DIR/x.npy = float weights, OUT_DIR/best.json = rounded certificate (max weight 65535).
"""
import argparse
import math
import time
import traceback
from pathlib import Path

import numpy as np

import core


def main():
    p = argparse.ArgumentParser()
    p.add_argument("inp")
    p.add_argument("out")
    p.add_argument("--minutes", type=float, default=100)
    p.add_argument("--pert", type=float, default=0.05)
    p.add_argument("--seed", type=int, default=1)
    p.add_argument("--eta", type=float, default=2.0)
    p.add_argument("--fixed", action="store_true")
    a = p.parse_args()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)

    def log(msg):
        print(f"[{time.strftime('%H:%M:%S')}] {msg}", flush=True)

    w, A = core.load(a.inp)
    rng = np.random.default_rng(a.seed)
    x = w / w.mean()
    if (out / "x.npy").exists():
        x = np.load(out / "x.npy")
        log("resumed x.npy")
    elif a.pert:
        x = x * np.exp(a.pert * rng.standard_normal(len(x)))
    x = x / x.mean()
    t_end = time.time() + a.minutes * 60
    eta = a.eta

    def PR(x):
        t = core.rooted(x, A)
        E = float(x @ t)
        Q = float(x.sum())
        return E / Q ** 4 * 1e12, Q * t / E

    P, r = PR(x)
    log(f"start P={P:.1f}")
    it = 0
    last_save = time.time()
    while time.time() < t_end:
        it += 1
        x2 = x * np.exp(-eta * (r - 1.0))
        x2 = x2 / x2.mean()
        P2, r2 = PR(x2)
        if P2 < P or a.fixed:
            x, P, r = x2, P2, r2
            if not a.fixed:
                eta = min(eta * 1.25, 64.0)
        else:
            eta *= 0.4
        log(f"it={it} P={P:.1f} eta={eta:.3g} spread={float(r.max() - r.min()):.2e} "
            f"xmin={x.min():.3f} xmax={x.max():.3f} vs_ref={P - core.REF_PPT:.0f} vs_leader={P - core.LEADER_PPT:.0f}")
        if time.time() - last_save > 120 or time.time() > t_end:
            last_save = time.time()
            np.save(out / "x.npy", x)
            wi = core.to_int(x)
            core.save(out / "best.json", wi, A)
            (out / "best.ppt").write_text(f"{P:.3f}")
    np.save(out / "x.npy", x)
    wi = core.to_int(x)
    y = wi / wi.mean()
    Pi = core.ppt_of(core.energy(y, A), y)
    core.save(out / "best.json", wi, A)
    (out / "best.ppt").write_text(f"{Pi:.3f}")
    log(f"done float P={P:.1f} rounded P={Pi:.1f}")


if __name__ == "__main__":
    try:
        main()
    except Exception:
        traceback.print_exc()
