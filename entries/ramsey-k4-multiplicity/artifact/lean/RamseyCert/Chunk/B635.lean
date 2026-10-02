import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_635 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_16, eB_17, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_30,
  eB_31, eB_32, eB_42, eB_43, eB_44, eB_45, eB_46, eB_47, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63,
  eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_79, eB_80, eB_81, eB_82, eB_83, eB_87, eB_92, eB_93,
  eB_94, eB_95, eB_96, eB_103, eB_104, eB_105, eB_124, eB_125, eB_126, eB_127, eB_128, eB_129, eB_130, eB_131, eB_132, eB_133,
  eB_134, eB_135, eB_148, eB_149, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157, eB_158, eB_159, eB_164, eB_165,
  eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_189, eB_192,
  eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222,
  eB_223, eB_224, eB_225, eB_226, eB_245, eB_246, eB_247, eB_251, eB_252, eB_253, eB_254, eB_259, eB_261, eB_263, eB_264, eB_265,
  eB_266, eB_267, eB_272, eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293,
  eB_294, eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325,
  eB_326, eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_385, eB_386, eB_387, eB_388, eB_389,
  eB_390, eB_397, eB_398, eB_402, eB_403, eB_404, eB_423, eB_424, eB_425, eB_426, eB_427, eB_431, eB_432, eB_433, eB_434, eB_435,
  eB_436, eB_437, eB_438, eB_439, eB_440, eB_447, eB_448, eB_449, eB_456, eB_457, eB_458, eB_466, eB_467, eB_468, eB_469, eB_472,
  eB_474, eB_475, eB_476, eB_477, eB_480, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_496,
  eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_528,
  eB_529, eB_530, eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_553, eB_554, eB_555, eB_556,
  eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_589, eB_590, eB_591, eB_592,
  eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616,
  eB_617, eB_618, eB_619, eB_620, eB_633, eB_634, eB_635, eB_636, eB_638, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651,
  eB_652, eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_671, eB_673, eB_674, eB_675, eB_676, eB_677, eB_681,
  eB_682, eB_683, eB_684, eB_688, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704,
  eB_709, eB_710, eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736,
  eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_772, eB_773, eB_774, eB_775,
  eB_776, eB_777, eB_782, eB_783, eB_788, eB_789, eB_792, eB_793, eB_796, eB_797, eB_798, eB_799, eB_802, eB_803, eB_804, eB_805,
  eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_822, eB_823, eB_825, eB_826, eB_827, eB_832, eB_833, eB_838, eB_839, eB_840,
  eB_841, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_858, eB_859, eB_878, eB_879, eB_882, eB_883, eB_886, eB_887, eB_888,
  eB_889, eB_894, eB_895, eB_897, eB_899, eB_901, eB_902, eB_904, eB_905, eB_906, eB_907, eB_910, eB_911, eB_912, eB_914, eB_915,
  eB_916, eB_919, eB_920, eB_924, eB_926, eB_928, eB_929, eB_930, eB_932, eB_934, eB_935, eB_936, eB_941, eB_942, eB_943, eB_944,
  eB_950, eB_951, eB_957, eB_958, eB_959, eB_960, eB_961, eB_964, eB_968, eB_971, eB_972, eB_973, eB_975, eB_976, eB_977, eB_979,
  eB_980, eB_984, eB_985, eB_986, eB_987, eB_988, eB_990, eB_991, eB_992, eB_993, eB_995, eB_999, eB_1002, eB_1005, eB_1006, eB_1007,
  eB_1012, eB_1014, eB_1017, eB_1018, eB_1020, eB_1021, eB_1023]
theorem nbOKB_635 : nbB_635 = nbhd entsB eB_635 := by decide +kernel
theorem mkOKB_635 : mkEnt 32 1024 W rB_635 635 = eB_635 := by decide +kernel
theorem tB_635 : kTermA 4294967295 eB_635 nbB_635 = 125413950482534951944715742 := by decide +kernel


end RamseyCert
