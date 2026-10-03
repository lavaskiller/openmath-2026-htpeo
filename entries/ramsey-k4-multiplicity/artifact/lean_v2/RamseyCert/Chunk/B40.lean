import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_40 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_14, eB_19, eB_27,
  eB_29, eB_30, eB_32, eB_34, eB_37, eB_40, eB_42, eB_44, eB_45, eB_47, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61,
  eB_62, eB_63, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_98, eB_99, eB_101, eB_102, eB_103,
  eB_105, eB_106, eB_108, eB_109, eB_110, eB_111, eB_112, eB_114, eB_115, eB_117, eB_118, eB_120, eB_121, eB_123, eB_125, eB_127,
  eB_128, eB_131, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_140, eB_143, eB_146, eB_148, eB_150, eB_151, eB_153, eB_154,
  eB_156, eB_157, eB_159, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_200, eB_201, eB_202, eB_203, eB_204,
  eB_205, eB_206, eB_207, eB_209, eB_210, eB_211, eB_212, eB_213, eB_214, eB_216, eB_217, eB_219, eB_221, eB_222, eB_225, eB_227,
  eB_229, eB_230, eB_232, eB_233, eB_235, eB_236, eB_238, eB_239, eB_240, eB_241, eB_242, eB_244, eB_245, eB_246, eB_247, eB_249,
  eB_250, eB_251, eB_252, eB_253, eB_254, eB_257, eB_258, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_276,
  eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_308,
  eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_332,
  eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_383,
  eB_387, eB_388, eB_389, eB_390, eB_391, eB_393, eB_394, eB_396, eB_397, eB_398, eB_399, eB_401, eB_403, eB_404, eB_406, eB_409,
  eB_412, eB_415, eB_418, eB_421, eB_423, eB_424, eB_425, eB_426, eB_435, eB_437, eB_438, eB_440, eB_441, eB_443, eB_444, eB_446,
  eB_448, eB_449, eB_451, eB_454, eB_457, eB_458, eB_459, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468,
  eB_469, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502,
  eB_503, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551,
  eB_552, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591,
  eB_592, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616,
  eB_617, eB_618, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_645, eB_646, eB_647, eB_648, eB_649,
  eB_650, eB_651, eB_652, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673,
  eB_674, eB_675, eB_676, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_697,
  eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708, eB_717, eB_718, eB_719, eB_720, eB_721,
  eB_722, eB_723, eB_724, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_767, eB_768, eB_769, eB_770, eB_771,
  eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_794, eB_795, eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_806, eB_807,
  eB_808, eB_809, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_832, eB_833,
  eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_844, eB_845, eB_848, eB_849, eB_850, eB_851, eB_854, eB_855, eB_860, eB_861,
  eB_862, eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879,
  eB_880, eB_881, eB_892, eB_893, eB_899, eB_900, eB_901, eB_903, eB_905, eB_907, eB_910, eB_911, eB_912, eB_913, eB_914, eB_915,
  eB_916, eB_925, eB_926, eB_928, eB_930, eB_933, eB_934, eB_935, eB_937, eB_939, eB_942, eB_944, eB_946, eB_948, eB_949, eB_955,
  eB_957, eB_961, eB_963, eB_965, eB_966, eB_968, eB_969, eB_970, eB_972, eB_974, eB_975, eB_976, eB_985, eB_986, eB_987, eB_988,
  eB_990, eB_991, eB_997, eB_1001, eB_1002, eB_1003, eB_1005, eB_1007, eB_1010, eB_1011, eB_1012, eB_1019, eB_1020, eB_1023]
theorem nbOKB_40 : nbB_40 = nbhd entsB eB_40 := by decide +kernel
theorem mkOKB_40 : mkEnt 32 1024 W rB_40 40 = eB_40 := by decide +kernel
theorem tB_40 : kTermA 4294967295 eB_40 nbB_40 = 118170831442847885729869320 := by decide +kernel


end RamseyCert
