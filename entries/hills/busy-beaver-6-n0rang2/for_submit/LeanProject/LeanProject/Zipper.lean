import LeanProject.Model

/-!
# A zipper simulator and its correctness

Evaluating `run M n` directly means stacking `n` tape updates, so it is only used on paper.
Computations run on a zipper `⟨l, a, r, s⟩`: `l` lists the cells left of the head (nearest
first), `a` is the scanned cell, `r` lists the cells to the right (nearest first), `s` is the
state. Unvisited cells are materialised as `0` when the head first moves onto them.

For every machine:
* `rep_run` (Lemma 1 and Corollary 1 of `proof.md`): the zipper run represents `run M n`;
* `lengths` (Lemma 2): the list lengths are the distances from the head to `lo M n` and
  `hi M n`;
* `tape_window` and `tape_outside` (Part 4 and Lemma 3): the tape read over `[lo, hi]` from the
  zipper, and zeros outside.
-/

namespace BB6

/-- Zipper configuration. -/
structure Z where
  l : List Bool
  a : Bool
  r : List Bool
  s : St
  deriving DecidableEq

/-- Write `w`, move in direction `d`, enter `nx`. An unmaterialised cell is read as `0`. -/
def moveZ (w : Bool) (d : Dir) (nx : St) (l r : List Bool) : Z :=
  match d with
  | .R =>
    match r with
    | [] => ⟨w :: l, false, [], nx⟩
    | b :: r' => ⟨w :: l, b, r', nx⟩
  | .L =>
    match l with
    | [] => ⟨[], false, w :: r, nx⟩
    | b :: l' => ⟨l', b, w :: r, nx⟩

/-- One zipper step; a zipper in state `H` is left unchanged. -/
def stepZ (M : Machine) : Z → Z
  | ⟨l, a, r, s⟩ =>
    if s = .H then ⟨l, a, r, .H⟩ else
      match M s a with
      | ⟨w, d, nx⟩ => moveZ w d nx l r

/-- `n` zipper steps. The pattern match on the zipper keeps kernel evaluation strict. -/
def runZ (M : Machine) : Nat → Z → Z
  | 0, z => z
  | n + 1, ⟨l, a, r, s⟩ => runZ M n (stepZ M ⟨l, a, r, s⟩)

/-- The zipper of the blank start. -/
def z0 : Z := ⟨[], false, [], .A⟩

theorem runZ_succ (M : Machine) (n : Nat) (z : Z) : runZ M (n + 1) z = runZ M n (stepZ M z) := by
  cases z; rfl

theorem runZ_succ' (M : Machine) :
    ∀ (n : Nat) (z : Z), runZ M (n + 1) z = stepZ M (runZ M n z) := by
  intro n
  induction n with
  | zero => intro z; rw [runZ_succ]; rfl
  | succ n ih => intro z; rw [runZ_succ M (n + 1) z, ih (stepZ M z), runZ_succ M n z]

/-- `z` represents the configuration `c`: same state, and every tape cell agrees. -/
def Rep (z : Z) (c : Cfg) : Prop :=
  z.s = c.state ∧ c.tape c.head = z.a ∧
  (∀ n : Nat, c.tape (c.head + 1 + n) = z.r.getD n false) ∧
  (∀ n : Nat, c.tape (c.head - 1 - n) = z.l.getD n false)

theorem getD_of_len_le : ∀ {l : List Bool} {n : Nat}, l.length ≤ n → l.getD n false = false
  | [], _, _ => rfl
  | _ :: _, 0, h => absurd h (by simp)
  | _ :: t, n + 1, h => by
    rw [List.getD_cons_succ]
    exact getD_of_len_le (l := t) (by simp at h; omega)

theorem rep_init : Rep z0 init := by
  refine ⟨rfl, rfl, ?_, ?_⟩ <;> intro n <;> simp [init, z0]

/-- The halted case of a step, for both simulators. -/
theorem stepZ_halted (M : Machine) (l : List Bool) (a : Bool) (r : List Bool) :
    stepZ M ⟨l, a, r, .H⟩ = ⟨l, a, r, .H⟩ := by
  simp [stepZ]

/-- The working case of a step: both simulators apply the same entry. -/
theorem step_working (M : Machine) {l : List Bool} {a : Bool} {r : List Bool} {s : St} {c : Cfg}
    (hs : s = c.state) (ha : c.tape c.head = a) (hH : ¬ s = .H) {w : Bool} {d : Dir} {nx : St}
    (hE : M s a = ⟨w, d, nx⟩) :
    stepZ M ⟨l, a, r, s⟩ = moveZ w d nx l r ∧
    step M c = ⟨nx, c.head + d.delta, fun i => if i = c.head then w else c.tape i⟩ := by
  have hcH : ¬ c.state = .H := by rw [← hs]; exact hH
  constructor
  · simp only [stepZ, ite_eq_right hH, hE]
  · unfold step
    rw [ite_eq_right hcH, ← hs, ha, hE]

