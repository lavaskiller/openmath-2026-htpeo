import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_825 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75,
  eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_96, eB_103, eB_104, eB_105, eB_124, eB_125, eB_126, eB_127,
  eB_128, eB_129, eB_130, eB_131, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_139, eB_140, eB_141, eB_142, eB_143,
  eB_144, eB_145, eB_146, eB_147, eB_160, eB_161, eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179,
  eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_210, eB_211,
  eB_212, eB_213, eB_227, eB_228, eB_229, eB_230, eB_231, eB_232, eB_233, eB_234, eB_235, eB_236, eB_237, eB_238, eB_239, eB_240,
  eB_241, eB_242, eB_243, eB_244, eB_248, eB_249, eB_250, eB_253, eB_254, eB_255, eB_263, eB_264, eB_265, eB_266, eB_267, eB_269,
  eB_272, eB_273, eB_274, eB_275, eB_278, eB_280, eB_281, eB_282, eB_283, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293,
  eB_294, eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325,
  eB_326, eB_327, eB_332, eB_333, eB_334, eB_335, eB_343, eB_345, eB_346, eB_347, eB_348, eB_350, eB_353, eB_354, eB_355, eB_356,
  eB_357, eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_391, eB_392, eB_393, eB_394,
  eB_395, eB_396, eB_399, eB_400, eB_401, eB_402, eB_403, eB_404, eB_423, eB_424, eB_425, eB_426, eB_427, eB_428, eB_429, eB_430,
  eB_435, eB_436, eB_437, eB_438, eB_439, eB_440, eB_447, eB_448, eB_449, eB_456, eB_457, eB_458, eB_462, eB_463, eB_464, eB_465,
  eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501,
  eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533,
  eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_565,
  eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_591,
  eB_593, eB_594, eB_595, eB_596, eB_600, eB_601, eB_602, eB_603, eB_604, eB_608, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626,
  eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_635, eB_638, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_706, eB_709, eB_710, eB_711,
  eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769, eB_772, eB_773,
  eB_776, eB_777, eB_784, eB_785, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_810, eB_811, eB_820, eB_821,
  eB_822, eB_823, eB_824, eB_825, eB_826, eB_827, eB_830, eB_831, eB_834, eB_835, eB_836, eB_837, eB_844, eB_845, eB_846, eB_847,
  eB_850, eB_851, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_868, eB_869, eB_874, eB_875, eB_882, eB_883,
  eB_884, eB_885, eB_892, eB_893, eB_894, eB_895, eB_896, eB_897, eB_898, eB_899, eB_903, eB_911, eB_912, eB_913, eB_915, eB_917,
  eB_920, eB_922, eB_925, eB_926, eB_927, eB_929, eB_930, eB_932, eB_935, eB_939, eB_940, eB_943, eB_945, eB_947, eB_948, eB_951,
  eB_952, eB_954, eB_957, eB_960, eB_961, eB_962, eB_963, eB_964, eB_967, eB_972, eB_974, eB_978, eB_982, eB_984, eB_985, eB_987,
  eB_988, eB_990, eB_991, eB_992, eB_993, eB_994, eB_996, eB_997, eB_999, eB_1002, eB_1003, eB_1004, eB_1005, eB_1006, eB_1007, eB_1008,
  eB_1010, eB_1011, eB_1012, eB_1013, eB_1014, eB_1015, eB_1018, eB_1019]
theorem nbOKB_825 : nbB_825 = nbhd entsB eB_825 := by decide +kernel
theorem mkOKB_825 : mkEnt 32 1024 W rB_825 825 = eB_825 := by decide +kernel
theorem tB_825 : kTermA 4294967295 eB_825 nbB_825 = 93860372343778523362969895 := by decide +kernel


end RamseyCert
