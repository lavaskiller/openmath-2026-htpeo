import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_51 : List Ent := [
  eR_9, eR_10, eR_11, eR_12, eR_15, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_45, eR_46, eR_52, eR_53, eR_54,
  eR_55, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_98, eR_101, eR_103, eR_105, eR_106, eR_109, eR_112, eR_115, eR_118, eR_121, eR_125,
  eR_126, eR_128, eR_129, eR_131, eR_132, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_148, eR_149, eR_151, eR_152, eR_154,
  eR_155, eR_157, eR_158, eR_161, eR_162, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218,
  eR_221, eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246,
  eR_247, eR_248, eR_250, eR_251, eR_252, eR_257, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_281, eR_282, eR_283,
  eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_312, eR_313, eR_315, eR_316,
  eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351,
  eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383,
  eR_384, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395, eR_397, eR_398, eR_399, eR_400, eR_403, eR_406, eR_407,
  eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_427, eR_428, eR_429, eR_430, eR_435, eR_438,
  eR_443, eR_446, eR_448, eR_451, eR_452, eR_454, eR_455, eR_456, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476,
  eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_508,
  eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_532, eR_533, eR_534, eR_535, eR_536,
  eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_573, eR_574,
  eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_596, eR_601, eR_603, eR_610,
  eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_633,
  eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_665, eR_666,
  eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_697, eR_698,
  eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726,
  eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758,
  eR_759, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783, eR_786,
  eR_787, eR_788, eR_789, eR_802, eR_803, eR_804, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815,
  eR_818, eR_819, eR_822, eR_823, eR_824, eR_825, eR_828, eR_829, eR_832, eR_833, eR_834, eR_835, eR_838, eR_839, eR_844, eR_845,
  eR_846, eR_847, eR_853, eR_854, eR_855, eR_862, eR_863, eR_868, eR_869, eR_870, eR_871, eR_874, eR_875, eR_888, eR_889, eR_890,
  eR_891, eR_892, eR_893, eR_897, eR_898, eR_900, eR_902, eR_909, eR_911, eR_913, eR_916, eR_920, eR_921, eR_924, eR_925, eR_926,
  eR_927, eR_928, eR_932, eR_934, eR_936, eR_938, eR_939, eR_940, eR_943, eR_944, eR_945, eR_946, eR_949, eR_951, eR_953, eR_955,
  eR_957, eR_960, eR_961, eR_962, eR_964, eR_965, eR_968, eR_969, eR_971, eR_973, eR_975, eR_977, eR_978, eR_979, eR_980, eR_983,
  eR_984, eR_986, eR_987, eR_990, eR_994, eR_996, eR_997, eR_999, eR_1001, eR_1003, eR_1004, eR_1006, eR_1010, eR_1011, eR_1012, eR_1013,
  eR_1015, eR_1018, eR_1019, eR_1022, eR_1023]
theorem nbOKR_51 : nbR_51 = nbhd entsR eR_51 := by decide +kernel
theorem mkOKR_51 : mkEnt 32 1024 W rR_51 51 = eR_51 := by decide +kernel
theorem tR_51 : kTermA 4294967295 eR_51 nbR_51 = 115556499768431251209628152 := by decide +kernel


end RamseyCert
