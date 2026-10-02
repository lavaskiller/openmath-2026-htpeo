import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_243 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_19, eR_21, eR_23, eR_25, eR_27, eR_29, eR_37, eR_40,
  eR_42, eR_44, eR_46, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66, eR_67, eR_68,
  eR_69, eR_70, eR_71, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92,
  eR_93, eR_94, eR_95, eR_98, eR_99, eR_100, eR_103, eR_109, eR_111, eR_112, eR_114, eR_116, eR_118, eR_120, eR_125, eR_128,
  eR_131, eR_140, eR_143, eR_146, eR_148, eR_150, eR_152, eR_154, eR_158, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174,
  eR_175, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_208, eR_212, eR_213, eR_214, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_228, eR_230, eR_232, eR_233, eR_235, eR_237, eR_240, eR_242, eR_244, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_252, eR_254, eR_255, eR_256, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268,
  eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300,
  eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_332,
  eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357,
  eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_387,
  eR_389, eR_391, eR_393, eR_394, eR_396, eR_397, eR_399, eR_401, eR_402, eR_408, eR_410, eR_412, eR_414, eR_416, eR_418, eR_422,
  eR_424, eR_426, eR_436, eR_439, eR_442, eR_445, eR_447, eR_451, eR_453, eR_458, eR_460, eR_470, eR_471, eR_472, eR_473, eR_474,
  eR_475, eR_476, eR_477, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_512, eR_513, eR_514, eR_515, eR_516,
  eR_517, eR_518, eR_519, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539, eR_540, eR_541,
  eR_542, eR_543, eR_544, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_569, eR_570, eR_571, eR_572, eR_573,
  eR_574, eR_575, eR_576, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602, eR_603, eR_604, eR_605,
  eR_606, eR_607, eR_608, eR_610, eR_613, eR_616, eR_619, eR_621, eR_623, eR_626, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650,
  eR_651, eR_652, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674,
  eR_675, eR_676, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698,
  eR_699, eR_700, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730,
  eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_776, eR_777, eR_782, eR_783, eR_786, eR_787, eR_788,
  eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_808, eR_809, eR_814,
  eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_833, eR_836, eR_837, eR_840, eR_841, eR_844, eR_845,
  eR_846, eR_847, eR_852, eR_853, eR_854, eR_855, eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_874, eR_875,
  eR_876, eR_877, eR_884, eR_885, eR_890, eR_891, eR_894, eR_895, eR_896, eR_899, eR_903, eR_908, eR_911, eR_912, eR_914, eR_916,
  eR_917, eR_918, eR_920, eR_921, eR_924, eR_925, eR_927, eR_929, eR_930, eR_932, eR_935, eR_940, eR_941, eR_942, eR_945, eR_946,
  eR_947, eR_950, eR_952, eR_953, eR_955, eR_956, eR_957, eR_958, eR_961, eR_963, eR_965, eR_966, eR_967, eR_970, eR_971, eR_973,
  eR_974, eR_975, eR_979, eR_980, eR_981, eR_982, eR_984, eR_986, eR_990, eR_993, eR_999, eR_1000, eR_1001, eR_1004, eR_1005, eR_1006,
  eR_1007, eR_1008, eR_1009, eR_1015, eR_1019, eR_1020, eR_1021, eR_1023]
theorem nbOKR_243 : nbR_243 = nbhd entsR eR_243 := by decide +kernel
theorem mkOKR_243 : mkEnt 32 1024 W rR_243 243 = eR_243 := by decide +kernel
theorem tR_243 : kTermA 4294967295 eR_243 nbR_243 = 121902529973282510120715018 := by decide +kernel


end RamseyCert
