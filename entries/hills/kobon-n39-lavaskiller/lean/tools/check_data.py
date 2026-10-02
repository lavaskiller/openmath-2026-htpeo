"""Independent check that the Lean data file transcribes the solution (and the report).

    python3 check_data.py SOLUTION.json PROJECT_DIR/KobonCert/Data.lean [REPORT.json]

Parses `def sol` and `def R_i`, `def reportFaces` from Data.lean with plain regular expressions
(no code shared with gen.py) and compares:
  * sol == solution.json "lines" (same order, same integers);
  * reportFaces is literally R_0 ++ (R_1 ++ ... ) over all i, every triple of R_i starts with i;
  * if REPORT.json is given: the concatenation equals details.triangle_line_indices, and its
    length equals the reported metric.
"""
import json
import re
import sys

lines = json.load(open(sys.argv[1]))["lines"]
src = open(sys.argv[2], encoding="utf-8").read()
n = len(lines)

m = re.search(r"def sol : List Line := \[(.*?)\n\]", src, flags=re.S)
rows = re.findall(r"⟨([^⟩]*)⟩", m.group(1))
sol = [[int(x.strip().strip("()")) for x in r.split(",")] for r in rows]
assert sol == lines, "lines differ"

R = {}
for i, body in re.findall(r"def R_(\d+) : List \(Nat × Nat × Nat\) := \[(.*?)\]", src, flags=re.S):
    R[int(i)] = [[int(x) for x in t.split(",")] for t in re.findall(r"\(([^()]*)\)", body)]
assert sorted(R) == list(range(n)), "R_i missing"
assert all(t[0] == i for i in R for t in R[i]), "triple in wrong row"
m = re.search(r"def reportFaces : List \(Nat × Nat × Nat\) :=\s*(.*?)\n", src)
names = re.findall(r"R_(\d+)", m.group(1))
assert [int(x) for x in names] == list(range(n)), "reportFaces is not R_0 ++ ... ++ R_{n-1}"
assert re.fullmatch(r"[R_0-9+ ()\[\]]*", m.group(1).strip())
faces = [t for i in range(n) for t in R[i]]
msg = f"OK: n = {n}, lines of {sys.argv[1]} match; {len(faces)} claimed triangles"
if len(sys.argv) > 3:
    rep = json.load(open(sys.argv[3]))
    assert rep["details"]["index_base"] == 0
    assert rep["details"]["triangle_line_indices"] == faces, "triangle list differs from report"
    assert rep["metrics"][0]["name"] == "triangles" and rep["metrics"][0]["value"] == len(faces)
    assert rep["config"][0]["name"] == "n" and rep["config"][0]["value"] == n
    msg += f" = triangle_line_indices of {sys.argv[3]} (metric {len(faces)}, n = {n})"
print(msg)
