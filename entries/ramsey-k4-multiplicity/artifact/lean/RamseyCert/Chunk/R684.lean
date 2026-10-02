import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_684 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_13, eR_15, eR_16, eR_17, eR_19, eR_21, eR_22, eR_23,
  eR_24, eR_25, eR_26, eR_27, eR_29, eR_30, eR_32, eR_34, eR_37, eR_40, eR_42, eR_44, eR_45, eR_47, eR_52, eR_53,
  eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81,
  eR_82, eR_83, eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_100, eR_103, eR_107, eR_110, eR_113, eR_116, eR_119, eR_122,
  eR_125, eR_128, eR_131, eR_133, eR_134, eR_135, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_151, eR_153,
  eR_154, eR_156, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179,
  eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_209, eR_210, eR_212, eR_213,
  eR_215, eR_217, eR_218, eR_220, eR_221, eR_223, eR_224, eR_226, eR_227, eR_229, eR_230, eR_232, eR_233, eR_235, eR_236, eR_238,
  eR_239, eR_241, eR_242, eR_244, eR_248, eR_251, eR_252, eR_255, eR_257, eR_258, eR_259, eR_265, eR_266, eR_267, eR_268, eR_269,
  eR_270, eR_271, eR_280, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306,
  eR_307, eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335,
  eR_340, eR_341, eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_365, eR_366, eR_367, eR_368,
  eR_378, eR_379, eR_380, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_392, eR_395, eR_397, eR_398, eR_400, eR_403, eR_404,
  eR_405, eR_407, eR_408, eR_410, eR_411, eR_413, eR_414, eR_416, eR_417, eR_419, eR_420, eR_422, eR_431, eR_432, eR_433, eR_434,
  eR_435, eR_437, eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_450, eR_452, eR_453, eR_455, eR_459, eR_461,
  eR_462, eR_463, eR_464, eR_465, eR_474, eR_475, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_500, eR_501,
  eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529,
  eR_530, eR_531, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567,
  eR_568, eR_569, eR_570, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_596, eR_605,
  eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_630,
  eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_662, eR_663,
  eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_697, eR_698, eR_699,
  eR_700, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_729, eR_730, eR_731,
  eR_732, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_782, eR_783, eR_788, eR_789, eR_790, eR_791,
  eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_805, eR_814, eR_815, eR_816, eR_817, eR_822, eR_823, eR_826, eR_827, eR_832,
  eR_833, eR_834, eR_835, eR_840, eR_841, eR_842, eR_843, eR_849, eR_854, eR_855, eR_856, eR_857, eR_860, eR_861, eR_872, eR_873,
  eR_884, eR_885, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_900, eR_901, eR_902, eR_903, eR_906, eR_909, eR_914, eR_918,
  eR_922, eR_924, eR_925, eR_926, eR_927, eR_928, eR_931, eR_932, eR_935, eR_937, eR_938, eR_939, eR_942, eR_945, eR_946, eR_948,
  eR_952, eR_953, eR_954, eR_956, eR_958, eR_959, eR_960, eR_961, eR_962, eR_963, eR_964, eR_966, eR_968, eR_969, eR_974, eR_975,
  eR_976, eR_977, eR_980, eR_982, eR_983, eR_984, eR_985, eR_987, eR_988, eR_989, eR_990, eR_991, eR_993, eR_994, eR_996, eR_997,
  eR_998, eR_1002, eR_1003, eR_1004, eR_1005, eR_1006, eR_1007, eR_1008, eR_1012, eR_1013, eR_1018, eR_1019, eR_1020, eR_1021, eR_1023]
theorem nbOKR_684 : nbR_684 = nbhd entsR eR_684 := by decide +kernel
theorem mkOKR_684 : mkEnt 32 1024 W rR_684 684 = eR_684 := by decide +kernel
theorem tR_684 : kTermA 4294967295 eR_684 nbR_684 = 49819593443171015754251136 := by decide +kernel


end RamseyCert
