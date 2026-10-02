import RamseyCert.Data.Ents

set_option maxRecDepth 1000000
namespace RamseyCert

def nbR_430 : List Ent := [
  eR_0, eR_1, eR_2, eR_3, eR_8, eR_9, eR_10, eR_11, eR_18, eR_19, eR_20, eR_27, eR_28, eR_29, eR_30, eR_31,
  eR_32, eR_33, eR_34, eR_35, eR_36, eR_37, eR_38, eR_39, eR_40, eR_41, eR_42, eR_43, eR_44, eR_45, eR_46, eR_47,
  eR_48, eR_49, eR_50, eR_51, eR_56, eR_57, eR_58, eR_59, eR_64, eR_65, eR_66, eR_67, eR_76, eR_77, eR_78, eR_79,
  eR_84, eR_85, eR_86, eR_87, eR_88, eR_89, eR_90, eR_91, eR_97, eR_98, eR_99, eR_100, eR_101, eR_102, eR_106, eR_107,
  eR_108, eR_109, eR_110, eR_111, eR_112, eR_113, eR_114, eR_115, eR_116, eR_117, eR_118, eR_119, eR_120, eR_121, eR_122, eR_123,
  eR_148, eR_149, eR_150, eR_151, eR_152, eR_153, eR_154, eR_155, eR_156, eR_157, eR_158, eR_159, eR_164, eR_165, eR_166, eR_167,
  eR_172, eR_173, eR_174, eR_175, eR_180, eR_181, eR_182, eR_183, eR_184, eR_185, eR_186, eR_187, eR_192, eR_193, eR_194, eR_195,
  eR_204, eR_205, eR_206, eR_207, eR_214, eR_215, eR_216, eR_217, eR_218, eR_219, eR_220, eR_221, eR_222, eR_223, eR_224, eR_225,
  eR_226, eR_245, eR_246, eR_247, eR_251, eR_252, eR_256, eR_257, eR_258, eR_259, eR_261, eR_262, eR_263, eR_268, eR_269, eR_271,
  eR_276, eR_278, eR_279, eR_285, eR_286, eR_287, eR_296, eR_297, eR_298, eR_299, eR_304, eR_305, eR_306, eR_307, eR_312, eR_313,
  eR_314, eR_315, eR_320, eR_321, eR_322, eR_323, eR_328, eR_329, eR_330, eR_331, eR_336, eR_337, eR_338, eR_339, eR_340, eR_341,
  eR_342, eR_344, eR_349, eR_351, eR_352, eR_361, eR_362, eR_363, eR_364, eR_369, eR_370, eR_371, eR_372, eR_377, eR_378, eR_379,
  eR_380, eR_381, eR_382, eR_383, eR_384, eR_385, eR_386, eR_387, eR_388, eR_389, eR_390, eR_397, eR_398, eR_405, eR_406, eR_407,
  eR_408, eR_409, eR_410, eR_411, eR_412, eR_413, eR_414, eR_415, eR_416, eR_417, eR_418, eR_419, eR_420, eR_421, eR_422, eR_431,
  eR_432, eR_433, eR_434, eR_441, eR_442, eR_443, eR_444, eR_445, eR_446, eR_450, eR_451, eR_452, eR_453, eR_454, eR_455, eR_459,
  eR_460, eR_461, eR_466, eR_467, eR_468, eR_469, eR_474, eR_475, eR_476, eR_477, eR_482, eR_483, eR_484, eR_485, eR_488, eR_489,
  eR_490, eR_491, eR_496, eR_497, eR_498, eR_499, eR_504, eR_505, eR_506, eR_507, eR_512, eR_513, eR_514, eR_515, eR_520, eR_521,
  eR_522, eR_523, eR_528, eR_529, eR_530, eR_531, eR_537, eR_538, eR_539, eR_540, eR_545, eR_546, eR_547, eR_548, eR_553, eR_554,
  eR_555, eR_556, eR_561, eR_562, eR_563, eR_564, eR_569, eR_570, eR_571, eR_572, eR_577, eR_578, eR_579, eR_580, eR_589, eR_590,
  eR_591, eR_597, eR_598, eR_599, eR_600, eR_605, eR_606, eR_607, eR_609, eR_610, eR_611, eR_612, eR_613, eR_614, eR_615, eR_616,
  eR_617, eR_618, eR_619, eR_620, eR_634, eR_635, eR_636, eR_637, eR_638, eR_645, eR_646, eR_647, eR_648, eR_653, eR_654, eR_655,
  eR_656, eR_661, eR_662, eR_663, eR_664, eR_669, eR_670, eR_671, eR_672, eR_677, eR_678, eR_679, eR_680, eR_685, eR_686, eR_687,
  eR_688, eR_697, eR_698, eR_699, eR_705, eR_707, eR_708, eR_713, eR_714, eR_715, eR_716, eR_721, eR_722, eR_723, eR_724, eR_729,
  eR_730, eR_731, eR_732, eR_737, eR_738, eR_739, eR_740, eR_745, eR_746, eR_747, eR_748, eR_753, eR_754, eR_755, eR_756, eR_757,
  eR_758, eR_759, eR_760, eR_770, eR_771, eR_774, eR_775, eR_778, eR_779, eR_780, eR_781, eR_782, eR_783, eR_788, eR_789, eR_790,
  eR_791, eR_798, eR_799, eR_800, eR_801, eR_802, eR_803, eR_804, eR_805, eR_806, eR_807, eR_808, eR_809, eR_812, eR_813, eR_814,
  eR_815, eR_816, eR_817, eR_818, eR_819, eR_828, eR_829, eR_832, eR_833, eR_838, eR_839, eR_840, eR_841, eR_842, eR_843, eR_848,
  eR_849, eR_852, eR_853, eR_854, eR_855, eR_862, eR_863, eR_864, eR_865, eR_866, eR_867, eR_870, eR_871, eR_872, eR_873, eR_876,
  eR_877, eR_878, eR_879, eR_880, eR_881, eR_886, eR_887, eR_888, eR_889, eR_890, eR_891, eR_900, eR_901, eR_902, eR_904, eR_905,
  eR_906, eR_907, eR_908, eR_909, eR_910, eR_914, eR_916, eR_918, eR_919, eR_921, eR_923, eR_924, eR_927, eR_928, eR_931, eR_933,
  eR_934, eR_936, eR_937, eR_938, eR_941, eR_942, eR_944, eR_946, eR_949, eR_950, eR_953, eR_955, eR_956, eR_958, eR_959, eR_965,
  eR_966, eR_968, eR_969, eR_970, eR_971, eR_975, eR_976, eR_977, eR_979, eR_980, eR_981, eR_982, eR_983, eR_986, eR_989, eR_998,
  eR_1000, eR_1001, eR_1009, eR_1016, eR_1017, eR_1020, eR_1021, eR_1022, eR_1023]
theorem nbOKR_430 : nbR_430 = nbhd entsR eR_430 := by decide +kernel
theorem mkOKR_430 : mkEnt 32 1024 W rR_430 430 = eR_430 := by decide +kernel
theorem tR_430 : kTermA 4294967295 eR_430 nbR_430 = 99635647030494719286032898 := by decide +kernel


end RamseyCert
