import RamseyCert.Fast
import RamseyCert.Data.Base

/-!
# Cross-check with compiled evaluation (`native_decide`) - NOT part of the kernel certificate

The computable evaluator `fastK` (proved equal to the specification in `fastK_eq`) is run on the
row masks directly (it rebuilds all packed data itself). These theorems depend on the extra axiom
introduced by `native_decide` (trust in the Lean compiler/interpreter and GMP).
-/

set_option maxRecDepth 1000000
namespace RamseyCert

theorem native_fastK_R : fastK 32 1024 W rowsR = 99839872478310077417039516880 := by native_decide

theorem native_fastK_B : fastK 32 1024 W rowsB = 100297877536367701755653260597 := by native_decide

#print axioms native_fastK_R
#print axioms native_fastK_B

end RamseyCert
