import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_1 : symRows rowsR ((rowsR.drop 128).take 128) 128 = true := by decide +kernel

end RamseyCert
