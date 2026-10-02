# RamseyCert — a Lean 4 certificate for a K4 Ramsey-multiplicity upper bound

Lean 4.33.1, Mathlib v4.33.1. No `sorry`, no `native_decide`, no extra axioms in the main chain
(`#print axioms`: `propext`, `Classical.choice`, `Quot.sound`).

Target hill: `alejandrozu/clique-cluster-ramsey-multiplicity` (weighted two-colour blow-up templates,
schema `weighted-two-color-blowup-v1`, at most 1024 blocks, weights ≤ 65535).
Certified solution: `solution.json` (= server `~/ramsey/cand/best_30139933996.json`,
sha256 `b0eae3d46cf41d2db1a9623568cbbf64d333a522ead6c6cd2899f0c4ad1da441`), n = 1024 blocks.

## Main theorems (all in namespace `RamseyCert`)

Specification (`RamseyCert/Defs.lean`), mirroring the hill evaluator's literal oracle (`eval.py`, `_oracle`):

```lean
structure Template where
  n : ℕ
  w : Fin n → ℕ
  red : Fin n → Fin n → Bool

def Template.mono (a b c d : Fin T.n) : Bool :=
  (T.red a b && T.red a c && T.red a d && T.red b c && T.red b d && T.red c d) ||
  (!T.red a b && !T.red a c && !T.red a d && !T.red b c && !T.red b d && !T.red c d)
def Template.numer : ℕ :=
  ∑ a, ∑ b, ∑ c, ∑ d, if T.mono a b c d = true then T.w a * T.w b * T.w c * T.w d else 0
def Template.total : ℕ := ∑ a, T.w a
def Template.density : ℚ := (T.numer : ℚ) / (T.total : ℚ) ^ 4
def Template.Symmetric : Prop := ∀ a b, T.red a b = T.red b a
```

The solution (`RamseyCert/Main.lean`; `wl` = the 1024 weights, `rowsR` = the 1024 row masks, bit `j` of
mask `i` = `red_rows[i][j]`, both in `RamseyCert/Data/Base.lean`):

```lean
def sol : Template := ⟨1024, fun i => wl.getD i 0, fun i j => adjOf rowsR i j⟩

theorem sol_numer   : sol.numer = 200080655744752337972227066537
theorem sol_total   : sol.total = 50759309
theorem sol_density : sol.density = 200080655744752337972227066537 / 6638390640717004439491700265361
theorem sol_lt_ref  : sol.density < 10486266368 / 768 ^ 4
theorem sol_ppt     : ⌈(10 ^ 12 : ℚ) * sol.density⌉ = 30139933996      -- the hill metric `density_ppt`
theorem sol_symm    : sol.Symmetric
```

Connection with the Ramsey multiplicity problem (`RamseyCert/Limit.lean`, `RamseyCert/Mono.lean`,
`RamseyCert/Final.lean`):

```lean
/-- number of monochromatic 4-subsets of the 2-coloured complete graph on `Fin m` -/
def monoK4 {m : ℕ} (c : Fin m → Fin m → Bool) : ℕ :=
  (Finset.univ.filter fun s : Finset (Fin m) => s.card = 4 ∧
      ((∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = true) ∨ (∀ u ∈ s, ∀ v ∈ s, u ≠ v → c u v = false))).card
noncomputable def minMonoK4 (m : ℕ) : ℕ :=
  sInf {k : ℕ | ∃ c : Fin m → Fin m → Bool, (∀ u v, c u v = c v u) ∧ monoK4 c = k}
noncomputable def ramseyMultK4 : ℝ :=
  Filter.liminf (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)) Filter.atTop

theorem blowup_count (T : Template) (hsym : T.Symmetric) (t : ℕ) :
    ∃ c : Fin (t * T.total) → Fin (t * T.total) → Bool, (∀ u v, c u v = c v u) ∧
      24 * monoK4 c ≤ t ^ 4 * T.numer
theorem minMonoK4_le (T : Template) (hsym : T.Symmetric) (t : ℕ) :
    24 * minMonoK4 (t * T.total) ≤ t ^ 4 * T.numer
theorem ramseyMultK4_le_density (T : Template) (hsym : T.Symmetric) (hpos : 0 < T.total) :
    ramseyMultK4 ≤ (T.density : ℝ)

theorem ramseyMultK4_le_sol :
    ramseyMultK4 ≤ 200080655744752337972227066537 / 6638390640717004439491700265361
theorem ramseyMultK4_lt_ref : ramseyMultK4 < 10486266368 / 768 ^ 4

-- Mono.lean: the sequence is nondecreasing, so the liminf is a limit and every term is below it
theorem minMonoK4_density_mono (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤ (minMonoK4 (m + 1) : ℝ) / ((m + 1).choose 4 : ℝ)
theorem ramseyMultK4_tendsto :
    Filter.Tendsto (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)) Filter.atTop (nhds ramseyMultK4)
theorem minMonoK4_density_le (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤ ramseyMultK4

-- Final.lean
theorem minMonoK4_density_le_sol (m : ℕ) (hm : 4 ≤ m) :
    (minMonoK4 m : ℝ) / (m.choose 4 : ℝ) ≤
      200080655744752337972227066537 / 6638390640717004439491700265361
theorem ramseyMultK4_limit_lt_ref :
    ∃ L : ℝ, Filter.Tendsto (fun m : ℕ => (minMonoK4 m : ℝ) / (m.choose 4 : ℝ)) Filter.atTop (nhds L) ∧
      L < 10486266368 / 768 ^ 4
```

