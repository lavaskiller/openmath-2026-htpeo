import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_535 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_15, eB_17, eB_20, eB_22, eB_24, eB_26, eB_29, eB_30, eB_31, eB_35, eB_38, eB_41,
  eB_44, eB_45, eB_46, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_72,
  eB_73, eB_74, eB_75, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_98, eB_100, eB_102, eB_104, eB_107,
  eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_124, eB_127, eB_130, eB_141, eB_144, eB_147, eB_150, eB_151,
  eB_152, eB_156, eB_157, eB_158, eB_160, eB_161, eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183,
  eB_188, eB_189, eB_190, eB_191, eB_192, eB_193, eB_194, eB_195, eB_204, eB_205, eB_206, eB_207, eB_208, eB_210, eB_212, eB_214,
  eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_228, eB_229, eB_230, eB_233, eB_237, eB_238, eB_240, eB_241,
  eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_251, eB_253, eB_255, eB_257, eB_264, eB_265, eB_266, eB_267, eB_272, eB_273,
  eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_296, eB_297, eB_298, eB_299, eB_304,
  eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_313, eB_316, eB_317, eB_318, eB_319, eB_320, eB_324, eB_325, eB_326,
  eB_327, eB_330, eB_336, eB_337, eB_338, eB_339, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_353, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_378, eB_388, eB_390, eB_391, eB_392,
  eB_394, eB_395, eB_398, eB_399, eB_400, eB_403, eB_406, eB_407, eB_408, eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_423,
  eB_425, eB_427, eB_428, eB_429, eB_430, eB_435, eB_438, eB_443, eB_446, eB_448, eB_451, eB_452, eB_453, eB_457, eB_461, eB_462,
  eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485, eB_492, eB_493, eB_494, eB_495, eB_500,
  eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_532,
  eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_546, eB_549, eB_550, eB_551, eB_552, eB_553, eB_557, eB_558, eB_559,
  eB_560, eB_563, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_586, eB_589,
  eB_590, eB_591, eB_592, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609, eB_612, eB_615, eB_618, eB_622,
  eB_624, eB_625, eB_627, eB_629, eB_630, eB_631, eB_632, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652, eB_653,
  eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684, eB_685,
  eB_686, eB_687, eB_688, eB_694, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_709, eB_710, eB_711, eB_712,
  eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746, eB_747, eB_748,
  eB_749, eB_750, eB_751, eB_752, eB_753, eB_755, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_778, eB_779, eB_782,
  eB_783, eB_784, eB_785, eB_788, eB_789, eB_798, eB_799, eB_800, eB_801, eB_808, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817,
  eB_818, eB_819, eB_824, eB_825, eB_830, eB_831, eB_834, eB_835, eB_840, eB_841, eB_842, eB_844, eB_845, eB_846, eB_847, eB_852,
  eB_853, eB_854, eB_855, eB_856, eB_857, eB_858, eB_859, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_878, eB_879, eB_880,
  eB_881, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_897, eB_899, eB_901, eB_905, eB_907, eB_908, eB_909, eB_910, eB_912,
  eB_914, eB_915, eB_916, eB_917, eB_918, eB_921, eB_923, eB_926, eB_927, eB_928, eB_929, eB_935, eB_938, eB_939, eB_940, eB_943,
  eB_944, eB_945, eB_955, eB_956, eB_960, eB_963, eB_966, eB_967, eB_968, eB_969, eB_970, eB_971, eB_972, eB_974, eB_979, eB_984,
  eB_986, eB_987, eB_988, eB_990, eB_991, eB_994, eB_996, eB_999, eB_1000, eB_1001, eB_1002, eB_1003, eB_1004, eB_1007, eB_1008, eB_1010,
  eB_1013, eB_1014, eB_1015, eB_1016, eB_1017, eB_1018, eB_1020, eB_1021, eB_1023]
theorem nbOKB_535 : nbB_535 = nbhd entsB eB_535 := by decide +kernel
theorem mkOKB_535 : mkEnt 32 1024 W rB_535 535 = eB_535 := by decide +kernel
theorem tB_535 : kTermA 4294967295 eB_535 nbB_535 = 120692686372009783736929824 := by decide +kernel


end RamseyCert
