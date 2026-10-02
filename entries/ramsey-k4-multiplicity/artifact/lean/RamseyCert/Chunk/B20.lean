import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_20 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_15, eB_20, eB_27,
  eB_28, eB_30, eB_31, eB_35, eB_38, eB_41, eB_42, eB_43, eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_52, eB_53,
  eB_54, eB_55, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_99, eB_100, eB_102,
  eB_104, eB_107, eB_108, eB_110, eB_111, eB_113, eB_114, eB_115, eB_116, eB_117, eB_119, eB_120, eB_122, eB_123, eB_124, eB_127,
  eB_129, eB_130, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_141, eB_144, eB_147, eB_148, eB_149, eB_151, eB_152, eB_154,
  eB_155, eB_157, eB_158, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_200, eB_201, eB_202, eB_203, eB_204,
  eB_205, eB_206, eB_207, eB_208, eB_210, eB_211, eB_212, eB_213, eB_214, eB_215, eB_218, eB_221, eB_223, eB_224, eB_227, eB_228,
  eB_229, eB_231, eB_232, eB_234, eB_235, eB_237, eB_238, eB_240, eB_241, eB_243, eB_244, eB_245, eB_246, eB_247, eB_248, eB_250,
  eB_251, eB_252, eB_253, eB_254, eB_255, eB_256, eB_258, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_284,
  eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_300,
  eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324,
  eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_381,
  eB_387, eB_388, eB_389, eB_390, eB_391, eB_392, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_402, eB_404, eB_405,
  eB_408, eB_411, eB_414, eB_417, eB_420, eB_423, eB_424, eB_425, eB_426, eB_436, eB_437, eB_439, eB_440, eB_441, eB_442, eB_444,
  eB_445, eB_447, eB_449, eB_450, eB_453, eB_457, eB_458, eB_459, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509,
  eB_510, eB_511, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542,
  eB_543, eB_544, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598,
  eB_599, eB_600, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_611, eB_613, eB_614, eB_616,
  eB_617, eB_618, eB_619, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_653, eB_654, eB_655, eB_656,
  eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672,
  eB_673, eB_674, eB_675, eB_676, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_693, eB_694, eB_695, eB_696,
  eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708, eB_725, eB_726, eB_727, eB_728,
  eB_729, eB_730, eB_731, eB_732, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_766, eB_770, eB_771, eB_772,
  eB_773, eB_776, eB_777, eB_792, eB_793, eB_798, eB_799, eB_800, eB_801, eB_804, eB_805, eB_806, eB_816, eB_817, eB_823, eB_826,
  eB_827, eB_832, eB_833, eB_834, eB_835, eB_838, eB_839, eB_842, eB_843, eB_844, eB_845, eB_854, eB_855, eB_856, eB_857, eB_861,
  eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_882,
  eB_883, eB_888, eB_889, eB_897, eB_898, eB_899, eB_900, eB_901, eB_903, eB_904, eB_911, eB_913, eB_915, eB_916, eB_917, eB_918,
  eB_920, eB_923, eB_924, eB_925, eB_927, eB_928, eB_929, eB_930, eB_931, eB_934, eB_935, eB_936, eB_937, eB_939, eB_940, eB_942,
  eB_943, eB_952, eB_956, eB_957, eB_958, eB_965, eB_966, eB_967, eB_968, eB_971, eB_972, eB_975, eB_977, eB_978, eB_979, eB_980,
  eB_981, eB_983, eB_984, eB_985, eB_986, eB_989, eB_990, eB_991, eB_994, eB_995, eB_996, eB_998, eB_1000, eB_1003, eB_1007, eB_1009,
  eB_1011, eB_1012, eB_1013, eB_1014, eB_1015, eB_1016, eB_1019]
theorem nbOKB_20 : nbB_20 = nbhd entsB eB_20 := by decide +kernel
theorem mkOKB_20 : mkEnt 32 1024 W rB_20 20 = eB_20 := by decide +kernel
theorem tB_20 : kTermA 4294967295 eB_20 nbB_20 = 125360543560984135421173880 := by decide +kernel


end RamseyCert
