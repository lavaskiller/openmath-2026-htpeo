import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_435 : List Ent := [
  eB_13, eB_14, eB_15, eB_18, eB_19, eB_27, eB_28, eB_30, eB_31, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40, eB_42,
  eB_43, eB_45, eB_46, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68,
  eB_69, eB_70, eB_71, eB_96, eB_97, eB_99, eB_100, eB_102, eB_103, eB_105, eB_107, eB_108, eB_110, eB_111, eB_112, eB_113,
  eB_114, eB_115, eB_116, eB_117, eB_119, eB_120, eB_122, eB_123, eB_125, eB_126, eB_128, eB_129, eB_130, eB_131, eB_132, eB_139,
  eB_140, eB_142, eB_143, eB_145, eB_146, eB_147, eB_148, eB_149, eB_151, eB_152, eB_154, eB_155, eB_157, eB_158, eB_168, eB_169,
  eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_208, eB_209,
  eB_210, eB_211, eB_212, eB_213, eB_216, eB_217, eB_218, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_228, eB_229, eB_231,
  eB_232, eB_234, eB_235, eB_237, eB_238, eB_240, eB_241, eB_243, eB_244, eB_245, eB_249, eB_251, eB_252, eB_253, eB_254, eB_255,
  eB_256, eB_257, eB_259, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_280,
  eB_281, eB_282, eB_283, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_304,
  eB_305, eB_306, eB_307, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_324, eB_325, eB_326, eB_327, eB_328,
  eB_329, eB_330, eB_331, eB_340, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_365, eB_366, eB_367, eB_368,
  eB_369, eB_370, eB_371, eB_372, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_393, eB_395,
  eB_396, eB_397, eB_398, eB_399, eB_401, eB_403, eB_405, eB_408, eB_411, eB_414, eB_417, eB_420, eB_423, eB_424, eB_425, eB_426,
  eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_438, eB_441, eB_443, eB_446, eB_448, eB_450, eB_453,
  eB_456, eB_457, eB_458, eB_461, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_504, eB_505,
  eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537,
  eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_585,
  eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_609, eB_612, eB_615, eB_618, eB_621, eB_622, eB_623, eB_624, eB_625,
  eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_641,
  eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_685, eB_686, eB_687, eB_688, eB_689,
  eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705,
  eB_706, eB_707, eB_708, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_749, eB_750, eB_751, eB_752, eB_753,
  eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769,
  eB_776, eB_777, eB_778, eB_779, eB_782, eB_783, eB_786, eB_787, eB_790, eB_791, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801,
  eB_806, eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_832, eB_833, eB_834,
  eB_835, eB_836, eB_837, eB_840, eB_841, eB_842, eB_843, eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856,
  eB_857, eB_860, eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_870, eB_871, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881,
  eB_884, eB_885, eB_888, eB_889, eB_892, eB_893, eB_894, eB_895, eB_897, eB_898, eB_899, eB_900, eB_905, eB_906, eB_907, eB_910,
  eB_912, eB_915, eB_918, eB_920, eB_921, eB_922, eB_925, eB_926, eB_928, eB_930, eB_931, eB_933, eB_936, eB_939, eB_940, eB_943,
  eB_946, eB_951, eB_952, eB_954, eB_956, eB_958, eB_959, eB_961, eB_968, eB_969, eB_970, eB_971, eB_972, eB_973, eB_975, eB_978,
  eB_979, eB_982, eB_987, eB_989, eB_990, eB_993, eB_997, eB_998, eB_999, eB_1000, eB_1008, eB_1012, eB_1015, eB_1019, eB_1021, eB_1022,
  eB_1023]
theorem nbOKB_435 : nbB_435 = nbhd entsB eB_435 := by decide +kernel
theorem mkOKB_435 : mkEnt 32 1024 W rB_435 435 = eB_435 := by decide +kernel
theorem tB_435 : kTermA 4294967295 eB_435 nbB_435 = 117125562193126345889672005 := by decide +kernel


end RamseyCert
