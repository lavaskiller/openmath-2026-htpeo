import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_42 : List Ent := [
  eR_12, eR_14, eR_15, eR_17, eR_18, eR_22, eR_24, eR_26, eR_28, eR_29, eR_30, eR_33, eR_36, eR_39, eR_43, eR_44,
  eR_45, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62,
  eR_63, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_99, eR_101, eR_105, eR_107, eR_114, eR_115, eR_116, eR_120, eR_121, eR_122, eR_126, eR_129, eR_136, eR_137, eR_138,
  eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_151, eR_155, eR_156, eR_157, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_184, eR_185, eR_186, eR_187,
  eR_188, eR_189, eR_190, eR_191, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_210, eR_211, eR_217, eR_220,
  eR_223, eR_229, eR_230, eR_231, eR_233, eR_234, eR_241, eR_242, eR_243, eR_250, eR_252, eR_253, eR_258, eR_259, eR_260, eR_261,
  eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285,
  eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309,
  eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_340, eR_349,
  eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_385,
  eR_386, eR_387, eR_389, eR_391, eR_399, eR_404, eR_405, eR_406, eR_411, eR_412, eR_416, eR_417, eR_418, eR_423, eR_425, eR_427,
  eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_441, eR_449, eR_450, eR_451, eR_455, eR_459, eR_470,
  eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_488,
  eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_528,
  eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_545,
  eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_601,
  eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621,
  eR_623, eR_626, eR_628, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649,
  eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681,
  eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704, eR_705,
  eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_741, eR_742, eR_743, eR_744, eR_745,
  eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761,
  eR_762, eR_763, eR_764, eR_770, eR_771, eR_772, eR_773, eR_782, eR_783, eR_786, eR_787, eR_788, eR_789, eR_794, eR_795, eR_796,
  eR_797, eR_800, eR_806, eR_807, eR_808, eR_809, eR_811, eR_816, eR_817, eR_820, eR_821, eR_824, eR_825, eR_826, eR_827, eR_830,
  eR_831, eR_834, eR_835, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_858,
  eR_859, eR_864, eR_865, eR_868, eR_869, eR_872, eR_873, eR_876, eR_877, eR_882, eR_883, eR_888, eR_889, eR_890, eR_891, eR_892,
  eR_893, eR_894, eR_895, eR_896, eR_897, eR_900, eR_901, eR_902, eR_904, eR_906, eR_907, eR_910, eR_911, eR_912, eR_913, eR_915,
  eR_917, eR_919, eR_920, eR_923, eR_924, eR_925, eR_926, eR_927, eR_928, eR_929, eR_933, eR_935, eR_940, eR_941, eR_942, eR_944,
  eR_948, eR_949, eR_952, eR_955, eR_958, eR_959, eR_960, eR_961, eR_962, eR_969, eR_970, eR_972, eR_974, eR_975, eR_977, eR_979,
  eR_982, eR_983, eR_984, eR_989, eR_990, eR_994, eR_999, eR_1000, eR_1001, eR_1002, eR_1004, eR_1009, eR_1010, eR_1011, eR_1013, eR_1017,
  eR_1018, eR_1020, eR_1021, eR_1022]
theorem nbOKR_42 : nbR_42 = nbhd entsR eR_42 := by decide +kernel
theorem mkOKR_42 : mkEnt 32 1024 W rR_42 42 = eR_42 := by decide +kernel
theorem tR_42 : kTermA 4294967295 eR_42 nbR_42 = 120526985695498752237614796 := by decide +kernel


end RamseyCert
