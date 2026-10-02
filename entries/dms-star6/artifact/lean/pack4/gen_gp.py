import json
d=json.load(open('facts/gp_data.json'))
def pat(x): return '['+', '.join(str(int(ch)-1) for ch in x)+']'
def rows(lst): return '['+', '.join(pat(x) for x in lst)+']'
def section(K,L,n0,N,nmin,fact):
    D=d[str(K)]; P=[D['pats']['P%d'%i] for i in range(L)]
    tabs=[]
    for r in range(L):
        seam=[D['pats']['S%d_%d'%(r,j)] for j in range(r+L)]
        tabs.append(P+seam)
    small=[D['small'][str(n)] for n in range(nmin,n0)]
    ns=f'GP{K}Five'
    W=3*K
    graph = 'gp2' if K==2 else 'gp3'
    wir = 'gpWir' if K==2 else 'gp3Wir'
    o=[]
    o.append(f'namespace {ns}\nopen BlockStar GPetersen2\n')
    if K==3:
        o.append('''def qjmp (s : Nat) : Nat := match s with
  | 0 => 1 | 1 => 0 | _ => 3

/-- wiring of GP(n,3): edge types 0: u_i u_{i+1}, 1: u_i v_i, 2: v_i v_{i+3}; vertex types u = 0, v = 1 -/
def gp3Wir : Wir Unit 2 3 where
  D := 3
  src := fun _ s => psrc s
  jmp := fun _ s => qjmp s
  dst := fun _ s => pdst s
  hsrc := by intro w s; unfold psrc; split <;> omega
  hdst := by intro w s; unfold pdst; split <;> omega
  hjmp := by intro w s; unfold qjmp; split <;> omega
  jumps := [0, 1, 3]
  hjmps := by intro w s; unfold qjmp; split <;> decide

/-- the generalized Petersen graph GP(n,3): u_i = 2i, v_i = 2i+1; edges 3i: u_i u_{i+1}, 3i+1: u_i v_i, 3i+2: v_i v_{i+3} -/
def gp3 (n : Nat) : MGraph := BG gp3Wir n (fun _ => ())
''')
    o.append(f'''/-- colour (0..4) of the edge type `s` in a block with pattern `c = [outer, spoke, inner]` -/
def ct (c : List Nat) (s : Nat) : Nat := (c.getD s 0) % 5

theorem ct_lt : ∀ c s, ct c s < 5 := fun _ _ => Nat.mod_lt _ (by decide)

/-- row r (r = n mod {L}): the periodic patterns P0..P{L-1} followed by the seam S{{r}}_0 .. S{{r}}_{{r+{L-1}}}
    (fact {fact}, colours shifted to 0..4) -/
def tabs : List (List (List Nat)) :=
  [''' + ',\n   '.join(rows(t) for t in tabs) + f''']

/-- explicit colourings for n = {nmin}..{n0-1} (row n - {nmin}) -/
def smallTab : List (List (List Nat)) :=
  [''' + ',\n   '.join(rows(t) for t in small) + f''']

/-- index into row `n % {L}` of `tabs` of the pattern of block `J`: the periodic part has length
    `n - n % {L} - {L}`, then comes the seam of length `n % {L} + {L}` -/
def idx (n J : Nat) : Nat :=
  if J < n - n % {L} - {L} then J % {L} else {L} + (J - (n - n % {L} - {L}))

/-- the pattern of block `J` -/
def chi (n J : Nat) : List Nat :=
  if n < {n0} then (smallTab.getD (n - {nmin}) []).getD J [] else (tabs.getD (n % {L}) []).getD (idx n J) []

/-- the colouring -/
def col (n : Nat) : Fin ({graph} n).m → Fin 5 := bcol 3 ct ct_lt (chi n)

abbrev winsAll (n : Nat) : Prop :=
  ∀ j, j < n → winOK {wir} ct (fun _ => ()) (fun p => chi n ((j + p) % n)) = true

theorem Wsmall : ∀ n, n < {N} → {nmin} ≤ n → winsAll n := by decide +kernel

theorem rep {{n : Nat}} (hn : {N} ≤ n) {{j : Nat}} (hj : j < n) :
    ∃ j', j' < 20 + n % {L} ∧ ∀ p, p ≤ {W} →
      idx (20 + n % {L}) ((j' + p) % (20 + n % {L})) = idx n ((j + p) % n) := by
  have hm : (20 + n % {L}) % {L} = n % {L} := by omega
  rcases (show j + {W} < n - n % {L} - {L} ∨ n - n % {L} - {L} ≤ j + {W} by omega) with c | c
  · refine ⟨j % {L}, by omega, ?_⟩
    intro p hp
    rw [SeamSeq.modc hj (by omega), SeamSeq.modc (by omega) (by omega)]
    simp only [idx, hm]
    split_ifs <;> omega
  · refine ⟨j + (20 + n % {L}) - n, by omega, ?_⟩
    intro p hp
    rw [SeamSeq.modc hj (by omega), SeamSeq.modc (by omega) (by omega)]
    simp only [idx, hm]
    split_ifs <;> omega

/-- **GP(n,{K}).** For every `n ≥ {nmin}`, `col n` is a star edge colouring of GP(n,{K}) with 5 colours. -/
theorem star5 (n : Nat) (hn : {nmin} ≤ n) : ({graph} n).Star 5 (col n) := by
  apply star_of_windows
  intro j hj
  by_cases c : n < {N}
  · exact ⟨_, _, fun p _ => ⟨rfl, rfl⟩, Wsmall n c hn j hj⟩
  · obtain ⟨j', hj', hrep⟩ := rep (by omega) hj
    have hn' : 20 + n % {L} < {N} := by omega
    refine ⟨fun _ => (), fun p => chi (20 + n % {L}) ((j' + p) % (20 + n % {L})), ?_,
      Wsmall _ hn' (by omega) j' hj'⟩
    intro p hp
    have hp' : p ≤ {W} := hp
    refine ⟨rfl, ?_⟩
    have e := hrep p hp'
    have h1 : ¬ n < {n0} := by omega
    have h2 : ¬ 20 + n % {L} < {n0} := by omega
    have hm : (20 + n % {L}) % {L} = n % {L} := by omega
    show chi (20 + n % {L}) ((j' + p) % (20 + n % {L})) = chi n ((j + p) % n)
    unfold chi
    rw [if_neg h1, if_neg h2, hm, e]

end {ns}

#print axioms {ns}.star5
''')
    return '\n'.join(o)