/-- Lemma 1: a zipper step represents a reference step. -/
theorem rep_step (M : Machine) {z : Z} {c : Cfg} (h : Rep z c) : Rep (stepZ M z) (step M c) := by
  obtain ⟨l, a, r, s⟩ := z
  obtain ⟨hs, ha, hr, hl⟩ := h
  dsimp only at hs ha hr hl
  by_cases hH : s = .H
  · subst hH
    rw [stepZ_halted, step_of_halted M hs.symm]
    exact ⟨hs, ha, hr, hl⟩
  · rcases hE : M s a with ⟨w, d, nx⟩
    obtain ⟨e1, e2⟩ := step_working M hs ha hH hE
    rw [e1, e2]
    cases d with
    | R =>
      -- the new head is `c.head + 1`; the old cell `c.head` now holds `w`
      have left : ∀ n : Nat, (if c.head + 1 - 1 - n = c.head then w
          else c.tape (c.head + 1 - 1 - n)) = (w :: l).getD n false := by
        intro n
        cases n with
        | zero => rw [ite_eq_left (by omega)]; rfl
        | succ m =>
          rw [ite_eq_right (by omega), List.getD_cons_succ]
          have e : c.head + 1 - 1 - ((m + 1 : Nat) : Int) = c.head - 1 - (m : Int) := by omega
          rw [e, hl m]
      cases r with
      | nil =>
        refine ⟨rfl, ?_, ?_, left⟩
        · show (if c.head + 1 = c.head then w else c.tape (c.head + 1)) = false
          rw [ite_eq_right (by omega)]
          have := hr 0
          simpa using this
        · intro n
          show (if c.head + 1 + 1 + n = c.head then w
              else c.tape (c.head + 1 + 1 + n)) = ([] : List Bool).getD n false
          rw [ite_eq_right (by omega)]
          have e : c.head + 1 + 1 + (n : Int) = c.head + 1 + ((n + 1 : Nat) : Int) := by omega
          rw [e, hr (n + 1)]; rfl
      | cons b r' =>
        refine ⟨rfl, ?_, ?_, left⟩
        · show (if c.head + 1 = c.head then w else c.tape (c.head + 1)) = b
          rw [ite_eq_right (by omega)]
          have := hr 0
          simpa using this
        · intro n
          show (if c.head + 1 + 1 + n = c.head then w
              else c.tape (c.head + 1 + 1 + n)) = r'.getD n false
          rw [ite_eq_right (by omega)]
          have e : c.head + 1 + 1 + (n : Int) = c.head + 1 + ((n + 1 : Nat) : Int) := by omega
          rw [e, hr (n + 1), List.getD_cons_succ]
    | L =>
      -- the new head is `c.head - 1`; the old cell `c.head` now holds `w`
      have right : ∀ n : Nat, (if c.head + -1 + 1 + n = c.head then w
          else c.tape (c.head + -1 + 1 + n)) = (w :: r).getD n false := by
        intro n
        cases n with
        | zero => rw [ite_eq_left (by omega)]; rfl
        | succ m =>
          rw [ite_eq_right (by omega), List.getD_cons_succ]
          have e : c.head + -1 + 1 + ((m + 1 : Nat) : Int) = c.head + 1 + (m : Int) := by omega
          rw [e, hr m]
      cases l with
      | nil =>
        refine ⟨rfl, ?_, right, ?_⟩
        · show (if c.head + -1 = c.head then w else c.tape (c.head + -1)) = false
          rw [ite_eq_right (by omega)]
          have e : c.head + -1 = c.head - 1 - ((0 : Nat) : Int) := by omega
          rw [e, hl 0]; rfl
        · intro n
          show (if c.head + -1 - 1 - n = c.head then w
              else c.tape (c.head + -1 - 1 - n)) = ([] : List Bool).getD n false
          rw [ite_eq_right (by omega)]
          have e : c.head + -1 - 1 - (n : Int) = c.head - 1 - ((n + 1 : Nat) : Int) := by omega
          rw [e, hl (n + 1)]; rfl
      | cons b l' =>
        refine ⟨rfl, ?_, right, ?_⟩
        · show (if c.head + -1 = c.head then w else c.tape (c.head + -1)) = b
          rw [ite_eq_right (by omega)]
          have e : c.head + -1 = c.head - 1 - ((0 : Nat) : Int) := by omega
          rw [e, hl 0]; rfl
        · intro n
          show (if c.head + -1 - 1 - n = c.head then w
              else c.tape (c.head + -1 - 1 - n)) = l'.getD n false
          rw [ite_eq_right (by omega)]
          have e : c.head + -1 - 1 - (n : Int) = c.head - 1 - ((n + 1 : Nat) : Int) := by omega
          rw [e, hl (n + 1), List.getD_cons_succ]

