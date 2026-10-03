import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_165 : List Ent := [
  eR_4, eR_5, eR_6, eR_12, eR_15, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_45, eR_46, eR_53, eR_54, eR_56,
  eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82, eR_83, eR_92,
  eR_93, eR_94, eR_95, eR_96, eR_97, eR_99, eR_100, eR_102, eR_104, eR_107, eR_108, eR_110, eR_111, eR_113, eR_114, eR_116,
  eR_117, eR_119, eR_120, eR_122, eR_123, eR_124, eR_127, eR_130, eR_133, eR_134, eR_135, eR_136, eR_137, eR_138, eR_141, eR_144,
  eR_147, eR_148, eR_149, eR_151, eR_152, eR_154, eR_155, eR_157, eR_158, eR_160, eR_161, eR_162, eR_163, eR_172, eR_173, eR_174,
  eR_175, eR_180, eR_181, eR_182, eR_183, eR_188, eR_189, eR_190, eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202,
  eR_203, eR_209, eR_212, eR_216, eR_217, eR_219, eR_220, eR_222, eR_223, eR_225, eR_226, eR_227, eR_230, eR_233, eR_236, eR_239,
  eR_242, eR_249, eR_253, eR_254, eR_255, eR_256, eR_258, eR_264, eR_265, eR_266, eR_267, eR_268, eR_269, eR_270, eR_276, eR_277,
  eR_278, eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_311,
  eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_345, eR_346, eR_347, eR_348, eR_353,
  eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_374, eR_375, eR_376, eR_393, eR_396,
  eR_401, eR_403, eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_423, eR_424,
  eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_438, eR_441, eR_442, eR_444, eR_445, eR_448, eR_451, eR_452, eR_454,
  eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_478, eR_479,
  eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_508, eR_509, eR_510, eR_511,
  eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_532, eR_533, eR_534, eR_535, eR_536, eR_541, eR_542, eR_544,
  eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_566, eR_568, eR_569, eR_570, eR_571, eR_572, eR_577,
  eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_600, eR_605, eR_606, eR_608, eR_610, eR_611, eR_613,
  eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626, eR_627, eR_628, eR_629, eR_630, eR_631,
  eR_632, eR_641, eR_642, eR_643, eR_644, eR_649, eR_651, eR_652, eR_653, eR_654, eR_655, eR_656, eR_661, eR_662, eR_663, eR_664,
  eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_689, eR_690, eR_691, eR_692, eR_693, eR_694, eR_695, eR_696,
  eR_701, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_725, eR_726, eR_727, eR_728,
  eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_749, eR_750, eR_751, eR_752, eR_761, eR_763, eR_764, eR_765,
  eR_766, eR_767, eR_768, eR_769, eR_776, eR_777, eR_780, eR_781, eR_782, eR_783, eR_784, eR_785, eR_790, eR_791, eR_800, eR_801,
  eR_802, eR_803, eR_812, eR_813, eR_814, eR_815, eR_824, eR_825, eR_828, eR_829, eR_832, eR_833, eR_836, eR_837, eR_838, eR_839,
  eR_840, eR_841, eR_848, eR_849, eR_856, eR_857, eR_860, eR_861, eR_864, eR_865, eR_866, eR_867, eR_872, eR_873, eR_876, eR_877,
  eR_878, eR_879, eR_880, eR_881, eR_884, eR_885, eR_888, eR_889, eR_890, eR_891, eR_892, eR_893, eR_894, eR_895, eR_896, eR_897,
  eR_899, eR_902, eR_903, eR_905, eR_909, eR_911, eR_912, eR_913, eR_914, eR_915, eR_921, eR_923, eR_924, eR_925, eR_928, eR_929,
  eR_930, eR_931, eR_932, eR_933, eR_934, eR_935, eR_938, eR_939, eR_940, eR_942, eR_944, eR_946, eR_950, eR_951, eR_952, eR_953,
  eR_955, eR_960, eR_961, eR_964, eR_965, eR_966, eR_967, eR_969, eR_971, eR_972, eR_974, eR_977, eR_978, eR_981, eR_983, eR_984,
  eR_985, eR_987, eR_994, eR_995, eR_998, eR_999, eR_1000, eR_1001, eR_1004, eR_1005, eR_1006, eR_1008, eR_1011, eR_1013, eR_1014, eR_1017,
  eR_1018, eR_1021, eR_1022]
theorem nbOKR_165 : nbR_165 = nbhd entsR eR_165 := by decide +kernel
theorem mkOKR_165 : mkEnt 32 1024 W rR_165 165 = eR_165 := by decide +kernel
theorem tR_165 : kTermA 4294967295 eR_165 nbR_165 = 122988554589112355349280440 := by decide +kernel


end RamseyCert
