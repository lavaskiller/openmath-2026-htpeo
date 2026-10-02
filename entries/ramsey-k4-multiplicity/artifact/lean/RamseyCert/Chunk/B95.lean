import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_95 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_8, eB_9, eB_10, eB_11, eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_22, eB_23,
  eB_24, eB_25, eB_26, eB_33, eB_34, eB_35, eB_36, eB_37, eB_38, eB_39, eB_40, eB_41, eB_52, eB_53, eB_54, eB_55,
  eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_84, eB_85, eB_86, eB_87,
  eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_99, eB_100, eB_101, eB_102, eB_103, eB_104, eB_105, eB_106, eB_107,
  eB_108, eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_115, eB_116, eB_117, eB_118, eB_119, eB_120, eB_121, eB_122, eB_123,
  eB_124, eB_125, eB_126, eB_127, eB_128, eB_129, eB_130, eB_131, eB_132, eB_133, eB_134, eB_135, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195,
  eB_200, eB_201, eB_202, eB_203, eB_205, eB_206, eB_248, eB_249, eB_250, eB_251, eB_252, eB_255, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294,
  eB_295, eB_300, eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326,
  eB_327, eB_332, eB_333, eB_334, eB_335, eB_340, eB_342, eB_345, eB_346, eB_347, eB_348, eB_350, eB_353, eB_354, eB_355, eB_356,
  eB_358, eB_361, eB_362, eB_363, eB_364, eB_365, eB_369, eB_370, eB_371, eB_372, eB_376, eB_377, eB_378, eB_379, eB_380, eB_385,
  eB_386, eB_387, eB_388, eB_389, eB_390, eB_391, eB_392, eB_393, eB_394, eB_395, eB_396, eB_397, eB_398, eB_399, eB_400, eB_401,
  eB_427, eB_428, eB_429, eB_430, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481,
  eB_488, eB_489, eB_490, eB_491, eB_496, eB_497, eB_498, eB_499, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515,
  eB_520, eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552,
  eB_557, eB_558, eB_559, eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584,
  eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_611, eB_612,
  eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_621, eB_622, eB_623, eB_624, eB_625, eB_626, eB_627, eB_628,
  eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646, eB_647, eB_648, eB_649, eB_653, eB_654, eB_655,
  eB_656, eB_660, eB_661, eB_662, eB_663, eB_664, eB_665, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684, eB_689,
  eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_713, eB_714, eB_715, eB_716, eB_721,
  eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746, eB_747, eB_748, eB_753,
  eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_761, eB_765, eB_766, eB_767, eB_770, eB_771, eB_774, eB_780, eB_781,
  eB_784, eB_785, eB_788, eB_790, eB_791, eB_794, eB_795, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_804, eB_805, eB_806,
  eB_807, eB_808, eB_809, eB_810, eB_811, eB_814, eB_815, eB_822, eB_823, eB_824, eB_825, eB_836, eB_837, eB_838, eB_839, eB_840,
  eB_841, eB_842, eB_843, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_862, eB_863, eB_864, eB_865, eB_868,
  eB_869, eB_874, eB_875, eB_880, eB_881, eB_882, eB_883, eB_884, eB_885, eB_886, eB_887, eB_890, eB_891, eB_892, eB_893, eB_896,
  eB_899, eB_900, eB_902, eB_903, eB_905, eB_906, eB_907, eB_908, eB_911, eB_916, eB_917, eB_919, eB_920, eB_923, eB_925, eB_927,
  eB_931, eB_932, eB_933, eB_937, eB_938, eB_939, eB_941, eB_942, eB_943, eB_944, eB_945, eB_946, eB_952, eB_954, eB_956, eB_958,
  eB_960, eB_961, eB_962, eB_966, eB_968, eB_972, eB_973, eB_975, eB_977, eB_984, eB_985, eB_990, eB_991, eB_993, eB_994, eB_995,
  eB_999, eB_1001, eB_1002, eB_1003, eB_1005, eB_1007, eB_1010, eB_1011, eB_1012, eB_1014, eB_1016, eB_1022, eB_1023]
theorem nbOKB_95 : nbB_95 = nbhd entsB eB_95 := by decide +kernel
theorem mkOKB_95 : mkEnt 32 1024 W rB_95 95 = eB_95 := by decide +kernel
theorem tB_95 : kTermA 4294967295 eB_95 nbB_95 = 121504496704210154717945088 := by decide +kernel


end RamseyCert
