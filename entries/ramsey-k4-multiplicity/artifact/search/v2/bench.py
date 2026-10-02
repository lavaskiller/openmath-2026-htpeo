import sys
import time

import numpy as np

import core

w, A = core.load(sys.argv[1])
x = w / w.mean()
t = time.time()
st = core.State(x, A)
E = core.energy(x, A)
print("init", time.time() - t)
mad = core.mean_abs_delta(st)
for T in (1e300, 0.02 * mad, 0.0):
    r = core.sa_run(st, E, E, T, 3.0, 1, 0.5)
    print("T", T, "acc/s", r[0] / 3, "props/s", r[4] / 3)
    E = r[1]
print("drift", st.diff(core.State(x, st.A)), "E err", core.energy(x, st.A) - E)
t = time.time()
d = core.tabu_run(st, E, E, 10 ** 9, 3.0, 20, 60, 1, 0.5)
print("tabu steps/s", d[0] / 3)
