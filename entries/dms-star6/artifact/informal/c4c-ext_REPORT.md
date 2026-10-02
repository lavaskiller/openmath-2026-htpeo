# helper-c4c-ext: removable-edge induction inside the c4c core (10-01)

Verdict: unclear, leaning positive, only for MC colourings with the matching prescribed, at radius 3 (or radius 2 plus one Kempe swap). Nothing is proved. Evidence 071a1c01e5f8f204, gm conclusion bdc5ff96e6815201.

## Setup
- Graphs: all c4c simple cubic graphs n <= 18 (counts 1,1,2,5,18,84,607,6100 for n=4..18); n = 20/24/30/40 are non-uniform random samples by edge bridging from n=18 (geng not on the server).
- Step: e = uv removable, N(u) = {v,a1,a2}, N(v) = {u,b1,b2}; G' has new edges f = a1a2, g = b1b2 and is simple c4c. R_r = edges of G at line-graph distance <= r from the 5 edges at u, v. "c' extends at radius r": a star 6-colouring of G agrees with c' outside R_r.
- Variants: plain; mc (colour 6 a perfect matching in c' and c); mcP (mc and c'(f), c'(g) != 6); mcPfix (mcP and c^-1(6) = c'^-1(6) + uv, only colours 1..5 recoloured in R_r).
- Measurements: random (3-4 SAT-sampled c'); exact CEGAR: ALL / FAIL (witness) / TO (8-20 s cap; INCONCLUSIVE, dominates at r >= 1 for n >= 14).
- Locality caveat: R_2 is nearly the whole graph for n <= 20 (fixed edges at r=2: 2.8 at n=16, 6.6 at n=20, 11/19/33 at n=24/30/40).

## Removable edges (exhaustive n <= 18)
Only K4 and Q3 have none; for n = 10..18 every c4c graph has >= n/2 removable edges.

## Results
plain: r=0 fails for essentially every pair (some c' does not extend; random 98-99.7% do). r=1: proved at n=10 (20/20), n=12 (61/72), 6/12 at n=14 in 640 s runs; REFUTED by one explicit c' at n=40. r=2, r=3: no FAIL anywhere up to n=40, random 100%, nothing decided for n >= 14 (all TO).
mc: r=1 random 92/86/79/72/66/51 % at n=12/14/16/20/24/30; r=2 FAIL 8, 7, 42, 50, 50 pairs at n=14/16/20/24/30; r=3 one FAIL at n=24.
mcP/mcPfix: r=1 fails for nearly every pair (random 93-98%); r=2: 0 FAIL at n=16/18/20/24, 1 at n=30, 2 at n=40 (4 in 1300 pairs); r=3: 0 FAIL (313 ALL, 527 TO). Random 100% at r >= 2.
Kempe (one bichromatic-component swap first; witness-based only): plain rescues all 1336 r=0 witnesses at n >= 14 and the n=40 r=1 witness; mc without P almost useless (10/157); mcP/mcPfix rescues 85-100% of r=1 witnesses and all four r=2 witnesses.

## Failure patterns
- mc: matching obstruction. All inspected r=2/r=3 witnesses have f or g in the colour-6 matching M'; then a1, a2 lose their matching edge in G and repair needs an M'-alternating cycle through f, which is not local. Without P no fixed radius can work.
- mcP at r=2: the inspected failures have e on a 4- or 5-cycle.
- plain r=0: no simple boundary explanation (c'(f) != c'(g) or rich neighbourhoods do not help).

## Proposed hypothesis
- P (local): c' MC and f, g not in c'^-1(6). Necessary; not self-reproducing at a prescribed pair.
- PMU (global, self-reproducing): for every c4c simple cubic G with n >= 10 and every perfect matching M, some star 6-colouring has colour class 6 exactly M. Existence: 0 failures over all 193,521 PMs of all c4c graphs 10 <= n <= 18 (exhaustive), 0 in 88,144 sampled PMs at n = 20/24/30/40; fails only for K3,3 (all 6 PMs) and 5 of 16 PMs at n=8.
- Induction step for PMU: removable e in M, M' = M - e gives P for free; this is mcPfix (r=2: 321 ALL, 3 FAIL, 276 TO over 600 pairs; r=3: 0 FAIL).
- Gap: perfect matchings with no removable edge: 18/235 (n=12), 29/1430 (14), 138/13,512 (16), 540/178,297 (18); need a second reduction (cases in pm_18all.jsonl).

## Not covered
Digons / multigraph neighbourhoods (the Y^{D'} instances of TD-C4C), pole boundary data, triangles.

## Next step
1. Ball-shape exact checker replacing whole-graph CEGAR: enumerate radius-(r+3) neighbourhood shapes of a removable edge (incl. short cycles through e); for each, decide whether every locally valid boundary colouring (matching prescribed) extends inside R_r, r = 2, 3, with and without one Kempe swap. Independent of n: yields a lemma or the true obstruction list.
2. Characterise the PMs with no removable edge and find a second reduction.
3. Port to the run's setting (digons near e, the pole piece at z; choose e outside the ball around the piece).

Files: c4cext3.py (generator, c4c filter, SAT, CEGAR, Kempe), pmtest.py, remstat.py, agg_c4c.py, patt.py, rec.py, job1-6.sh, c4c_*.txt, res_*.jsonl, pm_*.out/jsonl, remstat.out, patt_16_24.out.
