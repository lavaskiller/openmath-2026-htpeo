import LeanProject.Structural

/-!
# The counter law (Stage 6 of `proof.md`)

M★ is a base-3 counter. An *event configuration* `Ev L` has state `D`, scanned cell 0 and an empty
right list. The event theorems `ev_*` state `runZ bb6 f(C) (Ev from) = Ev to` for **arbitrary**
counter states: symbolic digit lists, symbolic runs and an arbitrary tape beyond the counter
(§6.2–6.6). They do not mention a budget or bound the counter size. As amended in `proof.md` §6.9
(M6-02), they do not claim that no earlier time has a configuration of the same shape. The
corollary iterates the abstract counter with fuel 400; 359 events suffice.

* Pieces `p_*`: fixed finite step sequences with symbolic tails (`rfl`).
* `left_phase`, `right_phase`: the two sweeps of one event, by induction over the carried digits.
* `event_of_absorbs` (Theorem 6.4) and the event theorems `ev_*` (the table of §6.6).
* `ctrStep` / `ctrStep_sound` (Theorem 6.5), `ctrRun` / `ctrRun_sound` (Theorem 6.6).
* `runZ_249880_counter` (Corollary 6.7): (Z) from a 74-step start-up, the abstract counter iteration
  (359 events on tuples of numbers) and the halting theorem `ev_H`.
-/

namespace BB6
namespace Counter

/-! ## 6.1 Definitions -/

def DIG0 : List Bool := [false, false, false, false, false, true]
def DIG1 : List Bool := [false, true, false, true]
def DIG2 : List Bool := [false, false, true, true, false, true]

/-- A base-3 digit. -/
inductive Dg
  | zero
  | one
  | two
  deriving DecidableEq, Repr

def dig : Dg → List Bool
  | .zero => DIG0
  | .one => DIG1
  | .two => DIG2

/-- Counter encoding, least significant digit first (nearest the head first). -/
def enc : List (Dg × Nat) → List Bool
  | [] => []
  | (d, a) :: ds => repL WL a ++ (dig d ++ enc ds)

def enc2 (tw : List Nat) : List Bool := enc (tw.map fun a => (Dg.two, a))
def enc0 (tw : List Nat) : List Bool := enc (tw.map fun a => (Dg.zero, a))

def PUSH : List Bool := [true, true, true, true, true, false]

/-- The right-hand stack left by the left phase; most recently pushed first. -/
def Pstk : List Nat → List Bool
  | [] => []
  | p :: ps => PUSH ++ (repL WR p ++ Pstk ps)

/-- Event configuration. -/
def Ev (L : List Bool) : Z := ⟨false :: true :: L, false, [], .D⟩
/-- Left phase configuration. -/
def LeftAt (Y R : List Bool) : Z := ⟨Y, true, false :: R, .E⟩
/-- Right phase configuration. -/
def RightAt (Q R : List Bool) : Z := ⟨Q, false, R, .D⟩

/-! ## 6.2 Pieces (finite step sequences; the tails `X`, `R`, `Q` are never inspected) -/

theorem p_start (X : List Bool) : runZ bb6 6 (Ev X) = LeftAt X [true, true] := rfl

theorem p_pass (X R : List Bool) :
    runZ bb6 8 (LeftAt (DIG2 ++ X) R) = LeftAt X (PUSH ++ R) := rfl

theorem p_absorb0 (X R : List Bool) :
    runZ bb6 7 (LeftAt ([false, false, false, false] ++ X) R) = RightAt (true :: X) (WR ++ R) :=
  rfl

theorem p_absorb1 (X R : List Bool) :
    runZ bb6 5 (LeftAt ([false, true] ++ X) R) = RightAt ([false, true, true] ++ X) R := rfl

theorem p_beta0 (X R : List Bool) :
    runZ bb6 17 (LeftAt ([false, false, true, true, true, false, false] ++ X) R) =
      RightAt ([false, false, false, false, false, true, false, true] ++ X) R := rfl

theorem p_beta1 (X R : List Bool) :
    runZ bb6 21 (LeftAt ([false, false, true, true, true, false, true, false, true] ++ X) R) =
      RightAt ([false, false, false, false, false, true, false, false, true, true] ++ X) R := rfl

theorem p_eps (X R : List Bool) :
    runZ bb6 9 (LeftAt ([false, false, true, true, false, false] ++ X) R) =
      RightAt (true :: X) (PUSH ++ R) := rfl

