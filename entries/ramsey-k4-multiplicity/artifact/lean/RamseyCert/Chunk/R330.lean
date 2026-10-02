import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_330 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_15, eR_16, eR_19, eR_21, eR_23, eR_25, eR_28, eR_30, eR_32, eR_34,
  eR_37, eR_40, eR_43, eR_45, eR_47, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_68, eR_69, eR_70, eR_71,
  eR_73, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_101, eR_102, eR_104,
  eR_105, eR_106, eR_108, eR_110, eR_113, eR_115, eR_117, eR_119, eR_121, eR_123, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_149, eR_151, eR_153, eR_155,
  eR_157, eR_159, eR_164, eR_165, eR_166, eR_167, eR_168, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_184, eR_186, eR_187,
  eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_208, eR_212, eR_213, eR_214, eR_215, eR_217, eR_218, eR_220,
  eR_221, eR_223, eR_224, eR_226, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_240, eR_242, eR_244, eR_245, eR_246, eR_247,
  eR_249, eR_250, eR_252, eR_253, eR_255, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_304, eR_305, eR_306, eR_307,
  eR_308, eR_309, eR_310, eR_311, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339,
  eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371,
  eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_391, eR_393, eR_394,
  eR_396, eR_397, eR_399, eR_401, eR_402, eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_418, eR_420, eR_422, eR_423, eR_425,
  eR_427, eR_428, eR_429, eR_430, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_451, eR_453, eR_455, eR_457, eR_459,
  eR_461, eR_462, eR_463, eR_464, eR_465, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491,
  eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_520, eR_521, eR_522, eR_523, eR_532,
  eR_533, eR_534, eR_541, eR_542, eR_543, eR_544, eR_545, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_573,
  eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_605,
  eR_606, eR_607, eR_608, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_622, eR_624, eR_625, eR_627, eR_633,
  eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660, eR_661,
  eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_693,
  eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_721, eR_723, eR_724, eR_725, eR_726,
  eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758,
  eR_759, eR_760, eR_765, eR_766, eR_767, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_781, eR_784, eR_785, eR_786, eR_787,
  eR_788, eR_789, eR_792, eR_793, eR_795, eR_796, eR_797, eR_798, eR_799, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_812,
  eR_813, eR_818, eR_819, eR_824, eR_825, eR_836, eR_837, eR_838, eR_839, eR_842, eR_846, eR_847, eR_848, eR_849, eR_852, eR_853,
  eR_858, eR_859, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_880, eR_881, eR_882, eR_884,
  eR_885, eR_888, eR_889, eR_892, eR_893, eR_899, eR_900, eR_901, eR_902, eR_903, eR_904, eR_905, eR_906, eR_907, eR_908, eR_911,
  eR_913, eR_915, eR_918, eR_922, eR_924, eR_928, eR_929, eR_931, eR_932, eR_933, eR_935, eR_936, eR_939, eR_940, eR_941, eR_942,
  eR_943, eR_944, eR_945, eR_946, eR_947, eR_952, eR_953, eR_955, eR_964, eR_965, eR_966, eR_967, eR_969, eR_970, eR_973, eR_974,
  eR_975, eR_976, eR_980, eR_982, eR_984, eR_985, eR_986, eR_991, eR_993, eR_996, eR_1000, eR_1002, eR_1012, eR_1013, eR_1014, eR_1015,
  eR_1017, eR_1018, eR_1019, eR_1021, eR_1023]
theorem nbOKR_330 : nbR_330 = nbhd entsR eR_330 := by decide +kernel
theorem mkOKR_330 : mkEnt 32 1024 W rR_330 330 = eR_330 := by decide +kernel
theorem tR_330 : kTermA 4294967295 eR_330 nbR_330 = 124152451484854444408692360 := by decide +kernel


end RamseyCert
