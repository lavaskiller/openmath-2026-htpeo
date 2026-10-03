import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_454 : List Ent := [
  eB_12, eB_13, eB_15, eB_17, eB_19, eB_22, eB_24, eB_26, eB_27, eB_29, eB_31, eB_34, eB_37, eB_40, eB_42, eB_44,
  eB_46, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_80, eB_81, eB_82, eB_83, eB_84, eB_85, eB_86,
  eB_87, eB_96, eB_97, eB_98, eB_99, eB_100, eB_104, eB_105, eB_107, eB_109, eB_111, eB_112, eB_114, eB_116, eB_117, eB_118,
  eB_120, eB_122, eB_123, eB_124, eB_126, eB_127, eB_129, eB_130, eB_131, eB_132, eB_133, eB_134, eB_135, eB_136, eB_137, eB_138,
  eB_139, eB_141, eB_142, eB_144, eB_145, eB_147, eB_148, eB_149, eB_150, eB_152, eB_154, eB_155, eB_156, eB_158, eB_168, eB_169,
  eB_170, eB_171, eB_172, eB_173, eB_174, eB_175, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_209, eB_210,
  eB_211, eB_214, eB_215, eB_217, eB_218, eB_220, eB_221, eB_222, eB_223, eB_224, eB_226, eB_227, eB_228, eB_229, eB_231, eB_234,
  eB_235, eB_236, eB_238, eB_239, eB_241, eB_242, eB_243, eB_245, eB_246, eB_247, eB_249, eB_250, eB_251, eB_252, eB_254, eB_255,
  eB_256, eB_257, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263, eB_264, eB_265, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271,
  eB_272, eB_273, eB_274, eB_275, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295,
  eB_296, eB_297, eB_298, eB_299, eB_308, eB_309, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_324, eB_325, eB_326, eB_327,
  eB_328, eB_329, eB_330, eB_331, eB_340, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_365, eB_366, eB_367,
  eB_368, eB_369, eB_370, eB_371, eB_372, eB_381, eB_382, eB_383, eB_384, eB_385, eB_386, eB_388, eB_390, eB_391, eB_393, eB_394,
  eB_395, eB_396, eB_398, eB_399, eB_401, eB_402, eB_405, eB_407, eB_409, eB_411, eB_413, eB_415, eB_417, eB_419, eB_421, eB_424,
  eB_426, eB_436, eB_439, eB_441, eB_443, eB_444, eB_446, eB_447, eB_450, eB_452, eB_454, eB_457, eB_458, eB_459, eB_461, eB_470,
  eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_504,
  eB_505, eB_506, eB_507, eB_508, eB_509, eB_510, eB_511, eB_520, eB_521, eB_522, eB_523, eB_524, eB_525, eB_526, eB_527, eB_537,
  eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_553, eB_554, eB_555, eB_556, eB_557, eB_558, eB_559, eB_560, eB_569,
  eB_570, eB_571, eB_572, eB_573, eB_574, eB_575, eB_576, eB_593, eB_594, eB_595, eB_596, eB_597, eB_598, eB_599, eB_600, eB_609,
  eB_611, eB_612, eB_614, eB_615, eB_617, eB_618, eB_620, eB_621, eB_623, eB_626, eB_628, eB_645, eB_646, eB_647, eB_648, eB_649,
  eB_650, eB_651, eB_652, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_677, eB_678, eB_679, eB_680, eB_681,
  eB_682, eB_683, eB_684, eB_701, eB_702, eB_703, eB_704, eB_705, eB_706, eB_707, eB_708, eB_709, eB_710, eB_711, eB_712, eB_713,
  eB_714, eB_715, eB_716, eB_725, eB_726, eB_727, eB_728, eB_729, eB_730, eB_731, eB_732, eB_741, eB_742, eB_743, eB_744, eB_745,
  eB_746, eB_747, eB_748, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_766, eB_767, eB_770, eB_771,
  eB_776, eB_777, eB_778, eB_779, eB_782, eB_783, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797,
  eB_798, eB_799, eB_800, eB_801, eB_807, eB_808, eB_809, eB_810, eB_811, eB_828, eB_829, eB_830, eB_831, eB_832, eB_833, eB_834,
  eB_835, eB_836, eB_837, eB_838, eB_839, eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_858, eB_859, eB_860, eB_861, eB_862,
  eB_863, eB_864, eB_865, eB_866, eB_867, eB_868, eB_869, eB_870, eB_871, eB_872, eB_873, eB_874, eB_875, eB_882, eB_883, eB_884,
  eB_885, eB_886, eB_887, eB_888, eB_890, eB_891, eB_894, eB_895, eB_896, eB_898, eB_900, eB_902, eB_905, eB_906, eB_907, eB_908,
  eB_909, eB_912, eB_913, eB_914, eB_917, eB_922, eB_924, eB_925, eB_927, eB_929, eB_930, eB_935, eB_943, eB_944, eB_945, eB_946,
  eB_948, eB_949, eB_950, eB_952, eB_956, eB_957, eB_960, eB_964, eB_966, eB_968, eB_969, eB_971, eB_972, eB_974, eB_978, eB_979,
  eB_980, eB_983, eB_985, eB_986, eB_989, eB_995, eB_996, eB_997, eB_998, eB_1001, eB_1002, eB_1003, eB_1006, eB_1012, eB_1013, eB_1014,
  eB_1020, eB_1021]
theorem nbOKB_454 : nbB_454 = nbhd entsB eB_454 := by decide +kernel
theorem mkOKB_454 : mkEnt 32 1024 W rB_454 454 = eB_454 := by decide +kernel
theorem tB_454 : kTermA 4294967295 eB_454 nbB_454 = 98889037990594365266600400 := by decide +kernel


end RamseyCert
