import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_908 : List Ent := [
  eR_4, eR_5, eR_7, eR_13, eR_14, eR_15, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_30, eR_31, eR_32,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55,
  eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83,
  eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_98, eR_99, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_118, eR_119,
  eR_120, eR_133, eR_134, eR_135, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_151, eR_152, eR_153,
  eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184,
  eR_185, eR_186, eR_187, eR_196, eR_199, eR_204, eR_205, eR_206, eR_207, eR_211, eR_212, eR_213, eR_215, eR_216, eR_217, eR_218,
  eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_242, eR_243,
  eR_244, eR_248, eR_249, eR_250, eR_251, eR_253, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281, eR_282,
  eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_293, eR_294, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309, eR_310, eR_320,
  eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347, eR_348, eR_349,
  eR_350, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382,
  eR_383, eR_384, eR_388, eR_390, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_398, eR_399, eR_400, eR_401, eR_402, eR_403,
  eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_423, eR_425, eR_427, eR_428, eR_429, eR_430,
  eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452, eR_457, eR_466, eR_467, eR_468,
  eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502,
  eR_503, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530,
  eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_566, eR_567, eR_568,
  eR_573, eR_574, eR_575, eR_582, eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602,
  eR_603, eR_604, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_623,
  eR_626, eR_628, eR_633, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655,
  eR_656, eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720,
  eR_725, eR_726, eR_727, eR_728, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756,
  eR_761, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_776, eR_777, eR_784, eR_785, eR_788, eR_789, eR_792, eR_793, eR_794,
  eR_795, eR_804, eR_805, eR_808, eR_809, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819, eR_820, eR_821, eR_824, eR_825, eR_826,
  eR_827, eR_830, eR_831, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_844, eR_845, eR_846, eR_847, eR_848,
  eR_849, eR_850, eR_851, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859, eR_862, eR_863, eR_864, eR_865, eR_868, eR_869, eR_870,
  eR_871, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_894, eR_895, eR_898, eR_901, eR_905, eR_907, eR_909, eR_910, eR_915,
  eR_919, eR_922, eR_923, eR_924, eR_925, eR_926, eR_928, eR_929, eR_931, eR_932, eR_934, eR_938, eR_941, eR_944, eR_946, eR_950,
  eR_954, eR_955, eR_958, eR_962, eR_963, eR_964, eR_965, eR_966, eR_968, eR_970, eR_971, eR_972, eR_973, eR_974, eR_976, eR_977,
  eR_978, eR_979, eR_980, eR_983, eR_984, eR_985, eR_987, eR_988, eR_989, eR_993, eR_994, eR_996, eR_998, eR_999, eR_1001, eR_1002,
  eR_1003, eR_1006, eR_1012, eR_1013, eR_1016, eR_1019, eR_1021, eR_1022]
theorem nbOKR_908 : nbR_908 = nbhd entsR eR_908 := by decide +kernel
theorem mkOKR_908 : mkEnt 32 1024 W rR_908 908 = eR_908 := by decide +kernel
theorem tR_908 : kTermA 4294967295 eR_908 nbR_908 = 73302613306753919271500592 := by decide +kernel


end RamseyCert