theorem p_halt (X R : List Bool) :
    runZ bb6 10 (LeftAt ([false, false, true, true, true, false, true, true] ++ X) R) =
      ⟨X, true, [true, false, true, true, true, true, true, true] ++ false :: R, .B⟩ := rfl

theorem p_pop (Q R : List Bool) :
    runZ bb6 6 (RightAt Q (PUSH ++ R)) = RightAt ([false, false, false, false, true, false] ++ Q) R :=
  rfl

theorem p_end (Q : List Bool) : runZ bb6 3 (RightAt Q [true, true]) = Ev (false :: Q) := rfl

/-- The table entry `B1 = 1RH`: the configuration of `p_halt` steps into `H`. -/
theorem halt_next (X r : List Bool) : (stepZ bb6 ⟨X, true, r, .B⟩).s = .H := by
  cases r <;> rfl

/-! ## 6.3 List identities -/

theorem I1 (R : List Bool) : ∀ k, repL WL2 k ++ false :: R = false :: (repL WR k ++ R)
  | 0 => rfl
  | k + 1 => by
    rw [show repL WL2 (k + 1) = WL2 ++ repL WL2 k from rfl, List.append_assoc, I1 R k]
    rfl

theorem I2 (Q : List Bool) : ∀ k, false :: (repL WR2 k ++ Q) = repL WL k ++ false :: Q
  | 0 => rfl
  | k + 1 => by
    rw [show repL WL (k + 1) = WL ++ repL WL k from rfl, List.append_assoc, ← I2 Q k]
    rfl

theorem enc_append : ∀ (xs ys : List (Dg × Nat)), enc (xs ++ ys) = enc xs ++ enc ys
  | [], _ => rfl
  | (d, a) :: xs, ys => by
    simp only [List.cons_append, enc, enc_append xs ys, List.append_assoc]

theorem Pstk_append : ∀ (xs ys : List Nat), Pstk (xs ++ ys) = Pstk xs ++ Pstk ys
  | [], _ => rfl
  | p :: xs, ys => by
    simp only [List.cons_append, Pstk, Pstk_append xs ys, List.append_assoc]

/-! ## Costs -/

def costL : List Nat → Nat
  | [] => 0
  | r :: rs => 6 * r + 8 + costL rs

def sumR : List Nat → Nat
  | [] => 0
  | p :: ps => 4 * p + 6 + sumR ps

def costR : List Nat → Nat → Nat
  | [], k => 4 * k + 3
  | p :: ps, k => 4 * k + 6 + costR ps p

/-- `S(tw) = Σ (10 r + 14)`: the cost of carrying through the digits `2` with runs `tw`. -/
def Scost : List Nat → Nat
  | [] => 0
  | r :: rs => 10 * r + 14 + Scost rs

theorem costR_eq : ∀ (ps : List Nat) (k : Nat), costR ps k = 4 * k + 3 + sumR ps
  | [], k => by simp [costR, sumR]
  | p :: ps, k => by simp only [costR, sumR, costR_eq ps p]; omega

theorem sumR_append : ∀ (xs ys : List Nat), sumR (xs ++ ys) = sumR xs + sumR ys
  | [], ys => by simp [sumR]
  | x :: xs, ys => by simp only [List.cons_append, sumR, sumR_append xs ys]; omega

theorem sumR_reverse : ∀ xs : List Nat, sumR xs.reverse = sumR xs
  | [] => rfl
  | x :: xs => by simp only [List.reverse_cons, sumR_append, sumR_reverse xs, sumR]; omega

theorem Scost_eq : ∀ tw : List Nat, Scost tw = costL tw + sumR tw
  | [] => rfl
  | r :: tw => by simp only [Scost, costL, sumR, Scost_eq tw]; omega

/-! ## 6.4 Phase lemmas -/

/-- Lemma 6.1. -/
theorem left_sweep (k : Nat) (Y R : List Bool) :
    runZ bb6 (6 * k) (LeftAt (repL WL k ++ Y) R) = LeftAt Y (repL WR k ++ R) := by
  unfold LeftAt
  rw [sweepL, I1]

theorem right_sweep (k : Nat) (Q R : List Bool) :
    runZ bb6 (4 * k) (RightAt Q (repL WR k ++ R)) = RightAt (repL WR2 k ++ Q) R :=
  sweepR k Q R

