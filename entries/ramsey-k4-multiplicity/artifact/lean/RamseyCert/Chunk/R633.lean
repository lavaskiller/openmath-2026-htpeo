import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_633 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_15, eR_18, eR_19, eR_20, eR_33,
  eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59,
  eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_79, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_97, eR_98,
  eR_99, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117,
  eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_136, eR_137, eR_138, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145,
  eR_146, eR_147, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189,
  eR_190, eR_196, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_227, eR_228,
  eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244,
  eR_248, eR_249, eR_250, eR_255, eR_256, eR_257, eR_258, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271, eR_276, eR_277, eR_278,
  eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313, eR_314,
  eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347,
  eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375,
  eR_376, eR_381, eR_382, eR_383, eR_384, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_399, eR_400, eR_401, eR_405, eR_406,
  eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422,
  eR_427, eR_428, eR_429, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_459,
  eR_460, eR_461, eR_462, eR_463, eR_465, eR_470, eR_471, eR_472, eR_479, eR_480, eR_481, eR_492, eR_493, eR_494, eR_495, eR_500,
  eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532,
  eR_533, eR_534, eR_535, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565,
  eR_566, eR_567, eR_568, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593,
  eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629,
  eR_630, eR_631, eR_632, eR_637, eR_638, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662,
  eR_663, eR_664, eR_669, eR_671, eR_672, eR_677, eR_678, eR_679, eR_686, eR_687, eR_688, eR_697, eR_698, eR_699, eR_700, eR_705,
  eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730, eR_731, eR_732, eR_737,
  eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_786, eR_787, eR_790, eR_791,
  eR_794, eR_795, eR_800, eR_801, eR_806, eR_807, eR_808, eR_809, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_825, eR_828,
  eR_829, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_842, eR_843, eR_844, eR_845, eR_852, eR_853, eR_854, eR_855, eR_856,
  eR_857, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_874,
  eR_875, eR_876, eR_877, eR_880, eR_881, eR_884, eR_885, eR_890, eR_891, eR_892, eR_893, eR_896, eR_898, eR_900, eR_903, eR_908,
  eR_909, eR_913, eR_917, eR_918, eR_919, eR_921, eR_922, eR_923, eR_925, eR_927, eR_931, eR_933, eR_937, eR_938, eR_939, eR_940,
  eR_945, eR_946, eR_947, eR_948, eR_949, eR_952, eR_953, eR_954, eR_955, eR_956, eR_962, eR_963, eR_964, eR_965, eR_966, eR_967,
  eR_969, eR_974, eR_978, eR_981, eR_982, eR_983, eR_989, eR_991, eR_994, eR_996, eR_997, eR_998, eR_1000, eR_1001, eR_1003, eR_1004,
  eR_1008, eR_1009, eR_1010, eR_1011, eR_1013, eR_1015, eR_1016, eR_1019, eR_1022]
theorem nbOKR_633 : nbR_633 = nbhd entsR eR_633 := by decide +kernel
theorem mkOKR_633 : mkEnt 32 1024 W rR_633 633 = eR_633 := by decide +kernel
theorem tR_633 : kTermA 4294967295 eR_633 nbR_633 = 71079328971983323655649744 := by decide +kernel


end RamseyCert
