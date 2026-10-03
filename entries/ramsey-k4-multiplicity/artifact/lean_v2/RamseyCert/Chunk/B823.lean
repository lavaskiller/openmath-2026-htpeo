import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_823 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_13, eB_15, eB_16, eB_17, eB_18, eB_19, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_27, eB_29, eB_30, eB_32, eB_34, eB_37, eB_38, eB_40, eB_42, eB_44, eB_45, eB_47, eB_56, eB_57, eB_58, eB_59,
  eB_60, eB_61, eB_62, eB_63, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83,
  eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_100, eB_103,
  eB_107, eB_110, eB_113, eB_116, eB_119, eB_122, eB_125, eB_128, eB_131, eB_133, eB_134, eB_135, eB_136, eB_139, eB_141, eB_142,
  eB_144, eB_145, eB_146, eB_147, eB_148, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_209, eB_210,
  eB_212, eB_213, eB_215, eB_216, eB_217, eB_218, eB_220, eB_221, eB_222, eB_223, eB_224, eB_226, eB_227, eB_229, eB_230, eB_232,
  eB_233, eB_235, eB_236, eB_238, eB_239, eB_241, eB_242, eB_244, eB_248, eB_251, eB_252, eB_255, eB_257, eB_258, eB_259, eB_260,
  eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_300,
  eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_324, eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_340,
  eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380,
  eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_392, eB_395, eB_397, eB_398, eB_400, eB_403, eB_404, eB_405, eB_406, eB_407,
  eB_408, eB_410, eB_411, eB_413, eB_414, eB_416, eB_417, eB_419, eB_420, eB_422, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432,
  eB_433, eB_434, eB_435, eB_436, eB_437, eB_438, eB_440, eB_441, eB_443, eB_444, eB_446, eB_448, eB_449, eB_450, eB_452, eB_453,
  eB_455, eB_459, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_486, eB_496, eB_497, eB_498, eB_499,
  eB_500, eB_501, eB_502, eB_503, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_545, eB_546, eB_547, eB_548,
  eB_549, eB_550, eB_551, eB_552, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_593, eB_594, eB_595, eB_596,
  eB_597, eB_598, eB_599, eB_600, eB_610, eB_613, eB_614, eB_615, eB_616, eB_619, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626,
  eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650,
  eB_651, eB_652, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674,
  eB_675, eB_676, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714,
  eB_715, eB_716, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738,
  eB_739, eB_740, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_765, eB_766, eB_767, eB_770, eB_771, eB_776,
  eB_777, eB_778, eB_779, eB_786, eB_787, eB_792, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_808, eB_809, eB_812, eB_813,
  eB_816, eB_817, eB_822, eB_823, eB_824, eB_825, eB_826, eB_827, eB_828, eB_829, eB_832, eB_833, eB_834, eB_835, eB_839, eB_840,
  eB_841, eB_842, eB_843, eB_848, eB_849, eB_850, eB_851, eB_858, eB_859, eB_860, eB_861, eB_872, eB_873, eB_874, eB_875, eB_878,
  eB_884, eB_885, eB_889, eB_890, eB_891, eB_897, eB_904, eB_906, eB_908, eB_909, eB_911, eB_912, eB_914, eB_917, eB_918, eB_919,
  eB_920, eB_922, eB_924, eB_925, eB_926, eB_928, eB_931, eB_932, eB_933, eB_935, eB_937, eB_938, eB_939, eB_943, eB_944, eB_946,
  eB_948, eB_953, eB_954, eB_956, eB_957, eB_959, eB_960, eB_961, eB_963, eB_965, eB_966, eB_967, eB_968, eB_969, eB_970, eB_973,
  eB_974, eB_975, eB_976, eB_977, eB_980, eB_985, eB_987, eB_989, eB_992, eB_994, eB_995, eB_996, eB_998, eB_1000, eB_1003, eB_1006,
  eB_1007, eB_1008, eB_1010, eB_1013, eB_1018, eB_1019, eB_1020, eB_1021]
theorem nbOKB_823 : nbB_823 = nbhd entsB eB_823 := by decide +kernel
theorem mkOKB_823 : mkEnt 32 1024 W rB_823 823 = eB_823 := by decide +kernel
theorem tB_823 : kTermA 4294967295 eB_823 nbB_823 = 90514226937854271179524068 := by decide +kernel


end RamseyCert
