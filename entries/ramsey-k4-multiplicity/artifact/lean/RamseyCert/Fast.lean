import Mathlib
import RamseyCert.Defs

/-!
# Correctness of the kernel-friendly evaluation scheme

General lemmas (no computation): the packed/bit-mask evaluation of `Defs.lean` equals the
specification `K4`, and `Template.numer` is the sum of the red and blue `K4` counts.
-/

open Finset

namespace RamseyCert

private theorem tb_eq_testBit (m i : ℕ) : tb m i = m.testBit i := by
  simp only [tb, Nat.testBit, Nat.and_comm]
  conv_rhs => lhs; rw [show (1 : ℕ) = 2 ^ 1 - 1 by decide, Nat.and_two_pow_sub_one_eq_mod]
  norm_num only [pow_one]
  have h : (m >>> i) % 2 < 2 := Nat.mod_lt _ (by omega)
  interval_cases hm : (m >>> i) % 2 <;>
    change Nat.mod (Nat.shiftRight m i) 2 = _ at hm <;>
    rw [hm] <;> decide

private theorem pack_lt (B : ℕ) (f : ℕ → ℕ) (hf : ∀ d, f d < 2 ^ B) (n : ℕ) :
    pack B f n < 2 ^ (B * n) := by
  induction n with
  | zero => simp [pack]
  | succ n ih =>
    have hpos : 0 < 2 ^ (B * n) := pow_pos (by omega) _
    have hmul := Nat.mul_le_mul_left (2 ^ (B * n)) (Nat.succ_le_iff.mpr (hf n))
    have hp : 2 ^ (B * (n + 1)) = 2 ^ (B * n) * 2 ^ B := by
      rw [show B * (n + 1) = B * n + B by ring, pow_add]
    rw [hp]
    change pack B f n + f n * 2 ^ (B * n) < 2 ^ (B * n) * 2 ^ B
    nlinarith

private theorem pack_bit (B : ℕ) (_hB : 0 < B) (f : ℕ → ℕ)
    (hf : ∀ d, f d < 2 ^ B) (n d t : ℕ) (hd : d < n) (ht : t < B) :
    (pack B f n).testBit (B * d + t) = (f d).testBit t := by
  induction n with
  | zero => omega
  | succ n ih =>
    have hlow := pack_lt B f hf n
    have hp : pack B f (n + 1) = 2 ^ (B * n) * f n + pack B f n := by
      simp [pack, Nat.add_comm, Nat.mul_comm]
    rw [hp, Nat.testBit_two_pow_mul_add (f n) hlow]
    by_cases hdn : d < n
    · have hmul := Nat.mul_le_mul_left B (Nat.succ_le_iff.mpr hdn)
      simp only [Nat.mul_succ] at hmul
      have hj : B * d + t < B * n := by omega
      simp only [if_pos hj]
      exact ih hdn
    · have hdn' : d = n := by omega
      subst d
      have hj : ¬ B * n + t < B * n := by omega
      simp only [if_neg hj]
      congr 1
      omega

private theorem pack_land (B : ℕ) (hB : 0 < B) (f g : ℕ → ℕ)
    (hf : ∀ d, f d < 2 ^ B) (hg : ∀ d, g d < 2 ^ B) (n : ℕ) :
    pack B f n &&& pack B g n = pack B (fun d => f d &&& g d) n := by
  have hfg (d : ℕ) : f d &&& g d < 2 ^ B :=
    lt_of_le_of_lt Nat.and_le_left (hf d)
  apply Nat.eq_of_testBit_eq
  intro j
  have ht : j % B < B := Nat.mod_lt _ hB
  have hj : j = B * (j / B) + j % B := by
    have := Nat.mod_add_div j B
    omega
  by_cases hd : j / B < n
  · rw [Nat.testBit_and, hj,
        pack_bit B hB f hf n (j / B) (j % B) hd ht,
        pack_bit B hB g hg n (j / B) (j % B) hd ht,
        pack_bit B hB (fun d => f d &&& g d) hfg n (j / B) (j % B) hd ht,
        Nat.testBit_and]
  · have hmul := Nat.mul_le_mul_left B (Nat.le_of_not_gt hd)
    have hlarge : B * n ≤ j := by omega
    have hpow : 2 ^ (B * n) ≤ 2 ^ j := Nat.pow_le_pow_right (by omega) hlarge
    have hfb : pack B f n < 2 ^ j := lt_of_lt_of_le (pack_lt B f hf n) hpow
    have hgb : pack B g n < 2 ^ j := lt_of_lt_of_le (pack_lt B g hg n) hpow
    have hfgb : pack B (fun d => f d &&& g d) n < 2 ^ j :=
      lt_of_lt_of_le (pack_lt B (fun d => f d &&& g d) hfg n) hpow
    rw [Nat.testBit_and, Nat.testBit_lt_two_pow hfb,
      Nat.testBit_lt_two_pow hgb, Nat.testBit_lt_two_pow hfgb]
    rfl

