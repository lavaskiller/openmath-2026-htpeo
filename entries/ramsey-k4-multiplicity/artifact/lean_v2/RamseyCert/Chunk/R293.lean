import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_293 : List Ent := [
  eR_8, eR_9, eR_10, eR_11, eR_12, eR_14, eR_15, eR_17, eR_18, eR_22, eR_24, eR_26, eR_28, eR_29, eR_30, eR_33,
  eR_36, eR_39, eR_43, eR_44, eR_45, eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_71,
  eR_72, eR_73, eR_74, eR_75, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_96, eR_97, eR_98, eR_102, eR_103,
  eR_104, eR_108, eR_109, eR_110, eR_112, eR_113, eR_117, eR_118, eR_119, eR_123, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_149, eR_150, eR_151, eR_155,
  eR_156, eR_157, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_180, eR_181, eR_183, eR_184, eR_185, eR_186,
  eR_187, eR_196, eR_197, eR_198, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_213, eR_214, eR_215, eR_216, eR_218, eR_219,
  eR_221, eR_222, eR_224, eR_225, eR_227, eR_228, eR_232, eR_235, eR_236, eR_237, eR_239, eR_240, eR_244, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_251, eR_254, eR_255, eR_256, eR_257, eR_259, eR_260, eR_261, eR_262, eR_263, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339,
  eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371,
  eR_372, eR_377, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_392, eR_393, eR_395,
  eR_396, eR_398, eR_400, eR_401, eR_404, eR_405, eR_406, eR_410, eR_411, eR_412, eR_416, eR_417, eR_418, eR_422, eR_424, eR_426,
  eR_431, eR_432, eR_433, eR_434, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449, eR_450, eR_451, eR_455, eR_458, eR_460,
  eR_461, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_492, eR_493, eR_494, eR_495,
  eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_527, eR_532,
  eR_533, eR_534, eR_535, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_561,
  eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_581, eR_583, eR_585, eR_586, eR_587, eR_588, eR_593, eR_594, eR_595,
  eR_596, eR_605, eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_623, eR_626,
  eR_628, eR_629, eR_630, eR_631, eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_661, eR_662, eR_663, eR_664, eR_669, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692,
  eR_693, eR_694, eR_695, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_718, eR_719, eR_720, eR_725,
  eR_727, eR_728, eR_733, eR_734, eR_736, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_776, eR_777, eR_778, eR_779, eR_784, eR_785,
  eR_786, eR_787, eR_788, eR_789, eR_794, eR_795, eR_798, eR_799, eR_804, eR_805, eR_812, eR_813, eR_815, eR_816, eR_817, eR_818,
  eR_819, eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_830, eR_831, eR_836, eR_837, eR_842, eR_843, eR_846, eR_847, eR_860,
  eR_861, eR_862, eR_863, eR_866, eR_867, eR_870, eR_871, eR_878, eR_879, eR_880, eR_881, eR_882, eR_883, eR_884, eR_885, eR_888,
  eR_889, eR_890, eR_891, eR_894, eR_895, eR_899, eR_900, eR_905, eR_906, eR_907, eR_908, eR_910, eR_912, eR_913, eR_914, eR_916,
  eR_920, eR_924, eR_925, eR_927, eR_928, eR_930, eR_931, eR_933, eR_936, eR_940, eR_941, eR_942, eR_948, eR_950, eR_952, eR_953,
  eR_955, eR_959, eR_960, eR_961, eR_965, eR_966, eR_968, eR_969, eR_977, eR_980, eR_981, eR_985, eR_986, eR_988, eR_989, eR_990,
  eR_991, eR_992, eR_993, eR_994, eR_996, eR_998, eR_999, eR_1001, eR_1002, eR_1003, eR_1008, eR_1009, eR_1010, eR_1011, eR_1013, eR_1014,
  eR_1015, eR_1018, eR_1019, eR_1020, eR_1022]
theorem nbOKR_293 : nbR_293 = nbhd entsR eR_293 := by decide +kernel
theorem mkOKR_293 : mkEnt 32 1024 W rR_293 293 = eR_293 := by decide +kernel
theorem tR_293 : kTermA 4294967295 eR_293 nbR_293 = 122641851169772360130643386 := by decide +kernel


end RamseyCert
