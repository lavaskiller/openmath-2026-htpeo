#!/usr/bin/env python3
"""Generate src/Star6Bounded.lean from the pack3 sources (read-only).

The star6 library proves its reductions as closed theorems with the *global* hypotheses
`Hyp` / `IID` (`ex1red`, `Cut2.twoSided_all`, `iic_of`, `iiToDMSII_c`, `dmsI_all`, `minimal_impossible'`).
A bounded-order statement needs the same inductions with the hypotheses restricted to orders <= N.
This script copies those six proofs verbatim from pack3/src and applies the listed textual
replacements (each must match exactly the stated number of times, otherwise the script aborts).
Nothing else is new in the generated file except the three counting lemmas and the definitions
written out in HEADER below.
"""
import os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, "..", "pack3", "src")
L4 = "MhFact_341b6e5e1be16205.lean"    # layer 4  (ex1red)
L12 = "MhFact_90b4662cdeba097d.lean"   # layer 12 (twoSided_all, iic_of, iiToDMSII_c, dmsI_all)
DII = "MhFact_974f7197c1be8069.lean"   # DmsIILean (minimal_impossible')


def cut(fn, start, end):
    """lines from the first line starting with `start` up to (not including) the next line starting with `end`"""
    lines = open(os.path.join(SRC, fn), encoding="utf-8").read().split("\n")
    i = next(k for k, l in enumerate(lines) if l.startswith(start))
    j = next(k for k in range(i + 1, len(lines)) if lines[k].startswith(end))
    while lines[j - 1].strip() == "":
        j -= 1
    return "\n".join(lines[i:j]), (i + 1, j)


def rep(text, pairs, what):
    for old, new, cnt in pairs:
        got = text.count(old)
        if got != cnt:
            sys.exit(f"{what}: expected {cnt} occurrence(s) of {old!r}, found {got}")
        text = text.replace(old, new)
    return text


prov = []

# ---------------------------------------------------------------- ex1red: the induction step
body, rng = cut(L4, "  have hbig : ∃ S, BigCut P S := by", "end red")
prov.append(f"ex1red_step body = {L4} lines {rng[0]}-{rng[1]} (proof of `ex1red`), 1 replacement")
body = rep(body, [
    ("twoC (hH _ _ GA (vA ▸ hA10) m2)", "twoC (IH _ _ GA (by omega) (by omega))", 1),
], "ex1red")

# ---------------------------------------------------------------- Cut2.twoSided_all
ts, rng = cut(L12, "/-- every side with at least 4 vertices is 2-sided, under (H) -/", "/-- hypothesis (II_D) of II-RED2")
prov.append(f"Cut2.twoSided_all_le = {L12} lines {rng[0]}-{rng[1]} (`Cut2.twoSided_all`), 2 replacements")
ts = rep(ts, [
    ("theorem Cut2.twoSided_all (hH : Hyp) (C : Cut2 P) (hG : InG X P) (h4 : 4 ≤ scount P C.S true) :",
     "theorem Cut2.twoSided_all_le (N : Nat) (hH : HypLE N) (C : Cut2 P) (hG : InG X P) (hN : vcount P ≤ N)\n"
     "    (h4 : 4 ≤ scount P C.S true) :", 1),
    ("    have hex := ex1red RH2P.pstat smallFacts hH _ _ (C.clo_inG hG) h10",
     "    have hsp := vcount_split P C.S\n"
     "    have hle : vcount C.clo ≤ N := by rw [C.vcount_clo]; omega\n"
     "    have hex := ex1red_le N RH2P.pstat smallFacts hH _ _ (C.clo_inG hG) h10 hle", 1),
], "twoSided_all")

