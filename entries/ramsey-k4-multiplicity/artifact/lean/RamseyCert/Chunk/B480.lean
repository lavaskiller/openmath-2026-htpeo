import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_480 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_12, eB_15, eB_18, eB_19, eB_29, eB_32, eB_33, eB_34, eB_36, eB_37, eB_39, eB_40,
  eB_44, eB_47, eB_52, eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_64, eB_65, eB_66, eB_67, eB_76, eB_77,
  eB_78, eB_79, eB_84, eB_85, eB_86, eB_87, eB_92, eB_93, eB_94, eB_95, eB_96, eB_98, eB_101, eB_104, eB_106, eB_109,
  eB_112, eB_115, eB_118, eB_121, eB_124, eB_127, eB_130, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138, eB_141, eB_144, eB_147,
  eB_150, eB_153, eB_156, eB_159, eB_160, eB_161, eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183,
  eB_184, eB_185, eB_186, eB_187, eB_192, eB_193, eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_208, eB_210, eB_211, eB_213,
  eB_216, eB_217, eB_219, eB_220, eB_222, eB_223, eB_225, eB_226, eB_228, eB_229, eB_231, eB_232, eB_234, eB_235, eB_237, eB_238,
  eB_240, eB_241, eB_243, eB_244, eB_249, eB_251, eB_252, eB_255, eB_256, eB_258, eB_261, eB_264, eB_265, eB_266, eB_267, eB_268,
  eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295,
  eB_300, eB_301, eB_302, eB_303, eB_309, eB_312, eB_313, eB_314, eB_315, eB_316, eB_317, eB_318, eB_319, eB_324, eB_325, eB_326,
  eB_327, eB_335, eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_357, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_387, eB_388, eB_389, eB_390, eB_393,
  eB_396, eB_397, eB_398, eB_401, eB_403, eB_405, eB_408, eB_411, eB_414, eB_417, eB_420, eB_427, eB_428, eB_429, eB_430, eB_435,
  eB_438, eB_441, eB_442, eB_444, eB_445, eB_448, eB_450, eB_453, eB_456, eB_459, eB_460, eB_466, eB_467, eB_468, eB_469, eB_474,
  eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502,
  eB_503, eB_504, eB_505, eB_506, eB_507, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529, eB_530,
  eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562,
  eB_563, eB_564, eB_565, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_589,
  eB_597, eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_610, eB_611, eB_613, eB_614, eB_616, eB_617, eB_619, eB_620,
  eB_629, eB_630, eB_631, eB_632, eB_635, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652, eB_653, eB_654, eB_655,
  eB_656, eB_659, eB_661, eB_662, eB_663, eB_664, eB_665, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679, eB_680, eB_686,
  eB_688, eB_689, eB_690, eB_691, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711,
  eB_712, eB_717, eB_718, eB_719, eB_720, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742, eB_743,
  eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_768, eB_769, eB_770, eB_774,
  eB_775, eB_782, eB_783, eB_788, eB_789, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799, eB_806, eB_807, eB_812, eB_813, eB_818,
  eB_819, eB_824, eB_825, eB_830, eB_831, eB_834, eB_835, eB_836, eB_837, eB_838, eB_839, eB_840, eB_841, eB_842, eB_843, eB_854,
  eB_855, eB_858, eB_859, eB_862, eB_863, eB_872, eB_873, eB_874, eB_875, eB_878, eB_879, eB_884, eB_885, eB_886, eB_887, eB_892,
  eB_893, eB_894, eB_895, eB_898, eB_900, eB_903, eB_905, eB_908, eB_911, eB_912, eB_913, eB_918, eB_919, eB_920, eB_921, eB_923,
  eB_924, eB_929, eB_933, eB_934, eB_935, eB_936, eB_941, eB_942, eB_943, eB_945, eB_946, eB_947, eB_948, eB_949, eB_951, eB_952,
  eB_956, eB_958, eB_961, eB_962, eB_963, eB_965, eB_966, eB_967, eB_968, eB_969, eB_975, eB_976, eB_977, eB_979, eB_981, eB_983,
  eB_984, eB_985, eB_987, eB_988, eB_989, eB_990, eB_992, eB_994, eB_995, eB_997, eB_999, eB_1008, eB_1010, eB_1011, eB_1012, eB_1013,
  eB_1014, eB_1015, eB_1019, eB_1020, eB_1021, eB_1022]
theorem nbOKB_480 : nbB_480 = nbhd entsB eB_480 := by decide +kernel
theorem mkOKB_480 : mkEnt 32 1024 W rB_480 480 = eB_480 := by decide +kernel
theorem tB_480 : kTermA 4294967295 eB_480 nbB_480 = 118586426504886092085996348 := by decide +kernel


end RamseyCert
