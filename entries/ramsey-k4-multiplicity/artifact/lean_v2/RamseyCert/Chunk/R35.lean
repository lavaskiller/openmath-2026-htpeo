import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_35 : List Ent := [
  eR_13, eR_14, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_29, eR_32, eR_33, eR_34,
  eR_36, eR_37, eR_39, eR_40, eR_44, eR_47, eR_56, eR_57, eR_58, eR_59, eR_60, eR_61, eR_62, eR_63, eR_64, eR_65,
  eR_66, eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81,
  eR_82, eR_83, eR_84, eR_85, eR_86, eR_87, eR_98, eR_101, eR_103, eR_105, eR_106, eR_109, eR_112, eR_115, eR_121, eR_125,
  eR_126, eR_129, eR_131, eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_150, eR_153, eR_156, eR_159, eR_168, eR_169, eR_170,
  eR_171, eR_172, eR_173, eR_174, eR_175, eR_176, eR_177, eR_178, eR_179, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186,
  eR_187, eR_188, eR_189, eR_190, eR_191, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_209, eR_212, eR_216,
  eR_217, eR_220, eR_222, eR_223, eR_225, eR_227, eR_230, eR_233, eR_236, eR_239, eR_249, eR_255, eR_257, eR_259, eR_268, eR_269,
  eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_276, eR_277, eR_278, eR_279, eR_280, eR_281, eR_282, eR_283, eR_308, eR_309,
  eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_332, eR_333, eR_334, eR_335, eR_336, eR_337, eR_338, eR_339, eR_340, eR_341,
  eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_353, eR_354, eR_355, eR_356, eR_357,
  eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_369, eR_370, eR_371, eR_372, eR_381,
  eR_382, eR_384, eR_385, eR_386, eR_393, eR_396, eR_401, eR_403, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416,
  eR_418, eR_419, eR_421, eR_422, eR_427, eR_428, eR_429, eR_430, eR_431, eR_432, eR_433, eR_434, eR_435, eR_438, eR_443, eR_446,
  eR_448, eR_451, eR_452, eR_454, eR_455, eR_456, eR_461, eR_478, eR_479, eR_480, eR_481, eR_482, eR_483, eR_484, eR_485, eR_486,
  eR_487, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497, eR_498, eR_499, eR_500, eR_501, eR_502,
  eR_503, eR_512, eR_513, eR_514, eR_515, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526,
  eR_527, eR_536, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_557, eR_558,
  eR_559, eR_560, eR_569, eR_570, eR_571, eR_572, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582,
  eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_609, eR_612, eR_629, eR_630, eR_631, eR_632,
  eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648,
  eR_649, eR_650, eR_651, eR_652, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_709, eR_710, eR_711, eR_712,
  eR_713, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736,
  eR_737, eR_738, eR_739, eR_740, eR_741, eR_742, eR_743, eR_744, eR_745, eR_746, eR_747, eR_748, eR_757, eR_758, eR_759, eR_760,
  eR_761, eR_762, eR_763, eR_764, eR_765, eR_766, eR_768, eR_769, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_788, eR_789, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_802, eR_803, eR_806, eR_808, eR_809, eR_810,
  eR_812, eR_813, eR_814, eR_815, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_828, eR_829, eR_830, eR_831,
  eR_837, eR_840, eR_841, eR_846, eR_847, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_858, eR_859, eR_861, eR_862, eR_863,
  eR_870, eR_871, eR_874, eR_875, eR_878, eR_879, eR_884, eR_885, eR_886, eR_887, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895,
  eR_896, eR_902, eR_905, eR_906, eR_907, eR_908, eR_909, eR_910, eR_912, eR_914, eR_919, eR_921, eR_922, eR_926, eR_932, eR_933,
  eR_938, eR_941, eR_944, eR_945, eR_946, eR_947, eR_948, eR_949, eR_950, eR_951, eR_953, eR_954, eR_955, eR_959, eR_960, eR_961,
  eR_962, eR_963, eR_964, eR_969, eR_970, eR_973, eR_976, eR_982, eR_987, eR_988, eR_992, eR_993, eR_997, eR_999, eR_1001, eR_1002,
  eR_1004, eR_1005, eR_1006, eR_1008, eR_1010, eR_1017, eR_1018, eR_1020, eR_1022, eR_1023]
theorem nbOKR_35 : nbR_35 = nbhd entsR eR_35 := by decide +kernel
theorem mkOKR_35 : mkEnt 32 1024 W rR_35 35 = eR_35 := by decide +kernel
theorem tR_35 : kTermA 4294967295 eR_35 nbR_35 = 123025886921892528148683060 := by decide +kernel


end RamseyCert
