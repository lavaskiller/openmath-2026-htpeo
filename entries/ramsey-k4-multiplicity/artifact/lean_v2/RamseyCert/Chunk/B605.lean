import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_605 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_14, eB_15, eB_19, eB_20, eB_28, eB_29, eB_31, eB_32, eB_34, eB_35, eB_37, eB_38,
  eB_40, eB_41, eB_43, eB_44, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60,
  eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95,
  eB_96, eB_99, eB_102, eB_105, eB_108, eB_111, eB_114, eB_117, eB_120, eB_123, eB_126, eB_129, eB_132, eB_133, eB_134, eB_135,
  eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150, eB_152, eB_153, eB_155, eB_156, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_167, eB_168, eB_169, eB_170, eB_171, eB_172, eB_174, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190,
  eB_191, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_210, eB_213, eB_214, eB_217, eB_220, eB_223, eB_226,
  eB_229, eB_232, eB_235, eB_238, eB_241, eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_256, eB_257, eB_259, eB_264, eB_265,
  eB_266, eB_267, eB_268, eB_269, eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287,
  eB_296, eB_297, eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323,
  eB_324, eB_325, eB_326, eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355,
  eB_356, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_392,
  eB_393, eB_395, eB_396, eB_400, eB_401, eB_404, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_427, eB_431, eB_432, eB_433,
  eB_434, eB_437, eB_440, eB_442, eB_443, eB_445, eB_446, eB_449, eB_452, eB_455, eB_456, eB_460, eB_461, eB_465, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_490, eB_492, eB_493, eB_494,
  eB_495, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_513, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521,
  eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_557,
  eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583, eB_584, eB_585,
  eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_611, eB_614, eB_617, eB_620, eB_621,
  eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628, eB_633, eB_634, eB_635, eB_636, eB_638, eB_641, eB_642, eB_643, eB_644,
  eB_645, eB_646, eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_665, eB_666, eB_667, eB_668, eB_671, eB_673, eB_674, eB_675,
  eB_676, eB_677, eB_678, eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707,
  eB_708, eB_711, eB_713, eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_736, eB_737,
  eB_738, eB_739, eB_740, eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_768,
  eB_769, eB_776, eB_777, eB_778, eB_779, eB_784, eB_785, eB_790, eB_794, eB_795, eB_796, eB_797, eB_798, eB_799, eB_802, eB_803,
  eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_820, eB_821, eB_824, eB_826, eB_827, eB_830, eB_831, eB_834, eB_835, eB_836,
  eB_837, eB_838, eB_839, eB_840, eB_841, eB_846, eB_847, eB_848, eB_849, eB_854, eB_855, eB_858, eB_864, eB_865, eB_866, eB_867,
  eB_876, eB_877, eB_880, eB_881, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_896, eB_897, eB_900, eB_901,
  eB_906, eB_908, eB_909, eB_911, eB_914, eB_916, eB_917, eB_919, eB_920, eB_923, eB_925, eB_927, eB_933, eB_934, eB_935, eB_936,
  eB_938, eB_939, eB_942, eB_943, eB_944, eB_945, eB_946, eB_947, eB_951, eB_953, eB_957, eB_958, eB_959, eB_962, eB_964, eB_967,
  eB_969, eB_970, eB_971, eB_973, eB_976, eB_979, eB_981, eB_983, eB_985, eB_986, eB_988, eB_993, eB_994, eB_996, eB_997, eB_999,
  eB_1002, eB_1003, eB_1004, eB_1005, eB_1007, eB_1009, eB_1013, eB_1016, eB_1019, eB_1020, eB_1021]
theorem nbOKB_605 : nbB_605 = nbhd entsB eB_605 := by decide +kernel
theorem mkOKB_605 : mkEnt 32 1024 W rB_605 605 = eB_605 := by decide +kernel
theorem tB_605 : kTermA 4294967295 eB_605 nbB_605 = 123117854343629589923331124 := by decide +kernel


end RamseyCert
