import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_585 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_13, eB_14, eB_18, eB_19, eB_27, eB_28, eB_30, eB_31, eB_33, eB_34, eB_36, eB_37,
  eB_39, eB_40, eB_42, eB_43, eB_45, eB_46, eB_48, eB_49, eB_50, eB_51, eB_57, eB_60, eB_61, eB_62, eB_63, eB_67,
  eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75, eB_80, eB_81, eB_82, eB_83, eB_88, eB_89, eB_90, eB_91,
  eB_96, eB_98, eB_101, eB_104, eB_106, eB_109, eB_112, eB_115, eB_118, eB_121, eB_124, eB_127, eB_130, eB_133, eB_134, eB_135,
  eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_148, eB_149, eB_151, eB_152, eB_154, eB_155, eB_157, eB_158, eB_160, eB_161,
  eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_184, eB_185, eB_186, eB_187, eB_192, eB_193,
  eB_194, eB_195, eB_200, eB_201, eB_202, eB_203, eB_209, eB_212, eB_214, eB_215, eB_218, eB_221, eB_224, eB_227, eB_230, eB_233,
  eB_236, eB_239, eB_242, eB_245, eB_246, eB_247, eB_248, eB_250, eB_256, eB_258, eB_259, eB_260, eB_261, eB_262, eB_263, eB_272,
  eB_273, eB_274, eB_275, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_289, eB_291, eB_296, eB_297, eB_298,
  eB_299, eB_304, eB_305, eB_306, eB_307, eB_308, eB_309, eB_310, eB_311, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330,
  eB_331, eB_332, eB_333, eB_334, eB_335, eB_340, eB_341, eB_342, eB_343, eB_344, eB_349, eB_350, eB_351, eB_352, eB_361, eB_362,
  eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_391, eB_392, eB_394, eB_395,
  eB_399, eB_400, eB_403, eB_405, eB_408, eB_411, eB_414, eB_417, eB_420, eB_427, eB_428, eB_429, eB_430, eB_434, eB_435, eB_438,
  eB_441, eB_442, eB_444, eB_445, eB_448, eB_450, eB_453, eB_456, eB_459, eB_460, eB_466, eB_467, eB_468, eB_469, eB_474, eB_475,
  eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_485, eB_486, eB_487, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501, eB_502,
  eB_503, eB_504, eB_505, eB_506, eB_507, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527, eB_528, eB_529,
  eB_530, eB_531, eB_536, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_561,
  eB_562, eB_563, eB_564, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587, eB_588, eB_597,
  eB_598, eB_599, eB_600, eB_605, eB_606, eB_607, eB_608, eB_609, eB_612, eB_615, eB_618, eB_621, eB_622, eB_623, eB_624, eB_625,
  eB_626, eB_627, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_641, eB_645, eB_646, eB_647, eB_648,
  eB_657, eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682, eB_683, eB_684,
  eB_685, eB_686, eB_687, eB_688, eB_690, eB_693, eB_694, eB_695, eB_696, eB_701, eB_702, eB_703, eB_704, eB_713, eB_714, eB_715,
  eB_716, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_732, eB_737, eB_738, eB_739, eB_740, eB_745, eB_746,
  eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_755, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_770, eB_771, eB_772,
  eB_773, eB_774, eB_775, eB_776, eB_777, eB_780, eB_781, eB_782, eB_783, eB_788, eB_789, eB_794, eB_795, eB_798, eB_799, eB_806,
  eB_807, eB_808, eB_809, eB_812, eB_813, eB_816, eB_817, eB_820, eB_821, eB_824, eB_825, eB_830, eB_831, eB_832, eB_833, eB_840,
  eB_841, eB_846, eB_847, eB_850, eB_851, eB_852, eB_853, eB_860, eB_861, eB_862, eB_863, eB_866, eB_867, eB_868, eB_869, eB_872,
  eB_873, eB_874, eB_875, eB_876, eB_877, eB_882, eB_883, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_897,
  eB_899, eB_903, eB_905, eB_906, eB_907, eB_918, eB_922, eB_924, eB_925, eB_926, eB_927, eB_928, eB_934, eB_936, eB_938, eB_939,
  eB_940, eB_941, eB_942, eB_945, eB_946, eB_947, eB_948, eB_951, eB_954, eB_957, eB_958, eB_962, eB_963, eB_967, eB_970, eB_971,
  eB_972, eB_974, eB_979, eB_980, eB_981, eB_982, eB_985, eB_986, eB_987, eB_989, eB_993, eB_994, eB_995, eB_998, eB_999, eB_1000,
  eB_1001, eB_1002, eB_1003, eB_1005, eB_1006, eB_1007, eB_1008, eB_1009, eB_1010, eB_1011, eB_1014, eB_1018, eB_1022]
theorem nbOKB_585 : nbB_585 = nbhd entsB eB_585 := by decide +kernel
theorem mkOKB_585 : mkEnt 32 1024 W rB_585 585 = eB_585 := by decide +kernel
theorem tB_585 : kTermA 4294967295 eB_585 nbB_585 = 92881319479915752463964946 := by decide +kernel


end RamseyCert
