import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_341 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_4, eB_5, eB_6, eB_7, eB_13, eB_14, eB_15, eB_16, eB_21, eB_23, eB_25, eB_27,
  eB_28, eB_29, eB_42, eB_43, eB_44, eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70,
  eB_71, eB_72, eB_73, eB_74, eB_75, eB_77, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89, eB_90, eB_91, eB_92, eB_96,
  eB_100, eB_101, eB_102, eB_106, eB_107, eB_108, eB_115, eB_116, eB_117, eB_121, eB_122, eB_123, eB_133, eB_134, eB_135, eB_139,
  eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_148, eB_149, eB_150, eB_154, eB_155, eB_156, eB_164, eB_165,
  eB_166, eB_167, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_188, eB_196,
  eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_204, eB_211, eB_212, eB_213, eB_214, eB_230, eB_231, eB_232, eB_233,
  eB_234, eB_235, eB_242, eB_243, eB_244, eB_245, eB_246, eB_247, eB_251, eB_254, eB_255, eB_264, eB_265, eB_266, eB_267, eB_268,
  eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_292, eB_293, eB_294, eB_295, eB_300,
  eB_301, eB_302, eB_303, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331, eB_336,
  eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_353, eB_354, eB_355, eB_356, eB_361, eB_362, eB_363, eB_364, eB_369,
  eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_388, eB_390, eB_398, eB_405, eB_406,
  eB_407, eB_411, eB_412, eB_413, eB_417, eB_418, eB_419, eB_424, eB_426, eB_430, eB_431, eB_432, eB_433, eB_434, eB_450, eB_451,
  eB_452, eB_456, eB_458, eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486,
  eB_487, eB_489, eB_492, eB_493, eB_494, eB_495, eB_498, eB_500, eB_501, eB_502, eB_503, eB_507, eB_508, eB_509, eB_510, eB_511,
  eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_528, eB_529, eB_530, eB_531, eB_536, eB_541, eB_542, eB_543,
  eB_544, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571,
  eB_572, eB_577, eB_578, eB_579, eB_580, eB_585, eB_586, eB_587, eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603,
  eB_604, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615, eB_616, eB_617, eB_618, eB_619, eB_620, eB_622, eB_624, eB_625,
  eB_627, eB_633, eB_634, eB_635, eB_636, eB_638, eB_641, eB_642, eB_643, eB_644, eB_649, eB_650, eB_651, eB_652, eB_657, eB_658,
  eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679, eB_680, eB_685, eB_686,
  eB_687, eB_688, eB_697, eB_698, eB_699, eB_700, eB_701, eB_702, eB_703, eB_704, eB_705, eB_708, eB_710, eB_713, eB_714, eB_715,
  eB_716, eB_719, eB_721, eB_722, eB_723, eB_724, eB_726, eB_729, eB_730, eB_731, eB_732, eB_733, eB_734, eB_735, eB_736, eB_741,
  eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_765, eB_766, eB_767, eB_768, eB_769,
  eB_772, eB_773, eB_774, eB_775, eB_776, eB_780, eB_781, eB_782, eB_783, eB_790, eB_791, eB_796, eB_797, eB_800, eB_801, eB_804,
  eB_805, eB_806, eB_807, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_830, eB_831, eB_832,
  eB_833, eB_838, eB_839, eB_840, eB_841, eB_844, eB_845, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_870, eB_871, eB_876,
  eB_877, eB_880, eB_881, eB_884, eB_885, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_896, eB_897, eB_898, eB_903, eB_904,
  eB_905, eB_907, eB_908, eB_909, eB_912, eB_914, eB_917, eB_920, eB_922, eB_927, eB_930, eB_932, eB_933, eB_935, eB_936, eB_937,
  eB_939, eB_941, eB_944, eB_945, eB_951, eB_952, eB_955, eB_956, eB_957, eB_958, eB_959, eB_963, eB_964, eB_965, eB_968, eB_970,
  eB_972, eB_973, eB_974, eB_977, eB_978, eB_983, eB_984, eB_985, eB_986, eB_989, eB_991, eB_992, eB_993, eB_996, eB_998, eB_999,
  eB_1002, eB_1010, eB_1011, eB_1012, eB_1013, eB_1017, eB_1018, eB_1019, eB_1020]
theorem nbOKB_341 : nbB_341 = nbhd entsB eB_341 := by decide +kernel
theorem mkOKB_341 : mkEnt 32 1024 W rB_341 341 = eB_341 := by decide +kernel
theorem tB_341 : kTermA 4294967295 eB_341 nbB_341 = 116263089132133911039312708 := by decide +kernel


end RamseyCert
