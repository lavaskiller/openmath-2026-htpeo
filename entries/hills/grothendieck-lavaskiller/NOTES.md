# grothendieck-constant-witnesses

**Candidate** (`solution.json`): CHSH matrix `[[1,1],[1,-1]]`, d = 2,
u1 = (4/5, 3/5), u2 = (-3/5, 4/5), v1 = (28/197, 195/197), v2 = (195/197, -28/197).

**Metrics** (hill's own `_load_solution`, `_sign_optimum`, `_vector_objective`, `_certificate_bits`; the private fixture check `_load_fixture` cannot run locally):
gap_ppm **1,414,213**, matrix_area **4**, certificate_bits **80**. Objective 2786/985, sign optimum 2, ratio 1393/985 = 1.4142131979...

**Board (2026-10-02T16:23Z)**: 1,414,213 / 4 / 80 held by 6 accounts, then 86 bits. This candidate **ties rank 1**.

**Can 80 be beaten?** No, for the 2x2 matrix: `search_bits.py` enumerates every rational unit vector in the plane with denominator <= 65536 and bit cost <= 70 and every quadruple (u1 in one octant by symmetry, sign changes free because bit_length ignores sign); result: no certificate with <= 79 bits reaches 1,414,213 (`search_65536_le79.json`: empty), and exactly 4 symmetric variants at 80 bits. A vector with denominator > 65536 costs >= 52 bits, leaving <= 27 bits for the other three vectors, which then cannot contain the near-45-degree pair that is needed (the cheapest such pair costs far more). Extra dimensions only add bits (each coordinate costs at least 1 bit). So 80 is the minimum at gap_ppm 1,414,213 and area 4.

gap_ppm >= 1,414,214 would need a +-1 matrix up to 8x8 with ratio above sqrt(2); not attempted (a public write-up of another team reports annealing over sign matrices up to 8x8 without finding any).

**Known vs new**: known construction (CHSH with Pythagorean-triple rotations 3-4-5 and 28-195-197, whose angle difference is close to 45 degrees). Same value as the public 80-bit solutions; not new.

Code: `search_bits.py` (plain Python, ~2 min for N = 65536).