private theorem pack_mod_eq (B : ℕ) (f : ℕ → ℕ) (n : ℕ) :
    pack B f n % (2 ^ B - 1) = (∑ d ∈ range n, f d) % (2 ^ B - 1) := by
  let F := 2 ^ B - 1
  have hbase : 2 ^ B ≡ 1 [MOD F] := by
    change 2 ^ B % F = 1 % F
    have hpow : 1 ≤ 2 ^ B := pow_pos (by norm_num : (0 : ℕ) < 2) _
    have heq : 2 ^ B = F + 1 := by dsimp [F]; omega
    rw [heq]
    simp
  have hpow (d : ℕ) : 2 ^ (B * d) ≡ 1 [MOD F] := by
    simpa [pow_mul] using hbase.pow d
  have hmod (k : ℕ) : pack B f k ≡ (∑ d ∈ range k, f d) [MOD F] := by
    induction k with
    | zero => simp [pack, Nat.ModEq]
    | succ k ih =>
      have hnew : f k * 2 ^ (B * k) ≡ f k [MOD F] := by
        simpa using (hpow k).mul_left (f k)
      simpa [pack, Finset.sum_range_succ] using ih.add hnew
  exact hmod n


/-- The raw-recursor version agrees with the computable twin. -/
theorem kTermA_eq (md : ℕ) (ea : Ent) (La : List Ent) : kTermA md ea La = termA md ea La := by
  have hc (rb Mab : ℕ) (es : List Ent) : kInnerC md rb Mab es = innerC md rb Mab es := by
    induction es with
    | nil => rfl
    | cons e es ih =>
      change Bool.rec 0 (e.w * ((Mab &&& e.E) % md)) (tb rb e.i) +
        kInnerC md rb Mab es =
        (bif tb rb e.i then e.w * ((Mab &&& e.E) % md) else 0) + innerC md rb Mab es
      rw [ih]
      cases tb rb e.i <;> rfl
  have hb (Ma : ℕ) (es : List Ent) : kInnerB md Ma La es = innerB md Ma La es := by
    induction es with
    | nil => rfl
    | cons e es ih =>
      change e.w * kInnerC md e.r (Ma &&& e.M) La + kInnerB md Ma La es =
        e.w * innerC md e.r (Ma &&& e.M) La + innerB md Ma La es
      rw [hc, ih]
  simp [kTermA, termA, hb]

private theorem mkAll_eq_map_range (B n W : ℕ) (rs : List ℕ) (hlen : rs.length = n) :
    mkAll B n W rs = (List.range n).map (fun i => mkEnt B n W (rs.getD i 0) i) := by
  apply List.ext_getElem
  · simp [mkAll, List.length_zipWith, hlen]
  · intro i hi₁ hi₂
    have hir : i < n := by simpa [mkAll, List.length_zipWith, hlen] using hi₁
    have hirs : i < rs.length := by omega
    simp [mkAll, List.getElem_zipWith, List.getElem_map,
      List.getElem_range, hirs]

private theorem list_sum_map_range (f : ℕ → ℕ) (n : ℕ) :
    ((List.range n).map f).sum = ∑ i ∈ range n, f i := by
  induction n with
  | zero => simp
  | succ n ih => simp [List.range_succ, ih, Finset.sum_range_succ]

private theorem list_sum_filter_map_range (n : ℕ) (α : Type) (f : ℕ → α)
    (p : α → Bool) (q : α → ℕ) :
    (((List.range n).map f).filter p |>.map q).sum =
      ∑ i ∈ range n, if p (f i) then q (f i) else 0 := by
  induction n with
  | zero => simp
  | succ n ih =>
    simp [List.range_succ, List.map_append, List.filter_append, List.sum_append,
      Finset.sum_range_succ, ih]
    cases h : p (f n) <;> simp [h]