# ---------------------------------------------------------------- iic_of
iic, rng = cut(L12, "theorem iic_of (hH : Hyp) (hD : IID) : IIc := by", "/-- (II) for connected hosts gives the suppression form")
prov.append(f"iic_le = {L12} lines {rng[0]}-{rng[1]} (`iic_of`), 7 replacements")
iic = rep(iic, [
    ("theorem iic_of (hH : Hyp) (hD : IID) : IIc := by",
     "theorem iic_le (N : Nat) (hH : HypLE N) (hD : IIDLE N) : IIcLE N := by", 1),
    ("InG X P → vcount P = n → ∀ g, P g →\n      Colourable (leafSet P g) 6 from fun X P hG g hg => h _ X P hG rfl g hg",
     "InG X P → vcount P = n → n ≤ N → ∀ g, P g →\n      Colourable (leafSet P g) 6 from fun X P hG hN g hg => h _ X P hG rfl hN g hg", 1),
    ("  intro X P hG hn g hg", "  intro X P hG hn hN g hg", 1),
    ("C.twoSided_all hH hG h4", "C.twoSided_all_le N hH hG (by omega) h4", 1),
    ("(C.flip.clo_inG hG) rfl _ (", "(C.flip.clo_inG hG) rfl (by omega) _ (", 2),
    ("(C.swap12.flip.clo_inG hG) rfl _ (", "(C.swap12.flip.clo_inG hG) rfl (by omega) _ (", 1),
    ("  apply hD X P hG hn6", "  apply hD X P hG hn6 (by omega)", 1),
], "iic_of")

# ---------------------------------------------------------------- iiToDMSII_c
sup, rng = cut(L12, "theorem iiToDMSII_c (hII : IIc) : DmsIILean.DMS_II := by", "/-- **(H) and (II_D) imply DMS**")
prov.append(f"supp_le = {L12} lines {rng[0]}-{rng[1]} (`iiToDMSII_c`), 2 replacements")
sup = rep(sup, [
    ("theorem iiToDMSII_c (hII : IIc) : DmsIILean.DMS_II := by\n  intro G Q S _ hloop huw hC hB hK _",
     "theorem supp_le (N : Nat) (hII : IIcLE N) (G : MGraph) (Q : Fin G.m → Prop) (S : SuppData Q) (hloop : Loopless G)\n"
     "    (huw : S.u ≠ S.w) (hC : ConnectedOn (supp Q S.y S.u S.w)) (hB : BridgelessOn (supp Q S.y S.u S.w))\n"
     "    (hK : CubicOn (supp Q S.y S.u S.w)) (hN : G.n ≤ N) : Colourable Q 6 := by", 1),
    ("⟨hXl, hC, hB, hK⟩ (Fin.last G.m) (Or.inl rfl)",
     "⟨hXl, hC, hB, hK⟩\n"
     "    (by have := vcount_le_n (supp Q S.y S.u S.w); have : (addEdge G S.u S.w).n = G.n := rfl; omega)\n"
     "    (Fin.last G.m) (Or.inl rfl)", 1),
], "iiToDMSII_c")

# ---------------------------------------------------------------- dmsI_all
dall, rng = cut(L12, "theorem dmsI_all (hH : Hyp)", "/-- **Theorem II-RED2**")
prov.append(f"dmsI_all_le = {L12} lines {rng[0]}-{rng[1]} (`dmsI_all`), 5 replacements")
dall = rep(dall, [
    ("theorem dmsI_all (hH : Hyp) : ∀ (X : MGraph) (P : Fin X.m → Prop), Loopless X → BridgelessOn P → CubicOn P →\n"
     "    Colourable P 6 := by",
     "theorem dmsI_all_le (N : Nat) (hH : HypLE N) : ∀ (X : MGraph) (P : Fin X.m → Prop), Loopless X → BridgelessOn P →\n"
     "    CubicOn P → vcount P ≤ N → Colourable P 6 := by", 1),
    ("CubicOn P → vcount P = n →\n      Colourable P 6 from fun X P hL hB hK => h _ X P hL hB hK rfl",
     "CubicOn P → vcount P = n → n ≤ N →\n      Colourable P 6 from fun X P hL hB hK hN => h _ X P hL hB hK rfl hN", 1),
    ("  intro X P hL hB hK hn", "  intro X P hL hB hK hn hN", 1),
    ("      · have hex := ex1red RH2P.pstat smallFacts hH _ _ hGK h10",
     "      · have hmono := vcount_mono (P := compK P s) (Q := P) (fun f hf => hf.1)\n"
     "        have hex := ex1red_le N RH2P.pstat smallFacts hH _ _ hGK h10 (by omega)", 1),
    ("        (cubic_of_part hK s False (compR_iff s)) rfl",
     "        (cubic_of_part hK s False (compR_iff s)) rfl (by have := vcount_compR (P := P) s hs; omega)", 1),
], "dmsI_all")

