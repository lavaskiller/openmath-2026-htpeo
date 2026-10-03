import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_617 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_18, eR_28,
  eR_29, eR_31, eR_32, eR_36, eR_43, eR_44, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55,
  eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79,
  eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_99, eR_108, eR_111, eR_114, eR_120, eR_123, eR_124, eR_125,
  eR_127, eR_128, eR_130, eR_131, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156,
  eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173,
  eR_174, eR_175, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197,
  eR_198, eR_199, eR_210, eR_215, eR_216, eR_218, eR_219, eR_221, eR_222, eR_229, eR_232, eR_235, eR_238, eR_244, eR_250, eR_255,
  eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275,
  eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315,
  eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339,
  eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_381, eR_382, eR_384, eR_391, eR_402, eR_403, eR_407, eR_410,
  eR_413, eR_416, eR_419, eR_422, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_436, eR_438, eR_439,
  eR_441, eR_444, eR_447, eR_448, eR_452, eR_455, eR_459, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_496,
  eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520,
  eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_553,
  eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_585,
  eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_609,
  eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_637,
  eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653,
  eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_693,
  eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_717,
  eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_741,
  eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_765,
  eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_786, eR_787, eR_790,
  eR_791, eR_792, eR_793, eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_808, eR_809, eR_818, eR_819, eR_822,
  eR_823, eR_824, eR_825, eR_835, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_850, eR_851, eR_854, eR_855, eR_864, eR_868,
  eR_869, eR_870, eR_871, eR_872, eR_873, eR_878, eR_879, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_897,
  eR_899, eR_900, eR_903, eR_904, eR_907, eR_908, eR_909, eR_912, eR_913, eR_916, eR_919, eR_920, eR_922, eR_923, eR_925, eR_934,
  eR_935, eR_937, eR_939, eR_940, eR_941, eR_943, eR_944, eR_945, eR_948, eR_949, eR_950, eR_953, eR_956, eR_958, eR_959, eR_962,
  eR_963, eR_964, eR_965, eR_969, eR_971, eR_972, eR_976, eR_977, eR_978, eR_980, eR_982, eR_984, eR_987, eR_988, eR_991, eR_994,
  eR_995, eR_996, eR_998, eR_999, eR_1000, eR_1001, eR_1002, eR_1004, eR_1005, eR_1006, eR_1007, eR_1009, eR_1017, eR_1018, eR_1019, eR_1020,
  eR_1022, eR_1023]
theorem nbOKR_617 : nbR_617 = nbhd entsR eR_617 := by decide +kernel
theorem mkOKR_617 : mkEnt 32 1024 W rR_617 617 = eR_617 := by decide +kernel
theorem tR_617 : kTermA 4294967295 eR_617 nbR_617 = 114654467000094560633431872 := by decide +kernel


end RamseyCert
