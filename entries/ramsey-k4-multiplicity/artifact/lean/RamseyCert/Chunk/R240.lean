import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_240 : List Ent := [
  eR_4, eR_5, eR_6, eR_7, eR_8, eR_9, eR_10, eR_11, eR_14, eR_17, eR_19, eR_22, eR_26, eR_28, eR_30, eR_32,
  eR_34, eR_37, eR_43, eR_45, eR_47, eR_48, eR_49, eR_50, eR_51, eR_52, eR_53, eR_54, eR_55, eR_64, eR_65, eR_66,
  eR_67, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_76, eR_77, eR_78, eR_79, eR_88, eR_89, eR_90,
  eR_91, eR_92, eR_93, eR_94, eR_95, eR_97, eR_101, eR_102, eR_103, eR_106, eR_108, eR_115, eR_117, eR_119, eR_121, eR_123,
  eR_125, eR_128, eR_131, eR_140, eR_143, eR_151, eR_153, eR_155, eR_159, eR_168, eR_169, eR_170, eR_171, eR_172, eR_173, eR_174,
  eR_175, eR_192, eR_193, eR_194, eR_195, eR_196, eR_197, eR_198, eR_199, eR_209, eR_210, eR_211, eR_214, eR_215, eR_217, eR_218,
  eR_220, eR_221, eR_223, eR_224, eR_226, eR_227, eR_229, eR_231, eR_234, eR_236, eR_238, eR_239, eR_241, eR_243, eR_245, eR_246,
  eR_247, eR_249, eR_250, eR_251, eR_253, eR_255, eR_256, eR_260, eR_261, eR_262, eR_263, eR_264, eR_265, eR_266, eR_267, eR_268,
  eR_269, eR_270, eR_271, eR_272, eR_273, eR_274, eR_275, eR_284, eR_285, eR_286, eR_287, eR_288, eR_289, eR_290, eR_291, eR_292,
  eR_293, eR_294, eR_295, eR_296, eR_297, eR_298, eR_299, eR_308, eR_309, eR_310, eR_311, eR_312, eR_313, eR_314, eR_315, eR_324,
  eR_325, eR_326, eR_327, eR_328, eR_329, eR_330, eR_331, eR_341, eR_342, eR_343, eR_344, eR_345, eR_346, eR_347, eR_348, eR_357,
  eR_358, eR_359, eR_360, eR_361, eR_362, eR_363, eR_364, eR_373, eR_374, eR_375, eR_376, eR_377, eR_378, eR_379, eR_380, eR_388,
  eR_390, eR_391, eR_393, eR_394, eR_396, eR_398, eR_399, eR_401, eR_405, eR_407, eR_413, eR_415, eR_417, eR_421, eR_423, eR_425,
  eR_436, eR_439, eR_442, eR_445, eR_447, eR_450, eR_452, eR_454, eR_457, eR_460, eR_470, eR_471, eR_472, eR_473, eR_474, eR_475,
  eR_476, eR_477, eR_488, eR_489, eR_490, eR_491, eR_492, eR_493, eR_494, eR_495, eR_504, eR_505, eR_506, eR_507, eR_508, eR_509,
  eR_510, eR_511, eR_520, eR_521, eR_522, eR_523, eR_524, eR_525, eR_526, eR_527, eR_545, eR_546, eR_547, eR_548, eR_549, eR_550,
  eR_551, eR_552, eR_561, eR_562, eR_563, eR_564, eR_565, eR_566, eR_567, eR_568, eR_577, eR_578, eR_579, eR_580, eR_581, eR_582,
  eR_583, eR_584, eR_585, eR_586, eR_587, eR_588, eR_589, eR_590, eR_591, eR_592, eR_601, eR_602, eR_603, eR_604, eR_605, eR_606,
  eR_607, eR_608, eR_610, eR_613, eR_619, eR_622, eR_624, eR_625, eR_627, eR_629, eR_630, eR_631, eR_632, eR_633, eR_634, eR_635,
  eR_636, eR_637, eR_638, eR_639, eR_640, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_649, eR_650, eR_651,
  eR_652, eR_661, eR_662, eR_663, eR_664, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_673, eR_674, eR_675,
  eR_676, eR_685, eR_686, eR_687, eR_688, eR_689, eR_690, eR_691, eR_692, eR_701, eR_702, eR_703, eR_704, eR_705, eR_706, eR_707,
  eR_708, eR_717, eR_718, eR_719, eR_720, eR_721, eR_722, eR_723, eR_724, eR_733, eR_734, eR_735, eR_736, eR_737, eR_738, eR_739,
  eR_740, eR_749, eR_750, eR_751, eR_752, eR_753, eR_754, eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_761, eR_762, eR_763,
  eR_764, eR_765, eR_766, eR_767, eR_768, eR_769, eR_770, eR_771, eR_774, eR_775, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785,
  eR_786, eR_787, eR_790, eR_791, eR_793, eR_794, eR_795, eR_798, eR_799, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_816,
  eR_817, eR_820, eR_821, eR_822, eR_823, eR_828, eR_829, eR_830, eR_831, eR_834, eR_835, eR_836, eR_837, eR_840, eR_841, eR_842,
  eR_843, eR_844, eR_845, eR_846, eR_847, eR_848, eR_849, eR_852, eR_853, eR_856, eR_857, eR_860, eR_861, eR_866, eR_867, eR_868,
  eR_869, eR_880, eR_881, eR_884, eR_885, eR_886, eR_887, eR_888, eR_889, eR_894, eR_895, eR_897, eR_898, eR_900, eR_902, eR_903,
  eR_911, eR_912, eR_915, eR_916, eR_917, eR_919, eR_921, eR_924, eR_927, eR_928, eR_929, eR_935, eR_936, eR_938, eR_942, eR_943,
  eR_944, eR_946, eR_948, eR_949, eR_957, eR_960, eR_961, eR_962, eR_964, eR_965, eR_966, eR_967, eR_968, eR_970, eR_972, eR_973,
  eR_977, eR_978, eR_980, eR_981, eR_982, eR_984, eR_986, eR_988, eR_989, eR_992, eR_993, eR_998, eR_999, eR_1002, eR_1007, eR_1008,
  eR_1009, eR_1010, eR_1012, eR_1017, eR_1018, eR_1021, eR_1023]
theorem nbOKR_240 : nbR_240 = nbhd entsR eR_240 := by decide +kernel
theorem mkOKR_240 : mkEnt 32 1024 W rR_240 240 = eR_240 := by decide +kernel
theorem tR_240 : kTermA 4294967295 eR_240 nbR_240 = 121936603409383571143114392 := by decide +kernel


end RamseyCert
