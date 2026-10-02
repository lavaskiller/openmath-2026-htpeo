import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_980 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_15, eR_18, eR_19, eR_29, eR_32, eR_33, eR_37,
  eR_39, eR_40, eR_44, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_72, eR_73, eR_74, eR_75,
  eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91,
  eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_101, eR_106, eR_109, eR_112, eR_115, eR_118, eR_121, eR_124, eR_130, eR_133,
  eR_134, eR_135, eR_136, eR_137, eR_141, eR_147, eR_153, eR_156, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174, eR_175,
  eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_208, eR_210, eR_211, eR_213, eR_216, eR_217, eR_219, eR_220,
  eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244,
  eR_249, eR_251, eR_252, eR_255, eR_256, eR_258, eR_268, eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277,
  eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301,
  eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_316, eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325,
  eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350,
  eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_387, eR_388,
  eR_389, eR_390, eR_393, eR_396, eR_397, eR_398, eR_401, eR_403, eR_408, eR_411, eR_417, eR_420, eR_427, eR_428, eR_429, eR_430,
  eR_431, eR_432, eR_433, eR_434, eR_435, eR_441, eR_442, eR_444, eR_445, eR_448, eR_450, eR_453, eR_456, eR_459, eR_460, eR_478,
  eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_486, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511,
  eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551,
  eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575,
  eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599,
  eR_600, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_645,
  eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677,
  eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698, eR_699, eR_700, eR_701,
  eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_717,
  eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739, eR_740, eR_741,
  eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_788, eR_789, eR_790, eR_791, eR_794, eR_795,
  eR_796, eR_797, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_812, eR_813, eR_816, eR_817, eR_824, eR_825,
  eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_852, eR_853, eR_854, eR_855,
  eR_858, eR_859, eR_862, eR_863, eR_866, eR_867, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_882, eR_883,
  eR_884, eR_885, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_896, eR_898, eR_899, eR_900, eR_903, eR_908, eR_910, eR_911,
  eR_912, eR_913, eR_914, eR_916, eR_918, eR_919, eR_920, eR_926, eR_933, eR_938, eR_940, eR_942, eR_943, eR_945, eR_946, eR_950,
  eR_951, eR_954, eR_958, eR_959, eR_962, eR_965, eR_967, eR_968, eR_972, eR_975, eR_976, eR_977, eR_978, eR_981, eR_983, eR_984,
  eR_985, eR_987, eR_988, eR_989, eR_990, eR_992, eR_995, eR_996, eR_998, eR_1000, eR_1001, eR_1006, eR_1007, eR_1009, eR_1010, eR_1012,
  eR_1015, eR_1017, eR_1018, eR_1019, eR_1020, eR_1021, eR_1022]
theorem nbOKR_980 : nbR_980 = nbhd entsR eR_980 := by decide +kernel
theorem mkOKR_980 : mkEnt 32 1024 W rR_980 980 = eR_980 := by decide +kernel
theorem tR_980 : kTermA 4294967295 eR_980 nbR_980 = 79807669619103718366083840 := by decide +kernel


end RamseyCert
