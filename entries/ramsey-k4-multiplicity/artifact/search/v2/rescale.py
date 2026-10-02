"""Variants of a certificate with smaller integer weights (faster exact evaluation: fewer bit planes).
    python rescale.py IN.json OUT_DIR   -> OUT_DIR/scale<max>_<exact ppt>.json, exact score via the hill code"""
import sys
import time
from pathlib import Path

import numpy as np

import core

w, A = core.load(sys.argv[1])
out = Path(sys.argv[2])
out.mkdir(parents=True, exist_ok=True)
x = w / w.max()
for scale in (65535, 16383, 4095, 1023, 255):
    wi = np.maximum(1, np.rint(x * scale)).astype(np.int64)
    t0 = time.time()
    dens, beaten, ppt = core.hill_exact(wi, A)
    f = out / f"scale{scale}_{ppt}.json"
    core.save(f, wi, A)
    print(f"scale {scale}: exact ppt {ppt} beaten={int(beaten)} eval {time.time() - t0:.0f}s -> {f}", flush=True)
