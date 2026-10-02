import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_106 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_16, eR_20, eR_21, eR_23, eR_25, eR_27, eR_28, eR_32,
  eR_35, eR_41, eR_43, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_72, eR_73, eR_74, eR_75,
  eR_76, eR_77, eR_78, eR_79, eR_96, eR_98, eR_100, eR_102, eR_103, eR_105, eR_107, eR_108, eR_109, eR_112, eR_116, eR_117,
  eR_118, eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_141, eR_144, eR_147, eR_148,
  eR_149, eR_153, eR_154, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180,
  eR_181, eR_182, eR_183, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_208, eR_210, eR_215, eR_218, eR_221, eR_224, eR_228, eR_229, eR_230, eR_237, eR_238, eR_240, eR_241,
  eR_242, eR_249, eR_251, eR_253, eR_256, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269,
  eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_308, eR_309,
  eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325,
  eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358,
  eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_381, eR_382,
  eR_383, eR_384, eR_388, eR_390, eR_393, eR_396, eR_398, eR_401, eR_403, eR_405, eR_409, eR_415, eR_416, eR_417, eR_421, eR_422,
  eR_423, eR_425, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445,
  eR_448, eR_450, eR_454, eR_455, eR_457, eR_459, eR_460, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470,
  eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496,
  eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_545,
  eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561,
  eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601,
  eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609, eR_615, eR_618, eR_621, eR_623, eR_628, eR_629, eR_630, eR_631,
  eR_632, eR_633, eR_634, eR_635, eR_636, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663,
  eR_664, eR_665, eR_666, eR_667, eR_668, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695,
  eR_696, eR_697, eR_698, eR_699, eR_700, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735,
  eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759,
  eR_760, eR_761, eR_762, eR_763, eR_764, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_782, eR_783, eR_786, eR_787, eR_788,
  eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_810, eR_811, eR_812, eR_813, eR_822,
  eR_823, eR_824, eR_825, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_844, eR_845, eR_846,
  eR_847, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_862, eR_863, eR_870, eR_871, eR_872, eR_873, eR_876,
  eR_877, eR_880, eR_881, eR_886, eR_887, eR_888, eR_894, eR_895, eR_896, eR_899, eR_901, eR_902, eR_903, eR_905, eR_915, eR_916,
  eR_917, eR_919, eR_923, eR_924, eR_926, eR_933, eR_934, eR_935, eR_936, eR_938, eR_940, eR_942, eR_943, eR_945, eR_949, eR_950,
  eR_953, eR_954, eR_956, eR_957, eR_958, eR_959, eR_961, eR_963, eR_964, eR_966, eR_968, eR_970, eR_973, eR_974, eR_976, eR_980,
  eR_981, eR_984, eR_985, eR_989, eR_990, eR_991, eR_992, eR_995, eR_996, eR_997, eR_998, eR_1001, eR_1002, eR_1008, eR_1009, eR_1010,
  eR_1011, eR_1013, eR_1015, eR_1016, eR_1018]
theorem nbOKR_106 : nbR_106 = nbhd entsR eR_106 := by decide +kernel
theorem mkOKR_106 : mkEnt 32 1024 W rR_106 106 = eR_106 := by decide +kernel
theorem tR_106 : kTermA 4294967295 eR_106 nbR_106 = 120458808078850571685945480 := by decide +kernel


end RamseyCert