/-- Corollary 1: the zipper run represents the reference run at every time. -/
theorem rep_run (M : Machine) : ∀ n, Rep (runZ M n z0) (run M n) := by
  intro n
  induction n with
  | zero => exact rep_init
  | succ n ih =>
    rw [runZ_succ', show run M (n + 1) = step M (run M n) from rfl]
    exact rep_step M ih

/-- Lemma 2: the list lengths are the distances from the head to `lo` and `hi`. -/
theorem lengths (M : Machine) : ∀ n,
    ((runZ M n z0).l.length : Int) = (run M n).head - lo M n ∧
    ((runZ M n z0).r.length : Int) = hi M n - (run M n).head := by
  intro n
  induction n with
  | zero => simp [runZ, z0, run, init, lo, hi]
  | succ n ih =>
    have hrep := rep_run M n
    rw [runZ_succ']
    simp only [lo, hi, show run M (n + 1) = step M (run M n) from rfl]
    revert hrep ih
    generalize runZ M n z0 = z
    generalize run M n = c
    generalize lo M n = L
    generalize hi M n = R
    intro ⟨ihl, ihr⟩ hrep
    obtain ⟨l, a, r, s⟩ := z
    obtain ⟨hs, ha, -, -⟩ := hrep
    dsimp only at hs ha ihl ihr
    by_cases hH : s = .H
    · subst hH
      rw [stepZ_halted, step_of_halted M hs.symm]
      simp only [Int.min_def, Int.max_def]
      constructor <;> split <;> omega
    · rcases hE : M s a with ⟨w, d, nx⟩
      obtain ⟨e1, e2⟩ := step_working M hs ha hH hE
      rw [e1, e2]
      cases d with
      | R =>
        cases r <;>
          simp only [moveZ, Dir.delta, List.length_cons, List.length_nil, Int.min_def,
            Int.max_def] at ihl ihr ⊢ <;>
          constructor <;> split <;> omega
      | L =>
        cases l <;>
          simp only [moveZ, Dir.delta, List.length_cons, List.length_nil, Int.min_def,
            Int.max_def] at ihl ihr ⊢ <;>
          constructor <;> split <;> omega

/-- The cells `lo, lo + 1, …` read from the zipper: the left list reversed, the scanned cell,
then the right list. -/
def zcell (z : Z) (k : Nat) : Bool :=
  if k < z.l.length then z.l.getD (z.l.length - 1 - k) false
  else if k = z.l.length then z.a
  else z.r.getD (k - z.l.length - 1) false

theorem tape_window {z : Z} {c : Cfg} {L : Int} (h : Rep z c)
    (hl : (z.l.length : Int) = c.head - L) (k : Nat) : c.tape (L + k) = zcell z k := by
  obtain ⟨_, ha, hr, hlft⟩ := h
  unfold zcell
  by_cases h1 : k < z.l.length
  · rw [ite_eq_left h1]
    have e : L + (k : Int) = c.head - 1 - ((z.l.length - 1 - k : Nat) : Int) := by omega
    rw [e, hlft]
  · rw [ite_eq_right h1]
    by_cases h2 : k = z.l.length
    · rw [ite_eq_left h2]
      have e : L + (k : Int) = c.head := by omega
      rw [e, ha]
    · rw [ite_eq_right h2]
      have e : L + (k : Int) = c.head + 1 + ((k - z.l.length - 1 : Nat) : Int) := by omega
      rw [e, hr]

/-- Lemma 3: cells outside `[L, R]` hold `0`. -/
theorem tape_outside {z : Z} {c : Cfg} {L R : Int} (h : Rep z c)
    (hl : (z.l.length : Int) = c.head - L) (hr : (z.r.length : Int) = R - c.head) (i : Int)
    (hi : i < L ∨ R < i) : c.tape i = false := by
  obtain ⟨_, _, hright, hleft⟩ := h
  rcases hi with hi | hi
  · have hn : ((c.head - 1 - i).toNat : Int) = c.head - 1 - i := Int.toNat_of_nonneg (by omega)
    have e : i = c.head - 1 - ((c.head - 1 - i).toNat : Int) := by omega
    rw [e, hleft]
    exact getD_of_len_le (by omega)
  · have hn : ((i - c.head - 1).toNat : Int) = i - c.head - 1 := Int.toNat_of_nonneg (by omega)
    have e : i = c.head + 1 + ((i - c.head - 1).toNat : Int) := by omega
    rw [e, hright]
    exact getD_of_len_le (by omega)

/-- Number of `true` values among `f 0, …, f (w - 1)`. -/
def countCells (f : Nat → Bool) : Nat → Nat
  | 0 => 0
  | w + 1 => countCells f w + (if f w then 1 else 0)

theorem countOnes_eq {τ : Int → Bool} {L : Int} {f : Nat → Bool} (h : ∀ k : Nat, τ (L + k) = f k) :
    ∀ w, countOnes τ L w = countCells f w := by
  intro w
  induction w with
  | zero => rfl
  | succ w ih => simp only [countOnes, countCells, ih, h w]

end BB6
