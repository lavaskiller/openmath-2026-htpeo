import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_305 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_15, eR_17, eR_19, eR_22, eR_24, eR_26, eR_27, eR_29, eR_31, eR_34,
  eR_37, eR_40, eR_42, eR_44, eR_46, eR_52, eR_53, eR_54, eR_55, eR_56, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71,
  eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_83, eR_92, eR_93, eR_94, eR_95, eR_96, eR_98, eR_99, eR_100, eR_104,
  eR_105, eR_107, eR_109, eR_111, eR_112, eR_114, eR_116, eR_118, eR_120, eR_122, eR_124, eR_126, eR_127, eR_129, eR_130, eR_132,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_141, eR_142, eR_144, eR_145, eR_147, eR_148, eR_150, eR_152, eR_154,
  eR_156, eR_158, eR_164, eR_165, eR_166, eR_167, eR_168, eR_169, eR_171, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190,
  eR_191, eR_192, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_209, eR_210, eR_211, eR_214, eR_215, eR_217, eR_218, eR_220,
  eR_221, eR_223, eR_224, eR_226, eR_227, eR_229, eR_231, eR_234, eR_236, eR_238, eR_239, eR_241, eR_243, eR_245, eR_246, eR_247,
  eR_249, eR_250, eR_251, eR_254, eR_255, eR_257, eR_258, eR_259, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274, eR_275,
  eR_276, eR_277, eR_278, eR_279, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_312, eR_313, eR_314, eR_315, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335,
  eR_340, eR_341, eR_342, eR_343, eR_344, eR_353, eR_354, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_369, eR_370, eR_371,
  eR_372, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_388, eR_390, eR_391, eR_393, eR_394,
  eR_396, eR_398, eR_399, eR_401, eR_402, eR_405, eR_407, eR_409, eR_411, eR_413, eR_415, eR_417, eR_419, eR_421, eR_424, eR_426,
  eR_427, eR_428, eR_429, eR_430, eR_436, eR_439, eR_441, eR_443, eR_444, eR_446, eR_447, eR_450, eR_452, eR_454, eR_458, eR_459,
  eR_461, eR_462, eR_463, eR_464, eR_465, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_492, eR_494, eR_495,
  eR_496, eR_497, eR_498, eR_499, eR_509, eR_510, eR_511, eR_512, eR_513, eR_514, eR_515, eR_524, eR_526, eR_527, eR_528, eR_529,
  eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566,
  eR_567, eR_568, eR_570, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_593, eR_594, eR_595, eR_596,
  eR_605, eR_606, eR_607, eR_608, eR_609, eR_611, eR_612, eR_614, eR_615, eR_617, eR_618, eR_620, eR_621, eR_623, eR_626, eR_628,
  eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_657, eR_658, eR_659, eR_660,
  eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687, eR_688,
  eR_697, eR_698, eR_699, eR_700, eR_701, eR_702, eR_703, eR_704, eR_713, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_730,
  eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759,
  eR_760, eR_765, eR_766, eR_767, eR_772, eR_773, eR_774, eR_775, eR_778, eR_779, eR_786, eR_787, eR_792, eR_793, eR_794, eR_795,
  eR_800, eR_801, eR_802, eR_803, eR_808, eR_809, eR_810, eR_811, eR_812, eR_813, eR_814, eR_815, eR_824, eR_825, eR_828, eR_829,
  eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_846, eR_847, eR_852, eR_853, eR_854, eR_855, eR_856,
  eR_857, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_872, eR_873, eR_882,
  eR_884, eR_885, eR_886, eR_890, eR_891, eR_892, eR_893, eR_896, eR_897, eR_898, eR_901, eR_903, eR_904, eR_905, eR_906, eR_907,
  eR_909, eR_911, eR_913, eR_914, eR_919, eR_920, eR_922, eR_925, eR_929, eR_930, eR_933, eR_935, eR_942, eR_946, eR_948, eR_949,
  eR_950, eR_956, eR_958, eR_960, eR_962, eR_965, eR_966, eR_967, eR_968, eR_969, eR_970, eR_971, eR_972, eR_973, eR_978, eR_979,
  eR_980, eR_982, eR_984, eR_985, eR_986, eR_988, eR_989, eR_990, eR_991, eR_992, eR_993, eR_996, eR_998, eR_1001, eR_1004, eR_1005,
  eR_1006, eR_1010, eR_1013, eR_1014, eR_1020, eR_1021, eR_1023]
theorem nbOKR_305 : nbR_305 = nbhd entsR eR_305 := by decide +kernel
theorem mkOKR_305 : mkEnt 32 1024 W rR_305 305 = eR_305 := by decide +kernel
theorem tR_305 : kTermA 4294967295 eR_305 nbR_305 = 75886012909948050836664918 := by decide +kernel


end RamseyCert
