import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_137 : List Ent := [
  eR_16, eR_17, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_42, eR_43,
  eR_44, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59,
  eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_88, eR_89, eR_90, eR_91,
  eR_92, eR_93, eR_94, eR_95, eR_96, eR_103, eR_105, eR_124, eR_125, eR_127, eR_129, eR_130, eR_131, eR_132, eR_134, eR_135,
  eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179,
  eR_180, eR_181, eR_182, eR_183, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_214, eR_215, eR_216, eR_217,
  eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_246, eR_247, eR_251, eR_252, eR_259, eR_292, eR_293, eR_294, eR_295, eR_296,
  eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312,
  eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_328,
  eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_341, eR_342, eR_343, eR_344,
  eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_385, eR_386, eR_387, eR_388,
  eR_389, eR_390, eR_398, eR_402, eR_403, eR_404, eR_423, eR_424, eR_425, eR_426, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440,
  eR_447, eR_448, eR_449, eR_456, eR_457, eR_458, eR_486, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496,
  eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_512,
  eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_528,
  eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593,
  eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609,
  eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_629, eR_630, eR_631, eR_632, eR_633,
  eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657,
  eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_709, eR_710, eR_711, eR_712, eR_713,
  eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729,
  eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745,
  eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_784,
  eR_785, eR_788, eR_789, eR_792, eR_793, eR_794, eR_795, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_808, eR_809, eR_810,
  eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_822, eR_823, eR_826, eR_827, eR_830, eR_831, eR_832,
  eR_833, eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_850, eR_851, eR_852, eR_853, eR_858, eR_859, eR_866, eR_867, eR_876,
  eR_877, eR_878, eR_879, eR_888, eR_889, eR_890, eR_891, eR_894, eR_895, eR_896, eR_897, eR_901, eR_902, eR_904, eR_906, eR_907,
  eR_911, eR_912, eR_915, eR_920, eR_921, eR_923, eR_928, eR_932, eR_938, eR_940, eR_942, eR_943, eR_944, eR_947, eR_948, eR_949,
  eR_954, eR_956, eR_957, eR_958, eR_960, eR_963, eR_966, eR_969, eR_971, eR_973, eR_975, eR_976, eR_977, eR_978, eR_980, eR_984,
  eR_985, eR_986, eR_987, eR_988, eR_990, eR_992, eR_993, eR_994, eR_995, eR_996, eR_998, eR_1000, eR_1001, eR_1002, eR_1005, eR_1008,
  eR_1009, eR_1011, eR_1012, eR_1020, eR_1021, eR_1023]
theorem nbOKR_137 : nbR_137 = nbhd entsR eR_137 := by decide +kernel
theorem mkOKR_137 : mkEnt 32 1024 W rR_137 137 = eR_137 := by decide +kernel
theorem tR_137 : kTermA 4294967295 eR_137 nbR_137 = 75951286223050290552426000 := by decide +kernel


end RamseyCert
