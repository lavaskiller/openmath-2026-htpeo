import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_63 : List Ent := [
  eR_4, eR_6, eR_7, eR_12, eR_14, eR_16, eR_17, eR_18, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_45, eR_47, eR_52, eR_53, eR_54,
  eR_55, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86,
  eR_87, eR_88, eR_89, eR_90, eR_91, eR_97, eR_100, eR_104, eR_105, eR_107, eR_110, eR_113, eR_116, eR_119, eR_122, eR_124,
  eR_126, eR_127, eR_129, eR_130, eR_132, eR_136, eR_137, eR_138, eR_140, eR_143, eR_146, eR_148, eR_150, eR_151, eR_153, eR_154,
  eR_156, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_172, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185,
  eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_209, eR_210, eR_212, eR_213, eR_214, eR_216,
  eR_219, eR_222, eR_225, eR_227, eR_229, eR_230, eR_232, eR_233, eR_235, eR_236, eR_238, eR_239, eR_241, eR_242, eR_244, eR_245,
  eR_246, eR_247, eR_249, eR_250, eR_251, eR_252, eR_256, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_280,
  eR_281, eR_282, eR_283, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_301, eR_302, eR_303, eR_312, eR_313, eR_314,
  eR_315, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_327, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347, eR_348,
  eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_377, eR_378, eR_379, eR_380, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_391, eR_393, eR_394, eR_396, eR_397, eR_398, eR_399, eR_401, eR_402,
  eR_405, eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420, eR_422, eR_431, eR_432, eR_433, eR_434,
  eR_436, eR_439, eR_442, eR_445, eR_447, eR_450, eR_452, eR_453, eR_455, eR_456, eR_460, eR_462, eR_463, eR_464, eR_465, eR_474,
  eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498,
  eR_499, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_532, eR_533, eR_534,
  eR_535, eR_536, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563,
  eR_564, eR_573, eR_574, eR_576, eR_577, eR_578, eR_579, eR_580, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_605,
  eR_606, eR_608, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658,
  eR_659, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691,
  eR_692, eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723,
  eR_724, eR_725, eR_726, eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751,
  eR_752, eR_761, eR_762, eR_763, eR_772, eR_773, eR_776, eR_777, eR_780, eR_781, eR_782, eR_784, eR_785, eR_791, eR_792, eR_793,
  eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_808, eR_809, eR_810, eR_811, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821,
  eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_858, eR_859, eR_860, eR_861,
  eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_875, eR_876, eR_877, eR_878, eR_879, eR_886, eR_887, eR_892, eR_893, eR_894,
  eR_895, eR_896, eR_897, eR_899, eR_901, eR_903, eR_907, eR_908, eR_909, eR_913, eR_918, eR_919, eR_920, eR_924, eR_925, eR_926,
  eR_927, eR_928, eR_931, eR_932, eR_935, eR_936, eR_939, eR_940, eR_941, eR_942, eR_943, eR_944, eR_947, eR_949, eR_950, eR_951,
  eR_953, eR_954, eR_959, eR_960, eR_961, eR_966, eR_968, eR_969, eR_972, eR_974, eR_975, eR_976, eR_978, eR_979, eR_981, eR_982,
  eR_983, eR_984, eR_986, eR_989, eR_991, eR_992, eR_993, eR_994, eR_996, eR_997, eR_1001, eR_1007, eR_1008, eR_1014, eR_1016, eR_1017,
  eR_1019, eR_1020, eR_1022, eR_1023]
theorem nbOKR_63 : nbR_63 = nbhd entsR eR_63 := by decide +kernel
theorem mkOKR_63 : mkEnt 32 1024 W rR_63 63 = eR_63 := by decide +kernel
theorem tR_63 : kTermA 4294967295 eR_63 nbR_63 = 54681779284313371999471050 := by decide +kernel


end RamseyCert
