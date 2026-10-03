/-!
# Reference model of the `busy-beaver-6-certificates` hill

This file states, in core Lean 4 (no Mathlib), the semantics of the hill's evaluator `eval.py`
(public part, v0.1.0, tree 86931c1b2f99):

* a 6-state, 2-symbol Turing machine starts in state `A` at head position `0` on an all-zero
  bi-infinite tape (`false` = 0, `true` = 1);
* each step writes, moves one cell and changes state; the transition into `H` also writes and
  moves, and it is counted as a step;
* `lo n` / `hi n` are the leftmost / rightmost head positions over times `0, …, n`, so the
  evaluator's `tape_span` after `N` steps is `hi N - lo N + 1`;
* `ones` is the number of cells holding `1`, stated below in finite-window form.

See `proof.md` (Math RED reviewed) for the correspondence with `eval.py`.
-/

namespace BB6

/-- States: six working states and the halting state `H`. -/
inductive St where
  | A | B | C | D | E | F | H
  deriving DecidableEq, Repr

/-- Head moves. -/
inductive Dir where
  | L | R
  deriving DecidableEq, Repr

/-- A table entry: symbol to write, move, next state. -/
structure Entry where
  write : Bool
  move : Dir
  next : St
  deriving DecidableEq, Repr

/-- A machine gives an entry for every state and scanned symbol; entries at `H` are never used. -/
abbrev Machine := St → Bool → Entry

/-- Head displacement of a move. -/
def Dir.delta : Dir → Int
  | .L => -1
  | .R => 1

/-- A configuration: state, head position and tape. -/
structure Cfg where
  state : St
  head : Int
  tape : Int → Bool

/-- The start: state `A`, head `0`, all-zero tape. -/
def init : Cfg := ⟨.A, 0, fun _ => false⟩

/-- One step of the evaluator. A configuration in state `H` is left unchanged. -/
def step (M : Machine) (c : Cfg) : Cfg :=
  if c.state = .H then c else
    { state := (M c.state (c.tape c.head)).next
      head := c.head + (M c.state (c.tape c.head)).move.delta
      tape := fun i => if i = c.head then (M c.state (c.tape c.head)).write else c.tape i }

/-- The configuration after `n` steps. -/
def run (M : Machine) : Nat → Cfg
  | 0 => init
  | n + 1 => step M (run M n)

/-- Leftmost head position over times `0, …, n`. -/
def lo (M : Machine) : Nat → Int
  | 0 => 0
  | n + 1 => min (lo M n) (run M (n + 1)).head

/-- Rightmost head position over times `0, …, n`. -/
def hi (M : Machine) : Nat → Int
  | 0 => 0
  | n + 1 => max (hi M n) (run M (n + 1)).head

/-- The number of cells holding `1` among `lo, lo + 1, …, lo + w - 1`. -/
def countOnes (τ : Int → Bool) (lo : Int) : Nat → Nat
  | 0 => 0
  | w + 1 => countOnes τ lo w + (if τ (lo + w) then 1 else 0)

/-- `M` halts after exactly `N` steps. -/
def HaltsAt (M : Machine) (N : Nat) : Prop :=
  (run M N).state = .H ∧ ∀ n < N, (run M n).state ≠ .H

/-- Every working state occurs at some time before `N` (the evaluator's `reached`). -/
def ReachesAll (M : Machine) (N : Nat) : Prop :=
  ∀ s : St, s ≠ .H → ∃ n < N, (run M n).state = s

/-- Acceptance by the evaluator's `_run` with step budget `B`: the machine halts after some
`N ≤ B` steps, having reached all six working states. Loading `solution.json` and the
evaluator's range check `10 ≤ B ≤ 2000000` are outside this model (see `proof.md`). -/
def Accepts (M : Machine) (B : Nat) : Prop :=
  ∃ N, N ≤ B ∧ HaltsAt M N ∧ ReachesAll M N

/-! ## General facts about the reference model -/

theorem step_of_halted (M : Machine) {c : Cfg} (h : c.state = .H) : step M c = c := by
  simp [step, h]

/-- `H` is absorbing. -/
theorem run_halted_of_le (M : Machine) {n m : Nat} (h : (run M n).state = .H) (hnm : n ≤ m) :
    (run M m).state = .H := by
  induction m with
  | zero =>
    have : n = 0 := by omega
    subst this; exact h
  | succ m ih =>
    by_cases hn : n = m + 1
    · subst hn; exact h
    · have hm : (run M m).state = .H := ih (by omega)
      simp [run, step_of_halted M hm, hm]

/-- A machine halts after at most one exact number of steps. -/
theorem HaltsAt.unique {M : Machine} {N N' : Nat} (h : HaltsAt M N) (h' : HaltsAt M N') :
    N = N' := by
  rcases Nat.lt_trichotomy N N' with hlt | heq | hgt
  · exact absurd h.1 (h'.2 N hlt)
  · exact heq
  · exact absurd h'.1 (h.2 N' hgt)

theorem lo_le_head (M : Machine) : ∀ n m, m ≤ n → lo M n ≤ (run M m).head := by
  intro n
  induction n with
  | zero =>
    intro m hm
    have : m = 0 := by omega
    subst this; simp [lo, run, init]
  | succ n ih =>
    intro m hm
    simp only [lo]
    by_cases h : m = n + 1
    · subst h; exact Int.min_le_right _ _
    · exact Int.le_trans (Int.min_le_left _ _) (ih m (by omega))

theorem head_le_hi (M : Machine) : ∀ n m, m ≤ n → (run M m).head ≤ hi M n := by
  intro n
  induction n with
  | zero =>
    intro m hm
    have : m = 0 := by omega
    subst this; simp [hi, run, init]
  | succ n ih =>
    intro m hm
    simp only [hi]
    by_cases h : m = n + 1
    · subst h; exact Int.le_max_right _ _
    · exact Int.le_trans (ih m (by omega)) (Int.le_max_left _ _)

theorem exists_head_eq_lo (M : Machine) : ∀ n, ∃ m, m ≤ n ∧ (run M m).head = lo M n := by
  intro n
  induction n with
  | zero => exact ⟨0, Nat.le_refl 0, by simp [lo, run, init]⟩
  | succ n ih =>
    obtain ⟨m, hm, he⟩ := ih
    simp only [lo, Int.min_def]
    split
    · exact ⟨m, by omega, he⟩
    · exact ⟨n + 1, Nat.le_refl _, rfl⟩

theorem exists_head_eq_hi (M : Machine) : ∀ n, ∃ m, m ≤ n ∧ (run M m).head = hi M n := by
  intro n
  induction n with
  | zero => exact ⟨0, Nat.le_refl 0, by simp [hi, run, init]⟩
  | succ n ih =>
    obtain ⟨m, hm, he⟩ := ih
    simp only [hi, Int.max_def]
    split
    · exact ⟨n + 1, Nat.le_refl _, rfl⟩
    · exact ⟨m, by omega, he⟩

end BB6
