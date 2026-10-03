import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_852 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_9, eR_10, eR_11, eR_12, eR_13, eR_14, eR_15, eR_16, eR_17, eR_18, eR_19, eR_20,
  eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_33, eR_34, eR_35, eR_36,
  eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47, eR_48, eR_49, eR_50, eR_56, eR_57,
  eR_58, eR_64, eR_65, eR_67, eR_72, eR_73, eR_74, eR_80, eR_81, eR_82, eR_83, eR_88, eR_89, eR_91, eR_96, eR_97,
  eR_98, eR_99, eR_100, eR_101, eR_102, eR_103, eR_104, eR_105, eR_106, eR_107, eR_108, eR_109, eR_110, eR_111, eR_112, eR_113,
  eR_114, eR_115, eR_116, eR_117, eR_118, eR_119, eR_120, eR_121, eR_122, eR_123, eR_124, eR_125, eR_126, eR_127, eR_128, eR_129,
  eR_130, eR_131, eR_132, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_139, eR_140, eR_141, eR_142, eR_143, eR_144, eR_145,
  eR_146, eR_147, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157, eR_158, eR_159, eR_161, eR_162,
  eR_163, eR_169, eR_170, eR_171, eR_176, eR_178, eR_179, eR_184, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_200, eR_201,
  eR_202, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222,
  eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_230, eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238,
  eR_239, eR_240, eR_241, eR_242, eR_243, eR_244, eR_245, eR_246, eR_247, eR_264, eR_265, eR_266, eR_267, eR_272, eR_273, eR_274,
  eR_275, eR_280, eR_281, eR_282, eR_283, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306,
  eR_307, eR_312, eR_313, eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338,
  eR_339, eR_345, eR_346, eR_347, eR_348, eR_353, eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371,
  eR_372, eR_377, eR_378, eR_379, eR_380, eR_427, eR_428, eR_429, eR_430, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472,
  eR_473, eR_478, eR_479, eR_480, eR_481, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506,
  eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_541, eR_542, eR_543,
  eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568, eR_573, eR_574, eR_575,
  eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607,
  eR_608, eR_633, eR_634, eR_635, eR_636, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_651, eR_652, eR_657, eR_658, eR_659,
  eR_660, eR_665, eR_666, eR_667, eR_668, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719,
  eR_720, eR_725, eR_726, eR_727, eR_728, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_749, eR_750, eR_751,
  eR_752, eR_761, eR_762, eR_763, eR_764, eR_772, eR_773, eR_776, eR_777, eR_784, eR_785, eR_795, eR_796, eR_797, eR_798, eR_799,
  eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_810, eR_811, eR_814, eR_815, eR_816, eR_817, eR_818, eR_819,
  eR_820, eR_821, eR_822, eR_823, eR_824, eR_825, eR_832, eR_833, eR_834, eR_835, eR_840, eR_841, eR_846, eR_847, eR_854, eR_855,
  eR_856, eR_857, eR_858, eR_859, eR_860, eR_861, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_874, eR_875, eR_876, eR_877,
  eR_878, eR_879, eR_880, eR_881, eR_888, eR_889, eR_892, eR_893, eR_894, eR_895, eR_896, eR_897, eR_898, eR_900, eR_902, eR_905,
  eR_912, eR_913, eR_917, eR_921, eR_922, eR_926, eR_928, eR_929, eR_931, eR_932, eR_935, eR_937, eR_941, eR_942, eR_944, eR_945,
  eR_946, eR_949, eR_952, eR_954, eR_957, eR_958, eR_960, eR_962, eR_965, eR_969, eR_970, eR_971, eR_973, eR_974, eR_976, eR_980,
  eR_982, eR_983, eR_985, eR_986, eR_988, eR_991, eR_992, eR_994, eR_995, eR_998, eR_1000, eR_1009, eR_1010, eR_1011, eR_1013, eR_1014,
  eR_1015, eR_1016, eR_1018, eR_1019, eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_852 : nbR_852 = nbhd entsR eR_852 := by decide +kernel
theorem mkOKR_852 : mkEnt 32 1024 W rR_852 852 = eR_852 := by decide +kernel
theorem tR_852 : kTermA 4294967295 eR_852 nbR_852 = 48965923381388157221724696 := by decide +kernel


end RamseyCert
