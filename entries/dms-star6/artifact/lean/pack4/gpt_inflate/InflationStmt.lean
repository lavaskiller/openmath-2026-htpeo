import InflationDefs

namespace Inflation

/-- **Petersen-type vertex inflation.** For every loopless multigraph `H` and every injective port assignment,
    the inflated graph has a star edge colouring with 5 colours. -/
theorem inflate_star5 (H : MGraph) (hl : H.Loopless) (slot : Fin H.m → Bool → Fin 3) (hinj : PortsInj H slot) :
    ∃ c : Fin (inflate H slot).m → Fin 5, (inflate H slot).Star 5 c := by
  sorry

end Inflation
