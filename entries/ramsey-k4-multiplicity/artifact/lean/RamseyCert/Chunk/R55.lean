import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_55 : List Ent := [
  eR_5, eR_6, eR_7, eR_12, eR_15, eR_16, eR_17, eR_18, eR_19, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_27,
  eR_28, eR_30, eR_31, eR_33, eR_34, eR_36, eR_37, eR_39, eR_40, eR_42, eR_43, eR_45, eR_46, eR_48, eR_49, eR_50,
  eR_51, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76, eR_77, eR_78, eR_79, eR_84, eR_85, eR_86,
  eR_87, eR_88, eR_89, eR_90, eR_91, eR_98, eR_101, eR_103, eR_105, eR_106, eR_109, eR_112, eR_115, eR_118, eR_121, eR_125,
  eR_126, eR_128, eR_129, eR_131, eR_132, eR_136, eR_137, eR_138, eR_141, eR_144, eR_147, eR_148, eR_149, eR_151, eR_152, eR_154,
  eR_155, eR_157, eR_158, eR_164, eR_166, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184, eR_185, eR_186,
  eR_187, eR_192, eR_193, eR_194, eR_195, eR_204, eR_205, eR_206, eR_207, eR_208, eR_210, eR_211, eR_213, eR_214, eR_215, eR_218,
  eR_221, eR_224, eR_228, eR_229, eR_231, eR_232, eR_234, eR_235, eR_237, eR_238, eR_240, eR_241, eR_243, eR_244, eR_245, eR_246,
  eR_247, eR_248, eR_250, eR_251, eR_252, eR_257, eR_264, eR_265, eR_266, eR_267, eR_268, eR_270, eR_271, eR_276, eR_277, eR_278,
  eR_288, eR_289, eR_290, eR_291, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_308, eR_309, eR_310, eR_311,
  eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_332, eR_333, eR_334, eR_345, eR_346, eR_347, eR_348, eR_353,
  eR_354, eR_355, eR_356, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_373, eR_374, eR_375, eR_376, eR_381,
  eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_391, eR_392, eR_394, eR_395, eR_397, eR_398, eR_399, eR_400, eR_403,
  eR_406, eR_407, eR_409, eR_410, eR_412, eR_413, eR_415, eR_416, eR_418, eR_419, eR_421, eR_422, eR_431, eR_432, eR_433, eR_434,
  eR_435, eR_438, eR_443, eR_446, eR_448, eR_451, eR_452, eR_454, eR_455, eR_456, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470,
  eR_471, eR_472, eR_473, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_500, eR_501, eR_502,
  eR_503, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_524, eR_525, eR_526, eR_527, eR_528, eR_529, eR_530,
  eR_531, eR_536, eR_541, eR_543, eR_544, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554, eR_555, eR_556, eR_565, eR_567, eR_568,
  eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_585, eR_586, eR_587, eR_588, eR_597, eR_598, eR_600, eR_606,
  eR_607, eR_608, eR_610, eR_611, eR_613, eR_614, eR_616, eR_617, eR_619, eR_620, eR_621, eR_622, eR_623, eR_624, eR_625, eR_626,
  eR_627, eR_628, eR_629, eR_630, eR_631, eR_632, eR_637, eR_638, eR_639, eR_640, eR_649, eR_650, eR_652, eR_653, eR_654, eR_655,
  eR_656, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_685, eR_686, eR_687,
  eR_688, eR_693, eR_694, eR_695, eR_696, eR_701, eR_702, eR_703, eR_704, eR_709, eR_710, eR_711, eR_712, eR_717, eR_718, eR_719,
  eR_720, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_741, eR_742, eR_743, eR_744, eR_753, eR_754, eR_755,
  eR_756, eR_761, eR_763, eR_764, eR_768, eR_769, eR_778, eR_779, eR_784, eR_785, eR_790, eR_791, eR_794, eR_795, eR_796, eR_797,
  eR_798, eR_799, eR_806, eR_807, eR_810, eR_811, eR_816, eR_817, eR_822, eR_823, eR_828, eR_829, eR_830, eR_831, eR_832, eR_833,
  eR_834, eR_835, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_848, eR_849, eR_850, eR_851, eR_857, eR_858, eR_859, eR_862,
  eR_863, eR_866, eR_867, eR_868, eR_869, eR_870, eR_871, eR_876, eR_877, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_894,
  eR_895, eR_896, eR_898, eR_899, eR_901, eR_903, eR_904, eR_905, eR_908, eR_909, eR_910, eR_913, eR_914, eR_917, eR_919, eR_923,
  eR_925, eR_928, eR_929, eR_932, eR_933, eR_935, eR_939, eR_941, eR_942, eR_946, eR_947, eR_948, eR_950, eR_951, eR_952, eR_953,
  eR_954, eR_955, eR_956, eR_958, eR_959, eR_960, eR_963, eR_966, eR_968, eR_970, eR_971, eR_972, eR_975, eR_977, eR_980, eR_982,
  eR_986, eR_987, eR_988, eR_991, eR_992, eR_993, eR_995, eR_998, eR_1000, eR_1003, eR_1005, eR_1007, eR_1008, eR_1009, eR_1013, eR_1015,
  eR_1017, eR_1019, eR_1022]
theorem nbOKR_55 : nbR_55 = nbhd entsR eR_55 := by decide +kernel
theorem mkOKR_55 : mkEnt 32 1024 W rR_55 55 = eR_55 := by decide +kernel
theorem tR_55 : kTermA 4294967295 eR_55 nbR_55 = 122821751784217152798600948 := by decide +kernel


end RamseyCert
