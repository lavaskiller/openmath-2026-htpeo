# helper-c4c-ball: n-independent ball checker for the PMU induction step (10-01/02)

Verdict: the fixed-radius step "EVERY PM-colouring c' of G' extends inside R_r" (mcPfix) is REFUTED at r = 2 and at r = 3,
already for tree-like balls, by explicit c4c graphs. It is refuted at r = 2 for all 8 shapes tested and at r = 3 for 6 of
the 8 (2 timeouts). Short cycles are not the cause. PMU itself is untouched (its induction needs only SOME c').

## 1. Local model
G simple cubic, girth >= 4, e = uv in M removable, d(x) = distance from {u,v}. R_r = edges with an endpoint at d <= r.
Core K_r(G,e): vertices with d <= r+2, edges with an endpoint at d <= r+1 (= R_{r+1}).
Model B: the core, plus fresh children at every vertex of depth r+2 up to degree 3, plus 2 fresh children at each of those
(leaves at depth r+4), plus PAD further tree levels. A = B - u - v + f + g (model of G'). phi: B -> G is the identity on the
core and follows the tree outside; it is bijective on the edges at every internal vertex.
Statement decided for a model: for every 6-colouring c* of A that is star-valid in A, has colour 6 at every internal vertex
of A, and c*(f), c*(g) != 6, there is a star-valid colouring c of B with c = c* outside R_r, c(e) = 6, and c = 6 on R_r - e
exactly where c* = 6. All M-patterns of a shape are covered at once (the adversary chooses the 6-class).

## 2. Boundary abstraction and soundness
Boundary state = colouring of the frozen model edges (depth r+1 .. r+4+PAD). It contains the 4-cut state (c_i, l_i(y)) of
every frozen edge leaving the ball: its colour, the colours at its outer end, and whether their far ends see c_i.
Lemma (soundness). If the statement holds for the model of K_r(G,e), the step holds for (G, e, M) at radius r.
(a) Pull-back: c' on G' gives c* = c' o phi on A. A 4-edge path or 4-cycle of A maps to a non-backtracking 4-walk of G',
which is a path or a 4-cycle because G' is simple of girth >= 4; so c* is star-valid, and internal vertices see 6.
(b) Frozen stays frozen: a model edge outside R_r(B) never maps into R_r(G). Core edges keep their depth. A tree edge w w1
(w at depth r+2) maps to an edge with both ends at d >= r+2, otherwise it would be a core edge; an edge w1 w2 maps to an
edge with ends at d >= r+1; an edge of R_r(G) has an end at d <= r.
(c) Push-forward: put c on R_r(G) and c' elsewhere. A 4-path or 4-cycle W of G through an edge of R_r lifts to B (its
inner vertices have depth <= r+3, so they are internal); the lift is a 4-path or 4-cycle of B and by (b) carries the same
colours, so W is not bichromatic. Properness: same argument with 2 edges.
Completeness: the abstraction over-approximates (tree colours need only be valid on PAD extra levels), so an abstract
failure may be spurious. Every failure called "true" below was realised in an actual graph.
Tree-like case T_r (the 2^(r+4) - 2 vertices of depth <= r+2 are distinct). The M-pattern is unique up to automorphism,
so T_r is ONE shape. The two sides of e interact only through "c(ua1), c(ua2), c(vb1), c(vb2) are four distinct colours
of 1..5" (each a_i, b_j is matched downwards, so every path x a_i u v b_j is coloured 6,*,6,*). Let P(c*) = set of
achievable pairs {c(ua1), c(ua2)} on one side (v a pendant end, e coloured 6). The step fails iff some P, Q have no
disjoint p in P, q in Q, iff for some S: con(S) and con(complement of N(S)), where con(S) = "some c* has P(c*) inside S"
and N = Petersen neighbourhood. Only the 34 graphs on 5 colours need a query.

## 3. Results (SAT + CEGAR over boundary states; every query terminated unless marked TO)
One-sided tree-like, r = 2 (PAD 0 and 3) and r = 3 (PAD 0; PAD 2 for the 5 decisive classes): con(S) holds for all 34
classes, including S = empty, i.e. one side alone can be blocked completely. 34 obstruction pairs up to S5.
Two-sided, PAD = 2, 8 shapes: tree; c4e, c5e, c6e (one 4-/5-/6-cycle through e); c4e2 (two 4-cycles through e);
c5u, c6u (5-/6-cycle through u, not e); c4a (4-cycle at a1, not through u).
- r = 2: FAIL for all 8 (18 .. 351 CEGAR iterations, under 4 s).
- r = 3: FAIL for tree, c4e, c5e, c6e, c6u, c4a (290 .. 5218 iterations); TO for c4e2 and c5u (45 min cap).
Not covered: shapes with two or more identifications other than c4e2; cycles deeper in the ball. No shape was proved.

## 4. True obstructions (graph6 + c' in the json files)
Construction: model unfolded one level further, random Hamilton cycle on the leaves, G and G' checked c4c exactly, c'
completed by SAT with the witness prescribed to depth r+4, extension decided exactly by c4cext3.extend.
- real2b.json: tree-like, n = 318: no extension at radius 2; extends at 3. One Kempe swap: 5 of 74 variants extend at 2.
- real3.json: tree-like, n = 574: no extension at radius 3; extends at 4. Kempe: 8 of 140 variants extend at 3.
- realf_2_*.jsonl: all 8 shapes at r = 2 (n = 258 .. 510): none extends at radius 2; all extend at radius 3 except the
  c6e graph (n = 448), which also fails at 3 and extends at 4. Kempe: 4 .. 10 of 53 .. 140 variants extend at 2.
Spurious failures: none identified. One realisation set-up failed (real2.out: unpadded witness, leaves closed directly,
no c' in 12 closures); with a padded witness and one slack level the first c4c closure worked every time.
r = 3 witnesses of the cyclic shapes were not realised (graphs of ~1000 vertices, c4c check too slow in Python).
In every realised case some single Kempe swap (bichromatic component, at most 3 edges, anywhere in G') rescues.

## 5. Mechanism
Contract M: the non-M edges properly 5-colour the 4-regular G/M, so each contracted vertex misses exactly one colour and
an edge can change colour alone only if both ends miss the same colour. Frozen boundary colours can make the interior of
the ball rigid; the changed topology at e then has no colouring inside the ball. Random c' always extend, adversarial
c' do not. r = 4 one-sided probe (S = empty): undecided (timeout after 7872 CEGAR iterations, 50 min); radius >= 4 is open.

## 6. What remains
- "For all c'" at fixed radius is dead for r = 2, 3. The induction needs "for some c'": strengthen PMU to a
  self-reproducing statement that hands over a c' that is flexible at the prescribed pair f, g (P(c') on the two sides
  containing disjoint pairs), or allow unbounded alternating-chain recolouring in G/M.
- r = 3: shapes c4e2, c5u undecided. Radius >= 4: see section 5.
- Unchanged gaps: perfect matchings with no removable edge, base cases n <= 8, digons and the pole piece.

Files: ball.py (models, side/full CEGAR), real.py, real_full.py (realisation), dbg.py, job1-3.sh, side*.jsonl,
full23.jsonl, real2b.json, real3.json, realf_2_*.jsonl, *.out.
