import LeanProject.Zipper
import LeanProject.WitnessData

/-!
# The accepted witness: exactly 249,881 steps

`bb6` is the machine `0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD` (states A–F; for each state
the entry for reading 0, then for reading 1: write, move, next state). The hill accepted it on
the validation split (AutoLab experiment 8297fb64).

This file derives the certificate from one fact, (Z): the zipper run for 249,880 steps ends at the
hint zipper `Witness.zA` (`certificate_of_run`). (Z) has two independent proofs:
`LeanProject.Direct` evaluates the run in the kernel, and `LeanProject.Structural` proves it with
sweep rules valid for every number of blocks plus a much smaller accelerated computation. The other
facts used here are small finite computations checked with `decide +kernel` (no `native_decide`).
-/

namespace BB6

/-- `0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD`. The row for `H` is never used. -/
def bb6 : Machine
  | .A, false => ⟨false, .L, .E⟩
  | .A, true  => ⟨true,  .L, .A⟩
  | .B, false => ⟨true,  .L, .C⟩
  | .B, true  => ⟨true,  .R, .H⟩
  | .C, false => ⟨true,  .R, .A⟩
  | .C, true  => ⟨true,  .R, .F⟩
  | .D, false => ⟨false, .R, .F⟩
  | .D, true  => ⟨false, .R, .D⟩
  | .E, false => ⟨true,  .R, .D⟩
  | .E, true  => ⟨true,  .L, .B⟩
  | .F, false => ⟨true,  .L, .C⟩
  | .F, true  => ⟨true,  .R, .D⟩
  | .H, _     => ⟨false, .R, .H⟩

/-! ## Small kernel-checked computations -/

theorem stepZ_zA : stepZ bb6 Witness.zA = Witness.zB := by decide +kernel

theorem zA_state : Witness.zA.s = .B := by decide +kernel

theorem zB_state : Witness.zB.s = .H := by decide +kernel

theorem zB_lengths : Witness.zB.l.length = 4 ∧ Witness.zB.r.length = 730 := by decide +kernel

theorem zB_ones : countCells (zcell Witness.zB) 735 = 554 := by decide +kernel

theorem early_states :
    (runZ bb6 0 z0).s = .A ∧ (runZ bb6 1 z0).s = .E ∧ (runZ bb6 2 z0).s = .D ∧
    (runZ bb6 3 z0).s = .F ∧ (runZ bb6 4 z0).s = .C ∧ (runZ bb6 31 z0).s = .B := by
  decide +kernel

/-! ## The certificate, stated on the reference model -/

theorem bb6_state (n : Nat) : (run bb6 n).state = (runZ bb6 n z0).s := (rep_run bb6 n).1.symm

/-- **The certificate statement.** With `N = 249881` and the reference semantics of
`LeanProject.Model`:
1. `bb6` halts after exactly `N` steps;
2. it reaches all six working states before halting;
3. the leftmost and rightmost head positions over times `0..N` span `735` cells;
4. `554` cells of that span hold `1`, and every cell outside it holds `0`. -/
def Certificate : Prop :=
  HaltsAt bb6 249881 ∧
  ReachesAll bb6 249881 ∧
  hi bb6 249881 - lo bb6 249881 + 1 = 735 ∧
  countOnes (run bb6 249881).tape (lo bb6 249881) 735 = 554 ∧
  (∀ i : Int, i < lo bb6 249881 ∨ hi bb6 249881 < i → (run bb6 249881).tape i = false)

/-- The certificate follows from (Z) and the small computations above. -/
theorem certificate_of_run (hZ : runZ bb6 249880 z0 = Witness.zA) : Certificate := by
  have hN : runZ bb6 249881 z0 = Witness.zB := by
    show runZ bb6 (249880 + 1) z0 = Witness.zB
    rw [runZ_succ', hZ, stepZ_zA]
  have hrepN := rep_run bb6 249881
  obtain ⟨hlN, hrN⟩ := lengths bb6 249881
  rw [hN] at hrepN hlN hrN
  refine ⟨⟨?_, ?_⟩, ?_, ?_, ?_, ?_⟩
  · rw [bb6_state, hN, zB_state]
  · intro n hn hH
    have h := run_halted_of_le bb6 hH (show n ≤ 249880 by omega)
    rw [bb6_state, hZ, zA_state] at h
    exact St.noConfusion h
  · intro s hs
    obtain ⟨h0, h1, h2, h3, h4, h31⟩ := early_states
    cases s with
    | A => exact ⟨0, by decide, by rw [bb6_state, h0]⟩
    | B => exact ⟨31, by decide, by rw [bb6_state, h31]⟩
    | C => exact ⟨4, by decide, by rw [bb6_state, h4]⟩
    | D => exact ⟨2, by decide, by rw [bb6_state, h2]⟩
    | E => exact ⟨1, by decide, by rw [bb6_state, h1]⟩
    | F => exact ⟨3, by decide, by rw [bb6_state, h3]⟩
    | H => exact absurd rfl hs
  · obtain ⟨hl4, hr730⟩ := zB_lengths
    rw [hl4] at hlN
    rw [hr730] at hrN
    omega
  · rw [countOnes_eq (tape_window hrepN hlN) 735]
    exact zB_ones
  · exact tape_outside hrepN hlN hrN

/-- **Acceptance** from the certificate: in the model of the evaluator's `_run`, a budget `B`
accepts `bb6` exactly when `B ≥ 249881`. (The evaluator additionally requires
`10 ≤ B ≤ 2000000`; see `proof.md`.) -/
theorem accepts_of_certificate (h : Certificate) (B : Nat) : Accepts bb6 B ↔ 249881 ≤ B := by
  constructor
  · rintro ⟨N, hNB, hN, -⟩
    have := hN.unique h.1
    omega
  · intro hB
    exact ⟨249881, hB, h.1, h.2.1⟩

end BB6