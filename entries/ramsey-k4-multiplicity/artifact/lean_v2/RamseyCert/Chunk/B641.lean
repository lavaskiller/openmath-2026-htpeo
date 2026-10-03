import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbB_641 : List Ent := [
  eB_8, eB_9, eB_10, eB_11, eB_12, eB_13, eB_14, eB_15, eB_16, eB_17, eB_21, eB_22, eB_23, eB_24, eB_25, eB_26,
  eB_52, eB_53, eB_54, eB_55, eB_60, eB_61, eB_62, eB_63, eB_68, eB_69, eB_70, eB_71, eB_72, eB_73, eB_74, eB_75,
  eB_80, eB_81, eB_82, eB_83, eB_92, eB_93, eB_94, eB_95, eB_97, eB_98, eB_99, eB_100, eB_101, eB_102, eB_106, eB_107,
  eB_108, eB_109, eB_110, eB_111, eB_112, eB_113, eB_114, eB_115, eB_116, eB_117, eB_118, eB_119, eB_120, eB_121, eB_122, eB_123,
  eB_136, eB_137, eB_138, eB_139, eB_140, eB_141, eB_142, eB_143, eB_144, eB_145, eB_146, eB_147, eB_160, eB_161, eB_162, eB_163,
  eB_168, eB_169, eB_170, eB_171, eB_176, eB_177, eB_178, eB_179, eB_188, eB_189, eB_190, eB_191, eB_196, eB_197, eB_198, eB_199,
  eB_200, eB_201, eB_202, eB_203, eB_214, eB_215, eB_216, eB_217, eB_218, eB_219, eB_220, eB_221, eB_222, eB_223, eB_224, eB_225,
  eB_226, eB_245, eB_246, eB_247, eB_251, eB_252, eB_256, eB_257, eB_258, eB_260, eB_261, eB_262, eB_263, eB_265, eB_268, eB_269,
  eB_270, eB_271, eB_273, eB_276, eB_277, eB_278, eB_279, eB_284, eB_285, eB_286, eB_287, eB_290, eB_296, eB_297, eB_298, eB_299,
  eB_304, eB_305, eB_306, eB_307, eB_312, eB_313, eB_314, eB_315, eB_320, eB_321, eB_322, eB_323, eB_328, eB_329, eB_330, eB_331,
  eB_336, eB_337, eB_338, eB_339, eB_341, eB_342, eB_343, eB_344, eB_346, eB_348, eB_349, eB_350, eB_351, eB_352, eB_356, eB_361,
  eB_362, eB_363, eB_364, eB_369, eB_370, eB_371, eB_372, eB_377, eB_378, eB_379, eB_380, eB_381, eB_382, eB_383, eB_384, eB_387,
  eB_388, eB_389, eB_390, eB_397, eB_398, eB_402, eB_403, eB_404, eB_427, eB_428, eB_429, eB_430, eB_432, eB_435, eB_436, eB_437,
  eB_438, eB_439, eB_440, eB_441, eB_442, eB_443, eB_444, eB_445, eB_446, eB_447, eB_448, eB_449, eB_456, eB_459, eB_460, eB_461,
  eB_462, eB_463, eB_464, eB_465, eB_470, eB_471, eB_472, eB_473, eB_478, eB_479, eB_480, eB_481, eB_486, eB_487, eB_492, eB_493,
  eB_494, eB_495, eB_500, eB_501, eB_502, eB_503, eB_508, eB_509, eB_510, eB_511, eB_516, eB_517, eB_518, eB_519, eB_524, eB_525,
  eB_526, eB_527, eB_532, eB_533, eB_534, eB_535, eB_536, eB_537, eB_538, eB_539, eB_540, eB_545, eB_546, eB_547, eB_548, eB_553,
  eB_554, eB_555, eB_556, eB_561, eB_562, eB_563, eB_564, eB_569, eB_570, eB_571, eB_572, eB_577, eB_578, eB_579, eB_580, eB_585,
  eB_589, eB_590, eB_591, eB_592, eB_597, eB_598, eB_599, eB_600, eB_601, eB_605, eB_606, eB_607, eB_608, eB_621, eB_622, eB_623,
  eB_624, eB_625, eB_626, eB_627, eB_628, eB_632, eB_633, eB_634, eB_635, eB_636, eB_641, eB_642, eB_643, eB_644, eB_645, eB_646,
  eB_647, eB_648, eB_653, eB_654, eB_655, eB_656, eB_661, eB_662, eB_663, eB_664, eB_673, eB_674, eB_675, eB_676, eB_681, eB_682,
  eB_683, eB_684, eB_689, eB_690, eB_691, eB_692, eB_696, eB_697, eB_698, eB_699, eB_700, eB_704, eB_705, eB_706, eB_707, eB_708,
  eB_709, eB_710, eB_711, eB_712, eB_717, eB_718, eB_719, eB_720, eB_725, eB_726, eB_727, eB_728, eB_733, eB_734, eB_735, eB_736,
  eB_741, eB_742, eB_743, eB_744, eB_749, eB_750, eB_751, eB_752, eB_757, eB_758, eB_759, eB_760, eB_769, eB_770, eB_771, eB_774,
  eB_775, eB_776, eB_777, eB_778, eB_779, eB_788, eB_789, eB_790, eB_791, eB_792, eB_793, eB_794, eB_795, eB_796, eB_797, eB_800,
  eB_801, eB_804, eB_805, eB_806, eB_807, eB_808, eB_809, eB_818, eB_819, eB_820, eB_821, eB_824, eB_825, eB_826, eB_827, eB_830,
  eB_831, eB_840, eB_841, eB_845, eB_848, eB_849, eB_850, eB_851, eB_852, eB_853, eB_854, eB_855, eB_858, eB_859, eB_862, eB_863,
  eB_864, eB_865, eB_866, eB_867, eB_870, eB_871, eB_872, eB_873, eB_876, eB_877, eB_878, eB_879, eB_880, eB_881, eB_882, eB_883,
  eB_892, eB_893, eB_897, eB_900, eB_905, eB_911, eB_913, eB_914, eB_916, eB_917, eB_922, eB_923, eB_925, eB_926, eB_927, eB_931,
  eB_932, eB_933, eB_936, eB_939, eB_940, eB_942, eB_947, eB_948, eB_949, eB_950, eB_951, eB_954, eB_959, eB_960, eB_961, eB_963,
  eB_964, eB_966, eB_968, eB_973, eB_975, eB_978, eB_979, eB_980, eB_981, eB_984, eB_986, eB_987, eB_988, eB_991, eB_992, eB_993,
  eB_994, eB_995, eB_996, eB_998, eB_999, eB_1000, eB_1004, eB_1006, eB_1007, eB_1011, eB_1013, eB_1017, eB_1018, eB_1021, eB_1023]
theorem nbOKB_641 : nbB_641 = nbhd entsB eB_641 := by decide +kernel
theorem mkOKB_641 : mkEnt 32 1024 W rB_641 641 = eB_641 := by decide +kernel
theorem tB_641 : kTermA 4294967295 eB_641 nbB_641 = 78207142558863080924878560 := by decide +kernel


end RamseyCert
