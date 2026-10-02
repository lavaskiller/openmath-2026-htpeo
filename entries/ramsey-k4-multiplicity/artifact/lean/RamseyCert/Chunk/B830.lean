import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_830 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_13, eB_16, eB_18, eB_21, eB_23, eB_25, eB_28, eB_29, eB_30, eB_33, eB_36, eB_39,
  eB_43, eB_44, eB_45, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59, eB_68, eB_69, eB_70, eB_71, eB_76,
  eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91, eB_97, eB_98, eB_102, eB_105, eB_108,
  eB_109, eB_110, eB_112, eB_113, eB_117, eB_118, eB_119, eB_123, eB_126, eB_129, eB_132, eB_139, eB_142, eB_145, eB_149, eB_150,
  eB_151, eB_155, eB_156, eB_157, eB_164, eB_165, eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_176, eB_177, eB_178, eB_179,
  eB_184, eB_185, eB_186, eB_187, eB_196, eB_197, eB_198, eB_199, eB_204, eB_205, eB_206, eB_207, eB_210, eB_211, eB_212, eB_214,
  eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_229, eB_230, eB_231, eB_233, eB_234, eB_238, eB_241, eB_242,
  eB_243, eB_245, eB_246, eB_247, eB_248, eB_249, eB_252, eB_254, eB_255, eB_258, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269,
  eB_270, eB_271, eB_275, eB_280, eB_281, eB_282, eB_283, eB_288, eB_289, eB_290, eB_291, eB_296, eB_297, eB_298, eB_299, eB_300,
  eB_301, eB_302, eB_303, eB_305, eB_308, eB_309, eB_310, eB_311, eB_315, eB_316, eB_317, eB_318, eB_319, eB_323, eB_328, eB_329,
  eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_345, eB_353, eB_354, eB_355, eB_356, eB_357,
  eB_358, eB_359, eB_360, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_387, eB_389, eB_392, eB_393, eB_395,
  eB_396, eB_397, eB_400, eB_401, eB_404, eB_407, eB_408, eB_409, eB_413, eB_414, eB_415, eB_419, eB_420, eB_421, eB_424, eB_426,
  eB_427, eB_428, eB_429, eB_430, eB_437, eB_440, eB_441, eB_444, eB_449, eB_452, eB_453, eB_454, eB_458, eB_459, eB_466, eB_467,
  eB_468, eB_469, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_492, eB_493, eB_494, eB_495, eB_496, eB_497,
  eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_524, eB_525, eB_526, eB_527, eB_532, eB_533,
  eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_555, eB_557, eB_558, eB_559, eB_560, eB_565,
  eB_566, eB_567, eB_568, eB_569, eB_573, eB_574, eB_575, eB_576, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588,
  eB_593, eB_594, eB_595, eB_596, eB_604, eB_605, eB_606, eB_607, eB_608, eB_611, eB_614, eB_617, eB_620, eB_621, eB_623, eB_626,
  eB_628, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_653, eB_654, eB_655,
  eB_656, eB_661, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_681, eB_682, eB_683, eB_684, eB_689, eB_690,
  eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712, eB_713,
  eB_714, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_741, eB_742, eB_743,
  eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769, eB_774, eB_775,
  eB_780, eB_781, eB_782, eB_783, eB_786, eB_787, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799, eB_802, eB_803, eB_804, eB_805,
  eB_808, eB_809, eB_810, eB_811, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_824, eB_825, eB_826, eB_827, eB_828, eB_829,
  eB_830, eB_831, eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_840, eB_848, eB_849, eB_852, eB_853, eB_856, eB_857, eB_858,
  eB_859, eB_862, eB_863, eB_866, eB_867, eB_872, eB_873, eB_874, eB_875, eB_878, eB_879, eB_880, eB_881, eB_882, eB_883, eB_884,
  eB_885, eB_888, eB_889, eB_891, eB_892, eB_893, eB_896, eB_897, eB_898, eB_899, eB_900, eB_901, eB_904, eB_905, eB_909, eB_916,
  eB_917, eB_918, eB_919, eB_920, eB_922, eB_923, eB_925, eB_926, eB_928, eB_929, eB_930, eB_931, eB_932, eB_934, eB_935, eB_936,
  eB_938, eB_940, eB_941, eB_942, eB_945, eB_948, eB_949, eB_954, eB_956, eB_957, eB_961, eB_964, eB_965, eB_966, eB_969, eB_974,
  eB_975, eB_979, eB_980, eB_986, eB_990, eB_993, eB_996, eB_998, eB_999, eB_1002, eB_1003, eB_1006, eB_1008, eB_1009, eB_1017, eB_1020,
  eB_1022]
theorem nbOKB_830 : nbB_830 = nbhd entsB eB_830 := by decide +kernel
theorem mkOKB_830 : mkEnt 32 1024 W rB_830 830 = eB_830 := by decide +kernel
theorem tB_830 : kTermA 4294967295 eB_830 nbB_830 = 89198546957946278156747366 := by decide +kernel


end RamseyCert