So the formal end result is: **the K4 Ramsey multiplicity constant (the limit of the minimum density of
monochromatic K4 over 2-colourings of K_m, which exists) is at most
200080655744752337972227066537 / 6638390640717004439491700265361 ≈ 0.030139933996, which is below
10486266368 / 768^4 ≈ 0.030142273432; equivalently, for every m ≥ 4 some 2-colouring of K_m has at most
that fraction of monochromatic K4.**

## What is and is not proved

Proved in Lean (kernel-checked, standard axioms only):
* the exact value of the specification numerator/density of the 1024-block solution (`sol_density`),
  the comparison with the reference (`sol_lt_ref`), the metric value (`sol_ppt`), symmetry of the colour
  matrix (`sol_symm`);
* the general blow-up lemma: every symmetric template gives, for every `t`, a 2-colouring of the complete
  graph on `t * total` vertices with at most `t^4 * numer / 24` monochromatic K4 (`blowup_count`), hence
  `ramseyMultK4 ≤ density` (`ramseyMultK4_le_density`), hence the bound for the solution;
* monotonicity of the minimum density in `m` (`minMonoK4_density_mono`), existence of the limit
  (`ramseyMultK4_tendsto`) and the finite form `minMonoK4_density_le_sol`.

Not formalised / to be read as definitions:
* `ramseyMultK4` is defined as the liminf of `min #monoK4 / C(m,4)` over symmetric Boolean colourings
  `c : Fin m → Fin m → Bool` (only the values on pairs of distinct vertices matter). `Mono.lean` proves the
  classical monotonicity, so this liminf is the limit (`ramseyMultK4_tendsto`), i.e. the usual constant
  (c_4 / m(K_4) in the literature). That this Lean definition is the constant of the literature is a
  matter of reading the three definitions `monoK4`, `minMonoK4`, `ramseyMultK4` above.
* The correspondence between `solution.json` and the Lean data (`wl`, `rowsR`) is a transcription done by
  `tools/gen.py`; it can be checked independently with `tools/check_data.py` (40 lines, regular
  expressions only) and by eye (weights are decimal, masks are hexadecimal with bit `j` = column `j`).
* The hill evaluator's fast routine `_density` (multiplicities 1, 4, 6, 12, 24) is not modelled; the Lean
  specification is the evaluator's `_oracle` (ordered 4-tuples), which the hill itself audits against
  `_density`. The Lean value equals the hill's `exact_density` for this solution (same fraction).
* The evaluator divides the weights by their gcd; the density is scale-invariant and the Lean template
  uses the weights of the file as they are (their gcd is 1 here: `total^4` is the reduced denominator).

## How the 1024-block instance is checked in the kernel

The naive sum has 1024^4 ≈ 1.1·10^12 terms. The certificate uses (per colour class, with adjacency `adj`):

  K4(adj) = Σ_a w_a Σ_{b ∈ N(a)} w_b Σ_{c ∈ N(a)} [adj b c] w_c · I(a,b,c),
  I(a,b,c) = Σ_d [adj a d][adj b d][adj c d] w_d = ((M_a &&& M_b &&& E_c) mod (2^32 − 1)),

where `M_x` is the neighbourhood mask of `x` with every bit expanded to a 32-bit field and `E_c` is the
weight vector packed into 32-bit fields and restricted to `N(c)` (32768-bit natural numbers). The bitwise
AND selects the common neighbours, and reduction mod 2^32 − 1 is the digit sum in base 2^32 (valid since
the total weight 50759309 < 2^32 − 1). The kernel's GMP-backed `Nat.land`/`Nat.mod` do the inner sum over
`d` in two operations, so the work is Θ(n^3): n·|N(a)|^2 ≈ 2.7·10^8 loop iterations per colour.

* `Defs.lean`: `kTermA md e_a La` (raw `List.rec`/`Bool.rec` recursion, fast in the kernel) is the
  contribution of block `a`; `mkEnt` builds the packed data of a block from its row mask.
* `Fast.lean` (general, no computation): `colour_total` proves
  `(all.map fun e => kTermA md e (nbhd all e)).sum = K4 n w (adjOf rs)` for the blocks built by `mkAll`
  under the side condition `Σ w < 2^B − 1`; `Template.numer_eq` proves `numer = K4 red + K4 blue`;
  `K4_blue` identifies the blue class with the complemented masks. Also `fastK_eq` (computable twin).
