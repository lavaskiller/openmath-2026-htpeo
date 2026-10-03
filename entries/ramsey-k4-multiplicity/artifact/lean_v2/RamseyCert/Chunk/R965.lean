import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_965 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_14, eR_15, eR_16, eR_17, eR_18, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_28, eR_29, eR_31, eR_32, eR_33, eR_36, eR_39, eR_43, eR_44, eR_46, eR_47, eR_48, eR_49,
  eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85,
  eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_99, eR_102, eR_105, eR_108, eR_111, eR_114, eR_117, eR_120, eR_123,
  eR_126, eR_129, eR_132, eR_133, eR_134, eR_135, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_152, eR_153,
  eR_155, eR_156, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179,
  eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_211, eR_212,
  eR_215, eR_216, eR_218, eR_219, eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237,
  eR_239, eR_240, eR_242, eR_243, eR_250, eR_251, eR_252, eR_255, eR_256, eR_257, eR_259, eR_260, eR_261, eR_262, eR_268, eR_269,
  eR_270, eR_271, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366,
  eR_368, eR_373, eR_374, eR_375, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_391, eR_394, eR_397, eR_398, eR_399, eR_402,
  eR_403, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_427, eR_428, eR_429,
  eR_430, eR_435, eR_436, eR_438, eR_439, eR_442, eR_443, eR_445, eR_446, eR_447, eR_448, eR_450, eR_451, eR_453, eR_454, eR_460,
  eR_461, eR_462, eR_465, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_500,
  eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532,
  eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_559, eR_561, eR_562,
  eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_605, eR_607, eR_608, eR_611, eR_614, eR_617, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628,
  eR_633, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_652, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662,
  eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694,
  eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726,
  eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758,
  eR_759, eR_760, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783,
  eR_784, eR_785, eR_792, eR_793, eR_796, eR_797, eR_810, eR_811, eR_814, eR_815, eR_818, eR_819, eR_820, eR_821, eR_824, eR_825,
  eR_828, eR_829, eR_838, eR_839, eR_840, eR_841, eR_848, eR_849, eR_852, eR_853, eR_860, eR_861, eR_864, eR_865, eR_868, eR_869,
  eR_878, eR_879, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_896, eR_897, eR_898, eR_899,
  eR_902, eR_904, eR_906, eR_908, eR_910, eR_911, eR_912, eR_914, eR_916, eR_918, eR_919, eR_924, eR_925, eR_926, eR_929, eR_932,
  eR_936, eR_937, eR_938, eR_939, eR_940, eR_941, eR_942, eR_945, eR_948, eR_949, eR_954, eR_955, eR_960, eR_962, eR_963, eR_966,
  eR_967, eR_968, eR_969, eR_970, eR_971, eR_972, eR_973, eR_974, eR_975, eR_976, eR_978, eR_979, eR_980, eR_981, eR_983, eR_985,
  eR_987, eR_988, eR_989, eR_993, eR_996, eR_997, eR_998, eR_999, eR_1000, eR_1007, eR_1009, eR_1011, eR_1012, eR_1013, eR_1015, eR_1020,
  eR_1022]
theorem nbOKR_965 : nbR_965 = nbhd entsR eR_965 := by decide +kernel
theorem mkOKR_965 : mkEnt 32 1024 W rR_965 965 = eR_965 := by decide +kernel
theorem tR_965 : kTermA 4294967295 eR_965 nbR_965 = 80168284146333042421914060 := by decide +kernel


end RamseyCert
