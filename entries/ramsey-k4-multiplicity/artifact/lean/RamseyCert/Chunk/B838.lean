import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_838 : List Ent := [
  eB_14, eB_15, eB_16, eB_17, eB_18, eB_19, eB_20, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_30, eB_34,
  eB_35, eB_36, eB_37, eB_38, eB_40, eB_41, eB_42, eB_45, eB_64, eB_65, eB_66, eB_67, eB_68, eB_69, eB_70, eB_71,
  eB_88, eB_89, eB_90, eB_91, eB_92, eB_93, eB_94, eB_95, eB_96, eB_97, eB_98, eB_100, eB_101, eB_105, eB_106, eB_107,
  eB_108, eB_109, eB_110, eB_112, eB_113, eB_115, eB_116, eB_118, eB_119, eB_120, eB_121, eB_122, eB_126, eB_129, eB_130, eB_132,
  eB_133, eB_134, eB_135, eB_140, eB_141, eB_143, eB_144, eB_146, eB_147, eB_148, eB_151, eB_154, eB_157, eB_176, eB_177, eB_178,
  eB_179, eB_180, eB_181, eB_182, eB_183, eB_200, eB_201, eB_202, eB_203, eB_204, eB_205, eB_206, eB_207, eB_208, eB_209, eB_211,
  eB_212, eB_214, eB_216, eB_217, eB_218, eB_220, eB_223, eB_226, eB_227, eB_228, eB_229, eB_230, eB_231, eB_233, eB_234, eB_236,
  eB_237, eB_239, eB_240, eB_242, eB_243, eB_245, eB_246, eB_247, eB_248, eB_249, eB_251, eB_252, eB_253, eB_254, eB_256, eB_257,
  eB_259, eB_276, eB_277, eB_278, eB_279, eB_280, eB_281, eB_282, eB_283, eB_284, eB_285, eB_286, eB_287, eB_288, eB_289, eB_290,
  eB_291, eB_292, eB_293, eB_294, eB_295, eB_296, eB_297, eB_298, eB_299, eB_316, eB_317, eB_318, eB_319, eB_320, eB_321, eB_322,
  eB_323, eB_340, eB_341, eB_342, eB_343, eB_344, eB_345, eB_346, eB_347, eB_348, eB_349, eB_350, eB_351, eB_352, eB_353, eB_354,
  eB_355, eB_356, eB_365, eB_366, eB_367, eB_368, eB_369, eB_370, eB_371, eB_372, eB_373, eB_374, eB_375, eB_376, eB_377, eB_378,
  eB_379, eB_380, eB_385, eB_386, eB_387, eB_388, eB_389, eB_390, eB_392, eB_393, eB_395, eB_396, eB_397, eB_398, eB_400, eB_401,
  eB_404, eB_405, eB_406, eB_408, eB_409, eB_411, eB_412, eB_414, eB_415, eB_417, eB_418, eB_420, eB_421, eB_423, eB_424, eB_425,
  eB_426, eB_437, eB_440, eB_441, eB_442, eB_443, eB_445, eB_446, eB_449, eB_450, eB_451, eB_453, eB_454, eB_456, eB_457, eB_458,
  eB_460, eB_461, eB_470, eB_471, eB_472, eB_473, eB_474, eB_475, eB_476, eB_477, eB_478, eB_479, eB_480, eB_481, eB_482, eB_483,
  eB_484, eB_485, eB_486, eB_487, eB_488, eB_489, eB_490, eB_491, eB_492, eB_493, eB_494, eB_495, eB_512, eB_513, eB_514, eB_515,
  eB_516, eB_517, eB_518, eB_519, eB_536, eB_537, eB_538, eB_539, eB_540, eB_541, eB_542, eB_543, eB_544, eB_545, eB_546, eB_547,
  eB_548, eB_549, eB_550, eB_551, eB_552, eB_561, eB_562, eB_563, eB_564, eB_565, eB_566, eB_567, eB_568, eB_569, eB_570, eB_571,
  eB_572, eB_573, eB_574, eB_575, eB_576, eB_601, eB_602, eB_603, eB_604, eB_605, eB_606, eB_607, eB_608, eB_611, eB_614, eB_617,
  eB_620, eB_629, eB_630, eB_631, eB_632, eB_633, eB_634, eB_635, eB_636, eB_661, eB_662, eB_663, eB_664, eB_665, eB_666, eB_667,
  eB_668, eB_677, eB_678, eB_679, eB_680, eB_681, eB_682, eB_683, eB_684, eB_685, eB_686, eB_687, eB_688, eB_689, eB_690, eB_691,
  eB_692, eB_709, eB_710, eB_711, eB_712, eB_713, eB_714, eB_715, eB_716, eB_733, eB_734, eB_735, eB_736, eB_737, eB_738, eB_739,
  eB_740, eB_757, eB_758, eB_759, eB_760, eB_761, eB_762, eB_763, eB_764, eB_765, eB_774, eB_775, eB_778, eB_779, eB_784, eB_785,
  eB_788, eB_789, eB_800, eB_801, eB_804, eB_805, eB_806, eB_807, eB_810, eB_811, eB_812, eB_813, eB_814, eB_815, eB_816, eB_817,
  eB_820, eB_821, eB_822, eB_823, eB_826, eB_827, eB_828, eB_829, eB_830, eB_831, eB_832, eB_833, eB_836, eB_837, eB_838, eB_839,
  eB_844, eB_845, eB_848, eB_849, eB_852, eB_853, eB_856, eB_857, eB_858, eB_859, eB_860, eB_861, eB_862, eB_863, eB_864, eB_866,
  eB_867, eB_868, eB_871, eB_874, eB_875, eB_876, eB_877, eB_878, eB_882, eB_883, eB_890, eB_891, eB_892, eB_893, eB_894, eB_895,
  eB_896, eB_898, eB_901, eB_902, eB_905, eB_906, eB_910, eB_911, eB_914, eB_915, eB_917, eB_918, eB_921, eB_924, eB_926, eB_927,
  eB_928, eB_929, eB_930, eB_931, eB_932, eB_933, eB_936, eB_938, eB_942, eB_946, eB_947, eB_951, eB_952, eB_954, eB_955, eB_957,
  eB_960, eB_961, eB_966, eB_967, eB_968, eB_970, eB_973, eB_974, eB_975, eB_979, eB_981, eB_983, eB_985, eB_986, eB_989, eB_990,
  eB_992, eB_993, eB_997, eB_1003, eB_1008, eB_1010, eB_1011, eB_1012, eB_1013, eB_1015, eB_1016, eB_1019, eB_1021, eB_1022]
theorem nbOKB_838 : nbB_838 = nbhd entsB eB_838 := by decide +kernel
theorem mkOKB_838 : mkEnt 32 1024 W rB_838 838 = eB_838 := by decide +kernel
theorem tB_838 : kTermA 4294967295 eB_838 nbB_838 = 45194439793700863139591743 := by decide +kernel


end RamseyCert
