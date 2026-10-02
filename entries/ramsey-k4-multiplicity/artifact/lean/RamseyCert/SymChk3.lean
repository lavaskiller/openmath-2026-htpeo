import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_3 : symRows rowsR ((rowsR.drop 384).take 128) 384 = true := by decide +kernel

end RamseyCert
