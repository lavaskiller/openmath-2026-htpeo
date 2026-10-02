import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_96 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_15, eR_16, eR_17, eR_21, eR_22,
  eR_23, eR_24, eR_25, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82, eR_83, eR_84,
  eR_85, eR_86, eR_87, eR_97, eR_98, eR_99, eR_100, eR_101, eR_102, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112,
  eR_113, eR_114, eR_115, eR_116, eR_117, eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_136, eR_137, eR_138, eR_139, eR_141,
  eR_144, eR_145, eR_146, eR_160, eR_161, eR_162, eR_163, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_170, eR_171, eR_172,
  eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_200, eR_201, eR_202, eR_203, eR_204,
  eR_205, eR_206, eR_207, eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226,
  eR_246, eR_251, eR_252, eR_256, eR_257, eR_258, eR_292, eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301,
  eR_302, eR_303, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_316, eR_317,
  eR_318, eR_319, eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333,
  eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_357, eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366,
  eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382,
  eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_397, eR_398, eR_403, eR_404, eR_436, eR_437, eR_438, eR_439, eR_440, eR_441,
  eR_442, eR_443, eR_444, eR_445, eR_446, eR_447, eR_448, eR_449, eR_456, eR_459, eR_460, eR_461, eR_487, eR_488, eR_489, eR_490,
  eR_491, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502, eR_503, eR_504, eR_505, eR_506,
  eR_507, eR_508, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522,
  eR_523, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530, eR_531, eR_532, eR_533, eR_534, eR_535, eR_536, eR_537, eR_538,
  eR_539, eR_540, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554,
  eR_555, eR_556, eR_557, eR_558, eR_559, eR_560, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_569, eR_570,
  eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582, eR_583, eR_584, eR_621, eR_622,
  eR_623, eR_625, eR_627, eR_628, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648,
  eR_649, eR_650, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_657, eR_658, eR_659, eR_660, eR_661, eR_662, eR_663, eR_664,
  eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680,
  eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_772, eR_773, eR_778, eR_779, eR_782, eR_783, eR_786, eR_787, eR_792, eR_793, eR_794, eR_795,
  eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_812, eR_813, eR_814, eR_815,
  eR_818, eR_819, eR_820, eR_821, eR_830, eR_831, eR_840, eR_841, eR_848, eR_849, eR_852, eR_853, eR_856, eR_857, eR_862, eR_863,
  eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_877, eR_878, eR_879, eR_880, eR_881,
  eR_882, eR_883, eR_894, eR_895, eR_901, eR_902, eR_903, eR_904, eR_905, eR_908, eR_912, eR_914, eR_916, eR_919, eR_920, eR_922,
  eR_923, eR_931, eR_936, eR_939, eR_940, eR_943, eR_944, eR_945, eR_947, eR_948, eR_949, eR_950, eR_951, eR_952, eR_954, eR_957,
  eR_958, eR_960, eR_961, eR_962, eR_963, eR_965, eR_966, eR_967, eR_968, eR_970, eR_975, eR_978, eR_979, eR_980, eR_981, eR_982,
  eR_983, eR_987, eR_990, eR_994, eR_997, eR_998, eR_999, eR_1000, eR_1002, eR_1005, eR_1006, eR_1007, eR_1010, eR_1011, eR_1012, eR_1013,
  eR_1017, eR_1018, eR_1021]
theorem nbOKR_96 : nbR_96 = nbhd entsR eR_96 := by decide +kernel
theorem mkOKR_96 : mkEnt 32 1024 W rR_96 96 = eR_96 := by decide +kernel
theorem tR_96 : kTermA 4294967295 eR_96 nbR_96 = 123760474215101463357607500 := by decide +kernel


end RamseyCert
