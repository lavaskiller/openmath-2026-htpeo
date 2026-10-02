# P23 check: adversarial review of TD-RED b4e4863f5db24a61 (helper, 10-01)

Verdict: TD-RED is correct; no gap, no counterexample. P23-TD-TRI closes once (TD-CORE) is proved.

- (a) closure of the class T: cut-size transfers (0.4)/(0.5), steps (1.1)-(1.3) correct; the one nontrivial case (S meets Y'' in exactly one vertex) is impossible because e'_r would be a bridge of X. Vertex counts exact.
- Induction: 3|V1| = 2|E(X[V1])| + 3 so |V1| odd; reducible (|V1|>=5) gives |V(X^T)| <= |V(X)|-2, |V(X_2)| <= |V(X)|-4; well-founded inside T.
- TD-PROP cd55c0f3 (e) hypotheses match exactly (D1, D2P, D3P-SDR word for word); TD-PROP proof re-checked (BRICK-TD d1/d2 incl. w'_m in P, Cases A/B/C1/C2, SDR, BRICK3(a)+MC-3M gluing, cross-cut 4-path/4-cycle by hand).
- (c) TD-TRI sentence character-identical to contract P23 (cmp.py); H^D in T via H-ASM (a) re-derived.
- Computation: all 2-cut-reduced n=10..16, 6,980 piece instances, 14,926 far sides: 0 violations (structure, counts, |V1| odd); parity checked on first 400 per n. Script tdred_struct.py.

Minor:
1. TD-PROP cites 53cbf7a3 (audit disputed, part (b) only); it uses only part (a), identical in verified repair 79b32490. Re-point the citation to 79b32490.
2. TD-RED is a reduction only; (TD-CORE) is open and contains every instance whose far sides fail a responding property. The intuition remark "|V1|>=9 far sides reducible" is unproved but unused.

Evidence da13a683a7fc045a; gm (verification) 55de1e6398f9709d.
