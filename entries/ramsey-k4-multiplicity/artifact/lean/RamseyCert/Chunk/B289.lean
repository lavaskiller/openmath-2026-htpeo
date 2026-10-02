import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_289 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_12, eB_15, eB_16, eB_17, eB_20, eB_21, eB_22, eB_23,
  eB_24, eB_25, eB_26, eB_29, eB_32, eB_35, eB_38, eB_41, eB_44, eB_47, eB_48, eB_49, eB_50, eB_51, eB_57, eB_60,
  eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88,
  eB_89, eB_90, eB_91, eB_96, eB_98, eB_101, eB_104, eB_106, eB_109, eB_112, eB_115, eB_118, eB_121, eB_124, eB_127, eB_130,
  eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_141, eB_144, eB_147, eB_150, eB_153, eB_156, eB_159, eB_160, eB_161, eB_162,
  eB_163, eB_170, eB_172, eB_173, eB_174, eB_175, eB_177, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192,
  eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_209, eB_212, eB_214, eB_215, eB_218, eB_221, eB_224, eB_227, eB_230,
  eB_233, eB_236, eB_239, eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_256, eB_258, eB_264, eB_265, eB_266, eB_267, eB_268,
  eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_301, eB_302, eB_303, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326, eB_327, eB_336,
  eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_365,
  eB_366, eB_367, eB_368, eB_377, eB_378, eB_379, eB_380, eB_391, eB_392, eB_394, eB_395, eB_399, eB_400, eB_402, eB_404, eB_406,
  eB_407, eB_409, eB_410, eB_412, eB_413, eB_415, eB_416, eB_418, eB_419, eB_421, eB_422, eB_427, eB_428, eB_429, eB_430, eB_431,
  eB_436, eB_437, eB_439, eB_440, eB_441, eB_442, eB_444, eB_445, eB_447, eB_449, eB_451, eB_452, eB_454, eB_455, eB_459, eB_460,
  eB_466, eB_467, eB_468, eB_469, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_483, eB_492, eB_493, eB_494,
  eB_495, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_510, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525,
  eB_526, eB_527, eB_528, eB_529, eB_530, eB_531, eB_534, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_553,
  eB_554, eB_555, eB_556, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_585,
  eB_588, eB_589, eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_610, eB_611, eB_613,
  eB_614, eB_616, eB_617, eB_619, eB_620, eB_633, eB_634, eB_635, eB_636, eB_637, eB_638, eB_639, eB_640, eB_641, eB_649, eB_650,
  eB_651, eB_652, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682,
  eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_713,
  eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_732, eB_737, eB_738, eB_739, eB_740,
  eB_745, eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_755, eB_761, eB_762, eB_763, eB_764, eB_769, eB_776, eB_777,
  eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_792, eB_793, eB_798, eB_799, eB_804, eB_805,
  eB_806, eB_807, eB_812, eB_813, eB_816, eB_817, eB_818, eB_819, eB_824, eB_825, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831,
  eB_838, eB_839, eB_844, eB_845, eB_848, eB_849, eB_850, eB_851, eB_854, eB_855, eB_856, eB_857, eB_860, eB_861, eB_862, eB_863,
  eB_868, eB_869, eB_872, eB_873, eB_882, eB_883, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895, eB_896, eB_897,
  eB_900, eB_909, eB_912, eB_913, eB_914, eB_916, eB_920, eB_921, eB_923, eB_924, eB_929, eB_932, eB_933, eB_934, eB_935, eB_937,
  eB_938, eB_940, eB_941, eB_943, eB_947, eB_948, eB_949, eB_950, eB_952, eB_953, eB_955, eB_958, eB_960, eB_963, eB_966, eB_970,
  eB_973, eB_974, eB_976, eB_977, eB_980, eB_981, eB_982, eB_985, eB_986, eB_990, eB_993, eB_994, eB_996, eB_997, eB_1001, eB_1003,
  eB_1006, eB_1007, eB_1009, eB_1011, eB_1012, eB_1013, eB_1014, eB_1016, eB_1017, eB_1018, eB_1020, eB_1023]
theorem nbOKB_289 : nbB_289 = nbhd entsB eB_289 := by decide +kernel
theorem mkOKB_289 : mkEnt 32 1024 W rB_289 289 = eB_289 := by decide +kernel
theorem tB_289 : kTermA 4294967295 eB_289 nbB_289 = 117989544967786614737866428 := by decide +kernel


end RamseyCert
