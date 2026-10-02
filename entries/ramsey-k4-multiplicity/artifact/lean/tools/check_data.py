"""Independent check that the Lean data file transcribes the solution file.

    python3 check_data.py SOLUTION.json PROJECT_DIR/RamseyCert/Data/Base.lean

Parses `def wl`, `def rR_i`, `def rowsR` from Base.lean (plain regular expressions, no code shared
with gen.py) and compares with the JSON: wl == weights, and bit j of rR_i == red_rows[i][j].
The Lean template `sol` (Main.lean) is defined from exactly `wl` and `rowsR`.
"""
import json
import re
import sys

sol = json.load(open(sys.argv[1]))
src = open(sys.argv[2], encoding="utf-8").read()
w = sol["weights"]
rows = sol["red_rows"]
n = len(w)

m = re.search(r"def wl : List ℕ := \[(.*?)\]", src, flags=re.S)
wl = [int(x) for x in m.group(1).replace("\n", " ").split(",")]
assert wl == w, "weights differ"

masks = {int(i): int(h, 16) for i, h in re.findall(r"def rR_(\d+) : ℕ := (0x[0-9a-f]+)", src)}
assert sorted(masks) == list(range(n)), "row constants missing"
for i in range(n):
    assert masks[i] < 2 ** n
    for j in range(n):
        assert ((masks[i] >> j) & 1) == int(rows[i][j]), (i, j)

m = re.search(r"def rowsR : List ℕ := \[(.*?)\]", src, flags=re.S)
names = [x.strip() for x in m.group(1).replace("\n", " ").split(",")]
assert names == [f"rR_{i}" for i in range(n)], "rowsR is not [rR_0, ..., rR_{n-1}]"
print(f"OK: n = {n}, weights and red_rows of {sys.argv[1]} match {sys.argv[2]}")
