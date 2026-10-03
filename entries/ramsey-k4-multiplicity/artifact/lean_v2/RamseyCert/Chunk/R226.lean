import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_226 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_20, eR_27, eR_34, eR_37, eR_38, eR_40,
  eR_41, eR_45, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77,
  eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93,
  eR_94, eR_95, eR_96, eR_99, eR_102, eR_105, eR_108, eR_111, eR_114, eR_117, eR_120, eR_123, eR_129, eR_133, eR_134, eR_135,
  eR_136, eR_138, eR_142, eR_145, eR_148, eR_151, eR_154, eR_157, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167,
  eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_208, eR_209, eR_211, eR_212, eR_215, eR_216, eR_218, eR_219,
  eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243,
  eR_250, eR_251, eR_252, eR_255, eR_256, eR_257, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285,
  eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309,
  eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333,
  eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350,
  eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_387, eR_388,
  eR_389, eR_390, eR_391, eR_394, eR_397, eR_398, eR_399, eR_404, eR_407, eR_410, eR_416, eR_419, eR_422, eR_427, eR_428, eR_429,
  eR_430, eR_431, eR_432, eR_433, eR_434, eR_437, eR_442, eR_443, eR_445, eR_446, eR_449, eR_452, eR_456, eR_460, eR_461, eR_462,
  eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_486, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495,
  eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_536, eR_537, eR_538, eR_539, eR_540, eR_541, eR_542, eR_543,
  eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567,
  eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591,
  eR_592, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_610, eR_612, eR_613, eR_615, eR_618, eR_619, eR_661,
  eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_685,
  eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_701,
  eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_725,
  eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_749,
  eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_774, eR_775, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_788, eR_789, eR_794, eR_795, eR_796, eR_797, eR_811, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_824,
  eR_825, eR_826, eR_827, eR_830, eR_831, eR_832, eR_833, eR_840, eR_841, eR_842, eR_843, eR_848, eR_849, eR_852, eR_853, eR_854,
  eR_855, eR_856, eR_857, eR_860, eR_861, eR_864, eR_865, eR_868, eR_869, eR_874, eR_875, eR_878, eR_879, eR_880, eR_881, eR_882,
  eR_883, eR_884, eR_885, eR_894, eR_895, eR_896, eR_897, eR_898, eR_899, eR_900, eR_902, eR_903, eR_904, eR_907, eR_908, eR_909,
  eR_911, eR_913, eR_914, eR_916, eR_919, eR_920, eR_921, eR_922, eR_926, eR_927, eR_928, eR_929, eR_933, eR_934, eR_936, eR_943,
  eR_946, eR_947, eR_949, eR_951, eR_952, eR_953, eR_956, eR_957, eR_959, eR_961, eR_966, eR_968, eR_970, eR_972, eR_974, eR_975,
  eR_977, eR_979, eR_980, eR_981, eR_983, eR_985, eR_988, eR_991, eR_993, eR_994, eR_995, eR_996, eR_998, eR_1000, eR_1001, eR_1002,
  eR_1005, eR_1006, eR_1010, eR_1015, eR_1016, eR_1018, eR_1023]
theorem nbOKR_226 : nbR_226 = nbhd entsR eR_226 := by decide +kernel
theorem mkOKR_226 : mkEnt 32 1024 W rR_226 226 = eR_226 := by decide +kernel
theorem tR_226 : kTermA 4294967295 eR_226 nbR_226 = 72992977557506495407824108 := by decide +kernel


end RamseyCert
