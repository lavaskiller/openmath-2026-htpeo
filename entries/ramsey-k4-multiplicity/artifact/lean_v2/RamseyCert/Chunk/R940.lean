import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_940 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_4, eR_5, eR_6, eR_7, eR_12, eR_13, eR_14, eR_16, eR_18, eR_19, eR_21, eR_23,
  eR_25, eR_27, eR_28, eR_32, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_96, eR_97, eR_99, eR_101, eR_103, eR_105, eR_106, eR_110, eR_111, eR_113, eR_114,
  eR_115, eR_119, eR_120, eR_121, eR_125, eR_126, eR_128, eR_129, eR_131, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138,
  eR_139, eR_140, eR_142, eR_143, eR_145, eR_146, eR_148, eR_149, eR_153, eR_154, eR_155, eR_159, eR_164, eR_165, eR_166, eR_167,
  eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186, eR_187, eR_196, eR_197, eR_198, eR_199,
  eR_200, eR_201, eR_202, eR_203, eR_209, eR_211, eR_213, eR_215, eR_218, eR_221, eR_224, eR_227, eR_231, eR_232, eR_234, eR_235,
  eR_236, eR_239, eR_243, eR_244, eR_249, eR_252, eR_254, eR_256, eR_258, eR_259, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269,
  eR_270, eR_271, eR_276, eR_277, eR_278, eR_279, eR_288, eR_290, eR_291, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302,
  eR_303, eR_312, eR_313, eR_315, eR_320, eR_322, eR_323, eR_328, eR_330, eR_331, eR_332, eR_333, eR_334, eR_335, eR_340, eR_341,
  eR_342, eR_343, eR_344, eR_353, eR_355, eR_356, eR_357, eR_358, eR_359, eR_360, eR_365, eR_366, eR_367, eR_368, eR_378, eR_379,
  eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_389, eR_393, eR_396, eR_397, eR_401, eR_402, eR_404, eR_405,
  eR_409, eR_410, eR_411, eR_415, eR_416, eR_417, eR_421, eR_422, eR_424, eR_426, eR_431, eR_432, eR_433, eR_434, eR_436, eR_437,
  eR_439, eR_440, eR_441, eR_442, eR_444, eR_445, eR_447, eR_449, eR_450, eR_454, eR_455, eR_456, eR_458, eR_459, eR_460, eR_466,
  eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490,
  eR_491, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526,
  eR_527, eR_528, eR_529, eR_530, eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554,
  eR_555, eR_556, eR_562, eR_563, eR_564, eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_586, eR_587, eR_588,
  eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620,
  eR_621, eR_623, eR_626, eR_628, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_645, eR_646, eR_657, eR_658,
  eR_659, eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690,
  eR_691, eR_692, eR_693, eR_694, eR_696, eR_705, eR_706, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723,
  eR_724, eR_725, eR_726, eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_756, eR_761,
  eR_762, eR_763, eR_764, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_776, eR_777, eR_780, eR_781, eR_786,
  eR_787, eR_790, eR_791, eR_792, eR_793, eR_794, eR_795, eR_796, eR_797, eR_802, eR_803, eR_805, eR_806, eR_807, eR_808, eR_809,
  eR_810, eR_811, eR_820, eR_821, eR_822, eR_823, eR_826, eR_827, eR_828, eR_829, eR_832, eR_833, eR_836, eR_837, eR_838, eR_839,
  eR_842, eR_848, eR_850, eR_851, eR_860, eR_861, eR_864, eR_865, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_877, eR_888,
  eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_896, eR_898, eR_899, eR_900, eR_902, eR_903, eR_904, eR_906, eR_911,
  eR_913, eR_919, eR_920, eR_922, eR_924, eR_925, eR_929, eR_930, eR_931, eR_932, eR_933, eR_934, eR_937, eR_941, eR_942, eR_946,
  eR_947, eR_948, eR_949, eR_951, eR_952, eR_953, eR_954, eR_957, eR_958, eR_959, eR_961, eR_962, eR_964, eR_965, eR_973, eR_975,
  eR_976, eR_977, eR_978, eR_980, eR_981, eR_982, eR_983, eR_985, eR_989, eR_992, eR_993, eR_995, eR_997, eR_998, eR_1005, eR_1006,
  eR_1009, eR_1011, eR_1012, eR_1019, eR_1022]
theorem nbOKR_940 : nbR_940 = nbhd entsR eR_940 := by decide +kernel
theorem mkOKR_940 : mkEnt 32 1024 W rR_940 940 = eR_940 := by decide +kernel
theorem tR_940 : kTermA 4294967295 eR_940 nbR_940 = 81705801730317838684044336 := by decide +kernel


end RamseyCert