/-- Lemma 6.2 (left phase): passing the digits `2` with runs `tw`. -/
theorem left_phase : ∀ (tw ps : List Nat) (X R : List Bool),
    runZ bb6 (costL tw) (LeftAt (enc2 tw ++ X) (Pstk ps ++ R)) =
      LeftAt X (Pstk (tw.reverse ++ ps) ++ R)
  | [], _, _, _ => rfl
  | r :: tw, ps, X, R => by
    have e1 : enc2 (r :: tw) ++ X = repL WL r ++ (DIG2 ++ (enc2 tw ++ X)) := by
      simp only [enc2, List.map_cons, enc, dig, List.append_assoc]
    have e2 : PUSH ++ (repL WR r ++ (Pstk ps ++ R)) = Pstk (r :: ps) ++ R := by
      simp only [Pstk, List.append_assoc]
    rw [show costL (r :: tw) = 6 * r + 8 + costL tw from rfl, runZ_add, runZ_add, e1, left_sweep,
      p_pass, e2, left_phase tw (r :: ps)]
    simp [List.reverse_cons, List.append_assoc]

/-- Lemma 6.3 (right phase): unwinding the stack and writing the reset digits. -/
theorem right_phase : ∀ (ps : List Nat) (k : Nat) (Q : List Bool),
    runZ bb6 (costR ps k) (RightAt Q (repL WR k ++ (Pstk ps ++ [true, true]))) =
      Ev (enc0 ps.reverse ++ (repL WL k ++ false :: Q))
  | [], k, Q => by
    rw [show costR [] k = 4 * k + 3 from rfl, runZ_add, right_sweep,
      show Pstk [] ++ [true, true] = [true, true] from rfl, p_end, I2]
    rfl
  | p :: ps, k, Q => by
    rw [show costR (p :: ps) k = 4 * k + 6 + costR ps p from rfl, runZ_add, runZ_add,
      show Pstk (p :: ps) ++ [true, true] = PUSH ++ (repL WR p ++ (Pstk ps ++ [true, true])) by
        simp only [Pstk, List.append_assoc],
      right_sweep, p_pop, right_phase ps p, ← I2 Q k, List.reverse_cons, enc0, enc0,
      List.map_append, enc_append]
    simp only [List.map_cons, List.map_nil, enc, dig, DIG0, List.append_assoc, List.append_nil,
      List.cons_append, List.nil_append]

/-- A left-phase absorber: from `LeftAt Y R` to `RightAt Q (WR^k ++ Pstk e ++ R)` for every `R`. -/
def Absorbs (Y : List Bool) (c k : Nat) (e : List Nat) (Q : List Bool) : Prop :=
  ∀ R, runZ bb6 c (LeftAt Y R) = RightAt Q (repL WR k ++ (Pstk e ++ R))

/-- Theorem 6.4 (event from an absorber), for every list `tw` of carried runs. -/
theorem event_of_absorbs {Y : List Bool} {c k : Nat} {e : List Nat} {Q : List Bool}
    (h : Absorbs Y c k e Q) (tw : List Nat) :
    runZ bb6 (6 + costL tw + c + costR (e ++ tw.reverse) k) (Ev (enc2 tw ++ Y)) =
      Ev (enc0 (tw ++ e.reverse) ++ (repL WL k ++ false :: Q)) := by
  have hl := left_phase tw [] Y [true, true]
  simp only [Pstk, List.nil_append, List.append_nil] at hl
  rw [runZ_add, runZ_add, runZ_add, p_start, hl, h, ← List.append_assoc (Pstk e), ← Pstk_append,
    right_phase, List.reverse_append, List.reverse_reverse]

/-! ## 6.5 Absorbers -/

theorem absorb0 (a : Nat) (X : List Bool) :
    Absorbs (repL WL a ++ ([false, false, false, false] ++ X)) (6 * a + 7) (a + 1) [] (true :: X) := by
  intro R
  rw [runZ_add, left_sweep, p_absorb0]
  simp only [repL, Pstk, List.nil_append, List.append_assoc]

theorem absorb1 (a : Nat) (X : List Bool) :
    Absorbs (repL WL a ++ ([false, true] ++ X)) (6 * a + 5) a [] ([false, true, true] ++ X) := by
  intro R
  rw [runZ_add, left_sweep, p_absorb1]
  simp only [Pstk, List.nil_append]