# ---------------------------------------------------------------- minimal_impossible'
mi, rng = cut(DII, "theorem minimal_impossible' (hI : DMS_I)", "/-- **(I) and (II) imply DMS**")
prov.append(f"minimal_impossible_le = {DII} lines {rng[0]}-{rng[1]} (`DmsIILean.minimal_impossible'`), 4 replacements")
mi = rep(mi, [
    ("theorem minimal_impossible' (hI : DMS_I) (hII : DMS_II) (hsub : Subcubic G) (hloop : Loopless G) {Q : Fin G.m → Prop}\n"
     "    (hmin : MinimalCounterexample Q 6) : False := by",
     "theorem minimal_impossible_le (N : Nat) (hI : CubicLE N) (hII : IIcLE N) (hsub : Subcubic G) (hloop : Loopless G)\n"
     "    (hN : 2 * G.n ≤ N) {Q : Fin G.m → Prop} (hmin : MinimalCounterexample Q 6) : False := by", 1),
    ("exact hI (dbl G) (dblP Q) hL hC hB hK hiso",
     "exact hI (dbl G) (dblP Q) ⟨hL, hC, hB, hK⟩\n"
     "            (by have := vcount_le_n (dblP Q); have : (dbl G).n = G.n + G.n := rfl; omega)", 1),
    ("exact hII G Q S hsub hloop huw hC hB hK hiso",
     "exact supp_le N hII G Q S hloop huw hC hB hK (by omega)", 1),
    ("exact hI G Q hloop hconn hB hK hiso",
     "exact hI G Q ⟨hloop, hconn, hB, hK⟩ (by have := vcount_le_n Q; omega)", 1),
], "minimal_impossible'")

OPT = "set_option backward.isDefEq.respectTransparency false in\n"

