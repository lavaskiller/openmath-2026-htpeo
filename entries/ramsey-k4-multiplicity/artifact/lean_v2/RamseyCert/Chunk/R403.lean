import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_403 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_16, eR_17, eR_20,
  eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_29, eR_32, eR_35, eR_38, eR_41, eR_44, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_52, eR_53, eR_54, eR_55, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82,
  eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_101,
  eR_104, eR_106, eR_109, eR_112, eR_115, eR_121, eR_124, eR_130, eR_133, eR_135, eR_136, eR_137, eR_138, eR_141, eR_147, eR_150,
  eR_153, eR_156, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_184, eR_185, eR_186, eR_187, eR_188,
  eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_209, eR_212, eR_214, eR_218, eR_221, eR_224, eR_227, eR_233, eR_239, eR_242, eR_245, eR_247, eR_248,
  eR_256, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289,
  eR_290, eR_291, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337,
  eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354,
  eR_355, eR_356, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_391, eR_392, eR_394, eR_395, eR_399, eR_402,
  eR_404, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_436, eR_437, eR_439,
  eR_440, eR_441, eR_444, eR_445, eR_447, eR_449, eR_451, eR_452, eR_454, eR_455, eR_460, eR_462, eR_463, eR_464, eR_465, eR_466,
  eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_488, eR_489, eR_490, eR_491, eR_492,
  eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514, eR_515, eR_516,
  eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_545, eR_546, eR_547, eR_548, eR_549,
  eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_569, eR_570, eR_571, eR_572, eR_573,
  eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_593, eR_594, eR_595, eR_596, eR_597,
  eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616,
  eR_617, eR_619, eR_620, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664, eR_665,
  eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681,
  eR_682, eR_683, eR_684, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721,
  eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745,
  eR_746, eR_747, eR_748, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781, eR_784, eR_785, eR_788, eR_789, eR_792,
  eR_793, eR_796, eR_797, eR_802, eR_803, eR_804, eR_805, eR_806, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_826, eR_827,
  eR_828, eR_829, eR_830, eR_831, eR_838, eR_839, eR_844, eR_845, eR_848, eR_849, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863,
  eR_868, eR_869, eR_873, eR_874, eR_875, eR_882, eR_883, eR_886, eR_887, eR_890, eR_891, eR_896, eR_901, eR_902, eR_903, eR_904,
  eR_908, eR_909, eR_911, eR_913, eR_914, eR_916, eR_917, eR_919, eR_923, eR_924, eR_927, eR_929, eR_932, eR_934, eR_935, eR_937,
  eR_938, eR_941, eR_942, eR_944, eR_945, eR_947, eR_948, eR_949, eR_950, eR_953, eR_955, eR_957, eR_960, eR_962, eR_963, eR_964,
  eR_965, eR_966, eR_967, eR_974, eR_976, eR_977, eR_980, eR_981, eR_983, eR_984, eR_985, eR_986, eR_988, eR_991, eR_992, eR_994,
  eR_995, eR_996, eR_1001, eR_1002, eR_1003, eR_1004, eR_1005, eR_1006, eR_1007, eR_1009, eR_1010, eR_1011, eR_1014, eR_1016, eR_1017, eR_1018,
  eR_1020]
theorem nbOKR_403 : nbR_403 = nbhd entsR eR_403 := by decide +kernel
theorem mkOKR_403 : mkEnt 32 1024 W rR_403 403 = eR_403 := by decide +kernel
theorem tR_403 : kTermA 4294967295 eR_403 nbR_403 = 124600903751541536626463952 := by decide +kernel


end RamseyCert
