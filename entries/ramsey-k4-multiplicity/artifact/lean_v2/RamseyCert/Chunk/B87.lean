import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_87 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_17, eB_22, eB_24, eB_26, eB_27, eB_28,
  eB_29, eB_42, eB_43, eB_44, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67,
  eB_72, eB_73, eB_74, eB_75, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_100, eB_101, eB_102, eB_103,
  eB_104, eB_105, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121, eB_122, eB_123, eB_124, eB_125, eB_126, eB_127, eB_128,
  eB_129, eB_130, eB_131, eB_132, eB_136, eB_137, eB_138, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_164, eB_165, eB_166,
  eB_167, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194,
  eB_195, eB_196, eB_199, eB_200, eB_201, eB_202, eB_203, eB_208, eB_209, eB_210, eB_214, eB_227, eB_228, eB_229, eB_236, eB_237,
  eB_238, eB_239, eB_240, eB_241, eB_245, eB_246, eB_247, eB_252, eB_254, eB_255, eB_256, eB_257, eB_258, eB_259, eB_261, eB_264,
  eB_265, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_295,
  eB_296, eB_297, eB_298, eB_299, eB_300, eB_304, eB_305, eB_306, eB_307, eB_309, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317,
  eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_352,
  eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376,
  eB_385, eB_386, eB_387, eB_389, eB_397, eB_408, eB_409, eB_410, eB_414, eB_415, eB_416, eB_420, eB_421, eB_422, eB_424, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_453, eB_454, eB_455, eB_456, eB_458, eB_459,
  eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487,
  eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_516, eB_517, eB_518, eB_519,
  eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551,
  eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_574, eB_577, eB_578,
  eB_579, eB_580, eB_583, eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_622,
  eB_624, eB_625, eB_627, eB_629, eB_630, eB_631, eB_632, eB_635, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651, eB_652,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_698, eB_705, eB_706, eB_707, eB_708, eB_713, eB_714, eB_715,
  eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_761, eB_765, eB_766, eB_767, eB_772, eB_773, eB_774,
  eB_775, eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799, eB_800,
  eB_801, eB_802, eB_803, eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_822, eB_823, eB_828, eB_829, eB_832, eB_833, eB_834,
  eB_835, eB_852, eB_853, eB_856, eB_857, eB_860, eB_861, eB_866, eB_867, eB_872, eB_873, eB_880, eB_881, eB_882, eB_883, eB_884,
  eB_885, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_896, eB_897, eB_899, eB_900, eB_902, eB_904, eB_906,
  eB_908, eB_911, eB_912, eB_913, eB_914, eB_916, eB_917, eB_918, eB_921, eB_927, eB_930, eB_933, eB_935, eB_936, eB_937, eB_939,
  eB_940, eB_942, eB_943, eB_945, eB_947, eB_948, eB_949, eB_951, eB_952, eB_953, eB_956, eB_957, eB_959, eB_960, eB_961, eB_964,
  eB_967, eB_969, eB_975, eB_981, eB_982, eB_986, eB_990, eB_991, eB_992, eB_995, eB_997, eB_1000, eB_1004, eB_1005, eB_1007, eB_1008,
  eB_1009, eB_1010, eB_1011, eB_1014, eB_1015, eB_1017, eB_1018, eB_1020, eB_1023]
theorem nbOKB_87 : nbB_87 = nbhd entsB eB_87 := by decide +kernel
theorem mkOKB_87 : mkEnt 32 1024 W rB_87 87 = eB_87 := by decide +kernel
theorem tB_87 : kTermA 4294967295 eB_87 nbB_87 = 123932210363940006960164190 := by decide +kernel


end RamseyCert
