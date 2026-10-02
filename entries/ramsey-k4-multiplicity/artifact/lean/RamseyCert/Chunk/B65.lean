import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_65 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_10, eB_14, eB_15, eB_18, eB_27, eB_30, eB_33, eB_36,
  eB_39, eB_42, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66, eB_67, eB_76,
  eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_96, eB_97, eB_98, eB_100, eB_101,
  eB_105, eB_106, eB_107, eB_109, eB_110, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_121, eB_122, eB_126, eB_129, eB_132,
  eB_133, eB_134, eB_135, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_148, eB_151, eB_154, eB_157, eB_160, eB_161, eB_162,
  eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_178, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192,
  eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_210, eB_213, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224,
  eB_225, eB_229, eB_232, eB_235, eB_238, eB_241, eB_244, eB_250, eB_253, eB_254, eB_255, eB_256, eB_257, eB_259, eB_264, eB_265,
  eB_266, eB_267, eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_281, eB_284, eB_285, eB_286, eB_287, eB_292,
  eB_293, eB_294, eB_295, eB_297, eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319,
  eB_322, eB_328, eB_329, eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354,
  eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_385,
  eB_386, eB_391, eB_394, eB_399, eB_402, eB_403, eB_407, eB_410, eB_413, eB_416, eB_419, eB_422, eB_423, eB_424, eB_425, eB_426,
  eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_438, eB_439, eB_442, eB_443, eB_445, eB_446, eB_447, eB_448, eB_452, eB_455,
  eB_457, eB_458, eB_460, eB_461, eB_466, eB_467, eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481,
  eB_488, eB_489, eB_490, eB_491, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515,
  eB_524, eB_525, eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548,
  eB_555, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_578, eB_581, eB_582,
  eB_583, eB_584, eB_586, eB_589, eB_590, eB_591, eB_592, eB_596, eB_597, eB_598, eB_599, eB_600, eB_601, eB_602, eB_603, eB_604,
  eB_611, eB_614, eB_617, eB_620, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647, eB_648,
  eB_653, eB_654, eB_655, eB_656, eB_663, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_681, eB_682, eB_683,
  eB_684, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_713, eB_714, eB_715,
  eB_716, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742, eB_743,
  eB_744, eB_749, eB_750, eB_751, eB_752, eB_758, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_776, eB_777, eB_778,
  eB_779, eB_784, eB_785, eB_786, eB_787, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_800, eB_801, eB_804, eB_805, eB_806,
  eB_807, eB_808, eB_809, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_832,
  eB_833, eB_834, eB_835, eB_838, eB_839, eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_862, eB_863, eB_868,
  eB_869, eB_878, eB_879, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_896,
  eB_897, eB_899, eB_901, eB_902, eB_903, eB_905, eB_906, eB_908, eB_909, eB_914, eB_915, eB_917, eB_919, eB_921, eB_923, eB_927,
  eB_928, eB_929, eB_930, eB_931, eB_933, eB_934, eB_935, eB_936, eB_937, eB_938, eB_940, eB_941, eB_945, eB_948, eB_949, eB_953,
  eB_957, eB_959, eB_961, eB_962, eB_963, eB_965, eB_972, eB_978, eB_979, eB_980, eB_981, eB_982, eB_984, eB_985, eB_987, eB_988,
  eB_990, eB_994, eB_995, eB_996, eB_998, eB_1000, eB_1008, eB_1012, eB_1013, eB_1019, eB_1022, eB_1023]
theorem nbOKB_65 : nbB_65 = nbhd entsB eB_65 := by decide +kernel
theorem mkOKB_65 : mkEnt 32 1024 W rB_65 65 = eB_65 := by decide +kernel
theorem tB_65 : kTermA 4294967295 eB_65 nbB_65 = 79020497556271059208839020 := by decide +kernel


end RamseyCert
