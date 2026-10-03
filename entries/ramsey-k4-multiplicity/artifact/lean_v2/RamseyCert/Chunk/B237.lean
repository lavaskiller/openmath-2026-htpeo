import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_237 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_13, eB_15, eB_16, eB_18, eB_19, eB_20, eB_21, eB_22, eB_23, eB_25, eB_27,
  eB_29, eB_31, eB_33, eB_35, eB_36, eB_38, eB_39, eB_41, eB_42, eB_44, eB_45, eB_46, eB_56, eB_57, eB_58, eB_59,
  eB_60, eB_61, eB_62, eB_63, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86, eB_87, eB_96, eB_97, eB_98, eB_99,
  eB_100, eB_104, eB_105, eB_107, eB_109, eB_110, eB_111, eB_112, eB_114, eB_116, eB_118, eB_120, eB_122, eB_124, eB_126, eB_127,
  eB_129, eB_130, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_139, eB_141, eB_142, eB_143, eB_144, eB_145, eB_147,
  eB_148, eB_149, eB_150, eB_152, eB_154, eB_156, eB_158, eB_159, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167,
  eB_176, eB_177, eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_188, eB_189, eB_190, eB_191,
  eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_212, eB_213, eB_216, eB_219, eB_222, eB_225, eB_228,
  eB_230, eB_232, eB_233, eB_235, eB_237, eB_240, eB_242, eB_244, eB_248, eB_252, eB_254, eB_257, eB_258, eB_259, eB_276, eB_277,
  eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_300, eB_301, eB_302, eB_303, eB_304, eB_305, eB_306, eB_307, eB_316, eB_317,
  eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340, eB_349,
  eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_381,
  eB_382, eB_383, eB_384, eB_385, eB_386, eB_387, eB_389, eB_392, eB_395, eB_397, eB_400, eB_403, eB_404, eB_406, eB_408, eB_410,
  eB_412, eB_414, eB_415, eB_416, eB_418, eB_420, eB_422, eB_424, eB_426, eB_427, eB_428, eB_429, eB_430, eB_431, eB_432, eB_433,
  eB_434, eB_435, eB_437, eB_438, eB_440, eB_441, eB_443, eB_444, eB_446, eB_448, eB_449, eB_450, eB_451, eB_452, eB_453, eB_455,
  eB_456, eB_458, eB_459, eB_461, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468, eB_469, eB_478, eB_479, eB_480, eB_481,
  eB_482, eB_483, eB_484, eB_485, eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_512, eB_513,
  eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_528, eB_529, eB_530, eB_531, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537,
  eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_569,
  eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609,
  eB_611, eB_612, eB_614, eB_615, eB_617, eB_618, eB_620, eB_621, eB_623, eB_626, eB_627, eB_628, eB_653, eB_654, eB_655, eB_656,
  eB_657, eB_658, eB_659, eB_660, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_693, eB_694, eB_695, eB_696,
  eB_697, eB_698, eB_699, eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_725, eB_726, eB_727, eB_728,
  eB_729, eB_730, eB_731, eB_732, eB_741, eB_742, eB_743, eB_744, eB_745, eB_746, eB_747, eB_748, eB_772, eB_773, eB_776, eB_777,
  eB_778, eB_779, eB_788, eB_789, eB_792, eB_793, eB_796, eB_797, eB_800, eB_801, eB_802, eB_803, eB_810, eB_811, eB_812, eB_813,
  eB_814, eB_815, eB_818, eB_819, eB_824, eB_825, eB_826, eB_827, eB_832, eB_833, eB_838, eB_839, eB_850, eB_851, eB_854, eB_855,
  eB_858, eB_859, eB_862, eB_863, eB_864, eB_865, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876, eB_877, eB_878, eB_879,
  eB_882, eB_883, eB_890, eB_891, eB_892, eB_893, eB_896, eB_899, eB_901, eB_904, eB_905, eB_906, eB_907, eB_908, eB_910, eB_913,
  eB_914, eB_918, eB_920, eB_922, eB_923, eB_925, eB_926, eB_930, eB_932, eB_933, eB_934, eB_937, eB_940, eB_941, eB_945, eB_947,
  eB_950, eB_951, eB_952, eB_953, eB_954, eB_955, eB_956, eB_958, eB_959, eB_960, eB_963, eB_969, eB_971, eB_974, eB_975, eB_977,
  eB_979, eB_983, eB_985, eB_987, eB_989, eB_990, eB_991, eB_994, eB_995, eB_996, eB_997, eB_1000, eB_1001, eB_1003, eB_1004, eB_1005,
  eB_1006, eB_1011, eB_1013, eB_1014, eB_1015, eB_1016, eB_1019, eB_1020, eB_1022]
theorem nbOKB_237 : nbB_237 = nbhd entsB eB_237 := by decide +kernel
theorem mkOKB_237 : mkEnt 32 1024 W rB_237 237 = eB_237 := by decide +kernel
theorem tB_237 : kTermA 4294967295 eB_237 nbB_237 = 123864762493852695561164544 := by decide +kernel


end RamseyCert
