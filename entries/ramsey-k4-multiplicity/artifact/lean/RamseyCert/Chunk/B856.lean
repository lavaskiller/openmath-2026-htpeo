import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_856 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_14, eB_17, eB_20, eB_22, eB_24, eB_26, eB_27, eB_28, eB_32, eB_35,
  eB_38, eB_41, eB_42, eB_43, eB_47, eB_48, eB_49, eB_50, eB_51, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69,
  eB_70, eB_71, eB_76, eB_77, eB_78, eB_79, eB_80, eB_81, eB_82, eB_83, eB_87, eB_92, eB_93, eB_94, eB_95, eB_98,
  eB_100, eB_102, eB_104, eB_107, eB_108, eB_109, eB_112, eB_116, eB_117, eB_118, eB_122, eB_123, eB_124, eB_127, eB_130, eB_136,
  eB_137, eB_138, eB_139, eB_140, eB_142, eB_143, eB_145, eB_146, eB_148, eB_149, eB_153, eB_154, eB_155, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_172, eB_173, eB_174, eB_175, eB_180, eB_181, eB_182, eB_183, eB_188, eB_189, eB_190, eB_191, eB_192, eB_193,
  eB_194, eB_195, eB_196, eB_204, eB_205, eB_206, eB_207, eB_209, eB_211, eB_213, eB_215, eB_218, eB_221, eB_224, eB_227, eB_231,
  eB_232, eB_234, eB_235, eB_236, eB_239, eB_243, eB_244, eB_249, eB_252, eB_253, eB_257, eB_259, eB_260, eB_261, eB_262, eB_263,
  eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_288, eB_289, eB_290, eB_291, eB_292, eB_293, eB_294, eB_295,
  eB_300, eB_301, eB_302, eB_303, eB_310, eB_311, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329,
  eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_340, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_387, eB_389, eB_393,
  eB_396, eB_397, eB_401, eB_403, eB_406, eB_407, eB_408, eB_412, eB_413, eB_414, eB_418, eB_419, eB_420, eB_423, eB_425, eB_427,
  eB_428, eB_429, eB_430, eB_435, eB_438, eB_443, eB_446, eB_448, eB_451, eB_452, eB_453, eB_457, eB_461, eB_462, eB_463, eB_464,
  eB_465, eB_470, eB_471, eB_472, eB_473, eB_482, eB_483, eB_484, eB_485, eB_490, eB_492, eB_493, eB_494, eB_495, eB_500, eB_501,
  eB_502, eB_503, eB_504, eB_505, eB_506, eB_507, eB_512, eB_513, eB_514, eB_515, eB_520, eB_521, eB_522, eB_523, eB_531, eB_532,
  eB_533, eB_534, eB_535, eB_537, eB_538, eB_539, eB_540, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559, eB_560, eB_565,
  eB_566, eB_567, eB_568, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_589, eB_590, eB_591, eB_592, eB_593,
  eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_610, eB_611, eB_613, eB_614, eB_616, eB_617, eB_619, eB_620, eB_621,
  eB_623, eB_626, eB_628, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_645, eB_646, eB_647, eB_648, eB_657,
  eB_658, eB_659, eB_660, eB_665, eB_666, eB_667, eB_668, eB_669, eB_670, eB_671, eB_672, eB_677, eB_678, eB_679, eB_680, eB_685,
  eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_705, eB_706, eB_707, eB_708, eB_709, eB_713, eB_714, eB_715,
  eB_716, eB_720, eB_721, eB_722, eB_723, eB_724, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736, eB_741, eB_742,
  eB_743, eB_744, eB_753, eB_754, eB_755, eB_756, eB_761, eB_762, eB_763, eB_764, eB_770, eB_771, eB_772, eB_773, eB_776, eB_777,
  eB_778, eB_779, eB_780, eB_781, eB_782, eB_783, eB_784, eB_785, eB_788, eB_789, eB_790, eB_791, eB_796, eB_797, eB_798, eB_799,
  eB_800, eB_801, eB_802, eB_808, eB_809, eB_812, eB_813, eB_814, eB_815, eB_820, eB_821, eB_824, eB_825, eB_830, eB_831, eB_832,
  eB_833, eB_836, eB_837, eB_838, eB_839, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_850, eB_851, eB_856, eB_857, eB_860,
  eB_861, eB_862, eB_863, eB_876, eB_877, eB_880, eB_881, eB_886, eB_887, eB_888, eB_889, eB_890, eB_891, eB_892, eB_894, eB_895,
  eB_897, eB_898, eB_899, eB_900, eB_901, eB_904, eB_905, eB_906, eB_909, eB_910, eB_911, eB_913, eB_914, eB_915, eB_916, eB_917,
  eB_918, eB_919, eB_920, eB_922, eB_925, eB_929, eB_933, eB_940, eB_944, eB_945, eB_949, eB_955, eB_957, eB_960, eB_961, eB_963,
  eB_965, eB_967, eB_970, eB_975, eB_976, eB_977, eB_979, eB_980, eB_982, eB_983, eB_987, eB_991, eB_992, eB_993, eB_994, eB_996,
  eB_998, eB_1002, eB_1004, eB_1005, eB_1006, eB_1008, eB_1009, eB_1010, eB_1012, eB_1014, eB_1016, eB_1017, eB_1019, eB_1023]
theorem nbOKB_856 : nbB_856 = nbhd entsB eB_856 := by decide +kernel
theorem mkOKB_856 : mkEnt 32 1024 W rB_856 856 = eB_856 := by decide +kernel
theorem tB_856 : kTermA 4294967295 eB_856 nbB_856 = 50108279923873872023474528 := by decide +kernel


end RamseyCert