HEADER = """-- GENERATED by pack5/gen5.py from the pack3 sources; do not edit by hand (edit gen5.py).
/-
  Star6Bounded.lean — the reductions of the star6 chain restricted to bounded order.

  The library proves `ex1red`, `iic_of`, `dmsI_all`, `dms_of_I_II` with the global hypotheses (H) = `Hyp` and
  (II_D) = `IID`.  Here the same inductions are run with the hypotheses restricted to graphs with at most `N`
  vertices (`HypLE N`, `IIDLE N`); the conclusions are then restricted to order at most `N`.
  The proofs are the library proofs, copied by gen5.py with the replacements listed there:
@@PROVENANCE@@
  New text: `cntF_le_n`, `vcount_le_n`, `vcount_mono`, the four definitions, the statements, and `ex1red_le`.
-/
import MhFact_90b4662cdeba097d

namespace RH2F
open MGraph
open Classical

/-- the counting function is at most `n` -/
theorem cntF_le_n : ∀ (n : Nat) (W : Fin n → Prop), cntF n W ≤ n
  | 0, _ => Nat.le_refl 0
  | n + 1, W => by
    rw [cntF_succ]
    have := cntF_le_n n (fun i => W (Fin.castSucc i))
    split <;> omega

/-- an edge set has at most as many vertices as the ambient multigraph -/
theorem vcount_le_n {X : MGraph} (P : Fin X.m → Prop) : vcount P ≤ X.n := cntF_le_n _ _

/-- the vertex count is monotone in the edge set -/
theorem vcount_mono {X : MGraph} {P Q : Fin X.m → Prop} (h : ∀ f, P f → Q f) : vcount P ≤ vcount Q :=
  cntF_mono _ _ _ (fun _ ⟨f, hf, hv⟩ => ⟨f, h f hf, hv⟩)

/-- (H) restricted to at most `N` vertices: every 2-cut-reduced connected bridgeless loopless cubic multigraph with
    between 10 and `N` vertices is EX1-good -/
def HypLE (N : Nat) : Prop :=
  ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → 10 ≤ vcount P → vcount P ≤ N → TwoCutReducedOn P → EX1On P

/-- (II_D) restricted to at most `N` vertices -/
def IIDLE (N : Nat) : Prop :=
  ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → 6 ≤ vcount P → vcount P ≤ N → TwoCutReducedOn P → ∀ g, P g →
    (∀ h, P h → h ≠ g → ¬ X.Joins h (X.ends g).1 (X.ends g).2) → (∀ S, TwoCut P S → ¬ Crosses P S g) →
    Colourable (leafSet P g) 6

/-- the leaf case for all connected bridgeless cubic hosts with at most `N` vertices -/
def IIcLE (N : Nat) : Prop :=
  ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → vcount P ≤ N → ∀ g, P g → Colourable (leafSet P g) 6

/-- star 6-colourability of all connected bridgeless cubic loopless multigraphs with at most `N` vertices -/
def CubicLE (N : Nat) : Prop :=
  ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → vcount P ≤ N → Colourable P 6

section red
variable {X : MGraph} {P : Fin X.m → Prop}

/-- **The induction step of Theorem EX1-RED, unconditionally**: a connected bridgeless loopless cubic multigraph `P`
    with at least 10 vertices that is *not* 2-cut-reduced is EX1-good as soon as all smaller ones (with at least 10
    vertices) are.  (The proof of `ex1red` with its induction hypothesis made explicit; the hypothesis (H) is not
    used in this branch except on a smaller graph.) -/
theorem ex1red_step (hPS : PStat) (hSF : SmallFacts) (hG : InG X P) (n : Nat) (hn : vcount P = n) (h10 : 10 ≤ n)
    (IH : ∀ (Y : MGraph) (Q : Fin Y.m → Prop), InG Y Q → 10 ≤ vcount Q → vcount Q < n → EX1On Q)
    (hred : ¬ TwoCutReducedOn P) : EX1On P := by
@@BODY@@

end red

/-- **Theorem EX1-RED for bounded order**: (H) for at most `N` vertices gives EX1-goodness of every connected
    bridgeless loopless cubic multigraph with between 10 and `N` vertices -/
theorem ex1red_le (N : Nat) (hPS : PStat) (hSF : SmallFacts) (hH : HypLE N) :
    ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → 10 ≤ vcount P → vcount P ≤ N → EX1On P := by
  suffices h : ∀ n, ∀ (X : MGraph) (P : Fin X.m → Prop), InG X P → vcount P = n → 10 ≤ n → n ≤ N → EX1On P from
    fun X P hG h10 hN => h _ X P hG rfl h10 hN
  intro n
  induction n using Nat.strongRecOn with
  | _ n ih =>
  intro X P hG hn h10 hN
  by_cases hred : TwoCutReducedOn P
  · exact hH X P hG (by omega) (by omega) hred
  · exact ex1red_step hPS hSF hG n hn h10 (fun Y Q hGQ h1 h2 => ih _ h2 Y Q hGQ rfl h1 (by omega)) hred

section ii4
variable {X : MGraph} {P : Fin X.m → Prop}

@@OPT@@/-- every side with at least 4 vertices is 2-sided, under (H) for at most `N` vertices -/
@@TS@@

@@OPT@@/-- the leaf case for connected hosts with at most `N` vertices, from (H) and (II_D) for at most `N` vertices -/
@@IIC@@

@@OPT@@/-- the suppression configuration over a host with at most `N` vertices -/
@@SUP@@

@@OPT@@/-- (I) for all bridgeless loopless cubic multigraphs with at most `N` vertices -/
@@DALL@@

end ii4

end RH2F

namespace RH2F
open MGraph DmsIILean

variable {G : MGraph}

/-- the minimal-counterexample argument of `DmsIILean.dms_of_I_II` for an ambient multigraph `G` with `2 * G.n ≤ N`
    (the doubling step uses a cubic multigraph on `2 * G.n` vertices) -/
@@MI@@

/-- **bounded form of "(I) and (II) imply DMS"** -/
theorem dms_le (N : Nat) (hI : CubicLE N) (hII : IIcLE N) :
    ∀ (G : MGraph), Subcubic G → Loopless G → 2 * G.n ≤ N → ∀ P : Fin G.m → Prop, Colourable P 6 := by
  intro G hsub hloop hN P
  apply Classical.byContradiction
  intro hP
  obtain ⟨Q, -, hmin⟩ := exists_minimal 6 P hP
  exact minimal_impossible_le N hI hII hsub hloop hN hmin

end RH2F
"""

# strip the docstring line that precedes the copied twoSided_all (we supply our own)
ts = ts.split("\n", 1)[1]
out = (HEADER.replace("@@PROVENANCE@@", "\n".join("    * " + p for p in prov))
       .replace("@@BODY@@", body).replace("@@TS@@", ts, 1).replace("@@IIC@@", iic, 1).replace("@@SUP@@", sup, 1)
       .replace("@@DALL@@", dall, 1).replace("@@MI@@", mi, 1).replace("@@OPT@@", OPT))
os.makedirs(os.path.join(HERE, "src"), exist_ok=True)
with open(os.path.join(HERE, "src", "Star6Bounded.lean"), "w", encoding="utf-8") as f:
    f.write(out)
print("\n".join(prov))
print("wrote src/Star6Bounded.lean", len(out.split("\n")), "lines")
