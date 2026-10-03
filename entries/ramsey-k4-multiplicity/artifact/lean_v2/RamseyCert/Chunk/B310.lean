import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_310 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_15, eB_16, eB_18, eB_19, eB_21, eB_23, eB_25, eB_29,
  eB_30, eB_31, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_44, eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_54,
  eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83,
  eB_92, eB_93, eB_94, eB_95, eB_98, eB_100, eB_102, eB_104, eB_107, eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122,
  eB_123, eB_124, eB_127, eB_130, eB_141, eB_144, eB_147, eB_150, eB_151, eB_152, eB_156, eB_157, eB_158, eB_160, eB_161, eB_162,
  eB_163, eB_165, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193,
  eB_194, eB_195, eB_197, eB_204, eB_205, eB_206, eB_207, eB_209, eB_211, eB_213, eB_215, eB_218, eB_221, eB_224, eB_227, eB_231,
  eB_232, eB_234, eB_235, eB_236, eB_239, eB_243, eB_244, eB_249, eB_252, eB_253, eB_257, eB_264, eB_265, eB_266, eB_267, eB_272,
  eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_296, eB_297, eB_298, eB_299, eB_304,
  eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_336,
  eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_365,
  eB_366, eB_367, eB_368, eB_377, eB_378, eB_379, eB_380, eB_387, eB_389, eB_393, eB_396, eB_397, eB_401, eB_402, eB_404, eB_405,
  eB_409, eB_410, eB_411, eB_415, eB_416, eB_417, eB_421, eB_422, eB_423, eB_425, eB_427, eB_428, eB_429, eB_430, eB_436, eB_437,
  eB_439, eB_440, eB_443, eB_446, eB_447, eB_449, eB_450, eB_454, eB_455, eB_456, eB_457, eB_461, eB_462, eB_463, eB_464, eB_465,
  eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_490, eB_492, eB_493, eB_494,
  eB_495, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522,
  eB_523, eB_530, eB_532, eB_533, eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_553,
  eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_565, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583,
  eB_584, eB_585, eB_586, eB_587, eB_588, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612, eB_615,
  eB_618, eB_622, eB_624, eB_625, eB_627, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651,
  eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679,
  eB_680, eB_688, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_710, eB_713,
  eB_714, eB_715, eB_716, eB_718, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736,
  eB_741, eB_742, eB_743, eB_744, eB_751, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_774,
  eB_775, eB_776, eB_777, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_792, eB_793, eB_796, eB_797, eB_798,
  eB_799, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_812, eB_813, eB_814, eB_815, eB_818, eB_819, eB_824, eB_825, eB_826,
  eB_827, eB_828, eB_829, eB_830, eB_831, eB_836, eB_837, eB_842, eB_843, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_852,
  eB_853, eB_854, eB_855, eB_856, eB_860, eB_861, eB_862, eB_863, eB_866, eB_867, eB_874, eB_875, eB_880, eB_881, eB_886, eB_887,
  eB_890, eB_891, eB_896, eB_898, eB_901, eB_903, eB_907, eB_908, eB_910, eB_911, eB_912, eB_915, eB_917, eB_919, eB_923, eB_926,
  eB_927, eB_928, eB_932, eB_935, eB_936, eB_937, eB_939, eB_940, eB_942, eB_943, eB_944, eB_946, eB_950, eB_951, eB_952, eB_953,
  eB_961, eB_962, eB_963, eB_965, eB_966, eB_971, eB_972, eB_973, eB_975, eB_980, eB_982, eB_983, eB_989, eB_990, eB_991, eB_992,
  eB_993, eB_994, eB_995, eB_997, eB_1000, eB_1002, eB_1004, eB_1006, eB_1009, eB_1013, eB_1014, eB_1019, eB_1020, eB_1022]
theorem nbOKB_310 : nbB_310 = nbhd entsB eB_310 := by decide +kernel
theorem mkOKB_310 : mkEnt 32 1024 W rB_310 310 = eB_310 := by decide +kernel
theorem tB_310 : kTermA 4294967295 eB_310 nbB_310 = 80349257881399012942780396 := by decide +kernel


end RamseyCert
