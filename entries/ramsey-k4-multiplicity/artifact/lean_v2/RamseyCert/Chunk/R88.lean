import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_88 : List Ent := [
  eR_8, eR_9, eR_11, eR_12, eR_13, eR_14, eR_15, eR_27, eR_28, eR_29, eR_30, eR_31, eR_32, eR_42, eR_43, eR_44,
  eR_45, eR_46, eR_47, eR_52, eR_53, eR_54, eR_55, eR_60, eR_61, eR_62, eR_63, eR_68, eR_69, eR_70, eR_71, eR_76,
  eR_77, eR_78, eR_79, eR_84, eR_85, eR_86, eR_87, eR_92, eR_93, eR_94, eR_95, eR_136, eR_137, eR_138, eR_139, eR_140,
  eR_141, eR_142, eR_143, eR_144, eR_145, eR_146, eR_147, eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156,
  eR_157, eR_158, eR_159, eR_160, eR_161, eR_162, eR_163, eR_168, eR_169, eR_170, eR_171, eR_176, eR_177, eR_178, eR_179, eR_184,
  eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195, eR_201, eR_203, eR_208, eR_209, eR_210, eR_211, eR_212, eR_213, eR_214,
  eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225, eR_226, eR_227, eR_228, eR_229, eR_230,
  eR_231, eR_232, eR_233, eR_234, eR_235, eR_236, eR_237, eR_238, eR_239, eR_240, eR_241, eR_242, eR_243, eR_244, eR_245, eR_246,
  eR_247, eR_253, eR_254, eR_256, eR_257, eR_258, eR_260, eR_261, eR_262, eR_263, eR_268, eR_269, eR_270, eR_271, eR_276, eR_277,
  eR_278, eR_279, eR_284, eR_285, eR_286, eR_287, eR_292, eR_293, eR_294, eR_295, eR_300, eR_301, eR_302, eR_303, eR_308, eR_309,
  eR_310, eR_311, eR_316, eR_317, eR_318, eR_319, eR_324, eR_325, eR_326, eR_327, eR_332, eR_333, eR_334, eR_335, eR_345, eR_346,
  eR_347, eR_353, eR_355, eR_356, eR_361, eR_363, eR_364, eR_370, eR_371, eR_372, eR_378, eR_379, eR_380, eR_381, eR_382, eR_383,
  eR_384, eR_402, eR_403, eR_404, eR_405, eR_406, eR_407, eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416,
  eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_423, eR_424, eR_425, eR_426, eR_427, eR_428, eR_429, eR_430, eR_435, eR_436,
  eR_437, eR_438, eR_439, eR_440, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_447, eR_448, eR_449, eR_450, eR_451, eR_452,
  eR_453, eR_454, eR_455, eR_456, eR_457, eR_458, eR_459, eR_460, eR_461, eR_462, eR_463, eR_464, eR_465, eR_470, eR_471, eR_472,
  eR_473, eR_478, eR_479, eR_480, eR_481, eR_486, eR_487, eR_488, eR_489, eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504,
  eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521, eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_536,
  eR_541, eR_542, eR_543, eR_544, eR_549, eR_550, eR_551, eR_552, eR_557, eR_558, eR_559, eR_560, eR_565, eR_566, eR_567, eR_568,
  eR_573, eR_574, eR_575, eR_576, eR_581, eR_582, eR_583, eR_584, eR_589, eR_590, eR_591, eR_592, eR_597, eR_598, eR_599, eR_600,
  eR_605, eR_606, eR_607, eR_608, eR_633, eR_634, eR_635, eR_636, eR_641, eR_642, eR_643, eR_644, eR_646, eR_647, eR_648, eR_654,
  eR_655, eR_656, eR_661, eR_662, eR_663, eR_664, eR_673, eR_674, eR_675, eR_676, eR_681, eR_682, eR_683, eR_684, eR_689, eR_690,
  eR_691, eR_692, eR_693, eR_695, eR_696, eR_702, eR_703, eR_704, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724,
  eR_729, eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756,
  eR_757, eR_758, eR_759, eR_770, eR_771, eR_778, eR_779, eR_780, eR_781, eR_785, eR_790, eR_791, eR_792, eR_793, eR_794, eR_795,
  eR_798, eR_799, eR_802, eR_803, eR_805, eR_808, eR_809, eR_814, eR_815, eR_820, eR_821, eR_824, eR_825, eR_826, eR_827, eR_828,
  eR_829, eR_832, eR_833, eR_834, eR_835, eR_841, eR_842, eR_843, eR_850, eR_851, eR_852, eR_856, eR_857, eR_860, eR_861, eR_870,
  eR_871, eR_872, eR_873, eR_874, eR_875, eR_878, eR_879, eR_882, eR_883, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_892,
  eR_893, eR_896, eR_898, eR_899, eR_902, eR_905, eR_908, eR_909, eR_911, eR_913, eR_915, eR_916, eR_917, eR_918, eR_919, eR_920,
  eR_922, eR_923, eR_927, eR_928, eR_930, eR_933, eR_938, eR_941, eR_942, eR_943, eR_944, eR_945, eR_951, eR_952, eR_953, eR_954,
  eR_955, eR_956, eR_958, eR_961, eR_962, eR_971, eR_972, eR_973, eR_974, eR_976, eR_980, eR_981, eR_984, eR_986, eR_987, eR_989,
  eR_990, eR_991, eR_993, eR_994, eR_995, eR_999, eR_1001, eR_1002, eR_1005, eR_1007, eR_1010, eR_1012, eR_1013, eR_1015, eR_1019, eR_1020,
  eR_1021, eR_1023]
theorem nbOKR_88 : nbR_88 = nbhd entsR eR_88 := by decide +kernel
theorem mkOKR_88 : mkEnt 32 1024 W rR_88 88 = eR_88 := by decide +kernel
theorem tR_88 : kTermA 4294967295 eR_88 nbR_88 = 89264517118685594216175228 := by decide +kernel


end RamseyCert
