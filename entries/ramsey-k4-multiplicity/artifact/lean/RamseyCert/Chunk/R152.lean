import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_152 : List Ent := [
  eR_12, eR_13, eR_15, eR_16, eR_19, eR_21, eR_23, eR_25, eR_28, eR_30, eR_32, eR_34, eR_37, eR_40, eR_43, eR_45,
  eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70,
  eR_71, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93, eR_94,
  eR_95, eR_98, eR_99, eR_107, eR_111, eR_112, eR_114, eR_116, eR_118, eR_122, eR_125, eR_128, eR_131, eR_136, eR_137, eR_138,
  eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_149, eR_151, eR_153, eR_155, eR_157, eR_159, eR_160, eR_161, eR_162, eR_163,
  eR_164, eR_165, eR_166, eR_167, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_192, eR_193, eR_194, eR_195,
  eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_209, eR_211, eR_216, eR_219,
  eR_225, eR_227, eR_229, eR_234, eR_236, eR_238, eR_241, eR_243, eR_248, eR_251, eR_254, eR_256, eR_259, eR_260, eR_261, eR_262,
  eR_263, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286,
  eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_316, eR_317, eR_318,
  eR_319, eR_320, eR_321, eR_322, eR_323, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_341, eR_342,
  eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_385, eR_386,
  eR_388, eR_392, eR_398, eR_400, eR_402, eR_406, eR_408, eR_410, eR_412, eR_414, eR_416, eR_420, eR_422, eR_424, eR_427, eR_428,
  eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_436, eR_439, eR_445, eR_447, eR_453, eR_455, eR_458, eR_460, eR_462, eR_463,
  eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489,
  eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521,
  eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_561, eR_562,
  eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_593, eR_594,
  eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_622, eR_624,
  eR_625, eR_627, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650,
  eR_651, eR_652, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674,
  eR_675, eR_676, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698,
  eR_699, eR_700, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730,
  eR_731, eR_732, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_784, eR_785, eR_790, eR_791, eR_792, eR_793, eR_796, eR_797,
  eR_798, eR_799, eR_800, eR_801, eR_808, eR_809, eR_812, eR_813, eR_816, eR_817, eR_818, eR_819, eR_823, eR_824, eR_825, eR_830,
  eR_831, eR_834, eR_835, eR_838, eR_839, eR_846, eR_847, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855, eR_856, eR_857, eR_858,
  eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_876, eR_877, eR_878, eR_879, eR_886, eR_887, eR_888, eR_889, eR_890,
  eR_891, eR_892, eR_893, eR_894, eR_895, eR_899, eR_901, eR_902, eR_904, eR_905, eR_906, eR_907, eR_908, eR_910, eR_911, eR_912,
  eR_913, eR_918, eR_920, eR_921, eR_922, eR_927, eR_928, eR_929, eR_930, eR_932, eR_934, eR_935, eR_936, eR_939, eR_944, eR_946,
  eR_948, eR_953, eR_954, eR_955, eR_956, eR_957, eR_959, eR_961, eR_962, eR_964, eR_965, eR_966, eR_968, eR_970, eR_976, eR_978,
  eR_981, eR_982, eR_984, eR_990, eR_991, eR_993, eR_994, eR_995, eR_996, eR_997, eR_999, eR_1000, eR_1001, eR_1003, eR_1005, eR_1006,
  eR_1007, eR_1009, eR_1010, eR_1011, eR_1013, eR_1017]
theorem nbOKR_152 : nbR_152 = nbhd entsR eR_152 := by decide +kernel
theorem mkOKR_152 : mkEnt 32 1024 W rR_152 152 = eR_152 := by decide +kernel
theorem tR_152 : kTermA 4294967295 eR_152 nbR_152 = 118562569937793959994230826 := by decide +kernel


end RamseyCert