theorem absorbB0 (X : List Bool) :
    Absorbs ([false, false, true, true, true, false, false] ++ X) 17 0 []
      ([false, false, false, false, false, true, false, true] ++ X) := fun R => p_beta0 X R

theorem absorbB1 (X : List Bool) :
    Absorbs ([false, false, true, true, true, false, true, false, true] ++ X) 21 0 []
      ([false, false, false, false, false, true, false, false, true, true] ++ X) :=
  fun R => p_beta1 X R

theorem absorbE (X : List Bool) :
    Absorbs (WL ++ ([false, false, true, true, false, false] ++ X)) 15 0 [1] (true :: X) := by
  intro R
  have e : WL ++ ([false, false, true, true, false, false] ++ X) =
      repL WL 1 ++ ([false, false, true, true, false, false] ++ X) := by
    simp [repL]
  rw [show (15 : Nat) = 6 * 1 + 9 from rfl, runZ_add, e, left_sweep, p_eps]
  simp only [repL, Pstk, List.nil_append, List.append_nil, List.append_assoc]

/-! ## 6.6 The event theorems (the counter law) -/

def Lα : List Bool := [false, true, true, false]
def Lβ : List Bool := [false, false, true, true, true, false]
def Lγ : List Bool := [false, false, false, false, false, false, true, false]
def Lδ : List Bool := [false, false, false, true, false, true, false, false, true, false]
def Lε : List Bool := [false, false, false, true, false, false, true, true, false, false, true, false]

/-- `zeros tw`: the digits `0` with runs `tw`. -/
def zeros (tw : List Nat) : List (Dg × Nat) := tw.map fun a => (Dg.zero, a)

/-- E0: a digit `0` absorbs the carry and becomes `1`; its run grows by one. -/
theorem ev_E0 (tw : List Nat) (a : Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 10 * a + 20) (Ev (enc2 tw ++ (repL WL a ++ (DIG0 ++ X)))) =
      Ev (enc0 tw ++ (repL WL (a + 1) ++ (DIG1 ++ X))) := by
  have h := event_of_absorbs (absorb0 a ([false, true] ++ X)) tw
  have hc : 6 + costL tw + (6 * a + 7) + costR ([] ++ tw.reverse) (a + 1) =
      Scost tw + 10 * a + 20 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- E1: a digit `1` absorbs the carry and becomes `2`. -/
theorem ev_E1 (tw : List Nat) (a : Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 10 * a + 14) (Ev (enc2 tw ++ (repL WL a ++ (DIG1 ++ X)))) =
      Ev (enc0 tw ++ (repL WL a ++ (DIG2 ++ X))) := by
  have h := event_of_absorbs (absorb1 a ([false, true] ++ X)) tw
  have hc : 6 + costL tw + (6 * a + 5) + costR ([] ++ tw.reverse) a = Scost tw + 10 * a + 14 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tα: the carry reaches the top `α`, which becomes `β`. -/
theorem ev_Ta (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 14) (Ev (enc2 tw ++ (Lα ++ X))) = Ev (enc0 tw ++ (Lβ ++ X)) := by
  have h := event_of_absorbs (absorb1 0 ([true, false] ++ X)) tw
  have hc : 6 + costL tw + (6 * 0 + 5) + costR ([] ++ tw.reverse) 0 = Scost tw + 14 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tβ0: at `β` the low bit of the high word goes `0 → 1`, and the top becomes `γ`. -/
theorem ev_Tb0 (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 26) (Ev (enc2 tw ++ (Lβ ++ (false :: X)))) =
      Ev (enc0 tw ++ (Lγ ++ (true :: X))) := by
  have h := event_of_absorbs (absorbB0 X) tw
  have hc : 6 + costL tw + 17 + costR ([] ++ tw.reverse) 0 = Scost tw + 26 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tβ1: at `β` the high word carries `101 → 011`, and the top becomes `γ`. -/
theorem ev_Tb1 (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 30) (Ev (enc2 tw ++ (Lβ ++ ([true, false, true] ++ X)))) =
      Ev (enc0 tw ++ (Lγ ++ ([false, true, true] ++ X))) := by
  have h := event_of_absorbs (absorbB1 X) tw
  have hc : 6 + costL tw + 21 + costR ([] ++ tw.reverse) 0 = Scost tw + 30 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tγ: `γ` becomes `δ`. -/
