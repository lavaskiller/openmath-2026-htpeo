import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_64 : List Ent := [
  eR_9, eR_10, eR_11, eR_12, eR_13, eR_16, eR_17, eR_19, eR_20, eR_21, eR_22, eR_23, eR_24, eR_25, eR_26, eR_28,
  eR_29, eR_31, eR_32, eR_34, eR_35, eR_37, eR_38, eR_40, eR_41, eR_43, eR_44, eR_46, eR_47, eR_48, eR_49, eR_50,
  eR_51, eR_56, eR_57, eR_58, eR_59, eR_68, eR_69, eR_70, eR_71, eR_72, eR_73, eR_74, eR_75, eR_80, eR_81, eR_82,
  eR_83, eR_92, eR_93, eR_94, eR_95, eR_99, eR_102, eR_103, eR_104, eR_108, eR_111, eR_114, eR_117, eR_120, eR_123, eR_124,
  eR_125, eR_127, eR_128, eR_130, eR_131, eR_136, eR_137, eR_138, eR_139, eR_142, eR_145, eR_149, eR_150, eR_152, eR_153, eR_155,
  eR_156, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167, eR_172, eR_173, eR_174, eR_175, eR_176, eR_178, eR_188, eR_189, eR_190,
  eR_191, eR_196, eR_197, eR_198, eR_199, eR_200, eR_201, eR_202, eR_203, eR_208, eR_209, eR_211, eR_212, eR_214, eR_217, eR_220,
  eR_223, eR_226, eR_227, eR_228, eR_230, eR_231, eR_233, eR_234, eR_236, eR_237, eR_239, eR_240, eR_242, eR_243, eR_245, eR_246,
  eR_247, eR_248, eR_249, eR_251, eR_252, eR_258, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271, eR_280, eR_281,
  eR_283, eR_288, eR_289, eR_291, eR_296, eR_297, eR_298, eR_299, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309, eR_310, eR_311,
  eR_320, eR_321, eR_322, eR_323, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_341, eR_342, eR_343, eR_344,
  eR_349, eR_350, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_365, eR_366, eR_367, eR_368, eR_373, eR_374, eR_375, eR_376,
  eR_381, eR_382, eR_383, eR_384, eR_387, eR_388, eR_389, eR_390, eR_392, eR_393, eR_395, eR_396, eR_397, eR_398, eR_400, eR_401,
  eR_404, eR_405, eR_406, eR_408, eR_409, eR_411, eR_412, eR_414, eR_415, eR_417, eR_418, eR_420, eR_421, eR_427, eR_428, eR_429,
  eR_430, eR_437, eR_440, eR_441, eR_444, eR_449, eR_450, eR_451, eR_453, eR_454, eR_456, eR_459, eR_462, eR_463, eR_464, eR_465,
  eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_486, eR_487, eR_492, eR_493, eR_494, eR_495, eR_496, eR_497,
  eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_516, eR_517, eR_518, eR_519, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529,
  eR_530, eR_531, eR_536, eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_553, eR_554, eR_555, eR_565, eR_566,
  eR_567, eR_568, eR_573, eR_574, eR_575, eR_576, eR_577, eR_578, eR_580, eR_585, eR_586, eR_587, eR_594, eR_595, eR_596, eR_605,
  eR_606, eR_607, eR_608, eR_609, eR_610, eR_612, eR_613, eR_615, eR_616, eR_618, eR_619, eR_621, eR_622, eR_623, eR_624, eR_625,
  eR_626, eR_627, eR_628, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_649, eR_650, eR_651, eR_652, eR_657,
  eR_658, eR_659, eR_660, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686,
  eR_687, eR_688, eR_697, eR_698, eR_699, eR_700, eR_705, eR_706, eR_707, eR_708, eR_709, eR_710, eR_711, eR_712, eR_721, eR_722,
  eR_723, eR_724, eR_729, eR_730, eR_731, eR_732, eR_733, eR_734, eR_735, eR_736, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754,
  eR_755, eR_756, eR_757, eR_758, eR_759, eR_760, eR_768, eR_769, eR_770, eR_771, eR_772, eR_773, eR_774, eR_775, eR_780, eR_781,
  eR_782, eR_783, eR_788, eR_789, eR_790, eR_791, eR_798, eR_799, eR_802, eR_803, eR_822, eR_823, eR_824, eR_825, eR_826, eR_827,
  eR_828, eR_829, eR_830, eR_831, eR_836, eR_837, eR_841, eR_842, eR_843, eR_852, eR_854, eR_855, eR_856, eR_857, eR_858, eR_859,
  eR_860, eR_861, eR_864, eR_865, eR_867, eR_870, eR_871, eR_872, eR_873, eR_874, eR_875, eR_876, eR_880, eR_881, eR_888, eR_889,
  eR_898, eR_900, eR_904, eR_907, eR_910, eR_911, eR_912, eR_913, eR_916, eR_918, eR_920, eR_922, eR_924, eR_925, eR_926, eR_929,
  eR_932, eR_939, eR_942, eR_943, eR_944, eR_946, eR_947, eR_950, eR_951, eR_952, eR_954, eR_955, eR_956, eR_958, eR_960, eR_964,
  eR_967, eR_968, eR_969, eR_970, eR_971, eR_973, eR_974, eR_975, eR_976, eR_977, eR_983, eR_986, eR_989, eR_991, eR_992, eR_993,
  eR_996, eR_997, eR_999, eR_1001, eR_1002, eR_1003, eR_1004, eR_1005, eR_1006, eR_1007, eR_1009, eR_1010, eR_1011, eR_1014, eR_1015, eR_1016,
  eR_1017, eR_1018, eR_1020, eR_1021]
theorem nbOKR_64 : nbR_64 = nbhd entsR eR_64 := by decide +kernel
theorem mkOKR_64 : mkEnt 32 1024 W rR_64 64 = eR_64 := by decide +kernel
theorem tR_64 : kTermA 4294967295 eR_64 nbR_64 = 122163467373694494545871672 := by decide +kernel


end RamseyCert
