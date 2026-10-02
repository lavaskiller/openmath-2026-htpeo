# helper-c4c-4cut: Kochol-type reduction of cyclic 4-edge-cuts for star 6-edge-colouring (10-01)

Verdict: UNCLEAR as a finite reduction; usable as a checked tool for sides on 8-12 vertices. Evidence 6000f3309454e62b, gm conclusion 80c286434a0a691a. Summary of outputs: out/ALL_summary.txt.

- One gadget suffices for every large side tested: K2 (u carries cut edges 1,2; v carries 3,4; edge uv) reduces every admissible side on 8, 10, 12 vertices (9/9, 50/50, 410/410; n=12 by sampling, sound for positive verdicts).
- It does not give c5c: the 4-cycle side C4 is irreducible (no gadget on <= 3 vertices, plain and MC). Also irreducible in plain mode: the 6-vertex side with edges 02 03 04 13 14 15 25, ports 2,3,4,5.
- The general statement is an infinite family, unproved beyond 12 vertices.

## Boundary state and gluing lemma
Setting: G cubic, (A, B) a 4-edge-cut, cut edges e_i = a_i b_i with the a_i pairwise distinct and the b_i pairwise distinct (automatic in a c4c graph when both sides are cyclic). A+ = A plus the four cut edges with pendant ends.
State of a star colouring of A+: (c_i, l_i), i = 1..4; c_i the colour of e_i; l_i maps each colour y != c_i to {0,1,2}: 0 = no edge at a_i has colour y; 1 = the edge a_i x has colour y and x sees no edge of colour c_i; 2 = the edge a_i x has colour y and x sees an edge of colour c_i. Equivalently l_i(y)+1 = number of edges of the {c_i,y}-component of A+ containing e_i (a path with e_i as an end edge). 240 local states per port.
Gluing lemma: star colourings of A+ and B+ with states (c,l), (c',l') combine into a star colouring of G iff c_i = c'_i for all i and l_i(y) + l'_i(y) <= 2 for all i and y != c_i.
Proof sketch: properness = agreement of cut colours. Necessity: if the sum is >= 3 the union of the two components is a connected two-coloured subgraph with >= 4 edges (a path or cycle), or a two-coloured 4-cycle through a second cut edge. Sufficiency: a two-coloured 4-edge path or 4-cycle P of G has an A-edge f and a B-edge g consecutive through a cut edge e_i; the fourth edge is adjacent to f or g (sum >= 3) or is a second cut edge (sum 4).
Replacement: Acc(X) = set of environment states X accepts. If g has fewer vertices than A and Acc(g∘π) ⊆ Acc(A) for a port bijection π, a colouring of the graph with g in place of A pulls back to G.

## Counts
Plain: 15 * 40^4 = 38,400,000 environment states. MC: 8,458,240. Exhaustive L(A): max |L| 1,490 / 46,084 / 695,942 / 6,159,417 at n = 4/6/8/10 (52 s per side at n=10; ~30x per +2 vertices). Randomised DFS lower bounds scale to n = 12-14.

## Results (plain)
n: sides / admissible / adm. universal / adm. reducible / adm. irreducible
4: 1 / 1 / 0 / 0 / 1 (C4); 6: 4 / 2 / 0 / 1 / 1; 8: 27 / 9 / 0 / 9 / 0; 10: 208 / 50 / 21 / 50 / 0; 12: - / 410 / 201 / 410 / 0.
Acc(C4) = 85.0% of states; every admissible side from n=6 on accepts >= 99.46%; Acc(K2) = 7.8%.
## Results (MC, n <= 10)
admissible / reducible / irreducible: 4: 1/0/1; 6: 2/0/2; 8: 9/5/4; 10: 50/50/0. No side universal (13-44% accepted); Acc(K2) = 1.9%. K2 reduces 52 of 55; three need 4-vertex multigraph gadgets.

## What a worker would need
Usable now (finite, checked): a vertex-minimal counterexample to DMS has no 4-edge-cut with an admissible side on 8, 10 or 12 vertices (replace by K2). MC: at 10 vertices and 5 of 9 sides at 8, provided the reduced graph stays in the MC class.
In general, prove (H-RED): for every admissible 4-pole A on >= 8 vertices (or every atom), Acc(K2∘π) ⊆ Acc(A) for some π. Infinite family; no finite Kochol-style argument known (languages have no linear structure). With (H-RED) the core becomes: c4c cubic graphs in which every cyclic 4-edge-cut has a side C4 (plus small exceptions) - not c5c.

## Limits
Sides with internal multi-edges on >= 6 vertices not in the gadget pool; n=12 sampling, plain only; environment states abstract (can only make sides look less reducible). Validation: brute-force checker vs gadget Acc, 0 mismatches.
