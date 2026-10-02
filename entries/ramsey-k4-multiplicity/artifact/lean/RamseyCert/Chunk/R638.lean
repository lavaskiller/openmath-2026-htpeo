import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_638 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_18, eR_19, eR_20, eR_27, eR_28, eR_29, eR_30, eR_31,
  eR_32, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47,
  eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75,
  eR_80, eR_81, eR_82, eR_83, eR_92, eR_93, eR_94, eR_95, eR_96, eR_103, eR_104, eR_105, eR_124, eR_125, eR_126, eR_127,
  eR_128, eR_129, eR_130, eR_131, eR_132, eR_133, eR_134, eR_135, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155,
  eR_156, eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179,
  eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_210, eR_211,
  eR_212, eR_213, eR_227, eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240,
  eR_241, eR_242, eR_243, eR_244, eR_248, eR_249, eR_250, eR_253, eR_254, eR_255, eR_259, eR_260, eR_261, eR_262, eR_268, eR_270,
  eR_271, eR_276, eR_277, eR_279, eR_284, eR_285, eR_286, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312,
  eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_340,
  eR_342, eR_343, eR_344, eR_349, eR_350, eR_351, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378,
  eR_379, eR_380, eR_385, eR_386, eR_391, eR_392, eR_393, eR_394, eR_395, eR_396, eR_399, eR_400, eR_401, eR_405, eR_406, eR_407,
  eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_423,
  eR_424, eR_425, eR_426, eR_429, eR_430, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_457, eR_458, eR_462, eR_463, eR_464,
  eR_465, eR_470, eR_471, eR_472, eR_473, eR_478, eR_479, eR_480, eR_481, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502,
  eR_503, eR_508, eR_509, eR_510, eR_511, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_532, eR_533, eR_534,
  eR_535, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_561, eR_562, eR_563,
  eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_590, eR_591, eR_592, eR_598, eR_599, eR_600, eR_605,
  eR_607, eR_608, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616, eR_617, eR_618, eR_619, eR_620, eR_633, eR_634,
  eR_636, eR_641, eR_642, eR_643, eR_644, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662, eR_663,
  eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690, eR_691, eR_692, eR_698, eR_699, eR_700,
  eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719, eR_720, eR_725, eR_726, eR_727, eR_728, eR_733,
  eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751, eR_752, eR_757, eR_758, eR_759, eR_760, eR_765,
  eR_766, eR_767, eR_770, eR_771, eR_774, eR_775, eR_776, eR_777, eR_788, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797, eR_804,
  eR_805, eR_808, eR_809, eR_810, eR_811, eR_818, eR_819, eR_822, eR_823, eR_824, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833,
  eR_834, eR_835, eR_836, eR_837, eR_838, eR_839, eR_840, eR_841, eR_848, eR_849, eR_850, eR_851, eR_852, eR_853, eR_854, eR_855,
  eR_858, eR_859, eR_860, eR_861, eR_866, eR_867, eR_868, eR_869, eR_876, eR_877, eR_882, eR_883, eR_884, eR_885, eR_888, eR_889,
  eR_892, eR_893, eR_897, eR_898, eR_900, eR_905, eR_906, eR_907, eR_909, eR_911, eR_914, eR_915, eR_916, eR_917, eR_918, eR_923,
  eR_927, eR_928, eR_930, eR_933, eR_936, eR_937, eR_940, eR_942, eR_946, eR_947, eR_948, eR_949, eR_950, eR_953, eR_954, eR_955,
  eR_961, eR_963, eR_964, eR_966, eR_971, eR_973, eR_974, eR_976, eR_977, eR_978, eR_979, eR_984, eR_985, eR_988, eR_989, eR_991,
  eR_992, eR_993, eR_994, eR_995, eR_998, eR_999, eR_1000, eR_1003, eR_1004, eR_1006, eR_1007, eR_1011, eR_1014, eR_1015, eR_1016, eR_1017,
  eR_1018, eR_1019, eR_1020, eR_1022, eR_1023]
theorem nbOKR_638 : nbR_638 = nbhd entsR eR_638 := by decide +kernel
theorem mkOKR_638 : mkEnt 32 1024 W rR_638 638 = eR_638 := by decide +kernel
theorem tR_638 : kTermA 4294967295 eR_638 nbR_638 = 120054926248471554486104550 := by decide +kernel


end RamseyCert