hdr='''/-
  GPFive.lean — generalized Petersen graphs: GP(n,2) (n ≥ 5) and GP(n,3) (n ≥ 7) have star edge colourings
  with 5 colours.

  GP(n,k): vertices u_i, v_i (i ∈ Z/n); edges u_i u_{i+1} (outer), u_i v_i (spokes), v_i v_{i+k} (inner).
  Encoding as cyclic block graphs (`BlockStar.BG`): u_i = 2i, v_i = 2i+1 in `Fin (n * 2)`; edge (i, s) has number
  3i+s in `Fin (n * 3)`, s = 0: u_i u_{i+1}, s = 1: u_i v_i, s = 2: v_i v_{i+k}.  GP(n,2) is `GPetersen2.gp2 n`.
  The colourings are those of the star6 facts 2f8113cb26f31818 (k = 2) and cab2712392b5deec (k = 3): a periodic
  part (period 5 resp. 4) followed by a seam whose length depends on n mod 5 resp. n mod 4, and explicit
  colourings for the small n.  (Generated by gen_gp.py from the pattern tables of the two facts.)
-/
import GPetersen2Defs

'''
open('pack4/src/GPFive.lean','w',encoding='utf-8',newline='\n').write(hdr+section(2,5,10,25,5,'2f8113cb26f31818')+'\n'+section(3,4,14,24,7,'cab2712392b5deec'))
