import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_2 : symRows rowsR ((rowsR.drop 256).take 128) 256 = true := by decide +kernel

end RamseyCert
