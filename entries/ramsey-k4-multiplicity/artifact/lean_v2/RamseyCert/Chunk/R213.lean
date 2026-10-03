import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_213 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_21, eR_23, eR_25, eR_28, eR_29, eR_30, eR_33,
  eR_36, eR_39, eR_43, eR_44, eR_45, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58,
  eR_59, eR_60, eR_61, eR_62, eR_63, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90,
  eR_91, eR_92, eR_93, eR_94, eR_95, eR_97, eR_98, eR_105, eR_108, eR_109, eR_110, eR_112, eR_113, eR_118, eR_119, eR_123,
  eR_126, eR_129, eR_132, eR_142, eR_145, eR_149, eR_150, eR_151, eR_156, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182,
  eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_210, eR_211, eR_212, eR_214, eR_215, eR_216, eR_218,
  eR_219, eR_221, eR_222, eR_224, eR_225, eR_229, eR_230, eR_231, eR_233, eR_234, eR_238, eR_241, eR_242, eR_243, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_252, eR_254, eR_255, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_276,
  eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292,
  eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332,
  eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_365,
  eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_387,
  eR_389, eR_392, eR_393, eR_395, eR_396, eR_397, eR_400, eR_401, eR_404, eR_407, eR_408, eR_409, eR_413, eR_415, eR_419, eR_420,
  eR_424, eR_426, eR_440, eR_441, eR_444, eR_449, eR_452, eR_453, eR_454, eR_458, eR_459, eR_462, eR_463, eR_464, eR_465, eR_466,
  eR_467, eR_468, eR_469, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_520, eR_521, eR_522, eR_523, eR_524,
  eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541,
  eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_577, eR_578, eR_579, eR_580, eR_581,
  eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_597,
  eR_598, eR_599, eR_600, eR_611, eR_614, eR_620, eR_621, eR_623, eR_628, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634, eR_635,
  eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651,
  eR_652, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683,
  eR_684, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699,
  eR_700, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731,
  eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_780, eR_781, eR_788, eR_789,
  eR_804, eR_805, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_816, eR_817, eR_818, eR_819, eR_826, eR_827, eR_828, eR_829,
  eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855,
  eR_862, eR_863, eR_866, eR_867, eR_872, eR_873, eR_878, eR_879, eR_880, eR_882, eR_883, eR_884, eR_885, eR_889, eR_894, eR_895,
  eR_896, eR_898, eR_899, eR_902, eR_903, eR_905, eR_908, eR_911, eR_912, eR_916, eR_918, eR_922, eR_923, eR_925, eR_926, eR_927,
  eR_929, eR_930, eR_931, eR_932, eR_933, eR_934, eR_935, eR_938, eR_940, eR_941, eR_943, eR_944, eR_948, eR_952, eR_954, eR_956,
  eR_958, eR_961, eR_962, eR_967, eR_969, eR_970, eR_973, eR_974, eR_975, eR_979, eR_980, eR_982, eR_983, eR_984, eR_986, eR_988,
  eR_991, eR_992, eR_995, eR_996, eR_997, eR_998, eR_999, eR_1003, eR_1004, eR_1005, eR_1006, eR_1008, eR_1009, eR_1010, eR_1012, eR_1017,
  eR_1023]
theorem nbOKR_213 : nbR_213 = nbhd entsR eR_213 := by decide +kernel
theorem mkOKR_213 : mkEnt 32 1024 W rR_213 213 = eR_213 := by decide +kernel
theorem tR_213 : kTermA 4294967295 eR_213 nbR_213 = 118574104386605630982791724 := by decide +kernel


end RamseyCert
