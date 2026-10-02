import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_6 : symRows rowsR ((rowsR.drop 768).take 128) 768 = true := by decide +kernel

end RamseyCert
