import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_311 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_17, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_32, eR_35,
  eR_38, eR_41, eR_42, eR_43, eR_47, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67,
  eR_72, eR_73, eR_74, eR_75, eR_84, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_99, eR_101, eR_103,
  eR_105, eR_106, eR_110, eR_111, eR_113, eR_114, eR_115, eR_119, eR_120, eR_121, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_153, eR_154,
  eR_155, eR_159, eR_164, eR_165, eR_167, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_196, eR_197, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_212, eR_214, eR_216, eR_217, eR_219, eR_220,
  eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_241, eR_242, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_254, eR_255, eR_256, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335,
  eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371,
  eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_391, eR_392, eR_394,
  eR_395, eR_398, eR_399, eR_400, eR_403, eR_406, eR_407, eR_408, eR_412, eR_413, eR_414, eR_418, eR_419, eR_420, eR_424, eR_426,
  eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_451, eR_452, eR_453, eR_458, eR_459,
  eR_460, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_488, eR_490, eR_491, eR_497,
  eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529,
  eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_567,
  eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596,
  eR_601, eR_602, eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_623, eR_626, eR_628,
  eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660,
  eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_687, eR_688, eR_693,
  eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_729, eR_730, eR_731,
  eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_750, eR_751, eR_752, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_770, eR_771, eR_772, eR_773, eR_784, eR_785, eR_788, eR_789, eR_790, eR_791, eR_794, eR_795, eR_802,
  eR_803, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_816, eR_817, eR_820, eR_821, eR_822, eR_823, eR_832, eR_833, eR_834,
  eR_835, eR_838, eR_839, eR_840, eR_841, eR_844, eR_845, eR_856, eR_858, eR_859, eR_864, eR_865, eR_868, eR_869, eR_870, eR_871,
  eR_872, eR_873, eR_876, eR_877, eR_878, eR_879, eR_882, eR_883, eR_884, eR_885, eR_888, eR_889, eR_892, eR_893, eR_894, eR_895,
  eR_897, eR_899, eR_900, eR_902, eR_904, eR_905, eR_906, eR_908, eR_909, eR_913, eR_914, eR_916, eR_918, eR_920, eR_921, eR_922,
  eR_924, eR_925, eR_929, eR_930, eR_931, eR_933, eR_934, eR_938, eR_941, eR_945, eR_947, eR_948, eR_949, eR_954, eR_955, eR_956,
  eR_957, eR_959, eR_960, eR_964, eR_967, eR_968, eR_969, eR_970, eR_974, eR_976, eR_977, eR_978, eR_979, eR_981, eR_984, eR_985,
  eR_986, eR_987, eR_988, eR_996, eR_998, eR_999, eR_1001, eR_1003, eR_1005, eR_1007, eR_1008, eR_1010, eR_1011, eR_1012, eR_1015, eR_1016,
  eR_1017, eR_1018, eR_1021, eR_1023]
theorem nbOKR_311 : nbR_311 = nbhd entsR eR_311 := by decide +kernel
theorem mkOKR_311 : mkEnt 32 1024 W rR_311 311 = eR_311 := by decide +kernel
theorem tR_311 : kTermA 4294967295 eR_311 nbR_311 = 117857449827360197303508216 := by decide +kernel


end RamseyCert
