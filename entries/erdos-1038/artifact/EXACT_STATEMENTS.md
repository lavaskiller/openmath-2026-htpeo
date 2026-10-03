# Exact elaborated statements and axiom dependencies

Generated from the successful 2026-10-03 `lake env lean VerifyContributions.lean` output. It includes all section variables and hypotheses. Eighteen main/reference/bridge checks are context; the eight candidate declarations named in CONTRIBUTIONS.md are the proposed reusable contribution.

```text
Erdos1038.erdos_1038.parts.i (n : ℕ) :
  ENNReal.ofReal EP1038.Stage9.Dval = ⨅ f, MeasureTheory.volume {x | |Polynomial.eval x ↑f| < 1}
'Erdos1038.erdos_1038.parts.i' depends on axioms: [propext, Classical.choice, Quot.sound]
Erdos1038.erdos_1038.parts.ii (n : ℕ) : 2 * 2 ^ (1 / 2) = ⨆ f, MeasureTheory.volume {x | |Polynomial.eval x ↑f| < 1}
'Erdos1038.erdos_1038.parts.ii' depends on axioms: [propext, Classical.choice, Quot.sound]
Erdos1038.erdos_1038.variants.inf_upperBound (n : ℕ) :
  ⨅ f, MeasureTheory.volume {x | |Polynomial.eval x ↑f| < 1} < 1.835
'Erdos1038.erdos_1038.variants.inf_upperBound' depends on axioms: [propext, Classical.choice, Quot.sound]
Erdos1038.erdos_1038.varaints.inf_lowerBound (n : ℕ) :
  2 ^ (4 / 3) - 1 ≤ ⨅ f, MeasureTheory.volume {x | |Polynomial.eval x ↑f| < 1}
'Erdos1038.erdos_1038.varaints.inf_lowerBound' depends on axioms: [propext, Classical.choice, Quot.sound]
Erdos1038.erdos_1038.inf_nonattainment (f : Polynomial ℝ)
  (hf : f.Monic ∧ f ≠ 1 ∧ (Multiset.filter (fun x => x ∈ Set.Icc (-1) 1) f.roots).card = f.natDegree) :
  MeasureTheory.volume {x | |Polynomial.eval x f| < 1} ≠ ⨅ p, MeasureTheory.volume {x | |Polynomial.eval x ↑p| < 1}
'Erdos1038.erdos_1038.inf_nonattainment' depends on axioms: [propext, Classical.choice, Quot.sound]
Erdos1038.erdos_1038.D_enclosure :
  18344304757 / 10000000000 ≤ EP1038.Stage9.Dval ∧ EP1038.Stage9.Dval < 18344304757628 / 10000000000000
'Erdos1038.erdos_1038.D_enclosure' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.filtered_roots_iff (p : Polynomial ℝ) :
  (Multiset.filter (fun x => x ∈ Set.Icc (-1) 1) p.roots).card = p.natDegree ↔
    p.roots.card = p.natDegree ∧ ∀ x ∈ p.roots, x ∈ Set.Icc (-1) 1
'EP1038.DeepMind.filtered_roots_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.inf_admissible_iff (p : Polynomial ℝ) : EP1038.DeepMind.InfAdmissible p ↔ EP1038.Admissible p
'EP1038.DeepMind.inf_admissible_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.sup_admissible_iff (p : Polynomial ℝ) : EP1038.DeepMind.SupAdmissible p ↔ EP1038.Admissible p ∨ p = 1
'EP1038.DeepMind.sup_admissible_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.officialInf_eq_localInf : EP1038.DeepMind.officialInf = EP1038.DeepMind.localInf
'EP1038.DeepMind.officialInf_eq_localInf' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.officialSup_eq_localSup : EP1038.DeepMind.officialSup = EP1038.DeepMind.localSup
'EP1038.DeepMind.officialSup_eq_localSup' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DeepMind.official_equality_iff (p : Polynomial ℝ) (hp : EP1038.DeepMind.InfAdmissible p) :
  MeasureTheory.volume {x | |Polynomial.eval x p| < 1} = 2 * 2 ^ (1 / 2) ↔ ∃ m, 1 ≤ m ∧ p = (Polynomial.X ^ 2 - 1) ^ m
'EP1038.DeepMind.official_equality_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.ReferenceCert.COV (k : ℝ) : 29 / 20 < k → EP1038.ReferenceCert.RatioCertified k
'EP1038.ReferenceCert.COV' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.ReferenceCert.universal_strict_lower {p : Polynomial ℝ} (hp : EP1038.Admissible p) :
  EP1038.Stage9.Dval < (EP1038.sublevelMeasure p).toReal
'EP1038.ReferenceCert.universal_strict_lower' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.ReferenceCert.exact_infimum_and_nonattainment :
  EP1038.DeepMind.officialInf = ENNReal.ofReal EP1038.Stage9.Dval ∧
    ∀ (p : Polynomial ℝ),
      EP1038.DeepMind.InfAdmissible p →
        MeasureTheory.volume {x | |Polynomial.eval x p| < 1} ≠ EP1038.DeepMind.officialInf
'EP1038.ReferenceCert.exact_infimum_and_nonattainment' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DLowerCert.actual_numerical_family_lower : EP1038.DLowerCert.NumericalFamilyLower
'EP1038.DLowerCert.actual_numerical_family_lower' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.DLowerCert.actual_numerical_D_enclosure : EP1038.DLowerCert.NumericalDEnclosure
'EP1038.DLowerCert.actual_numerical_D_enclosure' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage9.sharpness {q : ℝ} (hq : q ∈ EP1038.Stage9.Qadm) {ε : ℝ} (hε : 0 < ε) :
  ∃ n r,
    0 < n ∧
      (∀ (i : Fin n), r i ∈ Set.Icc (-1) 1) ∧
        MeasureTheory.volume (EP1038.sublevel r) < ENNReal.ofReal (EP1038.Stage9.Lam q + ε)
'EP1038.Stage9.sharpness' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Riesz.discrete_riesz {n : ℕ} [NeZero n] {c : ZMod n → ℝ} (hc : EP1038.Riesz.SymDec c) (a b : ZMod n → ℝ) :
  ∃ π τ,
    EP1038.Riesz.Canon (a ∘ ⇑π) ∧
      EP1038.Riesz.Canon (b ∘ ⇑τ) ∧ EP1038.Riesz.S c a b ≤ EP1038.Riesz.S c (a ∘ ⇑π) (b ∘ ⇑τ)
'EP1038.Riesz.discrete_riesz' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Circ.circle_rearrangement {K : ℝ → ℝ} (hK : EP1038.Circ.SymDecC K) {f g : ℝ → ℝ} (hfm : Measurable f)
  (hgm : Measurable g) (hfp : Function.Periodic f (2 * Real.pi)) (hgp : Function.Periodic g (2 * Real.pi))
  (hf0 : ∀ (x : ℝ), 0 ≤ f x) (hf1 : ∀ (x : ℝ), f x ≤ 1) (hg0 : ∀ (x : ℝ), 0 ≤ g x) (hg1 : ∀ (x : ℝ), g x ≤ 1) {Q R : ℝ}
  (hfmass : ∫ (θ : ℝ) in -Real.pi..Real.pi, f θ = 2 * Q) (hgmass : ∫ (θ : ℝ) in -Real.pi..Real.pi, g θ = 2 * R) :
  EP1038.Circ.IK K f g ≤ EP1038.Circ.VK K Q R
'EP1038.Circ.circle_rearrangement' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Arc.scalar_pos {c0 Ceff api Qm Rm : ℝ} (hapi : 0 < api) (hC : Ceff ≤ 0) (hQm : Qm ≤ Real.pi) (hRQ : Rm ≤ Qm)
  {M : ℕ} {pt : ℕ → ℝ} (hmono : Monotone pt) (hpt0 : pt 0 = Rm) (hptM : pt M = Qm)
  (h1 : 0 < c0 + EP1038.Arc.hfun Qm + EP1038.Arc.hfun Rm + -(Real.pi * Ceff / api) / Rm)
  (hpart :
    ∀ (m : ℕ),
      1 ≤ m →
        m ≤ M →
          0 <
            c0 + EP1038.Arc.hfun Qm + EP1038.Arc.hfun Rm + -(Real.pi * Ceff / api) / pt m +
              (EP1038.Arc.sinc Rm - EP1038.Arc.sinc (pt (m - 1))) ^ 2)
  {Q R : ℝ} (hQ : 0 < Q) (hQQ : Q ≤ Qm) (hR : 0 < R) (hRR : R ≤ Rm) : 0 < EP1038.Arc.rhs c0 Ceff api Q R
'EP1038.Arc.scalar_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage12.scalarPositive_partition (R : EP1038.Stage11.SeparatedReference) {Ceff : ℝ} (hC : Ceff ≤ 0)
  (hRQ : Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R ≤ Real.pi / EP1038.Stage12.api R.angles) {M : ℕ}
  {pt : ℕ → ℝ} (hmono : Monotone pt) (hpt0 : pt 0 = Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R)
  (hptM : pt M = Real.pi / EP1038.Stage12.api R.angles)
  (hmargin :
    0 <
      EP1038.Stage12.scalarC0 R + EP1038.Arc.hfun (Real.pi / EP1038.Stage12.api R.angles) +
          EP1038.Arc.hfun (Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R) +
        -(Real.pi * Ceff / EP1038.Stage12.api R.angles) / (Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R))
  (hpart :
    ∀ (m : ℕ),
      1 ≤ m →
        m ≤ M →
          0 <
            EP1038.Stage12.scalarC0 R + EP1038.Arc.hfun (Real.pi / EP1038.Stage12.api R.angles) +
                  EP1038.Arc.hfun (Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R) +
                -(Real.pi * Ceff / EP1038.Stage12.api R.angles) / pt m +
              (EP1038.Arc.sinc (Real.pi * EP1038.Stage12.totalXi R / EP1038.Stage12.bpi R) -
                  EP1038.Arc.sinc (pt (m - 1))) ^
                2) :
  EP1038.Stage12.ScalarPositive R Ceff
'EP1038.Stage12.scalarPositive_partition' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage11.L_XLip {r ρ1 ρ2 σ1 σ2 M : ℝ} (hr : 0 < r) (h10 : 0 < ρ1) (h11 : ρ1 < 1) (h20 : 0 < ρ2) (h21 : ρ2 < 1)
  (hM : 0 ≤ M) {f : ℝ → ℝ} (hf : EP1038.Stage11.XLip M f) : EP1038.Stage11.Lfun r ρ1 ρ2 σ1 σ2 f = 0
'EP1038.Stage11.L_XLip' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage11.finite_jump_adjoint_eq.{u_1} {ι : Type u_1} {r ρ1 ρ2 σ1 σ2 M : ℝ} {fc : ℝ → ℝ} (hr : 0 < r)
  (h10 : 0 < ρ1) (h11 : ρ1 < 1) (h20 : 0 < ρ2) (h21 : ρ2 < 1) (hs1 : 0 ≤ σ1) (hs2 : 0 ≤ σ2) (hM : 0 ≤ M)
  (hfc : EP1038.Stage11.XLip M fc) (s : Finset ι) (Δ z : ι → ℝ) (hz : ∀ i ∈ s, z i ∈ Set.Ioo (-1) 1) :
  EP1038.Stage11.AdjointIntegrable ρ1 ρ2 (EP1038.Stage11.Bxi ρ1 ρ2 σ1 σ2)
      (fc + ∑ i ∈ s, Δ i • EP1038.Stage11.jump (z i)) ∧
    EP1038.Stage11.Lfun r ρ1 ρ2 σ1 σ2 (fc + ∑ i ∈ s, Δ i • EP1038.Stage11.jump (z i)) = 0
'EP1038.Stage11.finite_jump_adjoint_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage10.convex_supporting_sep {T0 T : ℝ → ℝ} {a0 a1 k r : ℝ} (hm0 : Measurable T0) (hm1 : Measurable T)
  (ha0 : 0 < a0) (h0a : ∀ (u : ℝ), a0 ≤ T0 u) (h02 : ∀ (u : ℝ), T0 u ≤ 2) (ha1 : 0 < a1) (h1a : ∀ (u : ℝ), a1 ≤ T u)
  (h12 : ∀ (u : ℝ), T u ≤ 2) (hk : 0 < k) (hr0 : 0 < r) (hra : r < a0)
  (hsep : EP1038.Stage10.RS k T0 < EP1038.Stage10.PsiS k T0 r) {r1 : ℝ} (hr1 : 0 < r1) (hr1a : r1 < a1)
  (hsepT : EP1038.Stage10.RS k T < EP1038.Stage10.PsiS k T r1) :
  EP1038.Stage10.xpS k T0 - EP1038.Stage10.xmS k T0 + EP1038.Stage10.Mdot k T0 T ≤
    EP1038.Stage10.xpS k T - EP1038.Stage10.xmS k T
'EP1038.Stage10.convex_supporting_sep' depends on axioms: [propext, Classical.choice, Quot.sound]
EP1038.Stage10.convex_supporting_contact {T0 T : ℝ → ℝ} {a0 a1 k r : ℝ} (hm0 : Measurable T0) (hm1 : Measurable T)
  (ha0 : 0 < a0) (h0a : ∀ (u : ℝ), a0 ≤ T0 u) (h02 : ∀ (u : ℝ), T0 u ≤ 2) (ha1 : 0 < a1) (h1a : ∀ (u : ℝ), a1 ≤ T u)
  (h12 : ∀ (u : ℝ), T u ≤ 2) (hk : 0 < k) (hr0 : 0 < r) (hra : r < a0)
  (hsep : EP1038.Stage10.RS k T0 < EP1038.Stage10.PsiS k T0 r) (hyc : EP1038.Stage10.yc k a1 T < a1)
  (hcon : EP1038.Stage10.RS k T = EP1038.Stage10.PsiS k T (EP1038.Stage10.yc k a1 T)) :
  EP1038.Stage10.xpS k T0 - EP1038.Stage10.xmS k T0 + EP1038.Stage10.Mdot k T0 T ≤
    EP1038.Stage10.xpS k T - EP1038.Stage10.xmS k T
'EP1038.Stage10.convex_supporting_contact' depends on axioms: [propext, Classical.choice, Quot.sound]

```