theorem ev_Tc (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 20) (Ev (enc2 tw ++ (Lγ ++ X))) = Ev (enc0 tw ++ (Lδ ++ X)) := by
  have h := event_of_absorbs (absorb0 0 ([false, false, true, false] ++ X)) tw
  have hc : 6 + costL tw + (6 * 0 + 7) + costR ([] ++ tw.reverse) (0 + 1) = Scost tw + 20 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tδ: `δ` becomes `ε`. -/
theorem ev_Td (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 24) (Ev (enc2 tw ++ (Lδ ++ X))) = Ev (enc0 tw ++ (Lε ++ X)) := by
  have h := event_of_absorbs (absorb1 1 ([false, false, true, false] ++ X)) tw
  have hc : 6 + costL tw + (6 * 1 + 5) + costR ([] ++ tw.reverse) 1 = Scost tw + 24 := by
    simp only [List.nil_append, costR_eq, sumR_reverse, Scost_eq]; omega
  rw [hc] at h
  simp only [List.reverse_nil, List.append_nil] at h
  exact h

/-- Tε: `ε` becomes `α` and the counter gains a new most significant digit `0` with run 1. -/
theorem ev_Te (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 34) (Ev (enc2 tw ++ (Lε ++ X))) =
      Ev (enc (zeros tw ++ [(Dg.zero, 1)]) ++ (Lα ++ X)) := by
  have h := event_of_absorbs (absorbE ([true, false] ++ X)) tw
  have hc : 6 + costL tw + 15 + costR ([1] ++ tw.reverse) 0 = Scost tw + 34 := by
    simp only [costR_eq, sumR_append, sumR_reverse, Scost_eq, sumR]; omega
  rw [hc] at h
  simp only [List.reverse_cons, List.reverse_nil, List.nil_append, enc0, List.map_append,
    List.map_cons, List.map_nil] at h
  exact h

/-- Tε in the form of `proof.md`: the new digit list is `enc0 (tw ++ [1])` (L6-04). -/
theorem ev_Te' (tw : List Nat) (X : List Bool) :
    runZ bb6 (Scost tw + 34) (Ev (enc2 tw ++ (Lε ++ X))) = Ev (enc0 (tw ++ [1]) ++ (Lα ++ X)) := by
  rw [ev_Te]
  simp only [enc0, zeros, List.map_append, List.map_cons, List.map_nil]

/-- H: at `β` with high word `11…`, the machine reaches the configuration whose next step halts. -/
theorem ev_H (tw : List Nat) (X : List Bool) :
    runZ bb6 (6 + costL tw + 10) (Ev (enc2 tw ++ ([false, false, true, true, true, false, true, true] ++ X))) =
      ⟨X, true, [true, false, true, true, true, true, true, true] ++
        false :: (Pstk tw.reverse ++ [true, true]), .B⟩ := by
  have hl := left_phase tw [] ([false, false, true, true, true, false, true, true] ++ X) [true, true]
  simp only [Pstk, List.nil_append, List.append_nil] at hl
  rw [runZ_add, runZ_add, p_start, hl, p_halt]

/-- Row H composed with `halt_next`: after `6 + costL tw + 11` steps the state is `H` (L6-05). -/
theorem ev_H_halts (tw : List Nat) (X : List Bool) :
    (runZ bb6 (6 + costL tw + 10 + 1)
      (Ev (enc2 tw ++ ([false, false, true, true, true, false, true, true] ++ X)))).s = .H := by
  rw [runZ_add, ev_H, runZ_one]
  exact halt_next _ _

/-- The cost of Theorem 6.4 in closed form `N` (L6-03). -/
theorem event_cost (tw e : List Nat) (c k : Nat) :
    6 + costL tw + c + costR (e ++ tw.reverse) k = 9 + c + 4 * k + Scost tw + sumR e := by
  simp only [costR_eq, sumR_append, sumR_reverse, Scost_eq]; omega

/-! ## 6.7 The abstract counter -/

inductive Top
  | a
  | b
  | c
  | d
  | e
  deriving DecidableEq, Repr

inductive Hi
  | h0
  | h1
  | h2
  | h3
  deriving DecidableEq, Repr

def topL : Top → List Bool
  | .a => Lα
  | .b => Lβ
  | .c => Lγ
  | .d => Lδ
  | .e => Lε

