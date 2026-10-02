import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_456 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_14, eR_15, eR_18,
  eR_19, eR_20, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_48, eR_49, eR_50, eR_51, eR_52,
  eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68,
  eR_69, eR_70, eR_71, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94, eR_95, eR_96, eR_103, eR_105, eR_124, eR_126,
  eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134, eR_136, eR_137, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144,
  eR_145, eR_146, eR_147, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172,
  eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_214, eR_215, eR_217, eR_220, eR_221, eR_222, eR_224, eR_225, eR_226, eR_245, eR_247, eR_251, eR_253,
  eR_254, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274,
  eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290,
  eR_291, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371,
  eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_387, eR_388, eR_389, eR_397, eR_398, eR_405, eR_406,
  eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422,
  eR_423, eR_424, eR_426, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_457, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493,
  eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509,
  eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525,
  eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542,
  eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558,
  eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574,
  eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706,
  eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722,
  eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738,
  eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754,
  eR_755, eR_756, eR_770, eR_771, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_786, eR_787, eR_790, eR_791, eR_794, eR_795,
  eR_796, eR_797, eR_798, eR_799, eR_802, eR_803, eR_804, eR_805, eR_811, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_820,
  eR_821, eR_823, eR_828, eR_829, eR_830, eR_831, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851,
  eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_874, eR_875, eR_878, eR_879, eR_890, eR_891, eR_897, eR_899, eR_900, eR_901,
  eR_902, eR_903, eR_904, eR_905, eR_909, eR_911, eR_913, eR_914, eR_915, eR_916, eR_918, eR_921, eR_922, eR_925, eR_926, eR_927,
  eR_929, eR_930, eR_933, eR_935, eR_936, eR_937, eR_938, eR_939, eR_940, eR_944, eR_945, eR_946, eR_947, eR_948, eR_950, eR_952,
  eR_953, eR_954, eR_955, eR_956, eR_958, eR_962, eR_963, eR_967, eR_968, eR_969, eR_972, eR_975, eR_978, eR_979, eR_980, eR_984,
  eR_985, eR_986, eR_988, eR_989, eR_992, eR_993, eR_994, eR_997, eR_1001, eR_1009, eR_1010, eR_1011, eR_1013, eR_1014, eR_1016, eR_1017,
  eR_1021, eR_1022]
theorem nbOKR_456 : nbR_456 = nbhd entsR eR_456 := by decide +kernel
theorem mkOKR_456 : mkEnt 32 1024 W rR_456 456 = eR_456 := by decide +kernel
theorem tR_456 : kTermA 4294967295 eR_456 nbR_456 = 124704175335708015232049760 := by decide +kernel


end RamseyCert
