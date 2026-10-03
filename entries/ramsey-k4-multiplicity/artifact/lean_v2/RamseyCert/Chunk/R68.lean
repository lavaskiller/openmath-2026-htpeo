import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_68 : List Ent := [
  eR_4, eR_5, eR_7, eR_12, eR_13, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_28,
  eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_46, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86,
  eR_87, eR_88, eR_89, eR_90, eR_91, eR_99, eR_102, eR_103, eR_104, eR_108, eR_111, eR_114, eR_117, eR_120, eR_123, eR_124,
  eR_125, eR_127, eR_128, eR_130, eR_131, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155,
  eR_156, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_181, eR_183, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_209, eR_211, eR_212, eR_214, eR_217, eR_220,
  eR_223, eR_226, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_251, eR_252, eR_258, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277,
  eR_278, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313, eR_314, eR_315, eR_316,
  eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347, eR_348, eR_353,
  eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_392, eR_393, eR_395, eR_396, eR_397, eR_398, eR_400, eR_401, eR_404,
  eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_431, eR_432, eR_433, eR_434,
  eR_437, eR_440, eR_441, eR_444, eR_449, eR_450, eR_451, eR_453, eR_454, eR_456, eR_459, eR_466, eR_467, eR_468, eR_469, eR_470,
  eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_500, eR_501, eR_502,
  eR_503, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534,
  eR_535, eR_536, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_559, eR_560, eR_561, eR_562, eR_563,
  eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_584, eR_589, eR_590, eR_592, eR_597, eR_598, eR_600, eR_601, eR_602,
  eR_603, eR_604, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654,
  eR_655, eR_656, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691,
  eR_692, eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719,
  eR_720, eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751,
  eR_752, eR_761, eR_762, eR_763, eR_764, eR_776, eR_777, eR_784, eR_785, eR_794, eR_795, eR_796, eR_797, eR_804, eR_805, eR_808,
  eR_809, eR_812, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_836, eR_837,
  eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_860, eR_861, eR_864, eR_865, eR_870, eR_871, eR_872, eR_873,
  eR_880, eR_881, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_896, eR_897, eR_898, eR_899,
  eR_901, eR_902, eR_905, eR_907, eR_908, eR_913, eR_914, eR_917, eR_918, eR_919, eR_921, eR_922, eR_923, eR_925, eR_927, eR_932,
  eR_933, eR_934, eR_935, eR_936, eR_938, eR_939, eR_940, eR_941, eR_945, eR_946, eR_948, eR_949, eR_951, eR_955, eR_957, eR_959,
  eR_960, eR_961, eR_962, eR_963, eR_965, eR_968, eR_971, eR_972, eR_974, eR_975, eR_976, eR_977, eR_978, eR_979, eR_982, eR_984,
  eR_986, eR_988, eR_989, eR_994, eR_995, eR_998, eR_1000, eR_1003, eR_1008, eR_1012, eR_1014, eR_1015, eR_1016, eR_1020, eR_1021, eR_1023]
theorem nbOKR_68 : nbR_68 = nbhd entsR eR_68 := by decide +kernel
theorem mkOKR_68 : mkEnt 32 1024 W rR_68 68 = eR_68 := by decide +kernel
theorem tR_68 : kTermA 4294967295 eR_68 nbR_68 = 124190361586457698251536250 := by decide +kernel


end RamseyCert
