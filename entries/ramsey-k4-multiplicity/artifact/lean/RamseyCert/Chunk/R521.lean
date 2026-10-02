import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_521 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_15, eR_16, eR_18, eR_20, eR_21, eR_23,
  eR_25, eR_27, eR_29, eR_31, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44, eR_46, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86,
  eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_98, eR_99, eR_100, eR_104, eR_105, eR_107, eR_109, eR_111, eR_112, eR_114,
  eR_116, eR_118, eR_120, eR_122, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138,
  eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_152, eR_154, eR_156, eR_158, eR_164, eR_165, eR_166, eR_167,
  eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195,
  eR_204, eR_205, eR_206, eR_207, eR_208, eR_212, eR_213, eR_216, eR_219, eR_222, eR_225, eR_228, eR_230, eR_232, eR_233, eR_235,
  eR_237, eR_240, eR_242, eR_244, eR_248, eR_252, eR_254, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273,
  eR_274, eR_275, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_340,
  eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_368, eR_377, eR_378,
  eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_392, eR_395, eR_397, eR_400, eR_403, eR_404,
  eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_418, eR_420, eR_422, eR_424, eR_426, eR_427, eR_428, eR_429, eR_430, eR_435,
  eR_437, eR_438, eR_440, eR_441, eR_443, eR_444, eR_446, eR_448, eR_449, eR_451, eR_453, eR_455, eR_456, eR_458, eR_459, eR_461,
  eR_462, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_492, eR_493,
  eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525,
  eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_541, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_558, eR_559,
  eR_560, eR_561, eR_562, eR_563, eR_564, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588,
  eR_597, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621,
  eR_623, eR_626, eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_657,
  eR_658, eR_660, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690,
  eR_691, eR_692, eR_697, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723,
  eR_724, eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_742, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758,
  eR_759, eR_760, eR_768, eR_769, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_788, eR_789,
  eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813,
  eR_814, eR_815, eR_816, eR_817, eR_824, eR_825, eR_826, eR_827, eR_830, eR_831, eR_832, eR_833, eR_838, eR_839, eR_840, eR_841,
  eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859,
  eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_874, eR_878, eR_879, eR_886, eR_887, eR_892,
  eR_893, eR_901, eR_904, eR_906, eR_907, eR_908, eR_913, eR_916, eR_918, eR_920, eR_921, eR_922, eR_924, eR_925, eR_929, eR_930,
  eR_932, eR_935, eR_936, eR_937, eR_938, eR_945, eR_948, eR_949, eR_951, eR_952, eR_953, eR_955, eR_958, eR_961, eR_966, eR_971,
  eR_972, eR_974, eR_975, eR_978, eR_983, eR_985, eR_987, eR_991, eR_995, eR_997, eR_998, eR_999, eR_1003, eR_1004, eR_1007, eR_1008,
  eR_1009, eR_1013, eR_1014, eR_1015, eR_1016, eR_1017, eR_1018, eR_1019, eR_1020, eR_1022]
theorem nbOKR_521 : nbR_521 = nbhd entsR eR_521 := by decide +kernel
theorem mkOKR_521 : mkEnt 32 1024 W rR_521 521 = eR_521 := by decide +kernel
theorem tR_521 : kTermA 4294967295 eR_521 nbR_521 = 81395194155160116652887816 := by decide +kernel


end RamseyCert
