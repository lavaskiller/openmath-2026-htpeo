import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_380 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_13, eR_14, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26,
  eR_29, eR_32, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_44, eR_47, eR_48, eR_50, eR_51, eR_60, eR_61, eR_62,
  eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90,
  eR_96, eR_97, eR_99, eR_100, eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116, eR_117, eR_119, eR_120,
  eR_122, eR_123, eR_124, eR_127, eR_130, eR_133, eR_134, eR_135, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_153,
  eR_156, eR_159, eR_160, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_201, eR_202, eR_203, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218, eR_221,
  eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_250, eR_251, eR_252, eR_253, eR_254, eR_256, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302,
  eR_303, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370,
  eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395,
  eR_397, eR_398, eR_399, eR_400, eR_403, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421,
  eR_422, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448,
  eR_451, eR_452, eR_454, eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_466, eR_467, eR_469, eR_474, eR_475, eR_476, eR_477,
  eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509,
  eR_510, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_533, eR_534, eR_535, eR_536, eR_541, eR_542, eR_543,
  eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571,
  eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607,
  eR_608, eR_609, eR_612, eR_615, eR_618, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_646, eR_647, eR_657,
  eR_658, eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_673, eR_674, eR_676, eR_681, eR_683, eR_684, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719,
  eR_720, eR_729, eR_730, eR_731, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_757,
  eR_758, eR_759, eR_760, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_782, eR_783, eR_784, eR_785, eR_796, eR_797, eR_800,
  eR_801, eR_802, eR_803, eR_808, eR_812, eR_813, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_824, eR_825,
  eR_828, eR_829, eR_834, eR_835, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853,
  eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_864, eR_865, eR_868, eR_869, eR_872, eR_873, eR_880, eR_881, eR_882, eR_883,
  eR_892, eR_893, eR_896, eR_898, eR_900, eR_902, eR_903, eR_905, eR_906, eR_907, eR_908, eR_909, eR_914, eR_915, eR_919, eR_920,
  eR_922, eR_926, eR_927, eR_930, eR_931, eR_932, eR_934, eR_940, eR_942, eR_943, eR_944, eR_946, eR_949, eR_950, eR_951, eR_952,
  eR_953, eR_955, eR_956, eR_957, eR_960, eR_964, eR_967, eR_968, eR_970, eR_975, eR_976, eR_978, eR_980, eR_981, eR_982, eR_985,
  eR_986, eR_987, eR_988, eR_990, eR_992, eR_993, eR_994, eR_995, eR_1003, eR_1004, eR_1008, eR_1009, eR_1011, eR_1012, eR_1014, eR_1015,
  eR_1017, eR_1019, eR_1020, eR_1022]
theorem nbOKR_380 : nbR_380 = nbhd entsR eR_380 := by decide +kernel
theorem mkOKR_380 : mkEnt 32 1024 W rR_380 380 = eR_380 := by decide +kernel
theorem tR_380 : kTermA 4294967295 eR_380 nbR_380 = 100091910781142211222991440 := by decide +kernel


end RamseyCert