private theorem packed_triple (B n W : ℕ) (adj : ℕ → ℕ → Bool)
    (a b c : ℕ) (hB : 0 < B)
    (hsum : (∑ d ∈ range n, wOf W B d) < 2 ^ B - 1) :
    ((pack B (fun d => bif adj a d then 2 ^ B - 1 else 0) n &&&
        pack B (fun d => bif adj b d then 2 ^ B - 1 else 0) n) &&&
        pack B (fun d => bif adj c d then wOf W B d else 0) n) % (2 ^ B - 1) =
      ∑ d ∈ range n,
        if (adj a d && adj b d && adj c d) = true then wOf W B d else 0 := by
  let mask (x d : ℕ) : ℕ := bif adj x d then 2 ^ B - 1 else 0
  let ev (x d : ℕ) : ℕ := bif adj x d then wOf W B d else 0
  have hw (d : ℕ) : wOf W B d < 2 ^ B := by
    unfold wOf
    exact Nat.mod_lt _ (pow_pos (by norm_num : (0 : ℕ) < 2) _)
  have hm (x d : ℕ) : mask x d < 2 ^ B := by
    dsimp [mask]
    cases h : adj x d <;> simp
  have he (x d : ℕ) : ev x d < 2 ^ B := by
    dsimp [ev]
    cases h : adj x d <;> simp [hw]
  have hpoint (d : ℕ) : (mask a d &&& mask b d) &&& ev c d =
      (if (adj a d && adj b d && adj c d) = true then wOf W B d else 0) := by
    dsimp [mask, ev]
    cases ha : adj a d <;> cases hb : adj b d <;> cases hc : adj c d <;>
      simp [Nat.and_zero, Nat.zero_and, Nat.and_self]
    exact (Nat.and_comm _ _).trans (Nat.and_two_pow_sub_one_of_lt_two_pow (hw d))
  have hfg (d : ℕ) : mask a d &&& mask b d < 2 ^ B :=
    lt_of_le_of_lt Nat.and_le_left (hm a d)
  have hpack :
      (pack B (mask a) n &&& pack B (mask b) n) &&& pack B (ev c) n =
        pack B (fun d => (mask a d &&& mask b d) &&& ev c d) n := by
    rw [pack_land B hB (mask a) (mask b) (hm a) (hm b) n]
    exact pack_land B hB (fun d => mask a d &&& mask b d) (ev c) hfg (he c) n
  have hle (d : ℕ) :
      (if (adj a d && adj b d && adj c d) = true then wOf W B d else 0) ≤
        wOf W B d := by split <;> omega
  have hsub :
      (∑ d ∈ range n, if (adj a d && adj b d && adj c d) = true then wOf W B d else 0)
        < 2 ^ B - 1 :=
    lt_of_le_of_lt (Finset.sum_le_sum (fun d _ => hle d)) hsum
  change ((pack B (mask a) n &&& pack B (mask b) n) &&& pack B (ev c) n) % _ = _
  rw [hpack]
  simp_rw [hpoint]
  rw [pack_mod_eq, Nat.mod_eq_of_lt hsub]

private theorem kInnerC_sum (md rb Mab : ℕ) (es : List Ent) :
    kInnerC md rb Mab es =
      (es.map (fun e => bif tb rb e.i then e.w * ((Mab &&& e.E) % md) else 0)).sum := by
  induction es with
  | nil => rfl
  | cons e es ih =>
    change Bool.rec 0 (e.w * ((Mab &&& e.E) % md)) (tb rb e.i) +
      kInnerC md rb Mab es =
      (bif tb rb e.i then e.w * ((Mab &&& e.E) % md) else 0) +
      (es.map (fun e => bif tb rb e.i then e.w * ((Mab &&& e.E) % md) else 0)).sum
    rw [ih]
    cases tb rb e.i <;> rfl

private theorem kInnerB_sum (md Ma : ℕ) (La es : List Ent) :
    kInnerB md Ma La es =
      (es.map (fun e => e.w * kInnerC md e.r (Ma &&& e.M) La)).sum := by
  induction es with
  | nil => rfl
  | cons e es ih =>
    change e.w * kInnerC md e.r (Ma &&& e.M) La + kInnerB md Ma La es =
      e.w * kInnerC md e.r (Ma &&& e.M) La +
      (es.map (fun e => e.w * kInnerC md e.r (Ma &&& e.M) La)).sum
    rw [ih]

