import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_406 : List Ent := [
  eB_12, eB_13, eB_15, eB_16, eB_19, eB_21, eB_23, eB_25, eB_28, eB_30, eB_31, eB_32, eB_34, eB_37, eB_40, eB_43,
  eB_45, eB_47, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_72, eB_73, eB_74, eB_75, eB_76, eB_77,
  eB_78, eB_79, eB_96, eB_97, eB_101, eB_102, eB_104, eB_105, eB_106, eB_107, eB_108, eB_110, eB_113, eB_114, eB_115, eB_117,
  eB_119, eB_121, eB_123, eB_124, eB_126, eB_127, eB_129, eB_130, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_139,
  eB_141, eB_142, eB_144, eB_145, eB_147, eB_149, eB_151, eB_153, eB_155, eB_157, eB_158, eB_159, eB_168, eB_169, eB_170, eB_171,
  eB_172, eB_173, eB_174, eB_175, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191, eB_208, eB_209, eB_212, eB_213,
  eB_214, eB_215, eB_217, eB_218, eB_220, eB_221, eB_223, eB_224, eB_226, eB_228, eB_229, eB_230, eB_232, eB_233, eB_235, eB_237,
  eB_240, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_249, eB_250, eB_252, eB_253, eB_255, eB_257, eB_258, eB_259, eB_260,
  eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_284,
  eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_316,
  eB_317, eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340,
  eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372,
  eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_389, eB_391, eB_393, eB_394, eB_396, eB_397, eB_398, eB_399, eB_400,
  eB_401, eB_402, eB_406, eB_408, eB_410, eB_412, eB_414, eB_416, eB_418, eB_420, eB_422, eB_423, eB_425, eB_436, eB_439, eB_441,
  eB_443, eB_444, eB_445, eB_446, eB_447, eB_451, eB_453, eB_455, eB_457, eB_458, eB_459, eB_461, eB_470, eB_471, eB_472, eB_473,
  eB_474, eB_475, eB_476, eB_477, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_512, eB_513, eB_514, eB_515,
  eB_516, eB_517, eB_518, eB_519, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_545, eB_546, eB_547, eB_548,
  eB_549, eB_550, eB_551, eB_552, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_577, eB_578, eB_579, eB_580,
  eB_581, eB_582, eB_583, eB_584, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609, eB_611, eB_612, eB_614,
  eB_615, eB_617, eB_618, eB_620, eB_622, eB_624, eB_625, eB_627, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652,
  eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684,
  eB_693, eB_694, eB_695, eB_696, eB_697, eB_698, eB_699, eB_700, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723, eB_724,
  eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756,
  eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771, eB_774, eB_775, eB_778,
  eB_779, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_802, eB_803, eB_806,
  eB_807, eB_808, eB_809, eB_810, eB_811, eB_814, eB_815, eB_818, eB_819, eB_823, eB_834, eB_836, eB_837, eB_838, eB_839, eB_842,
  eB_843, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_861, eB_862, eB_864,
  eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_882, eB_883, eB_884, eB_885,
  eB_888, eB_889, eB_894, eB_895, eB_897, eB_899, eB_905, eB_906, eB_907, eB_912, eB_913, eB_915, eB_917, eB_918, eB_919, eB_920,
  eB_922, eB_924, eB_927, eB_928, eB_929, eB_931, eB_932, eB_935, eB_936, eB_938, eB_939, eB_940, eB_941, eB_946, eB_947, eB_953,
  eB_955, eB_957, eB_958, eB_962, eB_963, eB_966, eB_969, eB_974, eB_975, eB_976, eB_980, eB_983, eB_985, eB_986, eB_988, eB_990,
  eB_992, eB_995, eB_996, eB_997, eB_1000, eB_1004, eB_1005, eB_1010, eB_1013, eB_1014, eB_1015, eB_1017, eB_1018, eB_1019, eB_1021]
theorem nbOKB_406 : nbB_406 = nbhd entsB eB_406 := by decide +kernel
theorem mkOKB_406 : mkEnt 32 1024 W rB_406 406 = eB_406 := by decide +kernel
theorem tB_406 : kTermA 4294967295 eB_406 nbB_406 = 120336856625645753869934136 := by decide +kernel


end RamseyCert
