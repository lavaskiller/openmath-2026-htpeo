import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_931 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_14, eR_19, eR_22, eR_24, eR_26, eR_28, eR_30, eR_34,
  eR_40, eR_43, eR_45, eR_47, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_80, eR_81, eR_82, eR_83,
  eR_84, eR_85, eR_86, eR_87, eR_96, eR_98, eR_99, eR_100, eR_104, eR_105, eR_107, eR_109, eR_111, eR_112, eR_114, eR_116,
  eR_118, eR_120, eR_122, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132, eR_133, eR_134, eR_135, eR_140, eR_143, eR_151, eR_153,
  eR_155, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181,
  eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_208, eR_212, eR_213, eR_216, eR_219, eR_222, eR_225, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_242,
  eR_244, eR_248, eR_252, eR_254, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269,
  eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293,
  eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_324, eR_325,
  eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_357, eR_358,
  eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382,
  eR_383, eR_384, eR_387, eR_389, eR_392, eR_395, eR_397, eR_400, eR_407, eR_411, eR_413, eR_415, eR_417, eR_421, eR_424, eR_426,
  eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_450,
  eR_452, eR_454, eR_458, eR_459, eR_461, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479, eR_480,
  eR_481, eR_482, eR_483, eR_484, eR_485, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514,
  eR_515, eR_516, eR_517, eR_518, eR_519, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_545, eR_546, eR_547,
  eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579,
  eR_580, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602, eR_603,
  eR_604, eR_605, eR_606, eR_607, eR_608, eR_613, eR_616, eR_619, eR_622, eR_625, eR_627, eR_629, eR_630, eR_631, eR_632, eR_633,
  eR_634, eR_635, eR_636, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_661, eR_662, eR_663, eR_664, eR_665,
  eR_666, eR_667, eR_668, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_701, eR_702, eR_703, eR_704, eR_705,
  eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_725, eR_726, eR_727, eR_728, eR_729,
  eR_730, eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_784, eR_785, eR_786,
  eR_787, eR_790, eR_791, eR_792, eR_793, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_808, eR_809, eR_810,
  eR_811, eR_812, eR_813, eR_814, eR_815, eR_820, eR_821, eR_824, eR_825, eR_828, eR_840, eR_841, eR_844, eR_845, eR_846, eR_847,
  eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867,
  eR_870, eR_871, eR_872, eR_873, eR_878, eR_879, eR_882, eR_883, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895,
  eR_900, eR_901, eR_903, eR_904, eR_908, eR_909, eR_910, eR_912, eR_916, eR_927, eR_929, eR_930, eR_934, eR_935, eR_936, eR_939,
  eR_940, eR_941, eR_942, eR_943, eR_946, eR_947, eR_949, eR_954, eR_956, eR_957, eR_958, eR_959, eR_960, eR_962, eR_963, eR_966,
  eR_967, eR_969, eR_972, eR_973, eR_974, eR_975, eR_976, eR_983, eR_985, eR_989, eR_991, eR_994, eR_998, eR_1001, eR_1002, eR_1003,
  eR_1004, eR_1006, eR_1008, eR_1010, eR_1011, eR_1012, eR_1014, eR_1017, eR_1019, eR_1023]
theorem nbOKR_931 : nbR_931 = nbhd entsR eR_931 := by decide +kernel
theorem mkOKR_931 : mkEnt 32 1024 W rR_931 931 = eR_931 := by decide +kernel
theorem tR_931 : kTermA 4294967295 eR_931 nbR_931 = 78503498315733858497546112 := by decide +kernel


end RamseyCert
