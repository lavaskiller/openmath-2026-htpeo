# Mathematical Proof: H06. Busy Beaver 6 Certificates

## Target stage
- Stage: 4. Certificate that the accepted machine halts after exactly 249,881 steps, preparing the Lean formalization.
- Roadmap completion criteria:
  - a precise statement matching the hill's acceptance condition and metrics;
  - a proof whose only non-trivial step is a finite computation the Lean kernel can check.
- Version: 2 (2026-09-29). Responds to Math RED M-01 … M-05.
- Status: 검토대기 (re-review)

## Definitions and assumptions used
The reference semantics is the hill's evaluator `eval.py` (public part, v0.1.0, 86931c1b2f99) together with the README (see `problem.md`).

**Symbols and states.** Symbols are {0, 1}, identified with Bool (false = 0). States are A, B, C, D, E, F (working) and H (halting).

**Machine.** A machine M assigns to each working state s and symbol b an entry M(s, b) = (w, d, s'), where w ∈ {0,1}, d ∈ {L, R} and s' ∈ {A,…,F,H}.

**Configuration.** A configuration is c = (q, h, τ): state q, head h ∈ ℤ, and tape τ : ℤ → {0,1}. The initial configuration is c₀ = (A, 0, 0), the all-zero tape.

**Step.**
- If q = H, then step(c) = c.
- Otherwise let (w, d, s') = M(q, τ(h)). Then step(c) = (s', h + δ(d), τ[h ↦ w]), where δ(L) = −1 and δ(R) = +1.
- So the transition into H performs its write and move. This matches `eval.py`: write, `steps += 1`, move, update leftmost/rightmost, then return if `next_state == HALT`.

**Run.** c_n = stepⁿ(c₀) = (q_n, h_n, τ_n).

**Halting time.**
- M halts after exactly N steps iff q_N = H and q_n ≠ H for all n < N.
- This N is the `steps` value `eval.py` reports: its loop runs transitions while `steps < step_limit` and returns at the first transition into H.

**Reached states.**
- `reached` = {q_n : n < N}.
- This matches `eval.py`: it starts from {A} and adds each `next_state` that is not H.

**Head range.**
- lo_n = min{h_m : m ≤ n} and hi_n = max{h_m : m ≤ n}.
- `eval.py`'s leftmost and rightmost range over the initial head and the head after every move, including the halting move.
- So `tape_span` = hi_N − lo_N + 1.

**Ones.**
- `ones` = #{i ∈ ℤ : τ_N(i) = 1}.
- `eval.py` keeps exactly the cells holding 1: a write of 1 sets the cell, a write of 0 pops it. It returns `len(tape)`.

**Acceptance (M-01).** Let `eval.py` be given a submission directory and a budget B.
- It loads `solution.json` with `_load_machine`. Any schema violation means rejection.
- It checks 10 ≤ B ≤ 2,000,000. Otherwise it rejects ("outside safe limits").
- It runs `_run(machine, B)`.
- It accepts iff the run halts within the loop, i.e. after some N ≤ B steps, and `reached` = {A,…,F}.
- The harness watchdog (`hill.yaml`, 120 s) plays no role here: `_run` finishes in under a second.

**The machine.** States A–F in order, entries for read 0 then read 1:

```
M★ = 0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD
```

The file `certificate/solution.json` passes `_load_machine`, and the table it yields is M★ entry by entry. This was checked by Math RED. Its only halting entry is B1.

## Supporting lemmas

### Lemma 1 (zipper step)

**Zipper.** A zipper is z = (l, a, r, q):
- l lists the cells left of the head, nearest first;
- a is the scanned cell;
- r lists the cells right of the head, nearest first;
- q is the state.

For a list x, write x[j] for its j-th element, with value 0 when j ≥ length(x). For k ∈ ℤ define:
- zget(z, 0) = a;
- zget(z, k) = r[k−1] for k > 0;
- zget(z, k) = l[−k−1] for k < 0.

**Zipper step (M-03).**
- If q = H, then stepZ(z) = z.
- Otherwise let (w, d, s') = M(q, a). Then:
  - d = R and r = b :: r': stepZ(z) = (w :: l, b, r', s');
  - d = R and r = []: stepZ(z) = (w :: l, 0, [], s');
  - d = L and l = b :: l': stepZ(z) = (l', b, w :: r, s');
  - d = L and l = []: stepZ(z) = ([], 0, w :: r, s').

**Representation.** z represents c = (q, h, τ) when q_z = q and τ(i) = zget(z, i − h) for all i ∈ ℤ.

**Statement.** If z represents c, then stepZ(z) represents step(c).

**Proof.** If q = H, both sides are unchanged. Otherwise the representation at offset 0 gives a = τ(h). So both steps use the same entry (w, d, s'), the new state is s' on both sides, and the new tape is τ' = τ[h ↦ w].

Case d = R, so h' = h + 1. Put k = i − h'.
- k = 0: τ'(h+1) = τ(h+1) = zget(z, 1) = r[0], and r[0] is b when r = b :: r' and 0 when r = []. This is the new scanned cell.
- k > 0: τ'(i) = τ(i) = r[k] = r'[k−1]. When r = [], both sides are 0.
- k = −1: i = h, and τ'(h) = w = (w :: l)[0].
- k < −1: τ'(i) = τ(i) = zget(z, k+1) = l[−k−2] = (w :: l)[−k−1].

Case d = L, so h' = h − 1. Put k = i − h'.
- k = 0: τ'(h−1) = τ(h−1) = l[0], which is b or 0.
- k < 0: τ'(i) = τ(i) = l[−k] = l'[−k−1], or 0 when l = [].
- k = 1: i = h, and τ'(h) = w = (w :: r)[0].
- k > 1: τ'(i) = τ(i) = zget(z, k−1) = r[k−2] = (w :: r)[k−1]. ∎

### Corollary 1 (the runs stay in lockstep; M-02)
**Statement.** Let z₀ = ([], 0, [], A) and z_n = stepZⁿ(z₀). Then z_n represents c_n for all n. In particular q_{z_n} = q_n, the scanned cell of z_n is τ_n(h_n), and for every n with q_n ≠ H both runs apply the same entry M(q_n, τ_n(h_n)), hence the same direction.

**Proof.** z₀ represents c₀: the states are both A, and zget(z₀, k) = 0 = τ₀(h₀ + k) for every k. Induction with Lemma 1 does the rest. ∎

### Lemma 2 (zipper lengths track the head range)
**Statement.** For all n, length(l_n) = h_n − lo_n and length(r_n) = hi_n − h_n.

**Proof.** Induction on n. At n = 0 all quantities are 0.

If q_n = H, nothing changes: h_{n+1} = h_n, so lo and hi are unchanged, and stepZ is the identity.

Otherwise, by Corollary 1 both runs use the same direction d.

Case d = R, h' = h + 1:
- The left list becomes w :: l, and lo' = lo because h' > h ≥ lo. So length(l') = h − lo + 1 = h' − lo'.
- If r = b :: r': by the hypothesis hi − h = length(r) ≥ 1, so h' ≤ hi, hi' = hi, and length(r') = hi − h − 1 = hi' − h'.
- If r = []: hi = h, so hi' = h + 1 = h' and length([]) = 0 = hi' − h'.

Case d = L, h' = h − 1:
- The right list becomes w :: r, and hi' = hi. So length = hi − h + 1 = hi' − h'.
- If l = b :: l': lo ≤ h − 1 = h', so lo' = lo and length(l') = h − lo − 1 = h' − lo'.
- If l = []: lo = h, so lo' = h − 1 = h' and the length is 0. ∎

### Lemma 3 (cells never visited stay 0)
**Statement.** If i < lo_N or i > hi_N, then τ_N(i) = 0.

**Proof.** The step from time m to m + 1 changes only cell h_m, and lo_N ≤ h_m ≤ hi_N for m ≤ N. So cell i is never written and keeps its initial value 0. ∎

### Lemma 4 (H is absorbing)
**Statement.** If q_n = H, then q_m = H for all m ≥ n. Hence q_{N−1} ≠ H implies q_n ≠ H for all n < N.

**Proof.** step fixes every configuration whose state is H. ∎

## Target theorem
**Statement.** For M★ and N = 249,881:
1. q_N = H, and q_n ≠ H for all n < N. So M★ halts after exactly 249,881 steps.
2. {q_n : n < N} = {A, B, C, D, E, F}.
3. hi_N − lo_N + 1 = 735.
4. #{k ∈ [0, 735) : τ_N(lo_N + k) = 1} = 554, and τ_N(i) = 0 for every i outside [lo_N, hi_N]. Consequently `ones` = #{i ∈ ℤ : τ_N(i) = 1} = 554.

**Corollary (acceptance; M-01).** Take the submission `certificate/solution.json`, which encodes M★.
- For every budget B with 249,881 ≤ B ≤ 2,000,000, `eval.py` accepts it and reports (steps, ones, tape_span) = (249881, 554, 735).
- For every B < 249,881 it rejects it: either B is outside the safe range, or the run has not halted after B steps.

**Proof.**

The following finite facts are checked by evaluating stepZ, a total function on finite data, from z₀:
- (i) q_{z_{N−1}} ≠ H;
- (ii) q_{z_N} = H;
- (iii) length(l_N) + 1 + length(r_N) = 735;
- (iv) among zget(z_N, k − length(l_N)) for k = 0, …, 734, exactly 554 values are 1.

Part 1. By Corollary 1, q_n = q_{z_n}. So (ii) gives q_N = H, and (i) with Lemma 4 gives q_n ≠ H for n < N.

Part 2.
- (⊇) The states at times 0, 1, 2, 3, 4 and 31 are A, E, D, F, C and B. This is checked by computing the first 31 steps, and all these times are < N.
- (⊆) By Part 1, q_n ≠ H for every n < N, so every q_n with n < N is one of A–F.

Part 3. By Lemma 2, hi_N − lo_N + 1 = length(r_N) + length(l_N) + 1, which is 735 by (iii).

Part 4.
- By Lemma 2, lo_N = h_N − length(l_N). With Corollary 1: τ_N(lo_N + k) = zget(z_N, lo_N + k − h_N) = zget(z_N, k − length(l_N)). So (iv) gives the window count 554.
- By Part 3, k ↦ lo_N + k is a bijection from [0, 735) onto [lo_N, hi_N]. So exactly 554 cells of [lo_N, hi_N] hold 1.
- By Lemma 3, no cell outside [lo_N, hi_N] holds 1. So #{i ∈ ℤ : τ_N(i) = 1} = 554.

Corollary.
- For B in the safe range, `_run` executes at most B transitions and returns at the first transition into H. By Part 1 this happens at transition N ≤ B, with steps = N.
- `reached` = {A,…,F} by Part 2. `ones` = 554 by Part 4, and `tape_span` = 735 by Part 3 (definitions above).
- For B < N the loop stops after B transitions without meeting H, again by Part 1, so the machine is rejected. ∎

## Planned Lean realisation (M-05)
- **Toolchain.** Core Lean 4.34.1 only, without Mathlib, in `LeanProject/` pinned by `lean-toolchain`.
- **Top-level statement.** The main theorem states Parts 1–4 about the reference model:
  - `step` on configurations (q, h : Int, τ : Int → Bool);
  - `run n` = stepⁿ(c₀);
  - `lo n` and `hi n` defined by min/max recursion over the heads at times 0..n;
  - Part 4 in the finite-window form: a count over k < 735 of τ_N(lo_N + k), plus τ_N(i) = false outside [lo_N, hi_N]. The finite-window form is the formal counterpart of `ones`, since core Lean has no cardinality of subsets of ℤ.

  The zipper appears only inside the proof, through Lemmas 1–4 and Corollary 1. These lemmas are proved for every machine.
- **Acceptance corollary.** It is stated with an `accepts M B` predicate that mirrors `_run`: halts within B steps and reaches A–F. The range check 10 ≤ B ≤ 2,000,000 and JSON loading are the modelling link and stay in prose; see the Definitions section.
- **Finite facts (i)–(iv) and the 31-step prefix.** These are proved by `decide +kernel`, checked by the kernel alone; `native_decide` is not used. Soundness conditions:
  - `stepZ`, the iterated zipper run, and the machine table are defined by structural recursion (not well-founded recursion, not `partial`), so the kernel can unfold them;
  - run(a + b) z = run b (run a z) is proved by induction, not by `decide`;
  - explicit intermediate zippers serve only as hints. A wrong hint makes `decide` fail; it cannot yield a false theorem.
- **Axioms.** `#print axioms` should list only standard axioms (propext, Classical.choice, Quot.sound) or fewer.

## Unresolved points
- None known. The link between the Lean model and `eval.py` (JSON loading, the safe-range check) is argued in prose. Math RED checked it line by line in review 1.

## Math RED issue status
- M-01: fixed. The Acceptance rule and Corollary now include loading and the safe range 10 ≤ B ≤ 2,000,000, and the solution file is identified as M★.
- M-02: fixed. Corollary 1 is inserted after Lemma 1, with its base case, and Lemma 2 cites it.
- M-03: fixed. All four stepZ cases are written out, as are the d = L cases of Lemmas 1 and 2.
- M-04: fixed. Part 2 proves both inclusions, and Part 4 cites Part 3, the bijection and Lemma 3, and names the formal counterpart of `ones`.
- M-05: fixed. The Lean plan states the top-level theorem on the reference model and records the soundness conditions.


---

# Stage 5: structural proof (acceleration rules instead of stepping through the run)

- Status: 수학검토완료 (Math RED pass after re-review, 2026-09-30)
- Version: 2 (2026-09-30). Where version 1 below differs from the "version 2 amendments" at the end of this stage (pop normalisation, no k > 0 guard, 1,039 sweeps, rfl instead of decide for the one-block cases), the amendments are authoritative.
- Goal: prove the Stage 4 Target theorem again without evaluating 249,880 machine steps. The only computation left should be one whose size is a small fraction of the run. The bulk of the time must come from rules proved **for all k** by induction.
- Everything below uses the zipper model of Stage 4 (Lemma 1, Corollary 1). The Stage 4 target theorem and its reduction to the zipper run are unchanged; only the proof of the single fact (Z) changes:

  (Z)  stepZⁿ(z₀) = z_A for n = 249,880, where z_A is the explicit zipper of the Stage 4 plan (|l| = 3, |r| = 731, state B, scanned cell 1).

## 5.1 Observed structure (explanation, not used in the proof)
Let M★ = `0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD`. At the times the head first reaches a new rightmost cell at an even position (the "events"), the tape has the form

  P · d₁ · (1000)^a₁ · d₂ · (1000)^a₂ · … · d_m · (1000)^a_m · 100,

where each "digit" d_i is one of the words `00`, `1010`, `101100` (values 0, 1, 2) and P is a short prefix.

Between consecutive events the machine does the following:
- It sweeps left from the right end over the blocks. Each block `1000` becomes `1011`, at a cost of 6 steps per block.
- Stopping point:
  - at the first digit of value 0 or 1, it increments that digit and turns;
  - a digit of value 2 is reset and the sweep continues left, which is a carry;
- It sweeps right back to the end. Each block becomes `0100`, at a cost of 4 steps per block, and the tape grows by 2 cells.

So the machine is a base-3 counter whose digits are separated by growing runs of blocks. Without a carry, an event costs 10·a_m + 10 for a 0→1 increment and 10·a_m + 14 for a 1→2 increment. For example, event 362 (0→1) costs 1210 = 10·120 + 10 and event 363 (1→2) costs 1214 = 10·120 + 14.

At event 363 the tape begins `101110111 00 101100 …`, and the digits after P read 0 2 2 2 2 with runs 0, 3, 12, 39, 120. The next increment carries through the four 2s. The leading `00`, which sits directly after P, does not act as an ordinary digit 0: it becomes `11`, and the machine halts inside P (B reads 1). In this sense the counter overflows at its most significant end.

`search/digits.py` confirms this form for every event after event 1. Two qualifications: event 1 does not parse, and some events (81 of them) have an extra run (1000)^a₀ between P and d₁. This section is an explanation only; the proof below does not depend on it.

## 5.2 Lemmas

Notation:
- w^k denotes the list w repeated k times (repL k w);
- lists of the zipper are nearest-first;
- f = 0 and t = 1.

### Lemma 5.1 (run composition)
**Statement.** stepZ^(m+n)(z) = stepZ^n(stepZ^m(z)).

**Proof.** Induction on m. ∎

### Lemma 5.2 (left sweep)
**Statement.** For every k and all lists l, r:

  stepZ^(6k) ⟨(ffft)^k ++ l, 1, r, E⟩ = ⟨l, 1, (fttt)^k ++ r, E⟩.

**Proof.**
- **One block (k = 1).** Six steps with the entries E1 = 1LB, B0 = 1LC, C0 = 1RA, A1 = 1LA, A1 = 1LA, A0 = 0LE. The head starts on a 1 with left neighbours 0,0,0,1. These steps read only the three cells of the block to the left and the cells they themselves wrote, and they end on the next 1 in state E. So the tails l and r are never inspected, and the claim holds for arbitrary l, r.
- **Induction.** Split 6(k+1) = 6 + 6k and apply Lemma 5.1. Use (fttt) ++ (fttt)^k = (fttt)^k ++ (fttt), since both are the same word repeated. ∎

### Lemma 5.3 (right sweep)
**Statement.** For every k and all lists l, r:

  stepZ^(4k) ⟨l, 0, (tttf)^k ++ r, D⟩ = ⟨(fftf)^k ++ l, 0, r, D⟩.

**Proof.**
- **One block.** Four steps with the entries D0 = 0RF, F1 = 1RD, D1 = 0RD, D1 = 0RD. They read only the block's three 1s and the following 0. The tails are not inspected.
- **Induction.** As in Lemma 5.2. ∎

### Lemma 5.4 (rotation)
**Statement.** For a word x :: w₀ and k ≥ 0:

  (x :: w₀)^(k+1) = x :: ((w₀ ++ [x])^k ++ w₀).

**Proof.** Induction on k. It suffices to show w₀ ++ (x :: w₀)^k = (w₀ ++ [x])^k ++ w₀.
- k = 0: both sides are w₀.
- Step: w₀ ++ (x :: w₀) ++ (x :: w₀)^k = (w₀ ++ [x]) ++ (w₀ ++ (x :: w₀)^k), which is (w₀ ++ [x])^(k+1) ++ w₀ by the induction hypothesis. ∎

## 5.3 Compressed zippers

**Segments.** A segment is either a single cell `one b` or a repetition `rep w k`. flat(one b) = [b] and flat(rep w k) = w^k. For a list of segments, flat concatenates.

**Compressed zipper.** ζ = (L, a, R, q) stands for the zipper ⌈ζ⌉ = (flat L, a, flat R, q).

**Operations.** Each operation preserves flat, where noted.

- **pop.** pop([]) = (0, []); pop(one b :: S) = (b, S); pop(rep w 0 :: S) = pop(S); pop(rep (x :: w₀) (k+1) :: S) = (x, rep (w₀ ++ [x]) k :: one-cells(w₀) ++ S). A repetition of an empty word is treated like a repetition with k = 0.
  - **Lemma 5.5.** pop(S) = (headD(flat S, 0), tail(flat S) as segments), i.e. its first component is the first cell of flat S, or 0 if flat S is empty, and flat of its second component is tail(flat S). This is proved by induction on S, using Lemma 5.4 for the rotation case.
- **Normalisation.** These rewrites preserve flat, and each case is a one-line list identity:
  - r1: eight leading `one` cells equal to w ++ w become rep w 2;
  - r2: four leading `one` cells equal to w, followed by rep w k, become rep w (k+1);
  - r3: rep w k followed by rep w j becomes rep w (k+j);
  - r3': rep w k followed by four `one` cells equal to w becomes rep w (k+1). This uses w^k ++ w = w^(k+1).
  norm applies r1, r2, r3 at the front, then recurses past a leading `one` cell to a bounded depth, and repeats a fixed number of passes. So flat(norm S) = flat S.
- **Compressed step stepC.** It copies stepZ, using pop for the cell the head moves onto and norm(one w :: ·) for the written cell. By Lemma 5.5, and because stepZ in headD/tail form is the same function, ⌈stepC ζ⌉ = stepZ ⌈ζ⌉.
- **Accelerated step acc.** Three cases:
  - if q = E, a = 1 and L = rep (ffft) k :: L', then acc(ζ) = (6k, (L', 1, norm(rep (fttt) k :: R), E));
  - if q = D, a = 0 and R = rep (tttf) k :: R', then acc(ζ) = (4k, (norm(rep (fftf) k :: L), 0, R', D));
  - otherwise acc(ζ) = (1, stepC ζ).
  - **Lemma 5.6.** If acc(ζ) = (n, ζ'), then stepZⁿ⌈ζ⌉ = ⌈ζ'⌉. This follows from Lemmas 5.2, 5.3 and 5.5 and flat-preservation of norm.
- **Accelerated run accRun.** From ζ with fuel N, stop when the entry under the head leads to H (or the fuel runs out). Otherwise apply acc and continue, adding up the step counts.
  - **Lemma 5.7.** If accRun(N, ζ) = (T, ζ'), then stepZ^T⌈ζ⌉ = ⌈ζ'⌉. This is proved by induction on N with Lemma 5.1.

## 5.4 Target theorem (Stage 5)
**Statement.** (Z) holds, and it is proved as follows:

- (i) a finite computation: accRun(F, ([], 0, [], A)) = (249,880, ζ_A) and ⌈ζ_A⌉ = z_A;
- (ii) Lemma 5.7.

Consequently the Stage 4 Target theorem (Parts 1–4) and the acceptance corollary hold. Their proofs are unchanged, with (Z) now established structurally.

**Size of the computation.** Per the prototype `search/accel_lean_mirror.py`, which mirrors the planned Lean definitions:
- 7,900 single steps (3.2 % of the run) and 1,036 sweep applications;
- 96.8 % of the run's steps are covered by Lemmas 5.2 and 5.3, which hold for every k;
- at most 35 segments at any time.

**Planned Lean realisation.**
- New modules in `LeanProject/`, with no change to the Stage 4 definitions or statements:
  - `Accel.lean`: segments, flat, pop, norm, stepC and their lemmas, for any machine;
  - `Structural.lean`: the machine-specific sweep lemmas, acc, accRun, the kernel computation (i), and `bb6_certificate_structural`, with the same statement as `bb6_certificate`.
- `decide +kernel` is used only for (i) and for the one-block cases if needed; no native_decide.
- The Stage 4 direct proof stays as an independent cross-check.
## Stage 5, version 2 amendments (responses to M5-01 … M5-05)
These amendments supersede the corresponding statements of version 1 above. The definitions below are exactly those of `LeanProject/LeanProject/Accel.lean` and `Structural.lean`.

### (M5-03) Repetition and its identities
Definition: w^0 = [] and w^(k+1) = w ++ w^k (Lean `repL`). Three identities follow by induction on k:
- (R1) w^(k+1) = w^k ++ w;
- (R2) w^(k+j) = w^k ++ w^j;
- (R3) [] ^ k = [].

Their uses:
- Lemma 5.2 uses the definition in the form w^(k+1) ++ l = w ++ (w^k ++ l), and (R1) to reassemble (fttt)^k ++ (fttt ++ r) = (fttt)^(k+1) ++ r. Lemma 5.3 uses the same two identities.
- Lemma 5.4 uses the definition.
- r1 uses w^2 = w ++ w, by the definition; r2 uses the definition; r3 uses (R2); r3' uses (R1).
- pop's empty-word case uses (R3).

### (M5-04) One-block cases
- Lemma 5.2: the six steps read the scanned 1, the three 0s of the block, and two cells written during the sweep. The block's final 1 becomes the scanned cell without being read.
- Lemma 5.3: the four steps read the scanned 0 and the three 1s. The following 0 becomes the scanned cell without being read.

In both cases the tails l and r are never inspected. The statements quantify over all lists l, r, so they are proved by definitional unfolding (`rfl`), not by `decide`.

### (M5-01) Exact definitions and parameters
- **pop** (rotation case): pop(rep (x :: w₀) (k+1) :: S) = (x, norm(rep (w₀ ++ [x]) k :: one-cells(w₀) ++ S)). The other cases are as in version 1: [] ↦ (0, []); one b ↦ b; a repetition of the empty word, or with k = 0, is skipped.
  - Lemma 5.5 holds with flat(norm X) = flat X added to its proof.
- **norm**: one pass of r3 ∘ r2 ∘ r1 at the front of the list (depth 0). r3 contains both merges: rep·rep, and rep followed by four one-cells equal to w.
  - r1 uses the words K = all rotations of 0001 and of 0111 (8 words).
  - Stronger settings (more passes, more depth) give the same counts for M★, as checked with the mirror script.
- **acc**: the two sweep cases fire whenever the pattern matches, including k = 0, which is a sound 0-step move.
- **accRun**: accRun(0, ζ, c) = (c, ζ). accRun(F+1, ζ, c) = (c, ζ) if the entry under the head leads to H; otherwise, with acc(ζ) = (n, ζ'), it is accRun(F, ζ', c + n).
  - Lemma 5.7 in accumulator form: c ≤ T and stepZ^(T−c)⌈ζ⌉ = ⌈ζ'⌉ for (T, ζ') = accRun(F, ζ, c). Proof by induction on F with Lemma 5.1.
- **Fuel:** F = 10,000.
- **Measured size** with exactly these definitions (`search/accel_lean_mirror.py` with PASSES = 1, DEPTH = 0, no k > 0 guard):
  - 7,900 single steps (3.2 % of 249,880) and 1,039 sweep applications (3 of them with k = 0), so fuel 8,939 suffices;
  - about 96.8 % of the machine steps are covered by Lemmas 5.2 and 5.3.
- **Kernel time:** measured on the Lean draft, the whole structural module takes about 24 s, versus about 78 s for the Stage 4 direct evaluation.

### (M5-02) z_A, (Z), and the link to Stage 4
- **z_A** is `Witness.zA` in `LeanProject/LeanProject/WitnessData.lean`. It has l = [1,0,1] (nearest-first), scanned cell 1, |r| = 731 and state B. It is generated data, and it is the zipper after 249,880 steps.
- **(Z)**: stepZ^249880(z₀) = z_A.
- **Stage 5 computation (i)**, with ζ₀ = ([], 0, [], A):
  - (accRun 10000 ζ₀ 0).1 = 249,880, and
  - ⌈(accRun 10000 ζ₀ 0).2⌉ = z_A.

  ⌈ζ₀⌉ = z₀, so Lemma 5.7 gives (Z).
- **From (Z) to the Stage 4 facts** (as in `Witness249881.lean`):
  - z_N = stepZ(z_A) by Lemma 5.1 with N = 249,880 + 1;
  - z_B := stepZ(z_A) is a finite check: state H, |l| = 4, |r| = 730, and 554 ones in the window.
  - This gives (i) q_{N−1} = q_{z_A} = B ≠ H, and (ii)–(iv) from z_B.
- **The 31-step prefix** for Part 2 (states A, E, D, F, C, B at times 0, 1, 2, 3, 4, 31) stays a direct kernel computation of 31 steps. It is not covered by (Z).
- **Refactoring:** in Lean, the Stage 4 derivation becomes `certificate_of_run (h : (Z))`. The direct proof `runZ_249880` and the structural proof `runZ_249880_structural` are two independent proofs of (Z).

# Stage 6: the counter law as a theorem (event level, arbitrary counter states)

- Status: 수학검토완료 (Math RED review 1 pass, 2026-09-30; the amendments in §6.9 are authoritative)
- **Goal.** State and prove the behaviour of M★ between consecutive events for **arbitrary** counter states: symbolic digit lists, symbolic runs, and an arbitrary tape beyond the counter. The claim has the form "a configuration of this shape reaches the next configuration of the same shape in exactly f(C) steps", with no budget and no bound on the counter size. Then derive (Z) of Stage 5 from these theorems.
- **Allowed computations.** Only these:
  - a 74-step start-up, before the counter shape exists;
  - the abstract counter iteration on tuples of numbers;
  - list equalities.
  No machine step of the 248,714 + 1,092 steps after the start-up is evaluated, and no sweep rule is iterated by computation.
- **Notation (as in Stage 5).**
  - Lists are nearest-first; 0 = f, 1 = t; w^k = repL w k.
  - WL = 0001, WL2 = 0111, WR = 1110, WR2 = 0010.
  - stepZⁿ is written runZ n, and ++ is list append.
  - A word written as a digit string, e.g. 0110, is the list [f,t,t,f].

## 6.1 Definitions

- **Digit words.** DIG0 = 000001, DIG1 = 0101, DIG2 = 001101.
  - dig 0 = DIG0, dig 1 = DIG1, dig d = DIG2 for d ≥ 2.
- **Counter encoding.** For a list ds of pairs (d, a), least significant first:
  - enc [] = [];
  - enc ((d, a) :: ds) = WL^a ++ dig d ++ enc ds.
  - For a list tw of runs: enc2 tw = enc (tw.map (2, ·)) and enc0 tw = enc (tw.map (0, ·)).
- **Top words.** Lα = 0110, Lβ = 001110, Lγ = 00000010, Lδ = 0001010010, Lε = 000100110010.
- **High words.** h0 = 00101, h1 = 10101, h2 = 01101, h3 = 11101.
- **Stack words.** push p = 111110 ++ WR^p. For ps listed most recently pushed first:
  - P [] = [];
  - P (p :: ps) = push p ++ P ps.
- **Configurations.**
  - Ev(L) = ⟨01 ++ L, 0, [], D⟩ (event configuration);
  - LeftAt(Y, R) = ⟨Y, 1, 0 :: R, E⟩;
  - RightAt(Q, R) = ⟨Q, 0, R, D⟩.
- **Absorber.** Absorbs(Y, c, k, e, Q) means that for every list R:

    runZ c (LeftAt(Y, R)) = RightAt(Q, WR^k ++ P e ++ R).

## 6.2 Piece lemmas (finite computations with symbolic tails)

Each statement holds for **arbitrary** lists X, R (and Q).

**Proof method.** Every step of a piece reads either a cell of the explicit prefix or a cell written earlier in the same piece. It never reads a cell of X or R, so the same step sequence applies whatever X and R are.

**Machine check.** `search/absorb_check.py` evaluates each piece with sentinels in place of X and R; reading a sentinel raises an error. All pieces pass. In Lean, each piece is `rfl` with X and R as variables.

| piece | statement | steps |
|---|---|---|
| P1 start | runZ 6 Ev(X) = LeftAt(X, 11) | 6 |
| P2 pass | runZ 8 LeftAt(DIG2 ++ X, R) = LeftAt(X, 111110 ++ R) | 8 |
| P3 absorb0 | runZ 7 LeftAt(0000 ++ X, R) = RightAt(1 ++ X, WR ++ R) | 7 |
| P4 absorb1 | runZ 5 LeftAt(01 ++ X, R) = RightAt(011 ++ X, R) | 5 |
| P5 β0 | runZ 17 LeftAt(0011100 ++ X, R) = RightAt(00000101 ++ X, R) | 17 |
| P6 β1 | runZ 21 LeftAt(001110101 ++ X, R) = RightAt(0000010011 ++ X, R) | 21 |
| P7 ε | runZ 9 LeftAt(001100 ++ X, R) = RightAt(1 ++ X, 111110 ++ R) | 9 |
| P8 halt | runZ 10 LeftAt(00111011 ++ X, R) = ⟨X, 1, 10111111 ++ 0 :: R, B⟩, and the table entry B1 is 1RH | 10 |
| P9 pop | runZ 6 RightAt(Q, 111110 ++ R) = RightAt(000010 ++ Q, R) | 6 |
| P10 end | runZ 3 RightAt(Q, 11) = ⟨010 ++ Q, 0, [], D⟩ | 3 |

## 6.3 List identities

- (I1) WL2^k ++ 0 :: R = 0 :: (WR^k ++ R).
- (I2) 0 :: (WR2^k ++ Q) = WL^k ++ 0 :: Q.
- (I3) enc (xs ++ ys) = enc xs ++ enc ys, and P (xs ++ ys) = P xs ++ P ys.
- (I4) WR^(k+1) = WR ++ WR^k. This is the definition of repL.

**Proof.** (I1) and (I2) are proved by induction on k.
- Step for (I1): WL2 ++ (WL2^k ++ 0 :: R) = WL2 ++ 0 :: (WR^k ++ R) = 01110 ++ WR^k ++ R = 0 :: (WR ++ WR^k ++ R).
- Step for (I2): 0 :: (WR2 ++ WR2^k ++ Q) = 00010 ++ WR2^k ++ Q = WL ++ 0 :: (WR2^k ++ Q) = WL ++ WL^k ++ 0 :: Q.

(I3) is proved by induction on xs. ∎

## 6.4 Phase lemmas

**Lemma 6.1 (left sweep with marker).** runZ (6k) LeftAt(WL^k ++ Y, R) = LeftAt(Y, WR^k ++ R).

*Proof.* Lemma 5.2 gives ⟨Y, 1, WL2^k ++ 0 :: R, E⟩. Then apply (I1). ∎

**Lemma 6.2 (left phase).** For all tw, ps, X, R:

  runZ (Σ_{r∈tw}(6r+8)) LeftAt(enc2 tw ++ X, P ps ++ R) = LeftAt(X, P(rev tw ++ ps) ++ R).

*Proof.* Induction on tw, generalising ps.
- **tw = [].** Trivial.
- **tw = r :: tw'.** Here enc2 tw = WL^r ++ DIG2 ++ enc2 tw'.
  1. Lemma 6.1 (6r steps) gives LeftAt(DIG2 ++ enc2 tw' ++ X, WR^r ++ P ps ++ R).
  2. P2 (8 steps) gives LeftAt(enc2 tw' ++ X, 111110 ++ WR^r ++ P ps ++ R) = LeftAt(enc2 tw' ++ X, P(r :: ps) ++ R).
  3. The IH gives P(rev tw' ++ r :: ps) = P(rev (r :: tw') ++ ps).

  The steps compose by Lemma 5.1. ∎

**Lemma 6.3 (right phase).** For all ps, k, Q:

  runZ (4k + 3 + Σ_{p∈ps}(4p+6)) RightAt(Q, WR^k ++ P ps ++ 11) = Ev(enc0 (rev ps) ++ WL^k ++ 0 :: Q).

*Proof.* Induction on ps, generalising k and Q.
- **ps = [].**
  1. Lemma 5.3 (4k steps) gives RightAt(WR2^k ++ Q, 11).
  2. P10 (3 steps) gives ⟨010 ++ WR2^k ++ Q, 0, [], D⟩ = Ev(0 :: (WR2^k ++ Q)).
  3. By (I2) this is Ev(WL^k ++ 0 :: Q).
- **ps = p :: ps'.**
  1. Lemma 5.3 takes 4k steps.
  2. P9 (6 steps) gives RightAt(000010 ++ WR2^k ++ Q, WR^p ++ P ps' ++ 11).
  3. The IH (with k := p and Q := 000010 ++ WR2^k ++ Q) gives Ev(enc0 (rev ps') ++ WL^p ++ 0 :: 000010 ++ WR2^k ++ Q).
  4. By (I2), 0 :: 000010 ++ WR2^k ++ Q = DIG0 ++ 0 :: (WR2^k ++ Q) = DIG0 ++ WL^k ++ 0 :: Q.
  5. By (I3), enc0 (rev ps' ++ [p]) = enc0 (rev ps') ++ WL^p ++ DIG0.

  Cost: 4k + 6 + (4p + 3 + Σ_{ps'}) = 4k + 3 + Σ_{p::ps'}. ∎

**Theorem 6.4 (event from an absorber).** If Absorbs(Y, c, k, e, Q), then for every tw:

  runZ N Ev(enc2 tw ++ Y) = Ev(enc0 (tw ++ rev e) ++ WL^k ++ 0 :: Q),

where N = 9 + c + 4k + Σ_{r∈tw}(10r + 14) + Σ_{p∈e}(4p + 6).

*Proof.*
1. P1 (6 steps) gives LeftAt(enc2 tw ++ Y, P [] ++ 11).
2. Lemma 6.2 gives LeftAt(Y, P(rev tw) ++ 11).
3. The absorber, with R = P(rev tw) ++ 11, gives RightAt(Q, WR^k ++ P e ++ P(rev tw) ++ 11). By (I3) this is RightAt(Q, WR^k ++ P(e ++ rev tw) ++ 11).
4. Lemma 6.3 gives Ev(enc0 (rev (e ++ rev tw)) ++ WL^k ++ 0 :: Q), and rev (e ++ rev tw) = tw ++ rev e.

The cost is 6 + Σ(6r+8) + c + 4k + 3 + Σ_{e ++ rev tw}(4p+6) = N, since a sum over rev tw equals the sum over tw. ∎

## 6.5 Absorbers

- **(A0)** Absorbs(WL^a ++ 0000 ++ X, 6a+7, a+1, [], 1 ++ X). Proof: Lemma 6.1, then P3 and (I4).
- **(A1)** Absorbs(WL^a ++ 01 ++ X, 6a+5, a, [], 011 ++ X). Proof: Lemma 6.1, then P4.
- **(Aβ0)** Absorbs(Lβ ++ 0 ++ X, 17, 0, [], 00000101 ++ X). Proof: P5.
- **(Aβ1)** Absorbs(Lβ ++ 101 ++ X, 21, 0, [], 0000010011 ++ X). Proof: P6.
- **(Aε)** Absorbs(WL ++ 001100 ++ X, 15, 0, [1], 1 ++ X). Proof: Lemma 6.1 (k = 1), then P7, which gives RightAt(1 ++ X, 111110 ++ WR ++ R). Finally 111110 ++ WR ++ R = WR^0 ++ P [1] ++ R.

## 6.6 The event theorems (Theorem 6: the counter law)

Let S(tw) = Σ_{r∈tw}(10r + 14). The following hold for **all** tw (the runs of the trailing digits 2), all a, and all lists X. Here X is the rest of the tape: higher digits, top and high word.

| event | from | to | steps |
|---|---|---|---|
| E0 (digit 0→1) | Ev(enc2 tw ++ WL^a ++ DIG0 ++ X) | Ev(enc0 tw ++ WL^(a+1) ++ DIG1 ++ X) | S + 10a + 20 |
| E1 (digit 1→2) | Ev(enc2 tw ++ WL^a ++ DIG1 ++ X) | Ev(enc0 tw ++ WL^a ++ DIG2 ++ X) | S + 10a + 14 |
| Tα | Ev(enc2 tw ++ Lα ++ X) | Ev(enc0 tw ++ Lβ ++ X) | S + 14 |
| Tβ0 | Ev(enc2 tw ++ Lβ ++ 0 ++ X) | Ev(enc0 tw ++ Lγ ++ 1 ++ X) | S + 26 |
| Tβ1 | Ev(enc2 tw ++ Lβ ++ 101 ++ X) | Ev(enc0 tw ++ Lγ ++ 011 ++ X) | S + 30 |
| Tγ | Ev(enc2 tw ++ Lγ ++ X) | Ev(enc0 tw ++ Lδ ++ X) | S + 20 |
| Tδ | Ev(enc2 tw ++ Lδ ++ X) | Ev(enc0 tw ++ Lε ++ X) | S + 24 |
| Tε | Ev(enc2 tw ++ Lε ++ X) | Ev(enc0 (tw ++ [1]) ++ Lα ++ X) | S + 34 |
| H (halt) | Ev(enc2 tw ++ Lβ ++ 11 ++ X) | ⟨X, 1, 10111111 ++ 0 :: P(rev tw) ++ 11, B⟩; the next step enters H | 6 + Σ_{r∈tw}(6r+8) + 10 |

*Proofs.* Each row is Theorem 6.4 with the stated absorber, followed by a list identity for the result.
- **E0.** A0 with X := 01 ++ X, since DIG0 = 0000 ++ 01. Result: WL^(a+1) ++ 0 :: 101 ++ X = WL^(a+1) ++ DIG1 ++ X. Steps: 9 + 6a + 7 + 4(a+1).
- **E1.** A1 with X := 01 ++ X. Result: WL^a ++ 0 :: 01101 ++ X = WL^a ++ DIG2 ++ X. Steps: 9 + 6a + 5 + 4a.
- **Tα.** A1 with a = 0 and X := 10 ++ X. Result: 0 :: 01110 ++ X = Lβ ++ X. Steps: 9 + 5.
- **Tβ0.** Aβ0. Result: 0 :: 00000101 ++ X = Lγ ++ 1 ++ X. Steps: 9 + 17.
- **Tβ1.** Aβ1. Result: 0 :: 0000010011 ++ X = Lγ ++ 011 ++ X. Steps: 9 + 21.
- **Tγ.** Lγ = 0000 ++ 0010, so use A0 with a = 0 and X := 0010 ++ X (k = 1). Result: WL ++ 0 :: 10010 ++ X = Lδ ++ X. Steps: 9 + 7 + 4.
- **Tδ.** Lδ = WL ++ 01 ++ 0010, so use A1 with a = 1 and X := 0010 ++ X. Result: WL ++ 0 :: 0110010 ++ X = Lε ++ X. Steps: 9 + 11 + 4.
- **Tε.** Lε = WL ++ 001100 ++ 10, so use Aε with X := 10 ++ X (k = 0, e = [1]). Result: enc0 (tw ++ [1]) ++ 0 :: 110 ++ X = enc0 (tw ++ [1]) ++ Lα ++ X. Steps: 9 + 15 + (4 + 6).
- **H.** P1, then Lemma 6.2, then P8, using Lβ ++ 11 = 00111011. ∎

**Interpretation.** This is the counter law, and it holds for every counter size:
- M★ is a base-3 counter. Its digits are dig d, least significant first, and runs WL^a separate them.
- Above the digits sits a top that cycles α → β → γ → δ → ε → α. Each full top cycle appends one digit.
- At β the top also increments a 2-bit counter stored in the high word: h0 → h1 → h2 → h3.
- The machine halts at β when h = h3.

## 6.7 Abstract counter and the derivation of (Z)

**State.** C = (ds, top, h), where:
- ds : List (ℕ × ℕ);
- top ∈ ℕ, with 0..4 = α..ε, and values ≥ 4 read as ε;
- h ∈ ℕ, with values ≥ 3 read as 3.

Its concrete configuration is toZ(C) = Ev(enc ds ++ topL top ++ hL h).

**split ds.** Collects the leading digits ≥ 2 into tw. It returns the first digit d ∈ {0, 1} with its run a and the rest, or "none" if all digits are ≥ 2.

Spec: enc ds = enc2 tw ++ enc ((d, a) :: rest), or enc ds = enc2 tw ++ [] in the "none" case. Proof by induction on ds.

**ctrStep C** returns some (C′, n) or none:
- split = (tw, 0, a, rest): C′ = (zeros tw ++ (1, a+1) :: rest, top, h), n = S(tw) + 10a + 20.
- split = (tw, 1, a, rest): C′ = (zeros tw ++ (2, a) :: rest, top, h), n = S(tw) + 10a + 14.
- split = (tw, none): by (top, h):

| top, h | C′ | n |
|---|---|---|
| α | (zeros tw, β, h) | S + 14 |
| β, h = 0 | (zeros tw, γ, 1) | S + 26 |
| β, h = 1 | (zeros tw, γ, 2) | S + 30 |
| β, h = 2 | (zeros tw, γ, 3) | S + 26 |
| β, h ≥ 3 | none (halting event) | — |
| γ | (zeros tw, δ, h) | S + 20 |
| δ | (zeros tw, ε, h) | S + 24 |
| ε | (zeros tw ++ [(0, 1)], α, h) | S + 34 |

**Theorem 6.5 (soundness of one abstract event).** If ctrStep C = some (C′, n), then runZ n (toZ C) = toZ C′.

*Proof.* Rewrite enc ds by the split spec. Take X = enc rest ++ topL ++ hL, or X = hL, or the tail of hL, as the case requires. Each case is then one row of §6.6. The case identities are:
- h0 = 0 ++ 0101 and h2 = 0 ++ 1101 (Tβ0), with 1 ++ 0101 = h1 and 1 ++ 1101 = h3;
- h1 = 101 ++ 01 (Tβ1), with 011 ++ 01 = h2;
- enc (zeros tw) = enc0 tw;
- enc (zeros tw ++ [(0,1)]) = enc0 (tw ++ [1]) by (I3). ∎

**Theorem 6.6 (iteration).** Define:
- ctrRun 0 C t = (C, t);
- ctrRun (f+1) C t = ctrRun f C′ (t+n) if ctrStep C = some (C′, n), and (C, t) otherwise.

Then ctrRun f C t = (C*, t*) implies t ≤ t* and runZ (t* − t) (toZ C) = toZ C*.

*Proof.* Induction on f, using Theorem 6.5 and Lemma 5.1. ∎

**Corollary 6.7 (the 249,881 witness from the counter law).** Let C₄ = ([], γ, 0).
1. **Start-up (74 steps, direct evaluation).** runZ 74 z₀ = toZ C₄. Before event 4 the tape does not yet have the counter shape.
2. **Counter level.** ctrRun 400 C₄ 0 = (C_fin, 248,714), where C_fin = ([(2,120), (2,39), (2,12), (2,3)], β, 3), and ctrStep C_fin = none. This computation is on tuples of numbers (359 abstract events); it is not a machine run.
3. **Halting event.** Apply row H with tw = [120, 39, 12, 3] and X = 101 (h3 = 11 ++ 101). This gives runZ (6 + Σ(6r+8) + 10) (toZ C_fin) = ⟨101, 1, 10111111 ++ 0 :: P [3, 12, 39, 120] ++ 11, B⟩. The step count is 6 + (6·174 + 32) + 10 = 1,092. This configuration equals z_A, which is a list equality.
4. Hence runZ (74 + 248,714 + 1,092) z₀ = runZ 249,880 z₀ = z_A, which is (Z). The Stage 4 target theorem follows through `certificate_of_run`. ∎

**Machine check of the model (evidence only; the proof is §6.2–6.7).**
- `search/counter_abstract.py` compares toZ C with the real run at every abstract event. It finds 0 mismatches for events 7…363, with the halt at 249,881.
- Events 4…6 were checked with `search/zstate.py`: event 4 at t = 74 is Lγ ++ h0, event 5 is Lδ ++ h0, and event 6 is Lε ++ h0.

## 6.8 What is and is not claimed

- **Claimed:** Theorem 6 (§6.6) for arbitrary tw, a and X. This is a statement about infinitely many configurations. It gives the exact cost f(C) of every event from every counter state of this shape, with no budget.
- **Claimed:** the derivation of (Z) in Corollary 6.7. Apart from the 74 start-up steps, the only computation it uses is the abstract counter iteration.
- **Not claimed:** a closed form for the total halting time as a function of the counter parameters. Also not claimed: any halting or non-halting classification of other machines.

## 6.9 Version 2 amendments (responses to Math RED review 1)

- **M6-01 (fixed).** The missing definitions:
  - topL 0 = Lα, topL 1 = Lβ, topL 2 = Lγ, topL 3 = Lδ, topL (n+4) = Lε;
  - hL 0 = h0, hL 1 = h1, hL 2 = h2, hL (n+3) = h3;
  - zeros tw = tw.map (0, ·), so enc (zeros tw) = enc0 tw by definition.

  In Lean, top and h may be finite inductive types (α..ε and h0..h3), and digits may be a three-valued type. That removes the ≥ conventions entirely.
- **M6-02 (fixed by rewording).** "Reaches the next configuration of the same shape in exactly f(C) steps" means only that runZ f(C) (from) = (to). It does not claim that no earlier time has a configuration of that shape. The same applies to §6.8's "exact cost". A first-hit lemma is not claimed and is not needed for (Z).
- **M6-03, M6-04 (accepted, editorial).** The following steps are used as the reviewer listed them:
  - the digit-case identities enc (zeros tw ++ (1, a+1) :: rest) = enc0 tw ++ WL^(a+1) ++ DIG1 ++ enc rest, and the DIG2 analogue;
  - rev tw ++ [] = rev tw;
  - WR^1 = WR ++ [];
  - map_append;
  - associativity;
  - generalising C and t in Theorem 6.6.
- **M6-05 (accepted).** P1 and P10 also read blank cells from the explicitly empty right list. These cells are part of the explicit configuration, not of a tail.
- **M6-06 (accepted).**
  - The halt occurs at β with h = h3 **and all digits 2**.
  - Besides the counter iteration, the derivation of (Z) also uses the closed list equality with z_A and the symbolic piece evaluations.
  - "Theorem 6" means the table of §6.6.

# Stage 7: closed-form cycle law and an infinite halting family

- Status: 수학검토완료 (Math RED review 1 pass, 2026-10-01; §7.7 amendments are authoritative)
- Goal. Lift the Stage 6 event law, which costs one theorem application per event, to a law for a whole counting cycle. A cycle contains 3ⁿ − 1 regular events and one top event, and the law gives its cost in closed form for **every** n and **every** run vector. Consequences:
  - (a) An infinite family of initial configurations of M★ whose exact halting times are proved by a closed formula. This includes members whose halting time is far beyond simulation, about 3·10²⁹ steps.
  - (b) A phase-level derivation of the blank-tape run with 20 closed-form phase costs instead of 359 event evaluations.
- Notation: as in Stage 6.
  - Run lists **ms** in this stage are written *most significant digit first*: ms = [r_top, …, r_low].
  - The tape encoding uses rev ms, which is least significant first.
  - Weights: the most significant digit has weight 1, the next 3, then 9, and so on.

## 7.1 Definitions

- **Weighted cost and growth.** For c ∈ ℕ:
  - Ψ_c([]) = 0 and Ψ_c(r :: low) = c·(30r + 15c + 53) + Ψ_{3c}(low);
  - G_c([]) = [] and G_c(r :: low) = (r + c) :: G_{3c}(low).
  - Ψ = Ψ₁ and G = G₁. Explicitly, the digit at depth i has weight w = 3^i, adds w·(30r + 15w + 53) to Ψ, and G adds w to its run.
- **Sums.** For q : ℕ → ℕ, Σ_q(tw) = Σ_{r∈tw} q(r).
  - qS(r) = 10r + 14, so S = Σ_{qS} as in Stage 6.
  - qL(r) = 6r + 8, so costL = Σ_{qL}.
  - Every Σ_q is invariant under list reversal.
- **Internal cost.** Φ(ms) = Ψ(ms) − S(G ms). The subtraction is in ℕ and exact, by Lemma 7.3.
- **Law.** For κ, q, a list Y and a map F from run lists to configurations:

    Law(κ, q, Y, F) :⟺ ∀ tw, runZ (κ + Σ_q(tw)) Ev(enc2 tw ++ Y) = F(tw).

  Every row of the Stage 6 table is a Law:
  - E0 at (a, X) is Law(10a + 20, qS, WL^a ++ DIG0 ++ X, tw ↦ Ev(enc0 tw ++ WL^(a+1) ++ DIG1 ++ X)).
  - E1 at (a, X) is Law(10a + 14, qS, WL^a ++ DIG1 ++ X, tw ↦ Ev(enc0 tw ++ WL^a ++ DIG2 ++ X)).
  - Tα, Tβ0, Tβ1, Tγ, Tδ are Laws with qS and κ = 14, 26, 30, 20, 24.
  - Tε is Law(34, qS, Lε ++ X, tw ↦ Ev(enc0 tw ++ WL ++ DIG0 ++ Lα ++ X)), since enc0 (tw ++ [1]) = enc0 tw ++ WL ++ DIG0 by (I3).
  - H is Law(16, qL, Lβ ++ 11 ++ X, tw ↦ ⟨X, 1, 10111111 ++ 0 :: P(rev tw) ++ 11, B⟩).

## 7.2 Arithmetic lemmas

**Lemma 7.1.** G_a(G_b l) = G_{a+b}(l), and |G_c l| = |l|.

*Proof.* Induction on l, generalising a and b. The head is r + b + a = r + (a + b), and the weights satisfy 3a + 3b = 3(a + b). ∎

**Lemma 7.2 (splitting).** For all l and c: Ψ_{3c}(l) = Ψ_c(l) + Ψ_c(G_c l) + Ψ_c(G_{2c} l).

*Proof.* Induction on l, generalising c.
- **Step.** The head contributes (3c)(30r + 45c + 53) on the left. On the right it contributes c(30r + 15c + 53) + c(30(r+c) + 15c + 53) + c(30(r+2c) + 15c + 53) = c(90r + 135c + 159). These are equal.
- **Tails.** For the tails, the IH at weight 3c gives Ψ_{9c}(low) = Ψ_{3c}(low) + Ψ_{3c}(G_{3c} low) + Ψ_{3c}(G_{6c} low). These are the tails of the three right-hand terms, because G_c(r :: low) = (r + c) :: G_{3c} low and G_{2c}(r :: low) = (r + 2c) :: G_{6c} low. ∎

**Lemma 7.3.** If c ≥ 1, then S(G_c l) ≤ Ψ_c(l). Hence Φ(ms) + S(G ms) = Ψ(ms).

*Proof.* Induction on l, and 3c ≥ 1 is preserved. Per digit: 10(r + c) + 14 ≤ 30cr + 15c² + 53c, because cr ≥ r and 53c ≥ 10c + 14 when c ≥ 1. ∎

**Lemma 7.4 (recursion of Φ).** For all r and low:

  Φ(r :: low) = Φ(low) + S(G low) + (10r + 20) + Φ(G low) + S(G² low) + (10(r+1) + 14) + Φ(G² low).

*Proof.*
- By definition, Ψ(r :: low) = 30r + 68 + Ψ₃(low).
- By Lemma 7.2 with c = 1, Ψ₃(low) = Ψ(low) + Ψ(G low) + Ψ(G₂ low), and G₂ = G ∘ G by Lemma 7.1.
- S(G(r :: low)) = 10(r+1) + 14 + S(G₃ low), with G₃ = G ∘ G ∘ G.
- Substitute Ψ(x) = Φ(x) + S(G x) for x = low, G low and G² low (Lemma 7.3). Both sides then equal Φ(low) + Φ(G low) + Φ(G² low) + S(G low) + S(G² low) + 20r + 44. ∎

## 7.3 The lifting theorem

**Theorem 7.5 (Lift).** If Law(κ, q, Y, F), then for every ms:

  runZ (Φ(ms) + κ + Σ_q(rev(G ms))) Ev(enc0(rev ms) ++ Y) = F(rev(G ms)).

*Proof.* Strong induction on |ms|, for all κ, q, Y, F simultaneously.
- **ms = [].** The claim is runZ κ Ev(Y) = F([]), which is the Law at tw = [].
- **ms = r :: low.** By (I3), enc0(rev ms) ++ Y = enc0(rev low) ++ (WL^r ++ DIG0 ++ Y).
  - **(A)** The IH for low, with law E0 at (r, Y), gives Ev(enc0(rev(G low)) ++ WL^(r+1) ++ DIG1 ++ Y). Cost: Φ(low) + 10r + 20 + S(G low).
  - **(B)** The IH for G low (same length, Lemma 7.1), with law E1 at (r+1, Y), gives Ev(enc0(rev(G² low)) ++ WL^(r+1) ++ DIG2 ++ Y). Cost: Φ(G low) + 10(r+1) + 14 + S(G² low).
  - **(C)** Let Y₂ = WL^(r+1) ++ DIG2 ++ Y.
    - The law Law(κ + q(r+1), q, Y₂, tw ↦ F(tw ++ [r+1])) holds. Apply the given Law at tw ++ [r+1], using enc2(tw ++ [r+1]) ++ Y = enc2 tw ++ Y₂ and Σ_q(tw ++ [r+1]) = Σ_q(tw) + q(r+1).
    - The IH for G² low with this law gives F(rev(G³ low) ++ [r+1]) = F(rev(G(r :: low))), since G(r :: low) = (r+1) :: G₃ low. Cost: Φ(G² low) + κ + q(r+1) + Σ_q(rev(G³ low)).
  - The total cost of (A) + (B) + (C) equals Φ(r :: low) + κ + Σ_q(rev(G(r :: low))) by Lemma 7.4.
  - Composition is Lemma 5.1. ∎

**Corollary 7.6 (cycle law).** Suppose Law(κ, qS, Y, tw ↦ Ev(enc0 tw ++ Y′)). Then for every ms:

  runZ (Ψ(ms) + κ) Ev(enc0(rev ms) ++ Y) = Ev(enc0(rev(G ms)) ++ Y′).

*Proof.* Theorem 7.5 together with Φ(ms) + S(G ms) = Ψ(ms) (Lemma 7.3). ∎

**Instances.** For every ms and X, a whole counting cycle, which contains 3^|ms| − 1 regular events and one top event, costs Ψ(ms) + K:

| cycle | from | to | K |
|---|---|---|---|
| α | Lα ++ X | Lβ ++ X | 14 |
| β, low bit 0 | Lβ ++ 0 ++ X | Lγ ++ 1 ++ X | 26 |
| β, carry | Lβ ++ 101 ++ X | Lγ ++ 011 ++ X | 30 |
| γ | Lγ ++ X | Lδ ++ X | 20 |
| δ | Lδ ++ X | Lε ++ X | 24 |
| ε | Lε ++ X | WL ++ DIG0 ++ Lα ++ X, i.e. new run list 1 :: G ms | 34 |

**Theorem 7.7 (halting cycle).** For every ms and X:

  runZ (Φ(ms) + 16 + costL(rev(G ms))) Ev(enc0(rev ms) ++ Lβ ++ 11 ++ X) = ⟨X, 1, 10111111 ++ 0 :: P(G ms) ++ 11, B⟩,

and the next step enters H.

*Proof.* Theorem 7.5 with the law H, using rev(rev(G ms)) = G ms. The last claim is the table entry B1 = 1RH. ∎

## 7.4 An infinite family with exact halting times

**Lemma 7.8 (H is absorbing).** If (runZ m z).s = H, then (runZ (m + k) z).s = H for all k. Consequently, if (runZ n z).s ≠ H, then (runZ m z).s ≠ H for every m ≤ n.

*Proof.* stepZ fixes a configuration in state H (Stage 4); then induction on k. ∎

**Theorem 7.9 (halting family).** For every run list ms, let z_ms = Ev(enc0(rev ms) ++ Lα ++ h3), and

  T(ms) = Ψ(ms) + Ψ(G ms) − R(G² ms) + 31,  where R(l) = Σ_{r∈l}(4r + 6).

Then M★ started at z_ms first enters H at step T(ms):

  (runZ T(ms) z_ms).s = H, and (runZ m z_ms).s ≠ H for every m < T(ms).

*Proof.*
1. The α cycle (Corollary 7.6 with X = h3) takes Ψ(ms) + 14 steps to reach Ev(enc0(rev(G ms)) ++ Lβ ++ h3).
2. Since h3 = 11 ++ 101, Theorem 7.7 with ms := G ms and X = 101 takes Φ(G ms) + 16 + costL(G² ms) more steps. It reaches a configuration in state B whose next step enters H.
3. Let n be the sum of these two step counts. The state at n is B ≠ H, so by Lemma 7.8 no m ≤ n is a halting time. The state at n + 1 is H.
4. Finally, n + 1 = T(ms):
   - Φ(G ms) = Ψ(G ms) − S(G² ms);
   - S − costL = R digit by digit, since (10r + 14) − (6r + 8) = 4r + 6;
   - S(G² ms) ≥ R(G² ms), so the subtraction is exact. ∎

**Remarks.**
- T is a closed formula. Evaluating it takes O(|ms|) arithmetic operations, while the run has length Θ(9^|ms|): for |ms| = n, T(ms) ≥ 15·9^(n−1).
- **Example.** For ms = [1, 1, …, 1] (30 ones), T(ms) = 317,933,687,064,137,791,756,643,725,923 ≈ 3.18·10²⁹. The exact halting time of this configuration is therefore proved, although simulating it is impossible.
- **Evidence (not proof).** `search/cycle_check.py` compares Corollary 7.6 (all tops), the ε case and Theorem 7.9 with real simulation on random ms: 0 mismatches.

## 7.5 The blank-tape run at phase level

**Phase states and costs.** A phase state is (ms, top, h) with all digits 0. One phase applies the cycle law of the current (top, h):
- (ms, α, h) → (G ms, β, h), cost Ψ(ms) + 14;
- (ms, β, h0) → (G ms, γ, h1), Ψ + 26; (ms, β, h1) → (G ms, γ, h2), Ψ + 30; (ms, β, h2) → (G ms, γ, h3), Ψ + 26;
- (ms, γ, h) → (G ms, δ, h), Ψ + 20; (ms, δ, h) → (G ms, ε, h), Ψ + 24;
- (ms, ε, h) → (1 :: G ms, α, h), Ψ + 34;
- (ms, β, h3) is the halting phase (Theorem 7.7).

Each step is sound by Corollary 7.6.

**Phase run from C₄.** C₄ = ([], γ, h0) is Stage 6's configuration after 74 start-up steps. The phase iteration from it gives the following:
- 19 non-halting phases with total cost 151,790, ending at ms_f = [2, 9, 30, 93] (msd-first), β, h3;
- G ms_f = [3, 12, 39, 120];
- the halting phase: Theorem 7.7 with Φ(ms_f) = 96,924 and 16 + costL(G ms_f) = 1,092, i.e. 98,016 steps up to the configuration before the halt;
- total: 74 + 151,790 + 98,016 = 249,880.

The configuration reached equals z_A: by Theorem 7.7 it is ⟨101, 1, 10111111 ++ 0 :: P [3, 12, 39, 120] ++ 11, B⟩, the same configuration as in Corollary 6.7. The kernel evaluates only the 19 closed-form costs Ψ(ms) + K, the value Φ(ms_f), and this list equality.
**Corollary 7.10.** (Z) holds, derived from:
- 74 start-up steps;
- 20 closed-form phase costs;
- Theorem 7.7;
- a list equality.

No event is iterated: the 359 events are covered by 20 applications of Theorem 7.5. ∎

## 7.6 What is and is not claimed

- **Claimed:**
  - Theorem 7.5 and its corollaries for all ms, κ, q, Y, F that satisfy the hypotheses;
  - Theorem 7.9 for every ms, which is an infinite family of halting configurations with exact halting times given by a closed formula;
  - Corollary 7.10.
- **Not claimed:**
  - Anything about configurations outside these shapes.
  - Anything about other machines.
  - That z_ms is reachable from the blank tape. It is not, for most ms. z_ms is an initial configuration with finitely many 1s.

## 7.7 Version 2 amendments (responses to Math RED review 1)

- **M7-01 (fixed).**
  - The bound is T(ms) ≥ 15·9^(n−1) for n = |ms| ≥ 1. The "Θ(9^|ms|)" claim is withdrawn, since T([r]) = 56r + 183 is unbounded at n = 1.
  - Explicit form (checked by the reviewer): T(ms) = 31 + Σ_i [3^i(60 r_i + 60·3^i + 106) − 4 r_i − 8·3^i − 6].
  - The 30-ones example is "infeasible to simulate", not "impossible".
- **M7-02 (fixed).**
  - §7.6 is reworded. Since the blank-tape run halts, only finitely many z_ms are reachable from the blank tape.
  - Example: runZ 77,730 z₀ = z_[1,6,21,66] (msd-first), and T([1,6,21,66]) = 172,151, with 77,730 + 172,151 = 249,881. This is an independent cross-check of Theorem 7.9 against the certificate.
  - At phase level, 77,730 = 74 + 77,656, and the phase state after 18 phases from C₄ is ([1, 6, 21, 66], α, h3). It is proved in Lean as `blank_hits_family`.
- **M7-03 (fixed).** Exactness in Theorem 7.9 follows from this chain:
  - costL(G² ms) ≤ S(G² ms) ≤ Ψ(G ms), the second inequality by Lemma 7.3 at G ms.
  - S = costL + R (Stage 6 `Scost_eq`).
  - Σ_q is invariant under reversal.
  - Writing n = Ψ(ms) + 14 + Φ(G ms) + 16 + costL(G² ms), we get n + 1 = T(ms).
- **M7-04 (fixed).** The phase states are now fully specified.
  - **Configuration of a phase state:** toP(ms, top, h) = Ev(enc0(rev ms) ++ topL top ++ hL h).
  - **Phase step `pStep`:** the table in §7.5, with (ms, β, h3) ↦ none.
  - **Soundness:** pStep p = some (p′, n) ⇒ runZ n (toP p) = toP p′. Each case is Corollary 7.6 with the matching law and X = hL h, or X = the tail of hL h for β. The identities needed:
    - h0 = 0 ++ 0101 and h2 = 0 ++ 1101 (for β with low bit 0);
    - h1 = 101 ++ 01 (for the β carry);
    - for ε, enc0(rev(1 :: G ms)) = enc0(rev(G ms)) ++ WL ++ DIG0 (I3).
  - **Iteration `pRun`:** soundness as in Theorem 6.6.
  - **Halting:** h3 = 11 ++ 101, used in Theorem 7.7.
- **M7-05 (fixed).** The computations in Corollary 7.10 are:
  - the 74-step start-up;
  - the numeric phase iteration (19 closed-form costs);
  - the value Φ(ms_f) + 16 + costL(G ms_f) = 98,016;
  - the list equality with z_A.

  Everything else is a theorem applied symbolically: Corollary 7.6, Theorem 7.7 and the case identities.
- **M7-06 (fixed).** "3^|ms| − 1 regular events" is explanatory only and is not part of any claim. In the instance table, "from/to X" abbreviates Ev(enc0(rev ms) ++ from) and Ev(enc0(rev(G ms)) ++ to), or the ε variant.
- **M7-07 (accepted).** The Lean bookkeeping list is followed:
  - the laws are adapted from the Stage 6 theorems by commuting the cost;
  - the Tε adapter uses enc0_snoc;
  - Lemma 7.4 goes through Lemma 7.3 because of truncated subtraction;
  - the Lift induction is over n, for all ms with |ms| = n.
- **M7-08 (fixed).** Theorem 7.9 is a statement in the zipper model: (runZ T z_ms).s = H and (runZ m z_ms).s ≠ H for m < T. The Stage 4 link to the Int-tape model is stated only for the blank start and is not claimed here.