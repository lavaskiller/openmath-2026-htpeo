import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_114 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_17, eR_18, eR_24, eR_26, eR_27, eR_31, eR_32,
  eR_33, eR_36, eR_39, eR_42, eR_46, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_80, eR_81, eR_82,
  eR_83, eR_84, eR_85, eR_86, eR_87, eR_96, eR_97, eR_98, eR_102, eR_103, eR_104, eR_108, eR_109, eR_110, eR_112, eR_113,
  eR_117, eR_118, eR_119, eR_123, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_133, eR_134, eR_135, eR_139, eR_145, eR_152,
  eR_153, eR_154, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172,
  eR_173, eR_174, eR_175, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_210, eR_211, eR_212, eR_217, eR_220, eR_223, eR_226, eR_230, eR_231, eR_233, eR_234, eR_238, eR_242,
  eR_243, eR_250, eR_252, eR_254, eR_256, eR_257, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_276, eR_277,
  eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301,
  eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317,
  eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_365, eR_366,
  eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382,
  eR_383, eR_384, eR_387, eR_389, eR_391, eR_394, eR_397, eR_399, eR_404, eR_410, eR_411, eR_412, eR_417, eR_418, eR_422, eR_424,
  eR_426, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_442, eR_443, eR_445, eR_446, eR_449, eR_450,
  eR_451, eR_455, eR_458, eR_460, eR_461, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480,
  eR_481, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_520, eR_521, eR_522,
  eR_523, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_553, eR_554, eR_555,
  eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571,
  eR_572, eR_573, eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595,
  eR_596, eR_597, eR_598, eR_599, eR_600, eR_611, eR_617, eR_620, eR_622, eR_624, eR_627, eR_629, eR_630, eR_631, eR_632, eR_633,
  eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657,
  eR_658, eR_659, eR_660, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_701, eR_702, eR_703, eR_704, eR_705,
  eR_706, eR_707, eR_708, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729,
  eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780,
  eR_781, eR_782, eR_783, eR_784, eR_785, eR_794, eR_795, eR_804, eR_805, eR_808, eR_809, eR_822, eR_823, eR_824, eR_825, eR_826,
  eR_827, eR_830, eR_831, eR_832, eR_833, eR_834, eR_839, eR_852, eR_853, eR_856, eR_857, eR_862, eR_863, eR_868, eR_869, eR_870,
  eR_871, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_892, eR_893, eR_894, eR_895, eR_898, eR_900, eR_901, eR_902, eR_903,
  eR_904, eR_905, eR_908, eR_910, eR_912, eR_914, eR_916, eR_917, eR_920, eR_921, eR_922, eR_923, eR_924, eR_926, eR_927, eR_929,
  eR_930, eR_931, eR_933, eR_935, eR_936, eR_938, eR_940, eR_941, eR_944, eR_945, eR_948, eR_949, eR_950, eR_953, eR_955, eR_956,
  eR_958, eR_959, eR_960, eR_965, eR_967, eR_971, eR_972, eR_973, eR_974, eR_975, eR_976, eR_981, eR_985, eR_988, eR_989, eR_990,
  eR_992, eR_993, eR_994, eR_995, eR_996, eR_997, eR_1000, eR_1002, eR_1004, eR_1006, eR_1007, eR_1008, eR_1011, eR_1014, eR_1021, eR_1023]
theorem nbOKR_114 : nbR_114 = nbhd entsR eR_114 := by decide +kernel
theorem mkOKR_114 : mkEnt 32 1024 W rR_114 114 = eR_114 := by decide +kernel
theorem tR_114 : kTermA 4294967295 eR_114 nbR_114 = 50862463128238426332256776 := by decide +kernel


end RamseyCert
