import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_126 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_19, eR_20, eR_30, eR_34, eR_35, eR_38,
  eR_40, eR_41, eR_42, eR_45, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59,
  eR_60, eR_61, eR_62, eR_63, eR_97, eR_98, eR_100, eR_101, eR_103, eR_104, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113,
  eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_136, eR_138, eR_139, eR_142,
  eR_148, eR_151, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189,
  eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205,
  eR_206, eR_207, eR_210, eR_213, eR_214, eR_217, eR_223, eR_229, eR_232, eR_235, eR_238, eR_241, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_253, eR_254, eR_258, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286,
  eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310,
  eR_311, eR_312, eR_313, eR_314, eR_315, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334,
  eR_335, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351,
  eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_381, eR_382, eR_383,
  eR_384, eR_392, eR_393, eR_395, eR_396, eR_400, eR_401, eR_407, eR_410, eR_413, eR_416, eR_422, eR_423, eR_424, eR_425, eR_426,
  eR_437, eR_440, eR_441, eR_444, eR_449, eR_452, eR_456, eR_457, eR_458, eR_459, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475,
  eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_486, eR_496, eR_497, eR_498, eR_499, eR_500,
  eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521, eR_522, eR_523, eR_524,
  eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537, eR_538, eR_539, eR_540,
  eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562, eR_563, eR_564,
  eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588,
  eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_609, eR_610, eR_613, eR_615,
  eR_616, eR_618, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666,
  eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698,
  eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714,
  eR_715, eR_716, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_768, eR_769, eR_774, eR_775, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789, eR_798, eR_799, eR_800, eR_801,
  eR_802, eR_803, eR_806, eR_807, eR_812, eR_813, eR_818, eR_819, eR_822, eR_823, eR_826, eR_827, eR_832, eR_833, eR_834, eR_835,
  eR_836, eR_837, eR_840, eR_841, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859,
  eR_862, eR_863, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_886, eR_887, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895,
  eR_896, eR_899, eR_900, eR_901, eR_903, eR_909, eR_910, eR_914, eR_915, eR_916, eR_917, eR_920, eR_922, eR_924, eR_926, eR_927,
  eR_928, eR_929, eR_930, eR_931, eR_933, eR_936, eR_938, eR_940, eR_941, eR_943, eR_944, eR_946, eR_948, eR_949, eR_951, eR_952,
  eR_953, eR_954, eR_957, eR_958, eR_963, eR_964, eR_965, eR_966, eR_969, eR_972, eR_977, eR_978, eR_979, eR_982, eR_984, eR_986,
  eR_992, eR_995, eR_996, eR_998, eR_999, eR_1000, eR_1002, eR_1003, eR_1004, eR_1005, eR_1007, eR_1009, eR_1010, eR_1011, eR_1014, eR_1019,
  eR_1021, eR_1023]
theorem nbOKR_126 : nbR_126 = nbhd entsR eR_126 := by decide +kernel
theorem mkOKR_126 : mkEnt 32 1024 W rR_126 126 = eR_126 := by decide +kernel
theorem tR_126 : kTermA 4294967295 eR_126 nbR_126 = 116363660101031072427758880 := by decide +kernel


end RamseyCert
