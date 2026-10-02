import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_0 : symRows rowsR ((rowsR.drop 0).take 128) 0 = true := by decide +kernel

end RamseyCert
