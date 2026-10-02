import LeanProject.Counter

/-!
# Closed-form cycle law and an infinite halting family (Stage 7 of `proof.md`)

* `lift` (Theorem 7.5): any event law `Law κ q Y F` lifts to a whole counting cycle, with the
  internal cost `Phi ms` in closed form, for **every** run vector `ms` (most significant first).
* `cycle` (Corollary 7.6): from all digits `0` with runs `ms`, the next all-zero configuration is
  reached after exactly `Psi 1 ms + κ` steps.
* `halting_family` (Theorem 7.9): for every `ms`, M★ started at `zfam ms` first enters `H` at
  step `Tfam ms = Psi 1 ms + Psi 1 (Gr 1 ms) - sumR (Gr 2 ms) + 31`; `big_halting` instantiates it at a
  halting time of about `3.18 · 10^29` (infeasible to simulate; `big_example` evaluates the formula).
* `runZ_249880_phase` (Corollary 7.10): (Z) from 74 start-up steps and 20 closed-form phases;
  `blank_hits_family` (M7-02): the blank-tape run passes through `zfam [1, 6, 21, 66]`.
-/

namespace BB6
namespace Counter

/-! ## 7.1 Definitions -/

def sumq (q : Nat → Nat) : List Nat → Nat
  | [] => 0
  | r :: rs => q r + sumq q rs

def qS (r : Nat) : Nat := 10 * r + 14
def qL (r : Nat) : Nat := 6 * r + 8

/-- Weighted closed-form cycle cost; the head (most significant digit) has weight `c`. -/
def Psi : Nat → List Nat → Nat
  | _, [] => 0
  | c, r :: low => c * (30 * r + 15 * c + 53) + Psi (3 * c) low

/-- Growth of the runs over one counting cycle; the head grows by `c`, the next by `3c`, ... -/
def Gr : Nat → List Nat → List Nat
  | _, [] => []
  | c, r :: low => (r + c) :: Gr (3 * c) low

/-- Internal cost of a counting cycle (Lemma 7.3 makes the subtraction exact). -/
def Phi (ms : List Nat) : Nat := Psi 1 ms - Scost (Gr 1 ms)

/-- An event law: from all digits `2` with runs `tw` before `Y`, `κ + Σ q` steps reach `F tw`. -/
def Law (κ : Nat) (q : Nat → Nat) (Y : List Bool) (F : List Nat → Z) : Prop :=
  ∀ tw, runZ bb6 (κ + sumq q tw) (Ev (enc2 tw ++ Y)) = F tw

/-! ## Sums -/

theorem sumq_append (q : Nat → Nat) :
    ∀ xs ys : List Nat, sumq q (xs ++ ys) = sumq q xs + sumq q ys
  | [], ys => by simp [sumq]
  | x :: xs, ys => by simp only [List.cons_append, sumq, sumq_append q xs ys]; omega

theorem sumq_reverse (q : Nat → Nat) : ∀ xs : List Nat, sumq q xs.reverse = sumq q xs
  | [] => rfl
  | x :: xs => by
    simp only [List.reverse_cons, sumq_append, sumq_reverse q xs, sumq]; omega

theorem Scost_eq_sumq : ∀ tw : List Nat, Scost tw = sumq qS tw
  | [] => rfl
  | r :: tw => by simp only [Scost, sumq, qS, Scost_eq_sumq tw]

theorem costL_eq_sumq : ∀ tw : List Nat, costL tw = sumq qL tw
  | [] => rfl
  | r :: tw => by simp only [costL, sumq, qL, costL_eq_sumq tw]

/-! ## 7.2 Arithmetic lemmas -/

/-- Lemma 7.1. -/
theorem Gr_add : ∀ (l : List Nat) (a b : Nat), Gr a (Gr b l) = Gr (a + b) l
  | [], _, _ => rfl
  | r :: low, a, b => by
    show (r + b + a) :: Gr (3 * a) (Gr (3 * b) low) = (r + (a + b)) :: Gr (3 * (a + b)) low
    rw [Gr_add low, show r + b + a = r + (a + b) by omega, show 3 * a + 3 * b = 3 * (a + b) by omega]

theorem Gr_1_1 (l : List Nat) : Gr 1 (Gr 1 l) = Gr 2 l := Gr_add l 1 1
theorem Gr_1_2 (l : List Nat) : Gr 1 (Gr 2 l) = Gr 3 l := Gr_add l 1 2

