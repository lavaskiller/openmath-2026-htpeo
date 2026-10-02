import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_139 : List Ent := [
  eR_14, eR_15, eR_19, eR_20, eR_28, eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44,
  eR_46, eR_47, eR_64, eR_65, eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77,
  eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93,
  eR_94, eR_95, eR_96, eR_99, eR_102, eR_105, eR_108, eR_111, eR_117, eR_120, eR_123, eR_126, eR_129, eR_133, eR_135, eR_140,
  eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_152, eR_153, eR_155, eR_156, eR_158, eR_159, eR_176, eR_177, eR_178,
  eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194,
  eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_210, eR_217, eR_220,
  eR_223, eR_229, eR_232, eR_235, eR_241, eR_244, eR_245, eR_246, eR_247, eR_248, eR_249, eR_257, eR_259, eR_276, eR_277, eR_278,
  eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300, eR_301, eR_302,
  eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_324, eR_325, eR_326,
  eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_365, eR_366,
  eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_385, eR_386,
  eR_392, eR_393, eR_396, eR_400, eR_401, eR_404, eR_407, eR_410, eR_413, eR_416, eR_419, eR_422, eR_442, eR_445, eR_446, eR_449,
  eR_452, eR_455, eR_456, eR_460, eR_461, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480,
  eR_481, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504,
  eR_505, eR_506, eR_507, eR_508, eR_509, eR_510, eR_511, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_528,
  eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558, eR_559, eR_560,
  eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606, eR_607, eR_608,
  eR_611, eR_614, eR_617, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629, eR_630, eR_631, eR_632,
  eR_633, eR_634, eR_635, eR_636, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_677, eR_678, eR_679, eR_680,
  eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696,
  eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_717, eR_718, eR_719, eR_720,
  eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_741, eR_742, eR_743, eR_744,
  eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_796, eR_797, eR_798, eR_799, eR_802, eR_803,
  eR_804, eR_805, eR_810, eR_811, eR_812, eR_813, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_827, eR_834, eR_835, eR_837,
  eR_838, eR_839, eR_842, eR_843, eR_844, eR_845, eR_852, eR_853, eR_854, eR_855, eR_864, eR_880, eR_882, eR_883, eR_886, eR_887,
  eR_888, eR_889, eR_892, eR_893, eR_894, eR_895, eR_897, eR_899, eR_900, eR_901, eR_905, eR_906, eR_908, eR_909, eR_910, eR_911,
  eR_917, eR_919, eR_920, eR_921, eR_924, eR_925, eR_926, eR_927, eR_929, eR_933, eR_939, eR_940, eR_941, eR_942, eR_943, eR_944,
  eR_945, eR_946, eR_948, eR_949, eR_950, eR_951, eR_953, eR_954, eR_956, eR_957, eR_958, eR_961, eR_962, eR_963, eR_964, eR_966,
  eR_967, eR_970, eR_971, eR_972, eR_973, eR_976, eR_978, eR_981, eR_983, eR_986, eR_988, eR_993, eR_997, eR_998, eR_1000, eR_1001,
  eR_1002, eR_1003, eR_1004, eR_1005, eR_1006, eR_1008, eR_1011, eR_1013, eR_1016, eR_1017, eR_1018, eR_1019, eR_1020]
theorem nbOKR_139 : nbR_139 = nbhd entsR eR_139 := by decide +kernel
theorem mkOKR_139 : mkEnt 32 1024 W rR_139 139 = eR_139 := by decide +kernel
theorem tR_139 : kTermA 4294967295 eR_139 nbR_139 = 118580495164114708385890866 := by decide +kernel


end RamseyCert
