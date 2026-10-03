import LeanProject.Accel
import LeanProject.Witness249881

/-!
# (Z) by structural rules (Stage 5 of `proof.md`)

* `sweepL`, `sweepR`: sweeping `k` blocks takes exactly `6k` / `4k` steps, for **every** `k` and
  arbitrary surrounding tape (proved by induction, not by computation).
* `accRun`: an accelerated run on compressed zippers that applies a whole sweep at once when the
  rule matches and otherwise makes one machine step; `accRun_sound` shows it agrees with the
  machine for any fuel.
* `acc_computation`: the only computation left. It uses about 7,900 single steps and 1,039 sweeps
  instead of 249,880 steps.
-/

namespace BB6

def WL : List Bool := [false, false, false, true]
def WL2 : List Bool := [false, true, true, true]
def WR : List Bool := [true, true, true, false]
def WR2 : List Bool := [false, false, true, false]

/-- The words `norm` compresses: all rotations of `0001` and of `0111`. -/
def KNOWN : List (List Bool) :=
  [[false, false, false, true], [false, false, true, false], [false, true, false, false],
   [true, false, false, false], [false, true, true, true], [true, true, true, false],
   [true, true, false, true], [true, false, true, true]]

/-- One block of the left sweep (entries E1, B0, C0, A1, A1, A0); the tails are not inspected. -/
theorem sweepL_one (l r : List Bool) :
    runZ bb6 6 ⟨false :: false :: false :: true :: l, true, r, .E⟩ =
      ⟨l, true, false :: true :: true :: true :: r, .E⟩ := by
  rfl

/-- One block of the right sweep (entries D0, F1, D1, D1); the tails are not inspected. -/
theorem sweepR_one (l r : List Bool) :
    runZ bb6 4 ⟨l, false, true :: true :: true :: false :: r, .D⟩ =
      ⟨false :: false :: true :: false :: l, false, r, .D⟩ := by
  rfl

/-- Lemma 5.2: the left sweep over `k` blocks takes `6k` steps, for every `k`. -/
theorem sweepL : ∀ (k : Nat) (l r : List Bool),
    runZ bb6 (6 * k) ⟨repL WL k ++ l, true, r, .E⟩ = ⟨l, true, repL WL2 k ++ r, .E⟩
  | 0, l, r => by simp [repL, runZ]
  | k + 1, l, r => by
    rw [show 6 * (k + 1) = 6 + 6 * k by omega, runZ_add]
    have e : repL WL (k + 1) ++ l = false :: false :: false :: true :: (repL WL k ++ l) := by
      simp [repL, WL]
    rw [e, sweepL_one, sweepL k l]
    simp [repL_succ', WL2]

/-- Lemma 5.3: the right sweep over `k` blocks takes `4k` steps, for every `k`. -/
theorem sweepR : ∀ (k : Nat) (l r : List Bool),
    runZ bb6 (4 * k) ⟨l, false, repL WR k ++ r, .D⟩ = ⟨repL WR2 k ++ l, false, r, .D⟩
  | 0, l, r => by simp [repL, runZ]
  | k + 1, l, r => by
    rw [show 4 * (k + 1) = 4 + 4 * k by omega, runZ_add]
    have e : repL WR (k + 1) ++ r = true :: true :: true :: false :: (repL WR k ++ r) := by
      simp [repL, WR]
    rw [e, sweepR_one, sweepR k]
    simp [repL_succ', WR2]

theorem runZ_one (M : Machine) (z : Z) : runZ M 1 z = stepZ M z := by
  rw [show (1 : Nat) = 0 + 1 from rfl, runZ_succ]; rfl

/-- One accelerated step: a whole sweep if the rule applies, else one machine step. -/
def accStep (z : CZ) : Nat × CZ :=
  match z with
  | ⟨Seg.rep w k :: L', true, R, .E⟩ =>
    if w = WL then (6 * k, ⟨L', true, norm KNOWN (Seg.rep WL2 k :: R), .E⟩)
    else (1, stepC bb6 KNOWN z)
  | ⟨L, false, Seg.rep w k :: R', .D⟩ =>
    if w = WR then (4 * k, ⟨norm KNOWN (Seg.rep WR2 k :: L), false, R', .D⟩)
    else (1, stepC bb6 KNOWN z)
  | _ => (1, stepC bb6 KNOWN z)

/-- Lemma 5.6. -/
theorem accStep_sound (z : CZ) : runZ bb6 (accStep z).1 z.toZ = (accStep z).2.toZ := by
  unfold accStep
  split
  · split
    · rename_i hw
      subst hw
      simp only [CZ.toZ, flat, norm_flat]
      exact sweepL _ _ _
    · rw [runZ_one, stepC_toZ]
  · split
    · rename_i hw
      subst hw
      simp only [CZ.toZ, flat, norm_flat]
      exact sweepR _ _ _
    · rw [runZ_one, stepC_toZ]
  · rw [runZ_one, stepC_toZ]

/-- The accelerated run: stops at the configuration whose next step enters `H`. -/
def accRun : Nat → CZ → Nat → Nat × CZ
  | 0, z, acc => (acc, z)
  | f + 1, z, acc =>
    if (bb6 z.s z.a).next = .H then (acc, z) else
      match accStep z with
      | (n, z') => accRun f z' (acc + n)

/-- Lemma 5.7. -/
theorem accRun_sound : ∀ (f : Nat) (z : CZ) (acc : Nat),
    acc ≤ (accRun f z acc).1 ∧ runZ bb6 ((accRun f z acc).1 - acc) z.toZ = (accRun f z acc).2.toZ
  | 0, z, acc => by simp [accRun, runZ]
  | f + 1, z, acc => by
    have hsound := accStep_sound z
    simp only [accRun]
    split
    · simp [runZ]
    · generalize accStep z = p at hsound ⊢
      obtain ⟨n, z'⟩ := p
      obtain ⟨h1, h2⟩ := accRun_sound f z' (acc + n)
      simp only at hsound ⊢
      refine ⟨by omega, ?_⟩
      rw [show (accRun f z' (acc + n)).1 - acc = n + ((accRun f z' (acc + n)).1 - (acc + n)) by
        omega, runZ_add, hsound, h2]

def cz0 : CZ := ⟨[], false, [], .A⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The finite computation (i): about 7,900 single steps and 1,039 sweeps. -/
theorem acc_computation :
    (accRun 10000 cz0 0).1 = 249880 ∧ (accRun 10000 cz0 0).2.toZ = Witness.zA := by
  decide +kernel

/-- (Z), proved structurally: no evaluation of the 249,880-step run. -/
theorem runZ_249880_structural : runZ bb6 249880 z0 = Witness.zA := by
  obtain ⟨_, h⟩ := accRun_sound 10000 cz0 0
  obtain ⟨h1, h2⟩ := acc_computation
  have e : cz0.toZ = z0 := rfl
  rw [h1, h2, e] at h
  simpa using h

end BB6

namespace BB6

/-- **Certificate**, proved structurally (Stage 5). -/
theorem bb6_certificate_structural : Certificate := certificate_of_run runZ_249880_structural

/-- **Acceptance**, proved structurally (Stage 5). -/
theorem bb6_accepts_structural (B : Nat) : Accepts bb6 B ↔ 249881 ≤ B :=
  accepts_of_certificate bb6_certificate_structural B

end BB6