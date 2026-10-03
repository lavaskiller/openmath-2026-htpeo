import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_820 : List Ent := [
  eR_13, eR_15, eR_18, eR_20, eR_27, eR_29, eR_30, eR_32, eR_33, eR_35, eR_36, eR_38, eR_39, eR_41, eR_42, eR_44,
  eR_45, eR_47, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77,
  eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_92, eR_93,
  eR_94, eR_95, eR_100, eR_103, eR_107, eR_110, eR_113, eR_116, eR_119, eR_122, eR_128, eR_131, eR_133, eR_134, eR_135, eR_139,
  eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_151, eR_153, eR_154, eR_156, eR_157, eR_159, eR_168, eR_169, eR_170,
  eR_171, eR_172, eR_173, eR_174, eR_175, eR_184, eR_185, eR_186, eR_187, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194,
  eR_195, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_204, eR_205, eR_206, eR_207, eR_208, eR_211, eR_222,
  eR_225, eR_231, eR_234, eR_237, eR_240, eR_243, eR_245, eR_246, eR_247, eR_249, eR_250, eR_257, eR_258, eR_259, eR_268, eR_269,
  eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293,
  eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317,
  eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_357,
  eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_385,
  eR_386, eR_393, eR_394, eR_399, eR_401, eR_406, eR_409, eR_412, eR_415, eR_418, eR_421, eR_439, eR_443, eR_444, eR_446, eR_451,
  eR_454, eR_456, eR_459, eR_462, eR_463, eR_464, eR_465, eR_466, eR_467, eR_468, eR_469, eR_478, eR_479, eR_480, eR_481, eR_482,
  eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505, eR_506,
  eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_528, eR_529, eR_530,
  eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_569, eR_570,
  eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_593, eR_594, eR_595, eR_596, eR_597, eR_598, eR_599, eR_600, eR_610, eR_613,
  eR_616, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634,
  eR_635, eR_636, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674,
  eR_675, eR_676, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696, eR_697, eR_698,
  eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_713, eR_714,
  eR_715, eR_716, eR_725, eR_726, eR_727, eR_728, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738,
  eR_739, eR_740, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762,
  eR_763, eR_764, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_786, eR_787, eR_790, eR_791, eR_792, eR_793,
  eR_794, eR_795, eR_798, eR_799, eR_804, eR_805, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_823, eR_828, eR_829, eR_830,
  eR_831, eR_832, eR_833, eR_836, eR_837, eR_840, eR_841, eR_842, eR_843, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852,
  eR_853, eR_854, eR_855, eR_858, eR_859, eR_866, eR_867, eR_868, eR_869, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_878,
  eR_879, eR_886, eR_887, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_897, eR_899, eR_900, eR_901, eR_902, eR_906, eR_908,
  eR_910, eR_911, eR_914, eR_919, eR_922, eR_923, eR_925, eR_927, eR_928, eR_929, eR_931, eR_934, eR_938, eR_939, eR_940, eR_941,
  eR_947, eR_949, eR_951, eR_955, eR_956, eR_958, eR_961, eR_964, eR_965, eR_967, eR_969, eR_970, eR_972, eR_973, eR_976, eR_977,
  eR_978, eR_985, eR_986, eR_990, eR_991, eR_992, eR_995, eR_996, eR_1002, eR_1004, eR_1005, eR_1006, eR_1007, eR_1008, eR_1010, eR_1011,
  eR_1012, eR_1013, eR_1015, eR_1016, eR_1018, eR_1020, eR_1022]
theorem nbOKR_820 : nbR_820 = nbhd entsR eR_820 := by decide +kernel
theorem mkOKR_820 : mkEnt 32 1024 W rR_820 820 = eR_820 := by decide +kernel
theorem tR_820 : kTermA 4294967295 eR_820 nbR_820 = 45455670730529752506390720 := by decide +kernel


end RamseyCert
