#!/usr/bin/env python3
"""Independent check that the literals in GrothCert/Defs.lean equal solution.json and that the
numbers in the statement of Groth.certificate equal the signed report.json.
usage: check_data.py solution.json GrothCert/Defs.lean report.json"""
import json, re, sys
from fractions import Fraction

sol = json.load(open(sys.argv[1], encoding="utf-8-sig"))
lean = open(sys.argv[2], encoding="utf-8").read()
rep = json.load(open(sys.argv[3], encoding="utf-8"))

def lit(name):
    m = re.search(r"def %s : [^\n]*:=\s*(\[.*\])\s*\n" % name, lean)
    return json.loads(m.group(1).replace("(", "[").replace(")", "]"))

ok = True
for name, key in (("matrix", "matrix"), ("leftV", "left_vectors"), ("rightV", "right_vectors")):
    same = lit(name) == sol[key]
    ok &= same
    print(f"{name} == solution.json[{key}]: {same}")

metrics = {m["name"]: m["value"] for m in rep["metrics"]}
det = rep["details"]
stmt = lean[lean.index("theorem certificate"):lean.index("decide +kernel", lean.index("theorem certificate"))]
num = lambda s: Fraction(*map(int, s.split("/")))
checks = {
    "signOpt matrix = %d" % det["sign_optimum"]: True,
    "vectorObj matrix leftV rightV = %d / %d" % tuple(map(int, det["vector_objective"].split("/"))): True,
    "ratio matrix leftV rightV = %d / %d" % tuple(map(int, det["lower_bound"].split("/"))): True,
    "gapPpm matrix leftV rightV = %d" % metrics["gap_ppm"]: True,
    "area matrix = %d" % metrics["matrix_area"]: True,
    "certBits leftV rightV = %d" % metrics["certificate_bits"]: True,
}
for c in checks:
    same = c in stmt
    ok &= same
    print(f"statement contains '{c}': {same}")
print("report passed/official:", rep["passed"], rep["official"], "hill:", rep["hill"])
print("ALL OK" if ok else "MISMATCH")
sys.exit(0 if ok else 1)
