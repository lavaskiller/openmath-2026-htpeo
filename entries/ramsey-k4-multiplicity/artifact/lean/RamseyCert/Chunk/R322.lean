import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_322 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_12, eR_14, eR_15, eR_16, eR_18, eR_21, eR_23, eR_25, eR_27, eR_31, eR_32, eR_33,
  eR_36, eR_39, eR_42, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_64, eR_66, eR_67,
  eR_72, eR_74, eR_75, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_96, eR_99, eR_100, eR_101, eR_103,
  eR_104, eR_106, eR_107, eR_111, eR_114, eR_115, eR_116, eR_120, eR_121, eR_122, eR_124, eR_125, eR_127, eR_128, eR_130, eR_131,
  eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_140, eR_141, eR_143, eR_144, eR_146, eR_147, eR_148, eR_152, eR_153, eR_154,
  eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_177, eR_178, eR_179, eR_184, eR_186, eR_187,
  eR_196, eR_197, eR_198, eR_199, eR_204, eR_205, eR_206, eR_207, eR_210, eR_211, eR_212, eR_214, eR_215, eR_216, eR_218, eR_219,
  eR_221, eR_222, eR_224, eR_225, eR_229, eR_230, eR_231, eR_233, eR_234, eR_238, eR_241, eR_242, eR_243, eR_245, eR_246, eR_247,
  eR_248, eR_249, eR_252, eR_253, eR_255, eR_256, eR_257, eR_259, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_271,
  eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303,
  eR_308, eR_309, eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339,
  eR_340, eR_345, eR_346, eR_347, eR_348, eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367,
  eR_368, eR_373, eR_374, eR_375, eR_376, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_392, eR_393, eR_395,
  eR_396, eR_397, eR_400, eR_401, eR_404, eR_407, eR_408, eR_409, eR_413, eR_414, eR_415, eR_419, eR_420, eR_421, eR_423, eR_425,
  eR_427, eR_428, eR_429, eR_430, eR_437, eR_440, eR_442, eR_443, eR_445, eR_446, eR_449, eR_452, eR_453, eR_454, eR_457, eR_460,
  eR_461, eR_466, eR_468, eR_469, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_492, eR_495, eR_496, eR_497,
  eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_524, eR_525, eR_526, eR_532, eR_534, eR_535,
  eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570,
  eR_571, eR_572, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_601, eR_602,
  eR_603, eR_604, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_622, eR_624, eR_625, eR_627, eR_633, eR_634,
  eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_665, eR_666,
  eR_667, eR_668, eR_673, eR_674, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687, eR_688, eR_693, eR_694, eR_695,
  eR_696, eR_705, eR_706, eR_707, eR_708, eR_714, eR_715, eR_716, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727, eR_728,
  eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_748, eR_753, eR_754, eR_755, eR_757, eR_758, eR_759, eR_760, eR_765, eR_766,
  eR_767, eR_776, eR_777, eR_778, eR_779, eR_782, eR_783, eR_784, eR_785, eR_788, eR_789, eR_790, eR_791, eR_798, eR_799, eR_800,
  eR_801, eR_802, eR_803, eR_806, eR_807, eR_808, eR_809, eR_814, eR_815, eR_818, eR_819, eR_820, eR_821, eR_822, eR_823, eR_824,
  eR_825, eR_826, eR_827, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_842,
  eR_843, eR_844, eR_845, eR_850, eR_851, eR_852, eR_853, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_878, eR_879, eR_884,
  eR_885, eR_890, eR_892, eR_893, eR_898, eR_899, eR_900, eR_901, eR_903, eR_904, eR_906, eR_907, eR_908, eR_909, eR_911, eR_913,
  eR_914, eR_915, eR_917, eR_918, eR_920, eR_921, eR_923, eR_926, eR_929, eR_932, eR_934, eR_935, eR_936, eR_939, eR_940, eR_941,
  eR_948, eR_950, eR_952, eR_954, eR_957, eR_962, eR_964, eR_967, eR_970, eR_971, eR_973, eR_974, eR_975, eR_976, eR_977, eR_980,
  eR_981, eR_982, eR_983, eR_984, eR_985, eR_986, eR_988, eR_990, eR_992, eR_995, eR_997, eR_998, eR_1001, eR_1002, eR_1003, eR_1007,
  eR_1010, eR_1013, eR_1014, eR_1018, eR_1022, eR_1023]
theorem nbOKR_322 : nbR_322 = nbhd entsR eR_322 := by decide +kernel
theorem mkOKR_322 : mkEnt 32 1024 W rR_322 322 = eR_322 := by decide +kernel
theorem tR_322 : kTermA 4294967295 eR_322 nbR_322 = 115696467188526836379422862 := by decide +kernel


end RamseyCert
