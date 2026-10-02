import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_145 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_16, eB_17,
  eB_18, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_30, eB_33, eB_36, eB_39, eB_42, eB_45, eB_48, eB_49,
  eB_50, eB_51, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_97, eB_98,
  eB_100, eB_101, eB_102, eB_103, eB_104, eB_106, eB_107, eB_109, eB_110, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_120,
  eB_121, eB_122, eB_124, eB_125, eB_126, eB_127, eB_128, eB_130, eB_131, eB_135, eB_136, eB_137, eB_138, eB_139, eB_142, eB_145,
  eB_148, eB_151, eB_154, eB_157, eB_160, eB_161, eB_162, eB_163, eB_164, eB_165, eB_166, eB_167, eB_168, eB_169, eB_170, eB_171,
  eB_172, eB_173, eB_174, eB_175, eB_208, eB_209, eB_211, eB_212, eB_215, eB_216, eB_217, eB_218, eB_219, eB_221, eB_222, eB_224,
  eB_225, eB_227, eB_228, eB_230, eB_231, eB_232, eB_233, eB_234, eB_236, eB_237, eB_239, eB_240, eB_242, eB_243, eB_246, eB_250,
  eB_251, eB_252, eB_253, eB_254, eB_255, eB_258, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269,
  eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_316, eB_317,
  eB_318, eB_319, eB_320, eB_321, eB_322, eB_323, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350,
  eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364, eB_381, eB_382,
  eB_383, eB_384, eB_387, eB_388, eB_389, eB_390, eB_391, eB_394, eB_396, eB_397, eB_398, eB_399, eB_402, eB_403, eB_404, eB_405,
  eB_406, eB_408, eB_409, eB_411, eB_412, eB_414, eB_415, eB_417, eB_418, eB_420, eB_421, eB_423, eB_424, eB_425, eB_426, eB_427,
  eB_428, eB_429, eB_430, eB_431, eB_432, eB_433, eB_434, eB_435, eB_436, eB_437, eB_438, eB_439, eB_441, eB_444, eB_447, eB_448,
  eB_450, eB_451, eB_453, eB_454, eB_457, eB_458, eB_459, eB_460, eB_461, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467, eB_468,
  eB_469, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518,
  eB_519, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551,
  eB_552, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_573, eB_574, eB_575,
  eB_576, eB_585, eB_586, eB_587, eB_588, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599,
  eB_600, eB_609, eB_610, eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_637, eB_638, eB_639, eB_640, eB_641, eB_642, eB_643,
  eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_657, eB_658, eB_659,
  eB_660, eB_669, eB_670, eB_671, eB_672, eB_673, eB_674, eB_675, eB_676, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715,
  eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739, eB_740, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770, eB_771,
  eB_772, eB_773, eB_774, eB_775, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793,
  eB_794, eB_795, eB_800, eB_801, eB_806, eB_807, eB_808, eB_809, eB_814, eB_815, eB_822, eB_823, eB_824, eB_825, eB_828, eB_829,
  eB_830, eB_831, eB_832, eB_833, eB_835, eB_840, eB_841, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_856, eB_857, eB_858,
  eB_859, eB_860, eB_861, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_876,
  eB_877, eB_878, eB_879, eB_884, eB_885, eB_890, eB_891, eB_896, eB_898, eB_902, eB_903, eB_904, eB_907, eB_912, eB_913, eB_914,
  eB_915, eB_916, eB_918, eB_922, eB_923, eB_928, eB_930, eB_931, eB_932, eB_934, eB_935, eB_936, eB_937, eB_938, eB_947, eB_952,
  eB_955, eB_959, eB_960, eB_965, eB_968, eB_969, eB_974, eB_975, eB_977, eB_979, eB_980, eB_982, eB_984, eB_987, eB_989, eB_990,
  eB_991, eB_992, eB_994, eB_995, eB_996, eB_999, eB_1003, eB_1007, eB_1009, eB_1010, eB_1012, eB_1014, eB_1015, eB_1022, eB_1023]
theorem nbOKB_145 : nbB_145 = nbhd entsB eB_145 := by decide +kernel
theorem mkOKB_145 : mkEnt 32 1024 W rB_145 145 = eB_145 := by decide +kernel
theorem tB_145 : kTermA 4294967295 eB_145 nbB_145 = 119934151703303424189610314 := by decide +kernel


end RamseyCert
