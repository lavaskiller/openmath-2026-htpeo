import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_750 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_16, eR_18, eR_19, eR_21, eR_23,
  eR_25, eR_27, eR_28, eR_32, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_98, eR_100, eR_102, eR_104, eR_107, eR_108, eR_109, eR_112, eR_116, eR_117, eR_118,
  eR_122, eR_123, eR_124, eR_127, eR_130, eR_136, eR_137, eR_138, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149,
  eR_153, eR_154, eR_155, eR_159, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179,
  eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_210, eR_212, eR_214,
  eR_216, eR_217, eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_228, eR_229, eR_230, eR_233, eR_237, eR_238, eR_240, eR_241,
  eR_242, eR_245, eR_246, eR_247, eR_248, eR_250, eR_251, eR_253, eR_255, eR_257, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272,
  eR_273, eR_274, eR_275, eR_280, eR_281, eR_282, eR_283, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305,
  eR_306, eR_307, eR_309, eR_310, eR_311, eR_316, eR_318, eR_319, eR_325, eR_326, eR_327, eR_336, eR_337, eR_338, eR_339, eR_340,
  eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_374,
  eR_375, eR_376, eR_385, eR_386, eR_388, eR_390, eR_391, eR_392, eR_394, eR_395, eR_398, eR_399, eR_400, eR_402, eR_404, eR_405,
  eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_423, eR_425, eR_431, eR_432, eR_433, eR_434, eR_436, eR_437,
  eR_439, eR_440, eR_443, eR_446, eR_447, eR_449, eR_450, eR_454, eR_455, eR_456, eR_457, eR_461, eR_466, eR_467, eR_468, eR_469,
  eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497,
  eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529,
  eR_530, eR_536, eR_537, eR_538, eR_539, eR_540, eR_549, eR_551, eR_552, eR_557, eR_558, eR_560, eR_565, eR_566, eR_568, eR_569,
  eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602,
  eR_603, eR_604, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_623, eR_626, eR_628, eR_629, eR_630,
  eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_652, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662, eR_663,
  eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_697, eR_699, eR_700,
  eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728,
  eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760,
  eR_765, eR_766, eR_767, eR_776, eR_777, eR_778, eR_779, eR_780, eR_781, eR_784, eR_785, eR_788, eR_789, eR_792, eR_793, eR_794,
  eR_795, eR_796, eR_797, eR_800, eR_801, eR_802, eR_803, eR_818, eR_819, eR_820, eR_821, eR_826, eR_827, eR_828, eR_829, eR_832,
  eR_833, eR_834, eR_835, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_850, eR_851, eR_852,
  eR_853, eR_854, eR_855, eR_856, eR_857, eR_862, eR_863, eR_866, eR_867, eR_868, eR_869, eR_878, eR_879, eR_880, eR_881, eR_884,
  eR_885, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_902, eR_904, eR_905, eR_906, eR_911, eR_912, eR_913, eR_914, eR_915,
  eR_916, eR_919, eR_922, eR_923, eR_924, eR_925, eR_926, eR_927, eR_932, eR_934, eR_935, eR_937, eR_941, eR_943, eR_945, eR_946,
  eR_947, eR_948, eR_951, eR_953, eR_954, eR_959, eR_961, eR_964, eR_965, eR_966, eR_967, eR_968, eR_972, eR_974, eR_976, eR_977,
  eR_978, eR_979, eR_982, eR_983, eR_986, eR_989, eR_990, eR_992, eR_993, eR_996, eR_1000, eR_1002, eR_1003, eR_1006, eR_1008, eR_1009,
  eR_1010, eR_1011, eR_1014, eR_1015, eR_1017, eR_1021, eR_1022]
theorem nbOKR_750 : nbR_750 = nbhd entsR eR_750 := by decide +kernel
theorem mkOKR_750 : mkEnt 32 1024 W rR_750 750 = eR_750 := by decide +kernel
theorem tR_750 : kTermA 4294967295 eR_750 nbR_750 = 81556362887358168539585928 := by decide +kernel


end RamseyCert
