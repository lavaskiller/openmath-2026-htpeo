import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_120 : List Ent := [
  eB_0, eB_1, eB_2, eB_3, eB_12, eB_14, eB_15, eB_16, eB_17, eB_19, eB_20, eB_21, eB_23, eB_25, eB_28, eB_29,
  eB_30, eB_34, eB_35, eB_36, eB_37, eB_38, eB_40, eB_41, eB_43, eB_44, eB_45, eB_48, eB_49, eB_50, eB_51, eB_52,
  eB_53, eB_54, eB_55, eB_56, eB_57, eB_58, eB_59, eB_60, eB_61, eB_62, eB_63, eB_72, eB_73, eB_74, eB_75, eB_76,
  eB_77, eB_78, eB_79, eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_99, eB_100, eB_101, eB_105, eB_106,
  eB_107, eB_111, eB_114, eB_115, eB_116, eB_120, eB_121, eB_122, eB_126, eB_129, eB_132, eB_136, eB_137, eB_138, eB_140, eB_141,
  eB_143, eB_144, eB_145, eB_146, eB_147, eB_149, eB_150, eB_151, eB_152, eB_154, eB_155, eB_156, eB_157, eB_159, eB_176, eB_177,
  eB_178, eB_179, eB_180, eB_181, eB_182, eB_183, eB_192, eB_193, eB_194, eB_195, eB_196, eB_197, eB_198, eB_199, eB_208, eB_209,
  eB_210, eB_213, eB_214, eB_215, eB_216, eB_218, eB_219, eB_221, eB_222, eB_224, eB_225, eB_227, eB_228, eB_232, eB_235, eB_236,
  eB_237, eB_239, eB_240, eB_241, eB_244, eB_245, eB_246, eB_247, eB_248, eB_249, eB_251, eB_253, eB_255, eB_258, eB_259, eB_268,
  eB_269, eB_270, eB_271, eB_272, eB_273, eB_274, eB_275, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_324,
  eB_325, eB_326, eB_327, eB_328, eB_329, eB_330, eB_331, eB_332, eB_333, eB_334, eB_335, eB_336, eB_337, eB_338, eB_339, eB_340,
  eB_349, eB_350, eB_351, eB_352, eB_353, eB_354, eB_355, eB_356, eB_357, eB_358, eB_359, eB_360, eB_361, eB_362, eB_363, eB_364,
  eB_385, eB_386, eB_388, eB_390, eB_392, eB_393, eB_395, eB_396, eB_398, eB_400, eB_401, eB_402, eB_403, eB_407, eB_408, eB_409,
  eB_411, eB_413, eB_414, eB_415, eB_418, eB_419, eB_420, eB_421, eB_423, eB_425, eB_435, eB_436, eB_438, eB_439, eB_441, eB_444,
  eB_447, eB_448, eB_449, eB_452, eB_453, eB_454, eB_455, eB_456, eB_457, eB_459, eB_462, eB_463, eB_464, eB_465, eB_466, eB_467,
  eB_468, eB_469, eB_486, eB_487, eB_496, eB_497, eB_498, eB_499, eB_500, eB_501, eB_502, eB_503, eB_504, eB_505, eB_506, eB_507,
  eB_508, eB_509, eB_510, eB_511, eB_512, eB_513, eB_514, eB_515, eB_516, eB_517, eB_518, eB_519, eB_536, eB_537, eB_538, eB_539,
  eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547, eB_548, eB_549, eB_550, eB_551, eB_552, eB_577, eB_578, eB_579,
  eB_580, eB_581, eB_582, eB_583, eB_584, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_609, eB_610, eB_611,
  eB_612, eB_613, eB_615, eB_616, eB_618, eB_619, eB_621, eB_623, eB_624, eB_626, eB_628, eB_637, eB_638, eB_639, eB_640, eB_641,
  eB_642, eB_643, eB_644, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667, eB_668, eB_677, eB_678, eB_679, eB_680, eB_681,
  eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691, eB_692, eB_693, eB_694, eB_695, eB_696, eB_697,
  eB_698, eB_699, eB_700, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_741, eB_742, eB_743, eB_744, eB_745,
  eB_746, eB_747, eB_748, eB_749, eB_750, eB_751, eB_752, eB_753, eB_754, eB_755, eB_756, eB_765, eB_766, eB_767, eB_786, eB_787,
  eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_796, eB_797, eB_798, eB_799, eB_800, eB_801, eB_802, eB_803, eB_806, eB_807,
  eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817, eB_818, eB_819, eB_820, eB_821, eB_828, eB_829, eB_835, eB_836,
  eB_837, eB_840, eB_841, eB_842, eB_843, eB_844, eB_845, eB_846, eB_847, eB_848, eB_849, eB_850, eB_851, eB_854, eB_855, eB_858,
  eB_859, eB_860, eB_861, eB_864, eB_865, eB_866, eB_867, eB_872, eB_873, eB_878, eB_879, eB_882, eB_883, eB_884, eB_885, eB_886,
  eB_887, eB_888, eB_889, eB_890, eB_891, eB_896, eB_897, eB_899, eB_906, eB_907, eB_909, eB_911, eB_913, eB_915, eB_918, eB_919,
  eB_925, eB_928, eB_932, eB_934, eB_937, eB_942, eB_943, eB_946, eB_947, eB_951, eB_952, eB_954, eB_957, eB_961, eB_962, eB_963,
  eB_964, eB_966, eB_968, eB_969, eB_970, eB_977, eB_978, eB_979, eB_980, eB_982, eB_983, eB_984, eB_986, eB_987, eB_991, eB_998,
  eB_999, eB_1001, eB_1003, eB_1005, eB_1009, eB_1010, eB_1012, eB_1013, eB_1015, eB_1016, eB_1017, eB_1018, eB_1019, eB_1020]
theorem nbOKB_120 : nbB_120 = nbhd entsB eB_120 := by decide +kernel
theorem mkOKB_120 : mkEnt 32 1024 W rB_120 120 = eB_120 := by decide +kernel
theorem tB_120 : kTermA 4294967295 eB_120 nbB_120 = 117026764296593086621125930 := by decide +kernel


end RamseyCert
