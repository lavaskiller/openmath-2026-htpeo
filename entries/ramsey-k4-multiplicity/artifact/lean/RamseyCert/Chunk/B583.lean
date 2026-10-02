import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_583 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_12, eB_14, eB_15, eB_17, eB_18, eB_22, eB_24, eB_26, eB_28, eB_29, eB_30, eB_33,
  eB_36, eB_39, eB_43, eB_44, eB_45, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_64, eB_65, eB_66,
  eB_67, eB_68, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_87, eB_92, eB_93, eB_94, eB_95, eB_99,
  eB_100, eB_101, eB_105, eB_106, eB_107, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_126, eB_129, eB_132, eB_136,
  eB_137, eB_138, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_149, eB_150, eB_151, eB_155, eB_156, eB_157, eB_164, eB_165,
  eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179, eB_180, eB_188, eB_189, eB_190, eB_191, eB_192,
  eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_210, eB_211, eB_212, eB_217, eB_220, eB_223, eB_226, eB_229, eB_230,
  eB_231, eB_233, eB_234, eB_238, eB_241, eB_242, eB_243, eB_250, eB_252, eB_253, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263,
  eB_272, eB_273, eB_274, eB_275, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_294, eB_295, eB_296, eB_297,
  eB_298, eB_299, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_328, eB_329,
  eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_357,
  eB_358, eB_359, eB_360, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_385, eB_386, eB_387, eB_389, eB_391,
  eB_394, eB_397, eB_399, eB_404, eB_405, eB_406, eB_410, eB_411, eB_412, eB_416, eB_417, eB_418, eB_422, eB_423, eB_425, eB_427,
  eB_428, eB_429, eB_430, eB_437, eB_440, eB_441, eB_444, eB_449, eB_450, eB_451, eB_455, eB_457, eB_459, eB_465, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_488, eB_489, eB_490, eB_491, eB_497, eB_500,
  eB_501, eB_502, eB_503, eB_507, eB_508, eB_509, eB_510, eB_511, eB_515, eB_516, eB_517, eB_518, eB_519, eB_520, eB_521, eB_522,
  eB_523, eB_528, eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_553, eB_554, eB_555,
  eB_556, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587,
  eB_588, eB_593, eB_594, eB_595, eB_596, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_612, eB_613, eB_615, eB_616, eB_618,
  eB_619, eB_621, eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_649, eB_650, eB_651,
  eB_652, eB_657, eB_658, eB_659, eB_660, eB_661, eB_662, eB_663, eB_664, eB_670, eB_673, eB_674, eB_675, eB_676, eB_677, eB_678,
  eB_679, eB_680, eB_685, eB_686, eB_687, eB_688, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710,
  eB_711, eB_712, eB_719, eB_721, eB_722, eB_723, eB_724, eB_728, eB_729, eB_730, eB_731, eB_732, eB_736, eB_737, eB_738, eB_739,
  eB_740, eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_761, eB_762, eB_763, eB_764, eB_768, eB_769, eB_770,
  eB_771, eB_772, eB_773, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_788, eB_789, eB_796, eB_797, eB_800,
  eB_801, eB_803, eB_804, eB_805, eB_806, eB_807, eB_810, eB_811, eB_815, eB_818, eB_819, eB_820, eB_821, eB_824, eB_825, eB_826,
  eB_827, eB_834, eB_835, eB_846, eB_847, eB_850, eB_851, eB_858, eB_859, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_872,
  eB_873, eB_886, eB_887, eB_888, eB_889, eB_892, eB_893, eB_894, eB_895, eB_897, eB_898, eB_899, eB_900, eB_901, eB_902, eB_904,
  eB_905, eB_906, eB_907, eB_911, eB_912, eB_913, eB_914, eB_915, eB_916, eB_917, eB_919, eB_920, eB_921, eB_925, eB_927, eB_928,
  eB_933, eB_934, eB_936, eB_938, eB_942, eB_944, eB_947, eB_950, eB_952, eB_953, eB_954, eB_955, eB_956, eB_958, eB_960, eB_962,
  eB_963, eB_964, eB_966, eB_970, eB_974, eB_975, eB_977, eB_978, eB_982, eB_983, eB_984, eB_989, eB_990, eB_996, eB_998, eB_1002,
  eB_1004, eB_1006, eB_1007, eB_1008, eB_1010, eB_1012, eB_1013, eB_1020, eB_1021, eB_1022]
theorem nbOKB_583 : nbB_583 = nbhd entsB eB_583 := by decide +kernel
theorem mkOKB_583 : mkEnt 32 1024 W rB_583 583 = eB_583 := by decide +kernel
theorem tB_583 : kTermA 4294967295 eB_583 nbB_583 = 126807050781245930060766754 := by decide +kernel


end RamseyCert
