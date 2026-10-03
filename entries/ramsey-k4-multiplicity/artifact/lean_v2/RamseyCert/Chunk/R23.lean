import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_23 : List Ent := [
  eR_12, eR_17, eR_18, eR_19, eR_20, eR_22, eR_24, eR_26, eR_30, eR_31, eR_32, eR_33, eR_34, eR_35, eR_36, eR_37,
  eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56,
  eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_80,
  eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_96, eR_100, eR_101, eR_102, eR_107, eR_108, eR_115, eR_121, eR_122,
  eR_134, eR_135, eR_136, eR_137, eR_138, eR_151, eR_152, eR_153, eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_164,
  eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180,
  eR_181, eR_182, eR_183, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_211, eR_212, eR_213, eR_214, eR_230,
  eR_232, eR_234, eR_242, eR_243, eR_244, eR_245, eR_246, eR_247, eR_251, eR_254, eR_255, eR_259, eR_260, eR_261, eR_262, eR_263,
  eR_264, eR_265, eR_266, eR_267, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327,
  eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_349, eR_350, eR_351,
  eR_352, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367,
  eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_382, eR_383, eR_384,
  eR_385, eR_386, eR_388, eR_398, eR_402, eR_403, eR_404, eR_408, eR_409, eR_410, eR_414, eR_415, eR_416, eR_420, eR_421, eR_422,
  eR_424, eR_426, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_453, eR_454, eR_455, eR_462, eR_463,
  eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479,
  eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521,
  eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_561, eR_562,
  eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578,
  eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594,
  eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_623, eR_628,
  eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684,
  eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708,
  eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748,
  eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_768, eR_769, eR_770, eR_771, eR_782, eR_783, eR_786, eR_787, eR_788, eR_789, eR_792, eR_793, eR_794, eR_795,
  eR_796, eR_797, eR_800, eR_801, eR_804, eR_805, eR_806, eR_807, eR_812, eR_813, eR_814, eR_815, eR_818, eR_819, eR_826, eR_827,
  eR_828, eR_829, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_850, eR_851, eR_852, eR_853, eR_856, eR_857, eR_871, eR_874,
  eR_875, eR_876, eR_877, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_892, eR_893, eR_894, eR_895, eR_896,
  eR_897, eR_900, eR_904, eR_905, eR_906, eR_908, eR_910, eR_913, eR_914, eR_917, eR_918, eR_921, eR_924, eR_928, eR_930, eR_934,
  eR_935, eR_936, eR_938, eR_940, eR_942, eR_943, eR_944, eR_946, eR_947, eR_948, eR_953, eR_954, eR_958, eR_960, eR_961, eR_962,
  eR_964, eR_965, eR_967, eR_968, eR_969, eR_970, eR_971, eR_972, eR_974, eR_976, eR_983, eR_984, eR_985, eR_987, eR_990, eR_991,
  eR_992, eR_993, eR_994, eR_995, eR_996, eR_997, eR_998, eR_1001, eR_1005, eR_1006, eR_1007, eR_1009, eR_1016, eR_1017, eR_1019, eR_1022,
  eR_1023]
theorem nbOKR_23 : nbR_23 = nbhd entsR eR_23 := by decide +kernel
theorem mkOKR_23 : mkEnt 32 1024 W rR_23 23 = eR_23 := by decide +kernel
theorem tR_23 : kTermA 4294967295 eR_23 nbR_23 = 83940329126696047617876768 := by decide +kernel


end RamseyCert
