import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_229 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_13, eR_17, eR_22, eR_24, eR_27, eR_32, eR_33, eR_36,
  eR_39, eR_42, eR_46, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_56, eR_57, eR_58, eR_59, eR_60,
  eR_61, eR_62, eR_63, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90, eR_91, eR_92,
  eR_93, eR_94, eR_95, eR_99, eR_100, eR_101, eR_105, eR_106, eR_107, eR_115, eR_116, eR_120, eR_121, eR_122, eR_126, eR_129,
  eR_132, eR_139, eR_142, eR_145, eR_152, eR_153, eR_154, eR_158, eR_159, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182,
  eR_183, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_208, eR_209, eR_213, eR_214, eR_215, eR_216, eR_218,
  eR_219, eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_232, eR_235, eR_236, eR_237, eR_239, eR_240, eR_244, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_251, eR_253, eR_255, eR_258, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_276,
  eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_300,
  eR_301, eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316,
  eR_317, eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_365,
  eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_388,
  eR_390, eR_392, eR_393, eR_395, eR_396, eR_398, eR_400, eR_401, eR_404, eR_410, eR_411, eR_412, eR_416, eR_417, eR_418, eR_423,
  eR_425, eR_437, eR_440, eR_441, eR_444, eR_450, eR_451, eR_455, eR_457, eR_459, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467,
  eR_468, eR_469, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509,
  eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558,
  eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574,
  eR_575, eR_576, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598,
  eR_599, eR_600, eR_611, eR_614, eR_617, eR_624, eR_625, eR_627, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634, eR_635, eR_636,
  eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651, eR_652,
  eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_677, eR_678, eR_679, eR_680, eR_681, eR_682, eR_683, eR_684,
  eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708,
  eR_709, eR_710, eR_711, eR_712, eR_713, eR_714, eR_715, eR_716, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748,
  eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763, eR_764,
  eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_784, eR_785, eR_796, eR_797, eR_798,
  eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_814,
  eR_815, eR_816, eR_817, eR_826, eR_832, eR_833, eR_836, eR_837, eR_838, eR_839, eR_842, eR_843, eR_850, eR_851, eR_852, eR_853,
  eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_865, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_882,
  eR_883, eR_884, eR_885, eR_886, eR_887, eR_890, eR_891, eR_894, eR_895, eR_897, eR_900, eR_903, eR_905, eR_911, eR_912, eR_914,
  eR_915, eR_916, eR_919, eR_920, eR_923, eR_926, eR_927, eR_929, eR_933, eR_934, eR_935, eR_936, eR_939, eR_945, eR_947, eR_949,
  eR_950, eR_953, eR_954, eR_955, eR_960, eR_961, eR_963, eR_964, eR_967, eR_968, eR_969, eR_970, eR_971, eR_972, eR_973, eR_976,
  eR_978, eR_980, eR_982, eR_983, eR_984, eR_986, eR_989, eR_990, eR_991, eR_995, eR_996, eR_997, eR_999, eR_1000, eR_1001, eR_1002,
  eR_1003, eR_1008, eR_1009, eR_1015, eR_1018, eR_1019, eR_1023]
theorem nbOKR_229 : nbR_229 = nbhd entsR eR_229 := by decide +kernel
theorem mkOKR_229 : mkEnt 32 1024 W rR_229 229 = eR_229 := by decide +kernel
theorem tR_229 : kTermA 4294967295 eR_229 nbR_229 = 100614847694535879016678716 := by decide +kernel


end RamseyCert