* `Data/*.lean` (generated): the weights, masks and, as explicit numerals, the packed blocks `eR_i`, `eB_i`.
* `Chunk/R{a}.lean`, `Chunk/B{a}.lean` (generated, 2048 files): for each block and colour
  - `mkOKX_a : mkEnt 32 1024 W rX_a a = eX_a`   (the numerals are the packed data),
  - `nbOKX_a : nbX_a = nbhd entsX eX_a`          (the neighbour list is the filter),
  - `tX_a : kTermA 4294967295 eX_a nbX_a = <numeral>`,
  each by `decide +kernel`, i.e. by kernel evaluation of the `Decidable` instance (no compiler involved).
* `GlueR.lean`, `GlueB.lean` (generated): assemble the 1024 values per colour, apply `colour_total`
  → `K4R`, `K4B`. `SymChk{k}.lean` + `Sym.lean`: bit `j` of row `i` = bit `i` of row `j`.
* `Main.lean`, `Final.lean`: the theorems above. `Summary.lean` prints them with `#check` / `#print axioms`
  (output: `logs/Summary.log`).

Trusted base: the Lean 4 kernel including its GMP-accelerated arithmetic on `Nat` literals
(`Nat.add, mul, mod, land, shiftRight, pow, beq, ...`; this is part of the standard kernel and is used by
every `decide`/`norm_num` proof with large numerals), and Mathlib v4.33.1.

Scaling (measured; sub-templates on the first n blocks): n = 64: seconds; n = 192: 113 s of `lean` time in
total; n = 1024: 2048 files, 8.2 s each on average (16762 s in total, 50 minutes wall time with 6
processes), 3.3 GB peak RSS per process (of which ≈ 1.6 GB are shared memory-mapped `.olean` files).
The growth is cubic. Kernel memory is not returned between declarations, hence one block per file/process.

## Reproduce

Environment: Lean `leanprover/lean4:v4.33.1` (elan), Mathlib `v4.33.1` (`lakefile.toml`,
`lake-manifest.json`, `lean-toolchain` in this directory; fetch the Mathlib build cache with
`lake exe cache get`). The generated files are in the repository; they can be regenerated:

```bash
python3 tools/gen.py solution.json .            # needs numpy; writes RamseyCert/Data, Chunk, Glue*, Main, Final
python3 tools/check_data.py solution.json RamseyCert/Data/Base.lean
bash tools/build.sh . RamseyCert 6              # layered build, 6 parallel `lean` processes, resumable
grep -v "rc=0" build_status.txt                 # must show only "layer"/"done" lines
grep "depends on axioms" logs/RamseyCert.Main.log logs/RamseyCert.Final.log
```

`tools/build.sh` compiles the modules of `RamseyCert/layers.txt` layer by layer with `lean -o` (each
process in its own `systemd-run` scope with `MemoryMax=${MEM:-4G}`; pass `noscope` as 6th argument to
disable). The project is also a standard Lake library (`lake build`), but Lake starts as many `lean` processes as
there are cores, each needing ≈ 1.6 GB of private memory for the chunk files; the certificate was built
and timed with `tools/build.sh` (a full-size `lake build` was not run).

To certify another solution of the same schema: copy `tools/`, `lakefile.toml`, `lean-toolchain`,
`lake-manifest.json` and the static sources `RamseyCert/{Defs,Fast,Limit,Mono,Sym,SymDefs}.lean` into a new
directory and run the three commands above with the new `solution.json` (weights must sum to less than
2^32 − 1, which the schema guarantees: ≤ 1024·65535).

## Cross-check with compiled evaluation (not part of the certificate)

`RamseyCert/Native.lean` evaluates the computable twin `fastK` (which rebuilds all packed data from the
row masks and is proved equal to the specification by `fastK_eq`) with `native_decide`. This depends on
the additional axiom of `native_decide` (trust in the Lean compiler) and is provided only as independent
evidence; nothing in `Main.lean`/`Final.lean` imports it. It passed for this solution
(`logs/RamseyCert.Native.log`, 679 s).

## Files

* `RamseyCert/Defs.lean`, `Fast.lean`, `Limit.lean`, `Mono.lean`, `Sym.lean`, `SymDefs.lean`, `Summary.lean` —
  static sources (independent of the solution).
* `RamseyCert/Data/`, `Chunk/`, `SymChk*.lean`, `GlueR.lean`, `GlueB.lean`, `Main.lean`, `Final.lean`,
  `Native.lean`, `layers.txt`, `values.json` — generated by `tools/gen.py` from `solution.json`.
* `tools/gen.py`, `tools/build.sh`, `tools/check_data.py`.
* `CERT_STATUS.md` — build record (times, memory, axioms output), `SHA256SUMS`.
