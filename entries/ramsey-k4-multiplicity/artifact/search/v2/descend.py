"""Full-neighbourhood check: greedy best-flip descent over ALL pairs (not only soft ones) with the tabu routine.
    python descend.py IN.json OUT.json [max_steps]"""
import sys
import time

import numpy as np

import core

w, A = core.load(sys.argv[1])
steps = int(sys.argv[3]) if len(sys.argv) > 3 else 2000
x = w / w.mean()
Q4 = float(x.sum()) ** 4
t0 = time.time()
st = core.State(x, A)
E0 = core.energy(x, A)
print(f"start {E0 / Q4 * 1e12:.1f} init {time.time() - t0:.0f}s", flush=True)
cur = best = E0
done_total = 0
while done_total < steps:
    done, cur2, best2, nb = core.tabu_run(st, cur, best, 1, 60.0, 1, 1, 1, 0.0)
    if done == 0 or cur2 >= cur:
        # undo is not needed: bestA holds the best state
        break
    cur, best = cur2, best2
    done_total += done
D = (st.bestA != A)
print(f"improving flips taken: {done_total}, ppt {best / Q4 * 1e12:.1f} (gain {(E0 - best) / Q4 * 1e12:.1f})", flush=True)
fl = np.argwhere(np.triu(D))
print("flipped pairs:", fl[:40].tolist())
chk = core.energy(x, st.bestA)
print(f"recomputed {chk / Q4 * 1e12:.1f}")
core.save(sys.argv[2], w, st.bestA)
