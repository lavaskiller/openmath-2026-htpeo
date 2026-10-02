import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_812 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26,
  eR_28, eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_46, eR_47, eR_48, eR_49,
  eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83,
  eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_98, eR_100, eR_101, eR_105, eR_106, eR_107, eR_109, eR_110, eR_112, eR_113,
  eR_115, eR_116, eR_118, eR_119, eR_121, eR_122, eR_126, eR_129, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139,
  eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173,
  eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201,
  eR_202, eR_203, eR_210, eR_213, eR_215, eR_216, eR_218, eR_219, eR_221, eR_222, eR_224, eR_225, eR_229, eR_232, eR_235, eR_238,
  eR_241, eR_244, eR_250, eR_253, eR_254, eR_255, eR_256, eR_257, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_278, eR_279, eR_284, eR_285, eR_287, eR_292, eR_293, eR_294, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313, eR_314,
  eR_315, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347,
  eR_348, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_360, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380,
  eR_391, eR_394, eR_399, eR_404, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421,
  eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449, eR_450,
  eR_451, eR_453, eR_454, eR_456, eR_457, eR_458, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477,
  eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505,
  eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536, eR_537,
  eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_557, eR_558, eR_560, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570,
  eR_571, eR_572, eR_581, eR_583, eR_584, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_601, eR_602, eR_603, eR_604, eR_609,
  eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629,
  eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_665,
  eR_666, eR_668, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694,
  eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_729, eR_730,
  eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762,
  eR_763, eR_765, eR_766, eR_767, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_786, eR_798, eR_799, eR_800,
  eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_818, eR_819, eR_824, eR_825, eR_826,
  eR_827, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_858,
  eR_859, eR_862, eR_863, eR_868, eR_869, eR_878, eR_879, eR_884, eR_885, eR_888, eR_889, eR_895, eR_896, eR_899, eR_904, eR_905,
  eR_907, eR_910, eR_911, eR_913, eR_914, eR_915, eR_918, eR_922, eR_923, eR_924, eR_925, eR_927, eR_930, eR_931, eR_932, eR_933,
  eR_935, eR_936, eR_939, eR_944, eR_945, eR_946, eR_947, eR_949, eR_951, eR_954, eR_955, eR_956, eR_957, eR_958, eR_960, eR_962,
  eR_964, eR_969, eR_970, eR_971, eR_972, eR_976, eR_977, eR_979, eR_980, eR_981, eR_983, eR_985, eR_989, eR_991, eR_992, eR_995,
  eR_998, eR_999, eR_1000, eR_1001, eR_1004, eR_1006, eR_1007, eR_1008, eR_1009, eR_1011, eR_1016, eR_1018, eR_1019, eR_1020, eR_1023]
theorem nbOKR_812 : nbR_812 = nbhd entsR eR_812 := by decide +kernel
theorem mkOKR_812 : mkEnt 32 1024 W rR_812 812 = eR_812 := by decide +kernel
theorem tR_812 : kTermA 4294967295 eR_812 nbR_812 = 42676857890841594374018232 := by decide +kernel


end RamseyCert
