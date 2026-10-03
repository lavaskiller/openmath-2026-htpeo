import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_313 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_17, eR_20, eR_22, eR_24, eR_26, eR_27, eR_28, eR_32, eR_35,
  eR_38, eR_41, eR_42, eR_43, eR_47, eR_48, eR_49, eR_50, eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70,
  eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_82, eR_83, eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_99, eR_101,
  eR_103, eR_105, eR_106, eR_110, eR_111, eR_113, eR_114, eR_115, eR_119, eR_120, eR_121, eR_125, eR_126, eR_128, eR_129, eR_131,
  eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_153,
  eR_154, eR_155, eR_159, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189,
  eR_190, eR_191, eR_192, eR_193, eR_194, eR_204, eR_205, eR_206, eR_207, eR_208, eR_210, eR_212, eR_214, eR_216, eR_217, eR_219,
  eR_220, eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_241, eR_242, eR_245, eR_246,
  eR_247, eR_248, eR_250, eR_251, eR_254, eR_255, eR_256, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338,
  eR_339, eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366,
  eR_367, eR_368, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_391, eR_392,
  eR_394, eR_395, eR_398, eR_399, eR_400, eR_403, eR_406, eR_407, eR_408, eR_412, eR_413, eR_414, eR_418, eR_419, eR_420, eR_424,
  eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_451, eR_452, eR_453, eR_458,
  eR_459, eR_460, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472, eR_473, eR_482, eR_483, eR_485, eR_492, eR_493, eR_495,
  eR_500, eR_501, eR_502, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_532,
  eR_533, eR_534, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_563, eR_564,
  eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_623, eR_626, eR_628,
  eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656,
  eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_691, eR_692, eR_697,
  eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_713, eR_715, eR_716, eR_721, eR_723, eR_725, eR_726, eR_727, eR_728,
  eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_786, eR_787, eR_796, eR_797,
  eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_818, eR_819, eR_820, eR_821,
  eR_822, eR_823, eR_824, eR_825, eR_830, eR_832, eR_833, eR_834, eR_835, eR_838, eR_839, eR_843, eR_846, eR_847, eR_848, eR_849,
  eR_850, eR_851, eR_852, eR_853, eR_854, eR_855, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873,
  eR_874, eR_875, eR_878, eR_879, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_896, eR_901, eR_903, eR_906,
  eR_909, eR_910, eR_911, eR_912, eR_913, eR_917, eR_918, eR_919, eR_922, eR_923, eR_925, eR_926, eR_927, eR_930, eR_931, eR_935,
  eR_940, eR_942, eR_943, eR_944, eR_950, eR_952, eR_955, eR_960, eR_961, eR_962, eR_963, eR_965, eR_966, eR_968, eR_972, eR_973,
  eR_974, eR_976, eR_977, eR_981, eR_982, eR_983, eR_985, eR_986, eR_987, eR_990, eR_991, eR_992, eR_993, eR_994, eR_995, eR_997,
  eR_1000, eR_1002, eR_1003, eR_1004, eR_1006, eR_1015, eR_1016, eR_1021]
theorem nbOKR_313 : nbR_313 = nbhd entsR eR_313 := by decide +kernel
theorem mkOKR_313 : mkEnt 32 1024 W rR_313 313 = eR_313 := by decide +kernel
theorem tR_313 : kTermA 4294967295 eR_313 nbR_313 = 117963256228433957010537360 := by decide +kernel


end RamseyCert
