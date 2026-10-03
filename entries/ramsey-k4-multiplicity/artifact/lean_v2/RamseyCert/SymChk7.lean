import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_7 : symRows rowsR ((rowsR.drop 896).take 128) 896 = true := by decide +kernel

end RamseyCert
