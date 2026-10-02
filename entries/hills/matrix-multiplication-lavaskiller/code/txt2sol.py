"""txt scheme (R support / R lines of 27 ints) -> solution.json, verified with the hill's eval.py internals."""
import sys, json, importlib.util, pathlib, tempfile, shutil
here = pathlib.Path(__file__).resolve().parent
s = importlib.util.spec_from_file_location("mev", here / "hill" / "eval.py"); m = importlib.util.module_from_spec(s); s.loader.exec_module(m)
L = open(sys.argv[1]).read().split("\n"); R = int(L[0].split()[0])
rows = [list(map(int, L[1 + t].split())) for t in range(R)]
sol = {"u": [r[0:9] for r in rows], "v": [r[9:18] for r in rows], "w": [r[18:27] for r in rows]}
out = pathlib.Path(sys.argv[2]); out.mkdir(parents=True, exist_ok=True)
(out / "solution.json").write_text(json.dumps(sol, separators=(",", ":")))
u, v, w = m._load(out)
res = m._check_brent(u, v, w)
sup = sum(x != 0 for f in (u, v, w) for row in f for x in row)
print("rank", len(u), "support", sup, "_check_brent ->", res)