theorem length_Gr : ∀ (l : List Nat) (c : Nat), (Gr c l).length = l.length
  | [], _ => rfl
  | _ :: low, c => by simp only [Gr, List.length_cons, length_Gr low]

/-- The per-digit identity behind Lemma 7.2. -/
theorem digit_split (c r : Nat) : (3 * c) * (30 * r + 15 * (3 * c) + 53) =
    c * (30 * r + 15 * c + 53) + c * (30 * (r + c) + 15 * c + 53) +
      c * (30 * (r + 2 * c) + 15 * c + 53) := by
  have H : ∀ a b k : Nat, c * (a * r + b * c + k) = a * (c * r) + b * (c * c) + k * c := by
    intro a b k
    rw [Nat.mul_add, Nat.mul_add, Nat.mul_left_comm c a r, Nat.mul_left_comm c b c, Nat.mul_comm c k]
  have e1 : (3 * c) * (30 * r + 15 * (3 * c) + 53) = 3 * (c * (30 * r + 45 * c + 53)) := by
    rw [Nat.mul_assoc]; congr 2; omega
  have e2 : c * (30 * (r + c) + 15 * c + 53) = c * (30 * r + 45 * c + 53) := by congr 1; omega
  have e3 : c * (30 * (r + 2 * c) + 15 * c + 53) = c * (30 * r + 75 * c + 53) := by congr 1; omega
  rw [e1, e2, e3]
  simp only [H]
  omega

/-- Lemma 7.2 (splitting). -/
theorem Psi_split : ∀ (l : List Nat) (c : Nat),
    Psi (3 * c) l = Psi c l + Psi c (Gr c l) + Psi c (Gr (2 * c) l)
  | [], _ => rfl
  | r :: low, c => by
    show (3 * c) * (30 * r + 15 * (3 * c) + 53) + Psi (3 * (3 * c)) low =
      (c * (30 * r + 15 * c + 53) + Psi (3 * c) low) +
      (c * (30 * (r + c) + 15 * c + 53) + Psi (3 * c) (Gr (3 * c) low)) +
      (c * (30 * (r + 2 * c) + 15 * c + 53) + Psi (3 * c) (Gr (3 * (2 * c)) low))
    rw [Psi_split low (3 * c), show 3 * (2 * c) = 2 * (3 * c) by omega, digit_split c r]
    omega

/-- The per-digit inequality behind Lemma 7.3. -/
theorem digit_ge (c r : Nat) (h : 1 ≤ c) : 10 * (r + c) + 14 ≤ c * (30 * r + 15 * c + 53) := by
  have h1 : r ≤ c * r := Nat.le_mul_of_pos_left r h
  have e : c * (30 * r + 15 * c + 53) = 30 * (c * r) + 15 * (c * c) + 53 * c := by
    rw [Nat.mul_add, Nat.mul_add, Nat.mul_left_comm c 30 r, Nat.mul_left_comm c 15 c,
      Nat.mul_comm c 53]
  omega

/-- Lemma 7.3. -/
theorem Psi_ge : ∀ (l : List Nat) (c : Nat), 1 ≤ c → Scost (Gr c l) ≤ Psi c l
  | [], _, _ => Nat.le_refl 0
  | r :: low, c, h => by
    have ih := Psi_ge low (3 * c) (by omega)
    have hd := digit_ge c r h
    show 10 * (r + c) + 14 + Scost (Gr (3 * c) low) ≤ c * (30 * r + 15 * c + 53) + Psi (3 * c) low
    omega

theorem Phi_add (ms : List Nat) : Phi ms + Scost (Gr 1 ms) = Psi 1 ms := by
  have := Psi_ge ms 1 (Nat.le_refl 1)
  unfold Phi; omega

