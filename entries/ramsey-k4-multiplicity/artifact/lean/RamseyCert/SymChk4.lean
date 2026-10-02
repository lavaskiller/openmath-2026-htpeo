import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_4 : symRows rowsR ((rowsR.drop 512).take 128) 512 = true := by decide +kernel

end RamseyCert