def hL : Hi → List Bool
  | .h0 => [false, false, true, false, true]
  | .h1 => [true, false, true, false, true]
  | .h2 => [false, true, true, false, true]
  | .h3 => [true, true, true, false, true]

/-- Abstract counter state: digits (least significant first), top shape, high word. -/
structure CS where
  ds : List (Dg × Nat)
  top : Top
  hi : Hi
  deriving DecidableEq, Repr

def CS.toZ (c : CS) : Z := Ev (enc c.ds ++ (topL c.top ++ hL c.hi))

/-- Leading digits `2` (their runs), then the first digit `0`/`1` (`false`/`true`) if any. -/
def split : List (Dg × Nat) → List Nat × Option (Bool × Nat × List (Dg × Nat))
  | [] => ([], none)
  | (.zero, a) :: ds => ([], some (false, a, ds))
  | (.one, a) :: ds => ([], some (true, a, ds))
  | (.two, a) :: ds => (a :: (split ds).1, (split ds).2)

def encO : Option (Bool × Nat × List (Dg × Nat)) → List Bool
  | none => []
  | some (false, a, rest) => repL WL a ++ (DIG0 ++ enc rest)
  | some (true, a, rest) => repL WL a ++ (DIG1 ++ enc rest)

theorem split_spec : ∀ ds, enc ds = enc2 (split ds).1 ++ encO (split ds).2
  | [] => rfl
  | (.zero, _) :: _ => rfl
  | (.one, _) :: _ => rfl
  | (.two, a) :: ds => by
    show repL WL a ++ (DIG2 ++ enc ds) = enc2 (a :: (split ds).1) ++ encO (split ds).2
    rw [split_spec ds]
    simp only [enc2, List.map_cons, enc, dig, List.append_assoc]

/-- The top event when every digit is `2`; `none` is the halting event. -/
def topStep (tw : List Nat) : Top → Hi → Option (CS × Nat)
  | .a, h => some (⟨zeros tw, .b, h⟩, Scost tw + 14)
  | .b, .h0 => some (⟨zeros tw, .c, .h1⟩, Scost tw + 26)
  | .b, .h1 => some (⟨zeros tw, .c, .h2⟩, Scost tw + 30)
  | .b, .h2 => some (⟨zeros tw, .c, .h3⟩, Scost tw + 26)
  | .b, .h3 => none
  | .c, h => some (⟨zeros tw, .d, h⟩, Scost tw + 20)
  | .d, h => some (⟨zeros tw, .e, h⟩, Scost tw + 24)
  | .e, h => some (⟨zeros tw ++ [(.zero, 1)], .a, h⟩, Scost tw + 34)

/-- One abstract event: the next state and its exact cost `f(C)`, or `none` at the halting event. -/
def ctrStep (c : CS) : Option (CS × Nat) :=
  match split c.ds with
  | (tw, some (false, a, rest)) =>
    some (⟨zeros tw ++ (.one, a + 1) :: rest, c.top, c.hi⟩, Scost tw + 10 * a + 20)
  | (tw, some (true, a, rest)) =>
    some (⟨zeros tw ++ (.two, a) :: rest, c.top, c.hi⟩, Scost tw + 10 * a + 14)
  | (tw, none) => topStep tw c.top c.hi