/-- Lemma 7.4 (recursion of `Phi`). -/
theorem Phi_rec (r : Nat) (low : List Nat) :
    Phi (r :: low) = Phi low + Scost (Gr 1 low) + (10 * r + 20) + Phi (Gr 1 low) +
      Scost (Gr 2 low) + (10 * (r + 1) + 14) + Phi (Gr 2 low) := by
  have hs : Psi 3 low = Psi 1 low + Psi 1 (Gr 1 low) + Psi 1 (Gr 2 low) := Psi_split low 1
  have hP : Psi 1 (r :: low) = 1 * (30 * r + 15 * 1 + 53) + Psi 3 low := rfl
  have hG : Scost (Gr 1 (r :: low)) = 10 * (r + 1) + 14 + Scost (Gr 3 low) := rfl
  have a1 := Phi_add low
  have a2 := Phi_add (Gr 1 low)
  have a3 := Phi_add (Gr 2 low)
  have g0 := Psi_ge (r :: low) 1 (Nat.le_refl 1)
  rw [Gr_1_1] at a2
  rw [Gr_1_2] at a3
  unfold Phi at a1 a2 a3 ⊢
  omega

/-! ## 7.3 The lifting theorem -/

theorem enc0_snoc (l : List Nat) (r : Nat) (Y : List Bool) :
    enc0 (l ++ [r]) ++ Y = enc0 l ++ (repL WL r ++ (DIG0 ++ Y)) := by
  simp only [enc0, List.map_append, List.map_cons, List.map_nil, enc_append, enc, dig,
    List.append_assoc, List.append_nil]

theorem enc2_snoc (l : List Nat) (r : Nat) (Y : List Bool) :
    enc2 (l ++ [r]) ++ Y = enc2 l ++ (repL WL r ++ (DIG2 ++ Y)) := by
  simp only [enc2, List.map_append, List.map_cons, List.map_nil, enc_append, enc, dig,
    List.append_assoc, List.append_nil]

theorem runZ_three {a b c : Nat} {z z1 z2 z3 : Z} (h1 : runZ bb6 a z = z1)
    (h2 : runZ bb6 b z1 = z2) (h3 : runZ bb6 c z2 = z3) : runZ bb6 (a + b + c) z = z3 := by
  rw [runZ_add, runZ_add, h1, h2, h3]

/-- Theorem 7.5 (Lift), by induction on the number of digits. -/
theorem lift : ∀ (n : Nat) (ms : List Nat), ms.length = n →
    ∀ (κ : Nat) (q : Nat → Nat) (Y : List Bool) (F : List Nat → Z), Law κ q Y F →
      runZ bb6 (Phi ms + κ + sumq q (Gr 1 ms).reverse) (Ev (enc0 ms.reverse ++ Y)) =
        F (Gr 1 ms).reverse
  | 0, [], _, κ, q, Y, F, h => by
    show runZ bb6 (0 + κ + 0) (Ev Y) = F []
    rw [Nat.zero_add]
    exact h []
  | 0, _ :: _, hl, _, _, _, _, _ => absurd hl (Nat.succ_ne_zero _)
  | n + 1, [], hl, _, _, _, _, _ => absurd hl (Nat.succ_ne_zero n).symm
  | n + 1, r :: low, hl, κ, q, Y, F, h => by
    have hlow : low.length = n := Nat.succ.inj hl
    have hG1 : (Gr 1 low).length = n := by rw [length_Gr]; exact hlow
    have hG2 : (Gr 2 low).length = n := by rw [length_Gr]; exact hlow
    have lawA : Law (10 * r + 20) qS (repL WL r ++ (DIG0 ++ Y))
        (fun tw => Ev (enc0 tw ++ (repL WL (r + 1) ++ (DIG1 ++ Y)))) := by
      intro tw
      rw [← Scost_eq_sumq, show 10 * r + 20 + Scost tw = Scost tw + 10 * r + 20 by omega]
      exact ev_E0 tw r Y
    have lawB : Law (10 * (r + 1) + 14) qS (repL WL (r + 1) ++ (DIG1 ++ Y))
        (fun tw => Ev (enc0 tw ++ (repL WL (r + 1) ++ (DIG2 ++ Y)))) := by
      intro tw
      rw [← Scost_eq_sumq, show 10 * (r + 1) + 14 + Scost tw = Scost tw + 10 * (r + 1) + 14 by omega]
      exact ev_E1 tw (r + 1) Y
    have lawC : Law (κ + q (r + 1)) q (repL WL (r + 1) ++ (DIG2 ++ Y))
        (fun tw => F (tw ++ [r + 1])) := by
      intro tw
      have e := h (tw ++ [r + 1])
      rw [sumq_append, enc2_snoc] at e
      simp only [sumq] at e
      rw [show κ + q (r + 1) + sumq q tw = κ + (sumq q tw + (q (r + 1) + 0)) by omega]
      exact e
    have A := lift n low hlow _ _ _ _ lawA
    have B := lift n (Gr 1 low) hG1 _ _ _ _ lawB
    have C := lift n (Gr 2 low) hG2 _ _ _ _ lawC
    rw [Gr_1_1] at B
    rw [Gr_1_2] at C
    have eG : (Gr 1 (r :: low)).reverse = (Gr 3 low).reverse ++ [r + 1] := by
      show ((r + 1) :: Gr 3 low).reverse = _
      rw [List.reverse_cons]
    have eS : enc0 (r :: low).reverse ++ Y = enc0 low.reverse ++ (repL WL r ++ (DIG0 ++ Y)) := by
      rw [List.reverse_cons, enc0_snoc]
    have cost : Phi (r :: low) + κ + sumq q (Gr 1 (r :: low)).reverse =
        (Phi low + (10 * r + 20) + sumq qS (Gr 1 low).reverse) +
        (Phi (Gr 1 low) + (10 * (r + 1) + 14) + sumq qS (Gr 2 low).reverse) +
        (Phi (Gr 2 low) + (κ + q (r + 1)) + sumq q (Gr 3 low).reverse) := by
      rw [eG, sumq_append]
      simp only [sumq_reverse, ← Scost_eq_sumq, sumq]
      rw [Phi_rec]
      omega
    rw [cost, eS, eG]
    exact runZ_three A B C

