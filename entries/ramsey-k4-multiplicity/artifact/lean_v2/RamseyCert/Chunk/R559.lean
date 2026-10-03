import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_559 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_13, eR_17, eR_19, eR_20, eR_22, eR_24, eR_26, eR_28,
  eR_29, eR_30, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_45, eR_48, eR_49, eR_50, eR_51, eR_56,
  eR_57, eR_58, eR_59, eR_68, eR_69, eR_71, eR_76, eR_77, eR_79, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_90,
  eR_91, eR_96, eR_99, eR_100, eR_101, eR_103, eR_104, eR_106, eR_107, eR_111, eR_114, eR_115, eR_116, eR_120, eR_121, eR_122,
  eR_124, eR_125, eR_127, eR_128, eR_130, eR_131, eR_133, eR_134, eR_135, eR_139, eR_142, eR_145, eR_149, eR_150, eR_151, eR_155,
  eR_156, eR_157, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189,
  eR_191, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202, eR_203, eR_210, eR_211, eR_212, eR_214, eR_215, eR_216, eR_218,
  eR_219, eR_221, eR_222, eR_224, eR_225, eR_229, eR_230, eR_231, eR_233, eR_234, eR_238, eR_241, eR_242, eR_243, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_252, eR_253, eR_255, eR_256, eR_257, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271,
  eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_317, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346,
  eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374,
  eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_387, eR_389, eR_392, eR_393, eR_395, eR_396, eR_397, eR_400, eR_401, eR_402,
  eR_403, eR_405, eR_406, eR_410, eR_411, eR_412, eR_416, eR_417, eR_418, eR_422, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434,
  eR_435, eR_436, eR_438, eR_439, eR_442, eR_443, eR_445, eR_446, eR_447, eR_448, eR_450, eR_451, eR_455, eR_456, eR_457, eR_460,
  eR_461, eR_462, eR_463, eR_464, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_488, eR_489,
  eR_490, eR_500, eR_501, eR_502, eR_503, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_523,
  eR_528, eR_529, eR_530, eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555,
  eR_556, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591,
  eR_592, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602, eR_603, eR_604, eR_611, eR_614, eR_617, eR_620, eR_621, eR_623, eR_626,
  eR_628, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655,
  eR_656, eR_665, eR_666, eR_667, eR_668, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692,
  eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_709, eR_711, eR_712, eR_721, eR_722, eR_723, eR_724, eR_729,
  eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_741, eR_743, eR_744, eR_749, eR_751, eR_752, eR_757, eR_758, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_788, eR_789, eR_790, eR_791, eR_792, eR_793,
  eR_794, eR_795, eR_796, eR_797, eR_800, eR_801, eR_806, eR_807, eR_808, eR_809, eR_816, eR_817, eR_818, eR_819, eR_822, eR_823,
  eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_844, eR_845, eR_852, eR_853, eR_858, eR_859, eR_864, eR_865,
  eR_866, eR_867, eR_870, eR_871, eR_878, eR_879, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_898, eR_899,
  eR_900, eR_902, eR_903, eR_910, eR_914, eR_915, eR_919, eR_920, eR_922, eR_923, eR_924, eR_925, eR_926, eR_928, eR_929, eR_935,
  eR_936, eR_937, eR_938, eR_944, eR_946, eR_947, eR_950, eR_951, eR_952, eR_953, eR_955, eR_956, eR_957, eR_959, eR_960, eR_961,
  eR_962, eR_963, eR_965, eR_967, eR_969, eR_973, eR_974, eR_975, eR_978, eR_980, eR_981, eR_985, eR_986, eR_987, eR_989, eR_990,
  eR_991, eR_994, eR_995, eR_997, eR_998, eR_999, eR_1002, eR_1003, eR_1004, eR_1006, eR_1009, eR_1010, eR_1011, eR_1014, eR_1016, eR_1020,
  eR_1023]
theorem nbOKR_559 : nbR_559 = nbhd entsR eR_559 := by decide +kernel
theorem mkOKR_559 : mkEnt 32 1024 W rR_559 559 = eR_559 := by decide +kernel
theorem tR_559 : kTermA 4294967295 eR_559 nbR_559 = 122927005766713105609690878 := by decide +kernel


end RamseyCert
