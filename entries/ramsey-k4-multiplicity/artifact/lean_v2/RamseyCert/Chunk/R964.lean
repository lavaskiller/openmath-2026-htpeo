import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_964 : List Ent := [
  eR_4, eR_6, eR_7, eR_13, eR_14, eR_15, eR_16, eR_18, eR_19, eR_20, eR_21, eR_23, eR_25, eR_30, eR_31, eR_32,
  eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_51,
  eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_85, eR_86, eR_92, eR_93,
  eR_94, eR_95, eR_100, eR_101, eR_102, eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_115, eR_116, eR_117, eR_121, eR_122,
  eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129, eR_130, eR_131, eR_132, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144,
  eR_145, eR_146, eR_147, eR_151, eR_152, eR_153, eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174,
  eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201, eR_202,
  eR_203, eR_208, eR_209, eR_210, eR_214, eR_227, eR_228, eR_229, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_245, eR_246,
  eR_247, eR_252, eR_254, eR_255, eR_256, eR_257, eR_258, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275, eR_280, eR_281,
  eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_292, eR_294, eR_295, eR_301, eR_302, eR_303, eR_309, eR_310, eR_311, eR_320,
  eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_345, eR_346, eR_347, eR_348, eR_350,
  eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379, eR_380, eR_387, eR_389,
  eR_397, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_411, eR_412, eR_413, eR_417, eR_418, eR_419, eR_424, eR_426, eR_431,
  eR_432, eR_433, eR_434, eR_435, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447,
  eR_448, eR_449, eR_450, eR_451, eR_452, eR_458, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472,
  eR_473, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506,
  eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534, eR_535, eR_537, eR_538, eR_539,
  eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575,
  eR_576, eR_581, eR_582, eR_584, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595, eR_596, eR_601, eR_602, eR_603, eR_604,
  eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_621, eR_623, eR_626, eR_628,
  eR_633, eR_634, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_661,
  eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_697,
  eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729,
  eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_761,
  eR_762, eR_763, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783, eR_784,
  eR_785, eR_788, eR_789, eR_792, eR_793, eR_796, eR_797, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806,
  eR_807, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_834,
  eR_835, eR_838, eR_839, eR_840, eR_841, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_856, eR_860, eR_861, eR_872, eR_873,
  eR_875, eR_876, eR_877, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_886, eR_887, eR_890, eR_891, eR_892, eR_893, eR_894,
  eR_897, eR_902, eR_903, eR_904, eR_905, eR_907, eR_908, eR_909, eR_911, eR_917, eR_920, eR_921, eR_922, eR_923, eR_925, eR_926,
  eR_928, eR_929, eR_930, eR_932, eR_940, eR_946, eR_947, eR_948, eR_950, eR_955, eR_956, eR_959, eR_961, eR_962, eR_966, eR_969,
  eR_971, eR_972, eR_973, eR_975, eR_976, eR_977, eR_979, eR_981, eR_982, eR_986, eR_987, eR_989, eR_991, eR_992, eR_996, eR_998,
  eR_1002, eR_1004, eR_1007, eR_1009, eR_1011, eR_1012, eR_1013, eR_1014, eR_1015, eR_1016, eR_1018, eR_1022]
theorem nbOKR_964 : nbR_964 = nbhd entsR eR_964 := by decide +kernel
theorem mkOKR_964 : mkEnt 32 1024 W rR_964 964 = eR_964 := by decide +kernel
theorem tR_964 : kTermA 4294967295 eR_964 nbR_964 = 70545162357594749394130368 := by decide +kernel


end RamseyCert
