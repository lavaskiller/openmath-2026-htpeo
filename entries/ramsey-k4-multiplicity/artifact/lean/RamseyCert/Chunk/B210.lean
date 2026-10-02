import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_210 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_19, eB_20, eB_21, eB_23, eB_25, eB_27,
  eB_28, eB_29, eB_30, eB_33, eB_34, eB_35, eB_37, eB_38, eB_40, eB_41, eB_43, eB_44, eB_45, eB_64, eB_65, eB_66,
  eB_67, eB_68, eB_69, eB_70, eB_71, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_96, eB_97, eB_98,
  eB_102, eB_103, eB_104, eB_108, eB_109, eB_110, eB_111, eB_112, eB_113, eB_117, eB_118, eB_119, eB_120, eB_123, eB_124, eB_125,
  eB_127, eB_128, eB_130, eB_131, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147,
  eB_149, eB_150, eB_151, eB_152, eB_154, eB_155, eB_156, eB_157, eB_159, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166,
  eB_167, eB_168, eB_169, eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190,
  eB_191, eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_210, eB_211, eB_212, eB_217, eB_220, eB_223, eB_226,
  eB_229, eB_230, eB_231, eB_233, eB_234, eB_238, eB_241, eB_242, eB_243, eB_250, eB_252, eB_254, eB_256, eB_257, eB_259, eB_268,
  eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_324,
  eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340,
  eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364,
  eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_389, eB_391, eB_394, eB_397, eB_399, eB_402, eB_403, eB_407, eB_408,
  eB_409, eB_413, eB_414, eB_415, eB_417, eB_418, eB_419, eB_420, eB_421, eB_424, eB_426, eB_427, eB_428, eB_429, eB_430, eB_431,
  eB_432, eB_433, eB_434, eB_435, eB_436, eB_438, eB_439, eB_440, eB_442, eB_443, eB_445, eB_446, eB_447, eB_448, eB_452, eB_453,
  eB_454, eB_455, eB_456, eB_458, eB_460, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479,
  eB_480, eB_481, eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495,
  eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535,
  eB_536, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551,
  eB_552, eB_577, eB_578, eB_579, eB_580, eB_581, eB_582, eB_583, eB_584, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607,
  eB_608, eB_609, eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_621, eB_623, eB_626, eB_628, eB_661, eB_662, eB_663,
  eB_664, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675, eB_676, eB_693, eB_694, eB_695,
  eB_696, eB_697, eB_698, eB_699, eB_700, eB_717, eB_718, eB_719, eB_720, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727,
  eB_728, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_776, eB_777, eB_778,
  eB_779, eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_818,
  eB_819, eB_820, eB_821, eB_822, eB_823, eB_824, eB_825, eB_826, eB_828, eB_829, eB_830, eB_831, eB_834, eB_835, eB_839, eB_840,
  eB_841, eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_854, eB_855, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_870,
  eB_871, eB_880, eB_881, eB_888, eB_889, eB_892, eB_893, eB_896, eB_898, eB_899, eB_901, eB_902, eB_904, eB_906, eB_907, eB_908,
  eB_909, eB_910, eB_913, eB_917, eB_918, eB_921, eB_924, eB_925, eB_928, eB_930, eB_931, eB_932, eB_937, eB_938, eB_939, eB_940,
  eB_941, eB_942, eB_943, eB_944, eB_946, eB_948, eB_951, eB_952, eB_956, eB_957, eB_958, eB_959, eB_962, eB_965, eB_966, eB_974,
  eB_975, eB_977, eB_979, eB_981, eB_985, eB_987, eB_988, eB_992, eB_993, eB_994, eB_998, eB_1004, eB_1005, eB_1006, eB_1007, eB_1010,
  eB_1011, eB_1012, eB_1013, eB_1014, eB_1016, eB_1017, eB_1020, eB_1021]
theorem nbOKB_210 : nbB_210 = nbhd entsB eB_210 := by decide +kernel
theorem mkOKB_210 : mkEnt 32 1024 W rB_210 210 = eB_210 := by decide +kernel
theorem tB_210 : kTermA 4294967295 eB_210 nbB_210 = 118628408272101728226964644 := by decide +kernel


end RamseyCert
