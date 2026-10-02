import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_630 : List Ent := [
  eB_4, eB_5, eB_6, eB_7, eB_16, eB_17, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26, eB_27, eB_28, eB_29, eB_30,
  eB_31, eB_32, eB_42, eB_43, eB_44, eB_45, eB_46, eB_47, eB_48, eB_49, eB_50, eB_51, eB_56, eB_57, eB_58, eB_59,
  eB_64, eB_65, eB_66, eB_67, eB_72, eB_76, eB_77, eB_78, eB_79, eB_83, eB_84, eB_85, eB_86, eB_87, eB_88, eB_89,
  eB_90, eB_91, eB_96, eB_103, eB_104, eB_105, eB_124, eB_125, eB_126, eB_127, eB_128, eB_129, eB_130, eB_131, eB_132, eB_133,
  eB_134, eB_135, eB_148, eB_149, eB_150, eB_151, eB_152, eB_153, eB_154, eB_155, eB_156, eB_157, eB_158, eB_159, eB_160, eB_161,
  eB_162, eB_163, eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_185, eB_188, eB_189, eB_190, eB_191, eB_194,
  eB_196, eB_197, eB_198, eB_199, eB_200, eB_201, eB_202, eB_203, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221,
  eB_222, eB_223, eB_224, eB_225, eB_226, eB_245, eB_246, eB_247, eB_251, eB_252, eB_253, eB_254, eB_259, eB_260, eB_261, eB_262,
  eB_263, eB_266, eB_267, eB_268, eB_269, eB_270, eB_271, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_296,
  eB_297, eB_298, eB_299, eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328,
  eB_329, eB_330, eB_331, eB_336, eB_337, eB_338, eB_339, eB_340, eB_345, eB_346, eB_347, eB_348, eB_353, eB_354, eB_355, eB_356,
  eB_357, eB_358, eB_359, eB_360, eB_365, eB_366, eB_367, eB_368, eB_373, eB_374, eB_375, eB_376, eB_385, eB_386, eB_387, eB_388,
  eB_389, eB_390, eB_397, eB_398, eB_402, eB_403, eB_404, eB_423, eB_424, eB_425, eB_426, eB_427, eB_428, eB_429, eB_430, eB_434,
  eB_435, eB_436, eB_437, eB_438, eB_439, eB_440, eB_447, eB_448, eB_449, eB_456, eB_457, eB_458, eB_462, eB_463, eB_464, eB_465,
  eB_466, eB_470, eB_471, eB_472, eB_473, eB_475, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_492, eB_493, eB_494, eB_495,
  eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525, eB_526, eB_527,
  eB_532, eB_533, eB_534, eB_535, eB_536, eB_541, eB_542, eB_543, eB_544, eB_549, eB_550, eB_551, eB_552, eB_557, eB_558, eB_559,
  eB_560, eB_565, eB_566, eB_567, eB_568, eB_573, eB_574, eB_575, eB_576, eB_581, eB_582, eB_583, eB_584, eB_585, eB_586, eB_587,
  eB_588, eB_593, eB_594, eB_595, eB_596, eB_601, eB_602, eB_603, eB_604, eB_609, eB_610, eB_611, eB_612, eB_613, eB_614, eB_615,
  eB_616, eB_617, eB_618, eB_619, eB_620, eB_629, eB_630, eB_631, eB_632, eB_637, eB_638, eB_639, eB_640, eB_643, eB_645, eB_646,
  eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_669, eB_670, eB_671, eB_672, eB_673, eB_677,
  eB_678, eB_679, eB_680, eB_681, eB_685, eB_686, eB_687, eB_688, eB_692, eB_697, eB_698, eB_699, eB_700, eB_705, eB_706, eB_707,
  eB_708, eB_713, eB_714, eB_715, eB_716, eB_721, eB_722, eB_723, eB_724, eB_729, eB_730, eB_731, eB_732, eB_737, eB_738, eB_739,
  eB_740, eB_745, eB_746, eB_747, eB_748, eB_753, eB_754, eB_755, eB_756, eB_757, eB_758, eB_759, eB_760, eB_768, eB_769, eB_770,
  eB_771, eB_780, eB_781, eB_784, eB_785, eB_786, eB_787, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_808, eB_809, eB_810,
  eB_811, eB_816, eB_817, eB_818, eB_819, eB_822, eB_823, eB_824, eB_825, eB_826, eB_827, eB_830, eB_831, eB_832, eB_833, eB_838,
  eB_839, eB_842, eB_843, eB_844, eB_845, eB_852, eB_853, eB_854, eB_855, eB_856, eB_857, eB_866, eB_867, eB_874, eB_875, eB_876,
  eB_877, eB_878, eB_879, eB_883, eB_888, eB_889, eB_890, eB_891, eB_892, eB_893, eB_896, eB_900, eB_903, eB_906, eB_907, eB_908,
  eB_915, eB_917, eB_919, eB_921, eB_923, eB_927, eB_928, eB_930, eB_932, eB_933, eB_935, eB_938, eB_940, eB_945, eB_947, eB_948,
  eB_949, eB_951, eB_952, eB_954, eB_956, eB_960, eB_962, eB_963, eB_964, eB_965, eB_966, eB_967, eB_968, eB_969, eB_970, eB_971,
  eB_975, eB_976, eB_977, eB_978, eB_980, eB_982, eB_983, eB_985, eB_986, eB_987, eB_991, eB_994, eB_996, eB_997, eB_998, eB_1000,
  eB_1001, eB_1004, eB_1008, eB_1009, eB_1010, eB_1011, eB_1014, eB_1020, eB_1021]
theorem nbOKB_630 : nbB_630 = nbhd entsB eB_630 := by decide +kernel
theorem mkOKB_630 : mkEnt 32 1024 W rB_630 630 = eB_630 := by decide +kernel
theorem tB_630 : kTermA 4294967295 eB_630 nbB_630 = 122554851629342426758747584 := by decide +kernel


end RamseyCert