/-- Corollary 7.6 (cycle law): a whole counting cycle costs `Psi 1 ms + κ`. -/
theorem cycle {κ : Nat} {Y Y' : List Bool} (h : Law κ qS Y (fun tw => Ev (enc0 tw ++ Y')))
    (ms : List Nat) :
    runZ bb6 (Psi 1 ms + κ) (Ev (enc0 ms.reverse ++ Y)) = Ev (enc0 (Gr 1 ms).reverse ++ Y') := by
  have e := lift _ ms rfl _ _ _ _ h
  rw [sumq_reverse, ← Scost_eq_sumq] at e
  rw [← Phi_add ms, show Phi ms + Scost (Gr 1 ms) + κ = Phi ms + κ + Scost (Gr 1 ms) by omega]
  exact e

/-! ## The event laws of Stage 6 as `Law`s -/

theorem lawTa (X : List Bool) : Law 14 qS (Lα ++ X) (fun tw => Ev (enc0 tw ++ (Lβ ++ X))) := by
  intro tw; rw [← Scost_eq_sumq, Nat.add_comm]; exact ev_Ta tw X

theorem lawTb0 (X : List Bool) :
    Law 26 qS (Lβ ++ (false :: X)) (fun tw => Ev (enc0 tw ++ (Lγ ++ (true :: X)))) := by
  intro tw; rw [← Scost_eq_sumq, Nat.add_comm]; exact ev_Tb0 tw X

theorem lawTb1 (X : List Bool) :
    Law 30 qS (Lβ ++ ([true, false, true] ++ X))
      (fun tw => Ev (enc0 tw ++ (Lγ ++ ([false, true, true] ++ X)))) := by
  intro tw; rw [← Scost_eq_sumq, Nat.add_comm]; exact ev_Tb1 tw X

theorem lawTc (X : List Bool) : Law 20 qS (Lγ ++ X) (fun tw => Ev (enc0 tw ++ (Lδ ++ X))) := by
  intro tw; rw [← Scost_eq_sumq, Nat.add_comm]; exact ev_Tc tw X

theorem lawTd (X : List Bool) : Law 24 qS (Lδ ++ X) (fun tw => Ev (enc0 tw ++ (Lε ++ X))) := by
  intro tw; rw [← Scost_eq_sumq, Nat.add_comm]; exact ev_Td tw X

theorem lawTe (X : List Bool) :
    Law 34 qS (Lε ++ X) (fun tw => Ev (enc0 tw ++ (repL WL 1 ++ (DIG0 ++ (Lα ++ X))))) := by
  intro tw
  show runZ bb6 (34 + sumq qS tw) (Ev (enc2 tw ++ (Lε ++ X))) =
    Ev (enc0 tw ++ (repL WL 1 ++ (DIG0 ++ (Lα ++ X))))
  rw [← Scost_eq_sumq, Nat.add_comm, ← enc0_snoc]; exact ev_Te' tw X

/-- The halting law: row H of Stage 6 with `q = qL`. -/
theorem lawH (X : List Bool) :
    Law 16 qL (Lβ ++ ([true, true] ++ X))
      (fun tw => ⟨X, true, [true, false, true, true, true, true, true, true] ++
        false :: (Pstk tw.reverse ++ [true, true]), .B⟩) := by
  intro tw
  rw [← costL_eq_sumq, show 16 + costL tw = 6 + costL tw + 10 by omega]
  exact ev_H tw X

/-- Theorem 7.7 (halting cycle). -/
theorem halting_cycle (ms : List Nat) (X : List Bool) :
    runZ bb6 (Phi ms + 16 + costL (Gr 1 ms)) (Ev (enc0 ms.reverse ++ (Lβ ++ ([true, true] ++ X)))) =
      ⟨X, true, [true, false, true, true, true, true, true, true] ++
        false :: (Pstk (Gr 1 ms) ++ [true, true]), .B⟩ := by
  have e := lift _ ms rfl _ _ _ _ (lawH X)
  rw [sumq_reverse, ← costL_eq_sumq, List.reverse_reverse] at e
  exact e

/-- Theorem 7.7, last clause: the configuration reached by `halting_cycle` steps into `H` (L7-01). -/
theorem halting_cycle_halts (ms : List Nat) (X : List Bool) :
    (runZ bb6 (Phi ms + 16 + costL (Gr 1 ms) + 1)
      (Ev (enc0 ms.reverse ++ (Lβ ++ ([true, true] ++ X))))).s = .H := by
  rw [runZ_succ', halting_cycle]; exact halt_next _ _

/-! ## 7.4 An infinite family with exact halting times -/

/-- Lemma 7.8: `H` is absorbing. -/
theorem runZ_H_stable (z : Z) (m : Nat) (h : (runZ bb6 m z).s = .H) :
    ∀ k, (runZ bb6 (m + k) z).s = .H
  | 0 => h
  | k + 1 => by
    rw [← Nat.add_assoc, runZ_succ']
    have ih := runZ_H_stable z m h k
    generalize runZ bb6 (m + k) z = w at ih ⊢
    obtain ⟨l, a, r, s⟩ := w
    simp only at ih
    subst ih
    rw [stepZ_halted]

/-- Lemma 7.8, second part: before a non-halted time, no earlier time is halted (L7-04). -/
theorem runZ_not_H_of_le (z : Z) {m n : Nat} (hmn : m ≤ n) (hn : (runZ bb6 n z).s ≠ .H) :
    (runZ bb6 m z).s ≠ .H := by
  intro hm
  have := runZ_H_stable z m hm (n - m)
  rw [show m + (n - m) = n by omega] at this
  exact hn this

/-- The family member with runs `ms` (most significant first), top `α`, high word `h3`. -/
def zfam (ms : List Nat) : Z := Ev (enc0 ms.reverse ++ (Lα ++ hL .h3))

/-- Its halting time, in closed form. -/
def Tfam (ms : List Nat) : Nat := Psi 1 ms + Psi 1 (Gr 1 ms) - sumR (Gr 2 ms) + 31

/-- Theorem 7.9: for every `ms`, M★ started at `zfam ms` first enters `H` at step `Tfam ms`. -/
theorem halting_family (ms : List Nat) :
    (runZ bb6 (Tfam ms) (zfam ms)).s = .H ∧ ∀ m, m < Tfam ms → (runZ bb6 m (zfam ms)).s ≠ .H := by
  have s1 := cycle (lawTa (hL .h3)) ms
  have s2 := halting_cycle (Gr 1 ms) [true, false, true]
  rw [Gr_1_1] at s2
  have hN : runZ bb6 (Psi 1 ms + 14 + (Phi (Gr 1 ms) + 16 + costL (Gr 2 ms))) (zfam ms) =
      ⟨[true, false, true], true, [true, false, true, true, true, true, true, true] ++
        false :: (Pstk (Gr 2 ms) ++ [true, true]), .B⟩ := by
    rw [runZ_add]; exact (congrArg (runZ bb6 _) s1).trans s2
  have hT : Tfam ms = Psi 1 ms + 14 + (Phi (Gr 1 ms) + 16 + costL (Gr 2 ms)) + 1 := by
    have a := Phi_add (Gr 1 ms)
    have b := Scost_eq (Gr 2 ms)
    rw [Gr_1_1] at a
    unfold Tfam; omega
  constructor
  · rw [hT, runZ_succ', hN]; exact halt_next _ _
  · intro m hm hH
    have := runZ_H_stable (zfam ms) m hH (Psi 1 ms + 14 + (Phi (Gr 1 ms) + 16 + costL (Gr 2 ms)) - m)
    rw [show m + (Psi 1 ms + 14 + (Phi (Gr 1 ms) + 16 + costL (Gr 2 ms)) - m) =
      Psi 1 ms + 14 + (Phi (Gr 1 ms) + 16 + costL (Gr 2 ms)) by omega, hN] at this
    simp at this

/-- A family member far beyond simulation: 30 digits with run 1. -/
theorem big_example : Tfam (List.replicate 30 1) = 317933687064137791756643725923 := by
  decide +kernel

/-- M★ started at `zfam [1, …, 1]` (30 ones) first halts at step 317,933,687,064,137,791,756,643,725,923. -/
theorem big_halting :
    (runZ bb6 317933687064137791756643725923 (zfam (List.replicate 30 1))).s = .H ∧
      ∀ m, m < 317933687064137791756643725923 →
        (runZ bb6 m (zfam (List.replicate 30 1))).s ≠ .H := by
  rw [← big_example]; exact halting_family _

/-! ## 7.5 The blank-tape run at phase level -/

/-- Phase state: all digits `0` with runs `ms` (most significant first), top, high word. -/
structure PS where
  ms : List Nat
  top : Top
  hi : Hi
  deriving DecidableEq, Repr

def PS.toZ (p : PS) : Z := Ev (enc0 p.ms.reverse ++ (topL p.top ++ hL p.hi))

/-- One phase (a whole counting cycle and its top event), with its closed-form cost. -/
def pStep : PS → Option (PS × Nat)
  | ⟨ms, .a, h⟩ => some (⟨Gr 1 ms, .b, h⟩, Psi 1 ms + 14)
  | ⟨ms, .b, .h0⟩ => some (⟨Gr 1 ms, .c, .h1⟩, Psi 1 ms + 26)
  | ⟨ms, .b, .h1⟩ => some (⟨Gr 1 ms, .c, .h2⟩, Psi 1 ms + 30)
  | ⟨ms, .b, .h2⟩ => some (⟨Gr 1 ms, .c, .h3⟩, Psi 1 ms + 26)
  | ⟨_, .b, .h3⟩ => none
  | ⟨ms, .c, h⟩ => some (⟨Gr 1 ms, .d, h⟩, Psi 1 ms + 20)
  | ⟨ms, .d, h⟩ => some (⟨Gr 1 ms, .e, h⟩, Psi 1 ms + 24)
  | ⟨ms, .e, h⟩ => some (⟨1 :: Gr 1 ms, .a, h⟩, Psi 1 ms + 34)

theorem pStep_sound (p p' : PS) (n : Nat) (hs : pStep p = some (p', n)) :
    runZ bb6 n p.toZ = p'.toZ := by
  obtain ⟨ms, top, h⟩ := p
  cases top
  · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact cycle (lawTa (hL h)) ms
  · cases h
    · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact cycle (lawTb0 [false, true, false, true]) ms
    · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact cycle (lawTb1 [false, true]) ms
    · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
      obtain ⟨rfl, rfl⟩ := hs
      exact cycle (lawTb0 [true, true, false, true]) ms
    · simp [pStep] at hs
  · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact cycle (lawTc (hL h)) ms
  · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    exact cycle (lawTd (hL h)) ms
  · simp only [pStep, Option.some.injEq, Prod.mk.injEq] at hs
    obtain ⟨rfl, rfl⟩ := hs
    have e := cycle (lawTe (hL h)) ms
    show runZ bb6 (Psi 1 ms + 34) (Ev (enc0 ms.reverse ++ (Lε ++ hL h))) =
      Ev (enc0 (1 :: Gr 1 ms).reverse ++ (Lα ++ hL h))
    rw [List.reverse_cons, enc0_snoc]
    exact e

def pRun : Nat → PS → Nat → PS × Nat
  | 0, p, t => (p, t)
  | f + 1, p, t =>
    match pStep p with
    | some (p', n) => pRun f p' (t + n)
    | none => (p, t)

theorem pRun_sound : ∀ (f : Nat) (p : PS) (t : Nat),
    t ≤ (pRun f p t).2 ∧ runZ bb6 ((pRun f p t).2 - t) p.toZ = (pRun f p t).1.toZ
  | 0, p, t => by simp [pRun, runZ]
  | f + 1, p, t => by
    simp only [pRun]
    cases hs : pStep p with
    | none => simp [runZ]
    | some x =>
      obtain ⟨p', n⟩ := x
      obtain ⟨h1, h2⟩ := pRun_sound f p' (t + n)
      simp only
      refine ⟨by omega, ?_⟩
      rw [show (pRun f p' (t + n)).2 - t = n + ((pRun f p' (t + n)).2 - (t + n)) by omega,
        runZ_add, pStep_sound _ p' n hs, h2]

/-- Event 4 as a phase state; the same configuration as `C4`. -/
def P4 : PS := ⟨[], .c, .h0⟩

theorem P4_toZ : P4.toZ = C4.toZ := rfl

/-- The last phase state: runs `[2, 9, 30, 93]` (most significant first), top `β`, high word `h3`. -/
def Pfin : PS := ⟨[2, 9, 30, 93], .b, .h3⟩

/-- 19 phases, each a closed-form cost. -/
theorem phase_computation : pRun 19 P4 0 = (Pfin, 151790) := by decide +kernel

theorem Pfin_halting : pStep Pfin = none := by decide +kernel

/-- The halting phase from `Pfin` ends at `z_A`. -/
theorem halting_phase : runZ bb6 98016 Pfin.toZ = Witness.zA := by
  have h := halting_cycle [2, 9, 30, 93] [true, false, true]
  rw [show (98016 : Nat) = Phi [2, 9, 30, 93] + 16 + costL (Gr 1 [2, 9, 30, 93]) by decide +kernel]
  exact h.trans (by decide +kernel)

/-- (Z) from the closed-form phases (Corollary 7.10). -/
theorem runZ_249880_phase : runZ bb6 249880 z0 = Witness.zA := by
  have hs := (pRun_sound 19 P4 0).2
  rw [phase_computation] at hs
  simp only [Nat.sub_zero] at hs
  rw [show (249880 : Nat) = 74 + 151790 + 98016 from rfl, runZ_add, runZ_add, startup, ← P4_toZ,
    hs, halting_phase]

/-- M7-02: the blank-tape run passes through the family member `zfam [1, 6, 21, 66]` at step
77,730, and the halting family then predicts the halt at 77,730 + 172,151 = 249,881. -/
theorem blank_hits_family :
    runZ bb6 77730 z0 = zfam [1, 6, 21, 66] ∧ Tfam [1, 6, 21, 66] = 172151 ∧
      77730 + 172151 = 249881 := by
  refine ⟨?_, by decide +kernel, rfl⟩
  have hs := (pRun_sound 18 P4 0).2
  have hc : pRun 18 P4 0 = (⟨[1, 6, 21, 66], .a, .h3⟩, 77656) := by decide +kernel
  rw [hc] at hs
  simp only [Nat.sub_zero] at hs
  rw [show (77730 : Nat) = 74 + 77656 from rfl, runZ_add, startup, ← P4_toZ, hs]
  rfl

/-- L7-05: the halt of the blank-tape run at step 249,881, derived from the halting family alone. -/
theorem blank_halts_via_family :
    (runZ bb6 249881 z0).s = .H ∧ ∀ m, m < 249881 → (runZ bb6 m z0).s ≠ .H := by
  obtain ⟨h1, h2, _⟩ := blank_hits_family
  obtain ⟨f1, f2⟩ := halting_family [1, 6, 21, 66]
  rw [h2] at f1 f2
  have e : ∀ k, runZ bb6 (77730 + k) z0 = runZ bb6 k (zfam [1, 6, 21, 66]) := by
    intro k; rw [runZ_add, h1]
  constructor
  · rw [show (249881 : Nat) = 77730 + 172151 from rfl, e]; exact f1
  · intro m hm
    have h249880 : (runZ bb6 249880 z0).s ≠ .H := by
      rw [show (249880 : Nat) = 77730 + 172150 from rfl, e]; exact f2 172150 (by decide)
    exact runZ_not_H_of_le z0 (by omega) h249880

end Counter

/-- **Certificate**, proved from the closed-form phase law (Stage 7). -/
theorem bb6_certificate_phase : Certificate := certificate_of_run Counter.runZ_249880_phase

end BB6