theorem topStep_sound (tw : List Nat) (t : Top) (h : Hi) (c' : CS) (n : Nat)
    (hs : topStep tw t h = some (c', n)) :
    runZ bb6 n (Ev (enc2 tw ++ (topL t ++ hL h))) = c'.toZ := by
  cases t
  · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact ev_Ta tw (hL h)
  · cases h
    · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact ev_Tb0 tw [false, true, false, true]
    · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact ev_Tb1 tw [false, true]
    · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact ev_Tb0 tw [true, true, false, true]
    · simp [topStep] at hs
  · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact ev_Tc tw (hL h)
  · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact ev_Td tw (hL h)
  · simp only [topStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact ev_Te tw (hL h)

/-- Theorem 6.5: one abstract event is exactly `n` machine steps, for every counter state. -/
theorem ctrStep_sound (c c' : CS) (n : Nat) (hs : ctrStep c = some (c', n)) :
    runZ bb6 n c.toZ = c'.toZ := by
  obtain ⟨ds, top, hi⟩ := c
  have hsp := split_spec ds
  simp only [ctrStep] at hs
  simp only [CS.toZ]
  revert hs hsp
  generalize split ds = p
  intro hs hsp
  rcases p with ⟨tw, _ | ⟨b, a, rest⟩⟩
  · dsimp only at hs hsp
    rw [hsp]
    simp only [encO, List.append_nil]
    exact topStep_sound tw top hi c' n hs
  · cases b
    · simp only [Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      dsimp only at hsp
      rw [hsp]
      simp only [encO, enc_append, enc, dig, List.append_assoc]
      exact ev_E0 tw a _
    · simp only [Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      dsimp only at hsp
      rw [hsp]
      simp only [encO, enc_append, enc, dig, List.append_assoc]
      exact ev_E1 tw a _

/-- Iterate abstract events, accumulating their costs; stops at the halting event. -/
def ctrRun : Nat → CS → Nat → CS × Nat
  | 0, c, t => (c, t)
  | f + 1, c, t =>
    match ctrStep c with
    | some (c', n) => ctrRun f c' (t + n)
    | none => (c, t)

/-- Theorem 6.6. -/
theorem ctrRun_sound : ∀ (f : Nat) (c : CS) (t : Nat),
    t ≤ (ctrRun f c t).2 ∧ runZ bb6 ((ctrRun f c t).2 - t) c.toZ = (ctrRun f c t).1.toZ
  | 0, c, t => by simp [ctrRun, runZ]
  | f + 1, c, t => by
    simp only [ctrRun]
    cases hs : ctrStep c with
    | none => simp [runZ]
    | some p =>
      obtain ⟨c', n⟩ := p
      obtain ⟨h1, h2⟩ := ctrRun_sound f c' (t + n)
      simp only
      refine ⟨by omega, ?_⟩
      rw [show (ctrRun f c' (t + n)).2 - t = n + ((ctrRun f c' (t + n)).2 - (t + n)) by omega,
        runZ_add, ctrStep_sound _ c' n hs, h2]

/-! ## Corollary 6.7: the 249,881 witness from the counter law -/

/-- Event 4: empty counter, top `γ`, high word `h0`. -/
def C4 : CS := ⟨[], .c, .h0⟩

/-- The last event: digits `2 2 2 2` with runs 120, 39, 12, 3, top `β`, high word `h3`. -/
def Cfin : CS := ⟨[(.two, 120), (.two, 39), (.two, 12), (.two, 3)], .b, .h3⟩

/-- Start-up (74 steps, before the counter shape exists): direct evaluation. -/
theorem startup : runZ bb6 74 z0 = C4.toZ := by decide +kernel

/-- The counter-level computation: 359 abstract events on tuples of numbers. -/
theorem counter_computation : ctrRun 400 C4 0 = (Cfin, 248714) := by decide +kernel

theorem Cfin_halting : ctrStep Cfin = none := by decide +kernel

/-- The halting event, from `ev_H`, ends at `z_A`. -/
theorem halting_segment : runZ bb6 1092 Cfin.toZ = Witness.zA := by
  have h := ev_H [120, 39, 12, 3] [true, false, true]
  have e : Cfin.toZ =
      Ev (enc2 [120, 39, 12, 3] ++ ([false, false, true, true, true, false, true, true] ++
        [true, false, true])) := by decide +kernel
  rw [e, show (1092 : Nat) = 6 + costL [120, 39, 12, 3] + 10 from rfl, h]
  decide +kernel

/-- (Z) from the counter law. -/
theorem runZ_249880_counter : runZ bb6 249880 z0 = Witness.zA := by
  have hs := (ctrRun_sound 400 C4 0).2
  rw [counter_computation] at hs
  simp only [Nat.sub_zero] at hs
  rw [show (249880 : Nat) = 74 + 248714 + 1092 from rfl, runZ_add, runZ_add, startup, hs,
    halting_segment]

end Counter

/-- **Certificate**, proved from the counter law (Stage 6). -/
theorem bb6_certificate_counter : Certificate := certificate_of_run Counter.runZ_249880_counter

/-- **Acceptance**, proved from the counter law (Stage 6). -/
theorem bb6_accepts_counter (B : Nat) : Accepts bb6 B ↔ 249881 ≤ B :=
  accepts_of_certificate bb6_certificate_counter B

end BB6
