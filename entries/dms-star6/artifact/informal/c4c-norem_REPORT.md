# helper-c4c-norem: perfect matchings with no removable edge (PMU induction gap) (10-01/02)

Evidence 8a775f2914586165, gm conclusion 958e214dcfad93fc.
Verdict: PARTLY. A second reduction (delete a 4-cycle, or contract it to K2) is defined, keeps the class and the
matching, and covers every no-removable-edge pair found with n >= 16 (678 exhaustive at n = 16, 18; 445 sampled at
n = 20, 24, 28). Nothing is proved except the removability criterion (Lemma NR). Two pairs at n = 14 escape every
4-cycle reduction, so the base must include n = 14. Extension is empirical: radius 3 has 0 failures, radius 2 has
1 failure, radius 1 is false per instance.

## 1. Criterion and characterisation
Lemma NR (proved below, and checked: 0 mismatches over all edges of all c4c graphs 8 <= n <= 18 and 2460 sampled
graphs at n = 20..32). G c4c simple cubic, n >= 8. An edge e is removable iff e lies in NO cyclic 4-edge-cut
(4 edges whose removal leaves two components, each on >= 4 vertices). "e pendant to a 4-cycle" is the special case
side = C4; an edge ON a 4-cycle is not automatically non-removable (ladder rungs are removable, rails are not).
Proof. e = uv, N(u) = {v,a1,a2}, N(v) = {u,b1,b2}. G has no triangle, so G' = G - e suppressed is simple cubic.
(<=) e in a cyclic 4-cut d(S), u in S: the cut is a matching (else a 3-cut with both sides >= 3 vertices), so
a1,a2 in S, b1,b2 not in S, and d'(S-u) is a 3-cut of G' whose sides have odd size >= 3, hence contain cycles.
(=>) G' has a cut d'(X) with <= 3 edges, both sides cyclic (>= 3 vertices). If a new edge crosses, or both new edges
lie on one side, putting u, v back gives a cut of G with <= 3 edges and both sides >= 3 vertices: impossible.
So a1a2 in X, b1b2 outside, and d(X+u) is a 4-cut of G through e with both sides >= 4 vertices. QED

Hence: M has no removable edge iff every M-edge lies in a cyclic 4-edge-cut. Such pairs = perfect matchings of the
subgraph of non-removable edges. Counts reproduced: 2 / 18 / 29 / 138 / 540 at n = 10 / 12 / 14 / 16 / 18 (727 pairs,
462 graphs); n = 8: Q3 9 of 9, V8 2 of 7.
Structure found (727 pairs, n = 10..18):
- every such G has >= 2 four-cycles (min 2). No pair in a 4-cycle-free graph, although 16 c4c graphs with n <= 18
  have cyclic 4-cuts and no 4-cycle.
- each 4-cycle Q meets M in one of three patterns: inQ = 2 (two opposite Q-edges), inQ = 1 (one Q-edge + 2 pendant
  edges), inQ = 0 (all 4 pendant edges). Pairs having a Q of type 0 / 1 / 2: 623 / 488 / 448.
- 439 pairs: every M-edge is pendant to a 4-cycle (in d(Q)). 288 pairs (33 at n=16, 255 at n=18) have an M-edge whose
  smallest cut side is 8 (never 6); 232 of 5,964 M-edges at n = 16, 18 touch no 4-cycle at all. So "M is a rung/rail
  matching of a ladder" is NOT the general picture; prisms / Moebius ladders with rail matchings are one family.
- all vertices within distance 1 of a 4-cycle: 624 of 727.
Conjecture NR-Q: if every edge of a perfect matching M lies in a cyclic 4-edge-cut, then G has a 4-cycle (>= 2).
Tests at n = 20, 24: c4c_20s / c4c_24s (300 / 200 graphs): 5 / 1 pairs, all with >= 3 four-cycles; 500 targeted
4-cycle-free graphs WITH cyclic 4-cuts (g5_20, g5_24): 0 pairs; glued samples any_20 / any_24 / nr_24 / nr_28 / nr_32:
46 / 7 / 315 / 164 / 76 pairs, all with 4-cycles. 0 counterexamples.

## 2. Second reductions (G' simple c4c cubic, M' a perfect matching of G')
(a) remove a removable e = uv not in M (ua1, vb1 in M). NO natural M': M - ua1 - vb1 leaves a1, b1 exposed (the new
    edge a1a2 cannot be used: a2 is still matched). M' needs an alternating a1-b1 path P; local only if a1b1 is an
    edge (plen 1: e on a 4-cycle with both side edges in M). Measured with shortest P (length <= 7 always existed).
(b) delete a 4-cycle Q = q0q1q2q3 (outer neighbours x_i), add two edges pairing the x_i (3 pairings); the new edge
    x_i x_j is in M' iff q_i x_i and q_j x_j are both in M (exactly one: undefined). Always some defined pairing.
(c) K2 gadget on a cyclic 4-cut: replace a side T by an edge pq; pq in M' if no cut edge is in M; 2 M-cut edges must be
    split between p and q; 4: undefined. T = C4 is "contract Q to K2" (n - 2).
Measurement: class 6 fixed to M' and M; R_r = edges at line-graph distance <= r from the changed edges; exact CEGAR:
ALL (every colouring of G' with class 6 = M' extends, agreeing outside R_r) / FAIL (witness) / TO.