private theorem kTermA_as_sum (n md : ℕ) (e : ℕ → Ent)
    (hi : ∀ i, (e i).i = i) (a : ℕ) :
    kTermA md (e a) (nbhd ((List.range n).map e) (e a)) =
      (e a).w * ∑ b ∈ range n,
        if tb (e a).r b then
          (e b).w * ∑ c ∈ range n,
            if tb (e a).r c then
              (bif tb (e b).r c then
                (e c).w * ((((e a).M &&& (e b).M) &&& (e c).E) % md) else 0)
            else 0
        else 0 := by
  let La := nbhd ((List.range n).map e) (e a)
  have hLa (q : Ent → ℕ) : (La.map q).sum =
      ∑ i ∈ range n, if tb (e a).r i then q (e i) else 0 := by
    simpa [La, nbhd, hi] using
      list_sum_filter_map_range n Ent e (fun z => tb (e a).r z.i) q
  have hc (b : ℕ) : kInnerC md (e b).r ((e a).M &&& (e b).M) La =
      ∑ c ∈ range n,
        if tb (e a).r c then
          (bif tb (e b).r c then
            (e c).w * ((((e a).M &&& (e b).M) &&& (e c).E) % md) else 0)
        else 0 := by
    rw [kInnerC_sum, hLa]
    simp [hi]
  have hb : kInnerB md (e a).M La La =
      ∑ b ∈ range n,
        if tb (e a).r b then
          (e b).w * ∑ c ∈ range n,
            if tb (e a).r c then
              (bif tb (e b).r c then
                (e c).w * ((((e a).M &&& (e b).M) &&& (e c).E) % md) else 0)
            else 0
        else 0 := by
    rw [kInnerB_sum, hLa]
    apply Finset.sum_congr rfl
    intro b hb
    rw [hc]
  change (e a).w * kInnerB md (e a).M La La = _
  rw [hb]

private theorem nested_K4 (n : ℕ) (w : ℕ → ℕ) (adj : ℕ → ℕ → Bool) :
    (∑ a ∈ range n, w a * ∑ b ∈ range n,
      if adj a b then w b * ∑ c ∈ range n,
        if adj a c then
          (bif adj b c then w c * ∑ d ∈ range n,
            if (adj a d && adj b d && adj c d) = true then w d else 0 else 0)
        else 0
      else 0) = K4 n w adj := by
  unfold K4
  simp only [Finset.mul_sum, mul_ite, mul_zero]
  apply Finset.sum_congr rfl
  intro a ha
  apply Finset.sum_congr rfl
  intro b hb
  cases hab : adj a b <;> simp
  apply Finset.sum_congr rfl
  intro c hc
  cases hac : adj a c <;> simp
  cases hbc : adj b c <;> simp
  simp only [Finset.mul_sum, mul_ite, mul_zero]
  apply Finset.sum_congr rfl
  intro d hd
  cases h1 : adj a b <;> cases h2 : adj a c <;> cases h3 : adj a d <;>
    cases h4 : adj b c <;> cases h5 : adj b d <;> cases h6 : adj c d <;>
    simp [mul_assoc]

