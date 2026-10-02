#!/usr/bin/env python3
"""gen_all.py K [inflation]: write src/GPAll.lean (GP(n,k) for all 1 <= k <= K), src/All.lean (all statements and
axiom lists) and order.txt (build order)."""
import sys, os
HERE = os.path.dirname(os.path.abspath(__file__)); NL = chr(10)
K = int(sys.argv[1]); infl = len(sys.argv) > 2
cases = NL.join(f'  · exact ⟨_, GPn{k}.star5 n (by omega)⟩' for k in range(1, K + 1))
fcases = NL.join(f'  · exact GPn{k}.family n (by omega)' for k in range(1, K + 1))
gpall = f'''/-
  GPAll.lean — generalized Petersen graphs GP(n,k) for all 1 ≤ k ≤ {K} and all n ≥ 2k+1, except GP(3,1) (the prism,
  whose star chromatic index is 6): star edge colourings with 5 colours.  (Zhu–Shao conjecture: every GP(n,k)
  except GP(3,1) has star chromatic index at most 5; this is the case k ≤ {K}.)
-/
''' + NL.join(f'import GPn{k}' for k in range(1, K + 1)) + f'''

open GPk

/-- **GP(n,k), 1 ≤ k ≤ {K}, n ≥ 2k+1, (n,k) ≠ (3,1)**: a star edge colouring with 5 colours exists -/
theorem gp_star5 (k n : Nat) (hk : 1 ≤ k) (hK : k ≤ {K}) (hn : 2 * k + 1 ≤ n) (hex : ¬ (n = 3 ∧ k = 1)) :
    ∃ c : Fin (gp n k).m → Fin 5, (gp n k).Star 5 c := by
  interval_cases k
{cases}

/-- the same in the vocabulary of the DMS chain: subcubic, loopless, every edge set star 5- and 6-colourable -/
theorem gp_family (k n : Nat) (hk : 1 ≤ k) (hK : k ≤ {K}) (hn : 2 * k + 1 ≤ n) (hex : ¬ (n = 3 ∧ k = 1)) :
    StarFam (gp n k) 5 := by
  interval_cases k
{fcases}
'''
open(os.path.join(HERE, 'src', 'GPAll.lean'), 'w', encoding='utf-8', newline=NL).write(gpall)
names = ['FlowerSnark.flower_star', 'FlowerSnark.flower_family', 'GoldbergSnark.goldberg_star',
         'GoldbergSnark.goldberg_family', 'GPetersen2.gp2_star', 'GPetersen2.gp2_spokes', 'GPetersen2.gp2_spoke_family',
         'GP2Five.star5', 'GP2Five.gp2_family', 'GP3Five.star5', 'GP3Five.gp3_family']
for k in (4, 6, 8, 10, 12, 14): names += [f'GPk.star{k}', f'GPk.family{k}']
names += ['gp_star5', 'gp_family', 'Mobius.star5', 'Mobius.mobius_family']
if infl: names += ['Inflation.inflate_star5']
aux = ['BlockStar.star_of_windows', 'BlockStar.BG_ends', 'BlockStar.BG_loopless', 'BlockStar.BG_subcubic',
       'BlockStar.colourable_of_star', 'BlockStar.dms_iff', 'starFamily_dms', 'GPk.periodic_star']
allf = '''/-
  All.lean — every main statement of pack4 (`#check`) with its axioms (`#print axioms`).
  The output of this file is build/All.out (copied to axioms.log).
-/
import Families
import Check
import GPPeriodic
import GPAll
import Mobius
''' + ('import Inflation' + NL if infl else '') + '''
#print MGraph
#print MGraph.Star
#print MGraph.StarOn
#print MGraph.Bicol
#print MGraph.Walk4
#print MGraph.Subcubic
#print MGraph.Loopless
#print MGraph.Colourable
#print RH2F.DMS
#print BlockStar.DMSfor
#print StarFamily
#print GPk.StarFam
#print BlockStar.Wir
#print BlockStar.BG
#print BlockStar.bcol
#print FlowerSnark.flowerSnark
#print GoldbergSnark.goldbergSnark
#print GPetersen2.gp2
#print GP3Five.gp3
#print GPk.gp
#print Mobius.mobius
''' + ('#print Inflation.inflate' + NL + '#print Inflation.PortsInj' + NL if infl else '') + '''''' + NL.join(f'#check @{n}' for n in names + aux) + NL + NL.join(f'#print axioms {n}' for n in names + aux) + NL
open(os.path.join(HERE, 'src', 'All.lean'), 'w', encoding='utf-8', newline=NL).write(allf)
order = ['BlockStar', 'SeamSeq', 'SeamStar', 'BlockProps', 'FlowerSnark', 'GoldbergSnark', 'GPetersen2Defs',
         'GPetersen2W1', 'GPetersen2W2', 'GPetersen2W3', 'GPetersen2', 'GPFive', 'Families', 'Check', 'GPPeriodic']
for k in range(1, K + 1):
    order += open(os.path.join(HERE, 'search', f'gp{k}.modules')).read().split()
order += ['GPAll', 'Mobius', 'InflationDefs']
if infl: order += open(os.path.join(HERE, 'inflation.modules')).read().split()
order += ['Sanity', 'All']
open(os.path.join(HERE, 'order.txt'), 'w').write(NL.join(order) + NL)
print(len(order), 'modules')
