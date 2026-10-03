import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_511 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_17, eR_18, eR_19, eR_22, eR_24,
  eR_26, eR_29, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_44, eR_45, eR_46, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_84, eR_85, eR_86,
  eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_100, eR_102, eR_103, eR_105, eR_107, eR_108, eR_109, eR_112, eR_116,
  eR_117, eR_118, eR_122, eR_123, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138,
  eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_151, eR_152, eR_156, eR_157, eR_158, eR_164, eR_165, eR_166, eR_167,
  eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195,
  eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_212, eR_215, eR_218, eR_221, eR_224, eR_228, eR_229, eR_230, eR_233, eR_237,
  eR_238, eR_240, eR_241, eR_242, eR_249, eR_251, eR_253, eR_256, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269,
  eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_289, eR_290, eR_291, eR_296, eR_298, eR_299, eR_304, eR_305, eR_307, eR_308,
  eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_337, eR_338, eR_339, eR_340, eR_345,
  eR_346, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_377, eR_378,
  eR_379, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_393, eR_396, eR_398, eR_401, eR_402, eR_404, eR_406,
  eR_407, eR_408, eR_412, eR_413, eR_414, eR_418, eR_419, eR_420, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434, eR_436, eR_437,
  eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_451, eR_452, eR_453, eR_456, eR_457, eR_459, eR_460, eR_466,
  eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_492, eR_493, eR_494,
  eR_495, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522,
  eR_523, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559,
  eR_560, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_580, eR_586, eR_587, eR_588, eR_597,
  eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_622,
  eR_624, eR_625, eR_627, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_646, eR_647, eR_648, eR_657, eR_658,
  eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690,
  eR_691, eR_692, eR_697, eR_698, eR_699, eR_700, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719,
  eR_720, eR_729, eR_730, eR_731, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752,
  eR_761, eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_784, eR_785, eR_786, eR_787, eR_788, eR_789,
  eR_790, eR_791, eR_792, eR_793, eR_794, eR_795, eR_798, eR_799, eR_800, eR_801, eR_804, eR_805, eR_808, eR_809, eR_810, eR_811,
  eR_814, eR_815, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837,
  eR_838, eR_839, eR_850, eR_851, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_862, eR_863, eR_866, eR_867, eR_870, eR_871,
  eR_872, eR_873, eR_880, eR_881, eR_886, eR_887, eR_892, eR_893, eR_894, eR_895, eR_897, eR_903, eR_904, eR_906, eR_908, eR_909,
  eR_911, eR_913, eR_915, eR_918, eR_922, eR_924, eR_928, eR_933, eR_934, eR_937, eR_938, eR_939, eR_940, eR_942, eR_943, eR_944,
  eR_945, eR_946, eR_951, eR_954, eR_955, eR_957, eR_959, eR_960, eR_961, eR_963, eR_965, eR_968, eR_971, eR_972, eR_973, eR_974,
  eR_977, eR_980, eR_981, eR_982, eR_983, eR_985, eR_988, eR_990, eR_993, eR_995, eR_997, eR_1000, eR_1001, eR_1002, eR_1004, eR_1009,
  eR_1010, eR_1011, eR_1015, eR_1017, eR_1018, eR_1020, eR_1022]
theorem nbOKR_511 : nbR_511 = nbhd entsR eR_511 := by decide +kernel
theorem mkOKR_511 : mkEnt 32 1024 W rR_511 511 = eR_511 := by decide +kernel
theorem tR_511 : kTermA 4294967295 eR_511 nbR_511 = 125363080832000791539724074 := by decide +kernel


end RamseyCert