/-- Main correctness lemma for one colour class. `rs` is the list of neighbourhood masks of the
colour class, `all` the list of blocks built from it, `W` the packed weights. -/
theorem colour_total (B n W md : ℕ) (rs : List ℕ) (all : List Ent)
    (hmd : md = 2 ^ B - 1) (hlen : rs.length = n) (hall : all = mkAll B n W rs)
    (hsum : ((List.range n).map (wOf W B)).sum < 2 ^ B - 1) :
    (all.map (fun ea => kTermA md ea (nbhd all ea))).sum
      = K4 n (wOf W B) (adjOf rs) := by
  have hB : 0 < B := by
    by_contra hh
    have hzero : B = 0 := by omega
    subst B
    norm_num at hsum
  have hs : (∑ d ∈ range n, wOf W B d) < 2 ^ B - 1 := by
    simpa only [list_sum_map_range] using hsum
  let e (i : ℕ) : Ent := mkEnt B n W (rs.getD i 0) i
  have hi (i : ℕ) : (e i).i = i := rfl
  have hweight (i : ℕ) : (e i).w = wOf W B i := rfl
  have hrow (a b : ℕ) : tb (e a).r b = adjOf rs a b := rfl
  have heq : all = (List.range n).map e := by
    rw [hall, mkAll_eq_map_range B n W rs hlen]
  have hmask (a b c : ℕ) :
      ((((e a).M &&& (e b).M) &&& (e c).E) % md) =
        ∑ d ∈ range n,
          if (adjOf rs a d && adjOf rs b d && adjOf rs c d) = true
          then wOf W B d else 0 := by
    rw [hmd]
    change ((pack B (fun d => bif adjOf rs a d then 2 ^ B - 1 else 0) n &&&
      pack B (fun d => bif adjOf rs b d then 2 ^ B - 1 else 0) n) &&&
      pack B (fun d => bif adjOf rs c d then wOf W B d else 0) n) % (2 ^ B - 1) = _
    exact packed_triple B n W (adjOf rs) a b c hB hs
  rw [heq]
  calc
    (((List.range n).map e).map
        (fun ea => kTermA md ea (nbhd ((List.range n).map e) ea))).sum =
        ∑ a ∈ range n, kTermA md (e a) (nbhd ((List.range n).map e) (e a)) := by
          rw [← list_sum_map_range]
          simp only [List.map_map]
          rfl
    _ = ∑ a ∈ range n,
        (e a).w * ∑ b ∈ range n,
          if tb (e a).r b then
            (e b).w * ∑ c ∈ range n,
              if tb (e a).r c then
                (bif tb (e b).r c then
                  (e c).w * ((((e a).M &&& (e b).M) &&& (e c).E) % md) else 0)
              else 0
          else 0 := by
            apply Finset.sum_congr rfl
            intro a ha
            exact kTermA_as_sum n md e hi a
    _ = K4 n (wOf W B) (adjOf rs) := by
          simp_rw [hweight, hrow, hmask]
          exact nested_K4 n (wOf W B) (adjOf rs)

/-- The computable evaluation equals the specification. -/
theorem fastK_eq (B n W : ℕ) (rs : List ℕ) (hlen : rs.length = n)
    (hsum : ((List.range n).map (wOf W B)).sum < 2 ^ B - 1) :
    fastK B n W rs = K4 n (wOf W B) (adjOf rs) := by
  unfold fastK
  simp_rw [← kTermA_eq]
  exact colour_total B n W (2 ^ B - 1) rs (mkAll B n W rs) rfl hlen rfl hsum

/-- The blue colour class is given by the complemented masks. -/
theorem K4_blue (n : ℕ) (w : ℕ → ℕ) (rs rsB : List ℕ) (hlen : rs.length = n)
    (h : rsB = rs.map (fun r => Nat.xor r (2 ^ n - 1))) :
    K4 n w (fun a b => !adjOf rs a b) = K4 n w (adjOf rsB) := by
  have hget (a : ℕ) (ha : a < n) :
      rsB.getD a 0 = Nat.xor (rs.getD a 0) (2 ^ n - 1) := by
    subst rsB
    have hr : a < rs.length := by omega
    simp [List.getD, hr]
  have hblue (a b : ℕ) (ha : a < n) (hb : b < n) :
      adjOf rsB a b = !adjOf rs a b := by
    simp only [adjOf, hget a ha, tb_eq_testBit]
    change ((rs.getD a 0) ^^^ (2 ^ n - 1)).testBit b = _
    rw [Nat.testBit_xor, Nat.testBit_two_pow_sub_one]
    simp [hb]
  unfold K4
  refine Finset.sum_congr rfl ?_
  intro a ha
  refine Finset.sum_congr rfl ?_
  intro b hb
  refine Finset.sum_congr rfl ?_
  intro c hc
  refine Finset.sum_congr rfl ?_
  intro d hd
  have ha' := Finset.mem_range.mp ha
  have hb' := Finset.mem_range.mp hb
  have hc' := Finset.mem_range.mp hc
  have hd' := Finset.mem_range.mp hd
  rw [hblue a b ha' hb', hblue a c ha' hc', hblue a d ha' hd',
    hblue b c hb' hc', hblue b d hb' hd', hblue c d hc' hd']

