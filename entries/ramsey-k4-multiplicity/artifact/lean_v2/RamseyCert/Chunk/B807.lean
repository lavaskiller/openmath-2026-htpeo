import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_807 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_14, eB_16, eB_17, eB_18, eB_19, eB_22, eB_24, eB_26, eB_27, eB_29,
  eB_30, eB_31, eB_33, eB_34, eB_35, eB_36, eB_37, eB_39, eB_40, eB_43, eB_44, eB_45, eB_46, eB_56, eB_57, eB_58,
  eB_59, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71, eB_80, eB_81, eB_82,
  eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_97, eB_99, eB_101,
  eB_104, eB_106, eB_110, eB_111, eB_113, eB_114, eB_115, eB_119, eB_120, eB_121, eB_124, eB_127, eB_130, eB_136, eB_137, eB_138,
  eB_139, eB_140, eB_142, eB_143, eB_144, eB_145, eB_146, eB_150, eB_151, eB_152, eB_156, eB_157, eB_158, eB_160, eB_161, eB_162,
  eB_163, eB_164, eB_165, eB_166, eB_167, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_209, eB_211, eB_212,
  eB_213, eB_214, eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_227, eB_231, eB_232, eB_234, eB_235, eB_236,
  eB_239, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_248, eB_250, eB_252, eB_254, eB_255, eB_257, eB_259, eB_284, eB_285,
  eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_300, eB_301,
  eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340, eB_341,
  eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378, eB_379, eB_380, eB_385,
  eB_386, eB_387, eB_389, eB_391, eB_392, eB_394, eB_395, eB_397, eB_399, eB_400, eB_402, eB_403, eB_404, eB_406, eB_407, eB_408,
  eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_424, eB_426, eB_436, eB_437, eB_439, eB_440, eB_443, eB_446, eB_447, eB_449,
  eB_450, eB_451, eB_452, eB_453, eB_454, eB_456, eB_458, eB_461, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483, eB_484, eB_485,
  eB_486, eB_487, eB_504, eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517,
  eB_518, eB_519, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_536, eB_537, eB_538, eB_539, eB_540, eB_541,
  eB_542, eB_543, eB_544, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_581,
  eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_610, eB_611, eB_613, eB_614, eB_616,
  eB_617, eB_618, eB_619, eB_620, eB_622, eB_624, eB_625, eB_627, eB_628, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675,
  eB_676, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707,
  eB_708, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723,
  eB_724, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_765, eB_766, eB_767, eB_768, eB_769, eB_774, eB_775,
  eB_778, eB_779, eB_780, eB_781, eB_784, eB_785, eB_792, eB_793, eB_798, eB_799, eB_804, eB_805, eB_806, eB_807, eB_808, eB_809,
  eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_826, eB_827, eB_832, eB_838, eB_839, eB_842, eB_843, eB_850,
  eB_851, eB_858, eB_859, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_874, eB_875, eB_878, eB_879, eB_882,
  eB_883, eB_884, eB_885, eB_890, eB_891, eB_892, eB_893, eB_897, eB_898, eB_900, eB_904, eB_906, eB_908, eB_909, eB_910, eB_911,
  eB_912, eB_913, eB_914, eB_918, eB_920, eB_921, eB_922, eB_927, eB_928, eB_929, eB_930, eB_931, eB_937, eB_939, eB_941, eB_944,
  eB_946, eB_947, eB_948, eB_951, eB_952, eB_953, eB_955, eB_960, eB_962, eB_965, eB_967, eB_969, eB_971, eB_972, eB_975, eB_976,
  eB_977, eB_978, eB_979, eB_982, eB_983, eB_986, eB_988, eB_989, eB_993, eB_994, eB_999, eB_1000, eB_1003, eB_1004, eB_1005, eB_1006,
  eB_1007, eB_1012, eB_1013, eB_1014, eB_1017, eB_1019, eB_1020, eB_1021, eB_1022, eB_1023]
theorem nbOKB_807 : nbB_807 = nbhd entsB eB_807 := by decide +kernel
theorem mkOKB_807 : mkEnt 32 1024 W rB_807 807 = eB_807 := by decide +kernel
theorem tB_807 : kTermA 4294967295 eB_807 nbB_807 = 96467746402616018595866337 := by decide +kernel


end RamseyCert
