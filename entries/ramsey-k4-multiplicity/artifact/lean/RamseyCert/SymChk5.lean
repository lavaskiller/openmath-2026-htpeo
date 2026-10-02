import RamseyCert.Data.Base
import RamseyCert.SymDefs

set_option maxRecDepth 1000000
namespace RamseyCert

theorem symchk_5 : symRows rowsR ((rowsR.drop 640).take 128) 640 = true := by decide +kernel

end RamseyCert