private theorem mono_indicator (p q r s t u : Bool) (v : ℕ) :
    (if ((p && q && r && s && t && u) ||
          (!p && !q && !r && !s && !t && !u)) = true then v else 0) =
      (if (p && q && r && s && t && u) = true then v else 0) +
      (if (!p && !q && !r && !s && !t && !u) = true then v else 0) := by
  cases p <;> cases q <;> cases r <;> cases s <;> cases t <;> cases u <;> simp

private theorem fin_sum4_eq_range (n : ℕ) (F : ℕ → ℕ → ℕ → ℕ → ℕ) :
    (∑ a : Fin n, ∑ b : Fin n, ∑ c : Fin n, ∑ d : Fin n, F a b c d) =
      ∑ a ∈ range n, ∑ b ∈ range n, ∑ c ∈ range n, ∑ d ∈ range n, F a b c d := by
  calc
    _ = ∑ a ∈ range n, ∑ b : Fin n, ∑ c : Fin n, ∑ d : Fin n, F a b c d :=
      Fin.sum_univ_eq_sum_range (fun a => ∑ b : Fin n, ∑ c : Fin n, ∑ d : Fin n, F a b c d) n
    _ = _ := by
      apply Finset.sum_congr rfl
      intro a ha
      calc
        _ = ∑ b ∈ range n, ∑ c : Fin n, ∑ d : Fin n, F a b c d :=
          Fin.sum_univ_eq_sum_range (fun b => ∑ c : Fin n, ∑ d : Fin n, F a b c d) n
        _ = _ := by
          apply Finset.sum_congr rfl
          intro b hb
          calc
            _ = ∑ c ∈ range n, ∑ d : Fin n, F a b c d :=
              Fin.sum_univ_eq_sum_range (fun c => ∑ d : Fin n, F a b c d) n
            _ = _ := by
              apply Finset.sum_congr rfl
              intro c hc
              exact Fin.sum_univ_eq_sum_range (fun d => F a b c d) n

/-- The specification numerator is the red count plus the blue count. -/
theorem Template.numer_eq (T : Template) (n : ℕ) (hn : T.n = n) (w : ℕ → ℕ) (adj : ℕ → ℕ → Bool)
    (hw : ∀ i : Fin T.n, T.w i = w i) (hadj : ∀ i j : Fin T.n, T.red i j = adj i j) :
    T.numer = K4 n w adj + K4 n w (fun a b => !adj a b) := by
  subst n
  simp only [Template.numer, Template.mono, K4]
  simp_rw [hw, hadj]
  simp_rw [mono_indicator]
  simp only [Finset.sum_add_distrib]
  congr 1
  · exact fin_sum4_eq_range T.n (fun a b c d =>
      if (adj a b && adj a c && adj a d && adj b c && adj b d && adj c d) = true
      then w a * w b * w c * w d else 0)
  · exact fin_sum4_eq_range T.n (fun a b c d =>
      if (!adj a b && !adj a c && !adj a d && !adj b c && !adj b d && !adj c d) = true
      then w a * w b * w c * w d else 0)

theorem Template.total_eq (T : Template) (n : ℕ) (hn : T.n = n) (w : ℕ → ℕ)
    (hw : ∀ i : Fin T.n, T.w i = w i) :
    T.total = ((List.range n).map w).sum := by
  have hsum (f : ℕ → ℕ) (k : ℕ) : ((List.range k).map f).sum = ∑ i ∈ range k, f i := by
    induction k with
    | zero => simp
    | succ k ih => simp [List.range_succ, ih, Finset.sum_range_succ]
  calc
    T.total = ∑ i : Fin T.n, w i := by simp [Template.total, hw]
    _ = ∑ i ∈ range T.n, w i := Fin.sum_univ_eq_sum_range w T.n
    _ = ((List.range n).map w).sum := by rw [hn, ← hsum]

/-- Reading a mapped range. -/
theorem getD_map_range (f : ℕ → ℕ) (n i : ℕ) (hi : i < n) :
    ((List.range n).map f).getD i 0 = f i := by
  simp [List.getD, hi]

#print axioms colour_total
#print axioms Template.numer_eq
#print axioms Template.total_eq
#print axioms K4_blue
#print axioms getD_map_range
#print axioms kTermA_eq
#print axioms fastK_eq

end RamseyCert