Coverage, pairs with a usable instance and SOME instance ALL at r = 0 / 1 / 2 / 3:
| set | n <= 18 exhaustive (727; no TO at all) | n = 20, 24 (330) | n = 28 (115, partial) |
| a (path) | 727: 109 / 727 / 727 / 727 | 330: 45 / 322 / 330 / 330 | 115: 18 / 93 / 110 / 115 |
| b | 707: 551 / 707 / 707 / 707 | 328: 259 / 328 / 328 / 328 | 115: 97 / 113 / 114 / 115 |
| c, side C4 | (n' >= 10) 660: 226 / 633 / 660 / 660 | 326: 90 / 310 / 326 / 326 | 114: 40 / 103 / 112 / 114 |
| b or c-C4 | (n' >= 10) 721: 560 / 721 / 721 / 721 | 330: 259 / 330 / 330 / 330 | 115: 97 / 115 / 115 / 115 |
Not covered by b or c-C4 with n' >= 10: 6 pairs = 2 (n=10) + 2 (n=12) + 2 at n = 14 (M??CBBOQd_CoF?BO? and
M??CE@oQdGDOF?DO?, pair 0 each: two 4-cycles, all 8 pendant edges in M, every pairing of (b) breaks c4c, (c) undefined
with 4 M-cut edges; only (a) with a path of length 3 works). At n = 16, 18: all 678 pairs covered.
Per instance (all usable instances), ALL / FAIL / TO:
- b, n <= 18 (3507 instances): r=1 3430 / 77 / 0 (all 77 FAIL are inQ = 2); r=2 3507 / 0 / 0.
- b, n = 20, 24 (2167): r=1 1940 / 183 / 44; r=2 2158 / 1 / 8; r=3 2167 / 0 / 0.
- b, n = 28 (867): r=1 685 / 95 / 87; r=2 769 / 0 / 98; r=3 865 / 0 / 2.
- c side C4, n = 20, 24 (1627): r=1 1277 / 303 / 47; r=2 1618 / 0 / 9; r=3 1627 / 0 / 0.
- a plen 1, n = 20, 24 (796): r=2 732 / 9 / 55; r=3 796 / 0 / 0.  n = 28: r=2 2 FAIL, r=3 0 FAIL.
- random colourings of G' extend at r >= 2 in 100% of cases except a few a / b / c instances at r = 1.
Locality caveat: mean number of fixed edges at r = 0/1/2/3 is 18/11/3/0.1 at n <= 18 (r >= 2 is nearly vacuous there),
27/20/11/4 at n = 20-24, 34/27/18/9 at n = 28. Only the n >= 20 rows test locality; r = 3 at n = 28 still fixes only ~9.

## 3. Base cases
K4: 3/3 matchings good. K3,3: 0/6 (star 6-colourable, but no colouring with a perfect-matching class). Q3: 9/9.
V8 (Moebius ladder, Wagner): 2/7; good = the two rim matchings, bad = the 5 matchings containing a chord (the 4 chords
are exactly the removable edges, V8 - chord = K3,3). n = 10, 12, 14 (5 + 18 + 84 graphs, 47 + 235 + 1430 matchings):
all good (c4c-ext evidence 071a1c01e5f8f204); no c4c graph with 10 <= n <= 18 fails PMU.
Reductions landing below 10: (b) from n = 10 gives K3,3 (unusable), from n = 12 gives n' = 8; (c) with a large side gives
K3,3 (587 instances, unusable). Induction start: verify n = 10, 12, 14 by computer (done), step for n >= 16; then every
reduction used lands on n' >= 12.

## 4. What a worker would have to prove
(NR-1) Lemma NR - proved above.
(NR-2) Existence: for every c4c simple cubic G, n >= 16, and perfect matching M all of whose edges lie in cyclic
  4-edge-cuts, G has a 4-cycle Q such that deleting Q with an M-compatible pairing, or contracting Q to K2 with an
  M-compatible pairing, gives a simple c4c graph. Evidence: 678/678 exhaustive at n = 16, 18; 445/445 sampled at
  n = 20, 24, 28. False at n = 14 (2 pairs). Contains Conjecture NR-Q. This is the real gap: no proof idea yet.
(NR-3) Extension: for such a reduction, every star 6-colouring of G' with class 6 = M' extends to one of G with class
  6 = M after recolouring within radius 3 of Q. Evidence: 0 FAIL in all decided instances; radius 2: 1 FAIL
  (b, inQ = 0, n = 24); radius 1 false. Finite ball check in principle (same ball-shape checker as for the
  removable-edge step).
Then PMU for n >= 16 follows from: removable edge in M (mcPfix step of c4c-ext) or (NR-2) + (NR-3), base n <= 14.

## Limits
Samples at n >= 20 are non-uniform (edge bridging, gluing along 4-cuts, biased to 4-cycles); n = 28 partial (115 of
164 pairs when written), n = 32 (76 pairs) not measured; (a) capped at 8 edges and (c) at 24 instances per pair
(3 and 6 at n = 28); TO = undecided; simple graphs only (no digons, no pole piece).

Files (drafts/c4c-norem): char.py (criterion, cuts, census), red.py (reductions + CEGAR), sum.py, gen5.py, job1-5.sh,
char_*.jsonl/out, red_le18.jsonl, red_big.jsonl, red_big2.jsonl, sum_le18.txt, sum_big.txt, sum_big2.txt.
