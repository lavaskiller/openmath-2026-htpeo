# Statement-correspondence note — star6 (DMS) Lean artifacts

File: `StarDMS.lean`, Lean 4.33.1 core, no Mathlib. Line numbers refer to that file
as built on 2026-09-28.

## 1. Objects

| Lean | Mathematics |
|---|---|
| `structure MGraph` (l.30): `n m : Nat`, `ends : Fin m → Fin n × Fin n` | A finite multigraph with vertices `Fin n` and edges `Fin m`. Each edge has an ordered pair of ends, but only the unordered pair is ever used: `Joins f x y` (l.42) holds iff `ends f` is `(x,y)` or `(y,x)`. Parallel edges are distinct elements of `Fin m`. |
| `Inc f x` (l.39) | Edge f is incident with vertex x. |
| `Loopless G` (l.996) | No edge has equal ends. |
| `Subcubic G` (l.2311) | No vertex has 4 distinct incident edges, i.e. Δ ≤ 3. |
| `P : Fin G.m → Prop` | An edge set of G. A statement about `P` is a statement about the sub-multigraph of G whose edges are the edges in P and whose vertices are their ends. `P = fun _ => True` is G itself. |

**Encoding the OPG object.** A finite simple graph with Δ ≤ 3 is encoded as an `MGraph`
by listing each edge once. That encoding is `Loopless` and `Subcubic`.

## 2. Star edge colouring

| Lean | Mathematics |
|---|---|
| `Adj a b` (l.45) | Edges a ≠ b share an endpoint. This includes parallel edges, which share both endpoints. |
| `structure Walk4` (l.49–71) | A walk v0 e1 v1 e2 v2 e3 v3 e4 v4 in which v0,v1,v2,v3 are pairwise distinct and v1,v2,v3,v4 are pairwise distinct. So it is either a path with 4 edges (v4 ≠ v0) or a cycle with 4 edges on 4 distinct vertices (v4 = v0). The four edges are then distinct. |
| `Bicol c w` (l.76) | c(e1) = c(e3) and c(e2) = c(e4). |
| `StarOn P k c` (l.79) | c is proper on P (adjacent edges of P get different colours), and no `Walk4` with all four edges in P is `Bicol`. |
| `Star k c` (l.84) | `StarOn (fun _ => True) k c`. |
| `Colourable P k` (l.2316) | Some c : Fin m → Fin k satisfies `StarOn P k c`. |

**Agreement with the OPG definition.** OPG: "properly color the edges … so that no path
or cycle of length four is bi-colored". In a proper colouring, consecutive edges get
different colours. So a path or 4-cycle e1e2e3e4 is 2-coloured exactly when
c(e1) = c(e3) and c(e2) = c(e4). That is `Bicol`, and `Walk4` ranges over exactly the
paths and 4-cycles with 4 edges.

For simple graphs, `Colourable (fun _ => True) k` is therefore "χ′ₛ(G) ≤ k" in the OPG
sense. On multigraphs it is the standard extension: parallel edges count as adjacent,
and a 4-cycle must use 4 distinct vertices.

## 3. Hypotheses used in the reductions

| Lean | Mathematics (for the sub-multigraph H = G[P]) |
|---|---|
| `CubicOn P` (l.5681) | Every vertex of H has exactly 3 edges of P. |
| `ConnectedOn P` (l.5445) | Every 2-colouring of the vertices that is constant across each P-edge is constant on all ends of P-edges. So H is connected. |
| `BridgelessOn P` (l.5687) | No P-edge is a cut edge of H (`CutOn`). |
| `SimpleOn P` (l.8542) | No two P-edges join the same pair of vertices. |
| `IsoTo H' P` (l.5451) | H is isomorphic to H': injective vertex and edge maps, incidence preserved, and the image is exactly P. |
| `k33`, `prismG`, `m6G` (l.5464, l.9343–9346) | K₃,₃; the prism K₃□K₂ (triangles 0-2-4 and 1-3-5, matching 03, 14, 25); M₆, the 6-vertex cubic multigraph with one double edge {2,4}. |
| `HoleOn P c t β` (l.5691) | Colour β is on no P-edge incident with a vertex of N[t] (t or a P-neighbour of t). |

## 4. The four theorems in words

1. **`MGraph.dms_of_hole (hH : HOLE)`.** HOLE means: every connected, bridgeless,
   loopless cubic multigraph H ≠ K₃,₃, and every vertex t of H, has a star 6-edge-colouring
   in which some colour β is absent from every edge meeting N[t].
   Conclusion: for every loopless subcubic multigraph G and every edge set P of G, the
   sub-multigraph G[P] is star 6-edge-colourable. With P = all edges, this is DMS for G.
2. **`P05Lean.cubicSharp5_dms`.** Hypothesis: every connected, bridgeless, loopless cubic
   multigraph that is not isomorphic to K₃,₃, the prism or M₆ is star 5-edge-colourable.
   Conclusion: as in 1.
3. **`DmsIIsLean.cs5s_dms (hCS : CS5s)`.** CS5s is the hypothesis of 2 restricted to
   SIMPLE graphs, with M₆ dropped because it is not simple. Conclusion: as in 1.
4. **`P06Lean.cover_main`.** This theorem has three parts.
   (i) Suppose pv, pe map the vertices and edges of G to those of H, preserve
   incidence, and are injective on each vertex's incident edges and on each vertex's
   neighbours. This is a *locally injective homomorphism*: every covering map is one,
   and surjectivity is not required. If H is loopless and c is a star
   k-edge-colouring of H, then c ∘ pe is a star k-edge-colouring of G.
   (ii) Every multigraph with such a map to K₃,₃ (the 9 listed edges on 6 vertices),
   in particular every cover of K₃,₃, is star 6-edge-colourable.
   (iii) Every multigraph with such a map to the Petersen graph (the 15 listed edges on
   10 vertices: outer 5-cycle, spokes, inner pentagram), in particular every cover of
   it, is star 5-edge-colourable.

## 5. Scope and non-claims
- Theorems 1–3 are **conditional**: they reduce DMS to the stated hypotheses. None of
  the hypotheses is proved here.
- The conclusions hold for loopless multigraphs. That is stronger than the OPG question
  for simple graphs, which is the case `P = fun _ => True` on a simple G.
- No hidden hypotheses: all of the above are ordinary Lean `def`s and `structure`s in the
  same file, and the axiom list of each main theorem is printed at the end of the build.
