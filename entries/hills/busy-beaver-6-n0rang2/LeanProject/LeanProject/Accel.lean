import LeanProject.Zipper

/-!
# Compressed zippers (Stage 5 of `proof.md`)

A tape side is a list of segments: single cells and repetitions `rep w k` of a word `w`. The
operations below preserve the flattened tape, so a compressed zipper `CZ` stands for the zipper
`CZ.toZ`. `stepC` is one machine step on compressed zippers and agrees with `stepZ`
(`stepC_toZ`). All of this holds for every machine and every list of words used by `norm`.
-/

namespace BB6

/-- `w` repeated `k` times. -/
def repL (w : List Bool) : Nat → List Bool
  | 0 => []
  | k + 1 => w ++ repL w k

theorem repL_succ' (w : List Bool) : ∀ k, repL w (k + 1) = repL w k ++ w
  | 0 => by simp [repL]
  | k + 1 => by
    show w ++ repL w (k + 1) = (w ++ repL w k) ++ w
    rw [repL_succ' w k, List.append_assoc]

theorem repL_add (w : List Bool) (k j : Nat) : repL w (k + j) = repL w k ++ repL w j := by
  induction k with
  | zero => simp [repL]
  | succ k ih => rw [Nat.succ_add]; simp [repL, ih, List.append_assoc]

theorem repL_nil : ∀ k, repL [] k = []
  | 0 => rfl
  | k + 1 => by simp [repL, repL_nil k]

/-- Lemma 5.4 (rotation). -/
theorem repL_rotate (x : Bool) (w0 : List Bool) (k : Nat) :
    repL (x :: w0) (k + 1) = x :: (repL (w0 ++ [x]) k ++ w0) := by
  have aux : ∀ k, w0 ++ repL (x :: w0) k = repL (w0 ++ [x]) k ++ w0 := by
    intro k
    induction k with
    | zero => simp [repL]
    | succ k ih =>
      show w0 ++ ((x :: w0) ++ repL (x :: w0) k) = ((w0 ++ [x]) ++ repL (w0 ++ [x]) k) ++ w0
      rw [List.append_assoc (w0 ++ [x]), ← ih]
      simp
  show (x :: w0) ++ repL (x :: w0) k = _
  rw [List.cons_append, aux]

/-- A segment of a tape side. -/
inductive Seg where
  | one (b : Bool)
  | rep (w : List Bool) (k : Nat)
  deriving DecidableEq

/-- The cells of a list of segments. -/
def flat : List Seg → List Bool
  | [] => []
  | Seg.one b :: S => b :: flat S
  | Seg.rep w k :: S => repL w k ++ flat S

theorem flat_ones (cs : List Bool) (S : List Seg) : flat (cs.map Seg.one ++ S) = cs ++ flat S := by
  induction cs with
  | nil => rfl
  | cons c cs ih => simp [flat, ih]

/-- Take `n` leading single cells. -/
def takeOnes : Nat → List Seg → Option (List Bool × List Seg)
  | 0, S => some ([], S)
  | n + 1, Seg.one b :: S =>
    match takeOnes n S with
    | some (cs, R) => some (b :: cs, R)
    | none => none
  | _ + 1, _ => none

theorem takeOnes_flat : ∀ (n : Nat) (S : List Seg) (cs : List Bool) (R : List Seg),
    takeOnes n S = some (cs, R) → flat S = cs ++ flat R
  | 0, S, cs, R, h => by
    simp [takeOnes] at h
    obtain ⟨rfl, rfl⟩ := h
    rfl
  | n + 1, Seg.one b :: S, cs, R, h => by
    simp only [takeOnes] at h
    split at h
    · rename_i cs' R' h'
      simp at h
      obtain ⟨rfl, rfl⟩ := h
      simp [flat, takeOnes_flat n S cs' R' h']
    · simp at h
  | n + 1, [], cs, R, h => by simp [takeOnes] at h
  | n + 1, Seg.rep w k :: S, cs, R, h => by simp [takeOnes] at h

/-- r1: eight leading cells forming `w ++ w` for a known word `w` become `rep w 2`. -/
def r1 (known : List (List Bool)) (S : List Seg) : List Seg :=
  match takeOnes 8 S with
  | some (cs, R) =>
    match known.find? (fun w => decide (cs = w ++ w)) with
    | some w => Seg.rep w 2 :: R
    | none => S
  | none => S

/-- r2: four leading cells forming `w`, then `rep w k`, become `rep w (k + 1)`. -/
def r2 (S : List Seg) : List Seg :=
  match takeOnes 4 S with
  | some (cs, Seg.rep w k :: R) => if cs = w then Seg.rep w (k + 1) :: R else S
  | _ => S

/-- r3: merge a leading `rep w k` with a following `rep w j`, or with four cells forming `w`. -/
def r3 (S : List Seg) : List Seg :=
  match S with
  | Seg.rep w k :: Seg.rep w' j :: R => if w = w' then Seg.rep w (k + j) :: R else S
  | Seg.rep w k :: R =>
    match takeOnes 4 R with
    | some (cs, R') => if cs = w then Seg.rep w (k + 1) :: R' else S
    | none => S
  | _ => S

theorem r1_flat (known : List (List Bool)) (S : List Seg) : flat (r1 known S) = flat S := by
  unfold r1
  split
  · rename_i cs R h
    split
    · rename_i w hw
      have hp := List.find?_some hw
      have hcs : cs = w ++ w := of_decide_eq_true hp
      rw [takeOnes_flat 8 S cs R h, hcs]
      simp [flat, repL]
    · rfl
  · rfl

theorem r2_flat (S : List Seg) : flat (r2 S) = flat S := by
  unfold r2
  split
  · rename_i cs w k R h
    split
    · rename_i hcs
      rw [takeOnes_flat 4 S cs _ h, hcs]
      simp [flat, repL]
    · rfl
  · rfl

theorem r3_flat (S : List Seg) : flat (r3 S) = flat S := by
  unfold r3
  split
  · rename_i w k w' j R
    split
    · rename_i hw
      subst hw
      simp [flat, repL_add]
    · rfl
  · rename_i w k R _
    split
    · rename_i cs R' h
      split
      · rename_i hcs
        simp only [flat]
        rw [takeOnes_flat 4 R cs R' h, hcs, repL_succ', List.append_assoc]
      · rfl
    · rfl
  · rfl

/-- One normalisation pass: the rules at the front, then past a leading single cell. -/
def norm1 (known : List (List Bool)) : Nat → List Seg → List Seg
  | 0, S => r3 (r2 (r1 known S))
  | d + 1, S =>
    match r3 (r2 (r1 known S)) with
    | Seg.one b :: T => Seg.one b :: norm1 known d T
    | T => T

theorem norm1_flat (known : List (List Bool)) : ∀ d S, flat (norm1 known d S) = flat S
  | 0, S => by simp [norm1, r3_flat, r2_flat, r1_flat]
  | d + 1, S => by
    have h0 : flat (r3 (r2 (r1 known S))) = flat S := by rw [r3_flat, r2_flat, r1_flat]
    simp only [norm1]
    generalize r3 (r2 (r1 known S)) = T at h0
    match T, h0 with
    | Seg.one b :: T', h0 =>
      simp only [flat] at h0 ⊢
      rw [norm1_flat known d T', h0]
    | Seg.rep w k :: T', h0 => exact h0
    | [], h0 => exact h0

/-- Normalisation: one pass of the rules at the front (depth 0). Stronger settings do not
reduce the number of single steps for `bb6` (checked with `search/accel_lean_mirror.py`). -/
def norm (known : List (List Bool)) (S : List Seg) : List Seg :=
  norm1 known 0 S

theorem norm_flat (known : List (List Bool)) (S : List Seg) : flat (norm known S) = flat S := by
  simp [norm, norm1_flat]

/-- Take the cell next to the head; an empty side yields a fresh `0`. Taking a cell from a
repetition rotates it (Lemma 5.4). -/
def pop (known : List (List Bool)) : List Seg → Bool × List Seg
  | [] => (false, [])
  | Seg.one b :: S => (b, S)
  | Seg.rep [] _ :: S => pop known S
  | Seg.rep (_ :: _) 0 :: S => pop known S
  | Seg.rep (x :: w0) (k + 1) :: S =>
    (x, norm known (Seg.rep (w0 ++ [x]) k :: (w0.map Seg.one ++ S)))

/-- Lemma 5.5. -/
theorem pop_spec (known : List (List Bool)) : ∀ S : List Seg,
    (pop known S).1 = (flat S).headD false ∧ flat (pop known S).2 = (flat S).tail
  | [] => by simp [pop, flat]
  | Seg.one b :: S => by simp [pop, flat]
  | Seg.rep [] k :: S => by
    have := pop_spec known S
    simp only [pop, flat, repL_nil, List.nil_append]
    exact this
  | Seg.rep (x :: w0) 0 :: S => by
    have := pop_spec known S
    simp only [pop, flat, repL, List.nil_append]
    exact this
  | Seg.rep (x :: w0) (k + 1) :: S => by
    simp only [pop, flat, norm_flat, repL_rotate, flat_ones]
    simp

/-- Compressed zipper. -/
structure CZ where
  L : List Seg
  a : Bool
  R : List Seg
  s : St
  deriving DecidableEq

/-- The zipper a compressed zipper stands for. -/
def CZ.toZ (z : CZ) : Z := ⟨flat z.L, z.a, flat z.R, z.s⟩

/-- One machine step on compressed zippers. -/
def stepC (M : Machine) (known : List (List Bool)) (z : CZ) : CZ :=
  if z.s = .H then z else
    match M z.s z.a with
    | ⟨w, .R, nx⟩ =>
      match pop known z.R with
      | (b, R') => ⟨norm known (Seg.one w :: z.L), b, R', nx⟩
    | ⟨w, .L, nx⟩ =>
      match pop known z.L with
      | (b, L') => ⟨L', b, norm known (Seg.one w :: z.R), nx⟩

theorem moveZ_R (w : Bool) (nx : St) (l r : List Bool) :
    moveZ w .R nx l r = ⟨w :: l, r.headD false, r.tail, nx⟩ := by
  cases r <;> rfl

theorem moveZ_L (w : Bool) (nx : St) (l r : List Bool) :
    moveZ w .L nx l r = ⟨l.tail, l.headD false, w :: r, nx⟩ := by
  cases l <;> rfl

theorem stepC_toZ (M : Machine) (known : List (List Bool)) (z : CZ) :
    (stepC M known z).toZ = stepZ M z.toZ := by
  obtain ⟨L, a, R, s⟩ := z
  by_cases hH : s = .H
  · subst hH
    simp [stepC, CZ.toZ, stepZ]
  · rcases hE : M s a with ⟨w, d, nx⟩
    have hz : stepZ M (CZ.toZ ⟨L, a, R, s⟩) = moveZ w d nx (flat L) (flat R) := by
      simp only [CZ.toZ, stepZ, ite_eq_right hH, hE]
    rw [hz]
    cases d with
    | R =>
      rw [moveZ_R]
      obtain ⟨h1, h2⟩ := pop_spec known R
      simp only [stepC, ite_eq_right hH, hE]
      generalize pop known R = p at h1 h2
      obtain ⟨b, R'⟩ := p
      simp only [CZ.toZ, norm_flat, flat] at h1 h2 ⊢
      rw [h1, h2]
    | L =>
      rw [moveZ_L]
      obtain ⟨h1, h2⟩ := pop_spec known L
      simp only [stepC, ite_eq_right hH, hE]
      generalize pop known L = p at h1 h2
      obtain ⟨b, L'⟩ := p
      simp only [CZ.toZ, norm_flat, flat] at h1 h2 ⊢
      rw [h1, h2]

/-- Lemma 5.1: running `m + n` steps is running `m` steps, then `n`. -/
theorem runZ_add (M : Machine) : ∀ (m n : Nat) (z : Z), runZ M (m + n) z = runZ M n (runZ M m z)
  | 0, n, z => by simp [runZ]
  | m + 1, n, z => by
    rw [show m + 1 + n = (m + n) + 1 by omega, runZ_succ, runZ_add M m n (stepZ M z), runZ_succ]

end BB6
