// Exhaustive sandwich minimum of support over all invertible {-1,0,1} matrices modulo monomial
// factors (246 classes per side): U'=P U Q, V'=adj(Q) V R, W'=adj(P)^T W adj(R)^T.
// Returns the minimal support (scalars do not change support). X is R x 3 x 9 in hill coordinates.
#define NCL 300
static int ncl = 0;
static int CP[NCL][9], CQ[NCL][9], CPAT[NCL][9], CQADJ[NCL][9], CRADJT[NCL][9];
static void adjugate(const int *m, int *a) {
  a[0] = m[4] * m[8] - m[5] * m[7]; a[1] = -(m[1] * m[8] - m[2] * m[7]); a[2] = m[1] * m[5] - m[2] * m[4];
  a[3] = -(m[3] * m[8] - m[5] * m[6]); a[4] = m[0] * m[8] - m[2] * m[6]; a[5] = -(m[0] * m[5] - m[2] * m[3]);
  a[6] = m[3] * m[7] - m[4] * m[6]; a[7] = -(m[0] * m[7] - m[1] * m[6]); a[8] = m[0] * m[4] - m[1] * m[3];
}
static void transpose3(const int *m, int *t) { for (int i = 0; i < 3; i++) for (int j = 0; j < 3; j++) t[3 * i + j] = m[3 * j + i]; }
static void sand_init(void) {
  int vec[13][3], nv = 0;
  for (int a = -1; a <= 1; a++) for (int b = -1; b <= 1; b++) for (int c = -1; c <= 1; c++) {
    int f = a ? a : (b ? b : c); if (f <= 0) continue; vec[nv][0] = a; vec[nv][1] = b; vec[nv][2] = c; nv++; }
  for (int i = 0; i < nv; i++) for (int j = i + 1; j < nv; j++) for (int k = j + 1; k < nv; k++) {
    int m[9] = { vec[i][0], vec[i][1], vec[i][2], vec[j][0], vec[j][1], vec[j][2], vec[k][0], vec[k][1], vec[k][2] };
    int det = m[0] * (m[4] * m[8] - m[5] * m[7]) - m[1] * (m[3] * m[8] - m[5] * m[6]) + m[2] * (m[3] * m[7] - m[4] * m[6]);
    if (!det) continue;
    int ad[9], q[9];
    memcpy(CP[ncl], m, sizeof m);           // P: rows
    transpose3(m, q); memcpy(CQ[ncl], q, sizeof q);   // Q / R: columns
    adjugate(m, ad); transpose3(ad, CPAT[ncl]);        // adj(P)^T
    adjugate(q, ad); memcpy(CQADJ[ncl], ad, sizeof ad); // adj(Q)
    transpose3(ad, CRADJT[ncl]);                        // adj(R)^T
    ncl++; }
}
static inline void mm3(const int *a, const int *b, int *c) {
  for (int i = 0; i < 3; i++) for (int j = 0; j < 3; j++) c[3 * i + j] = a[3 * i] * b[j] + a[3 * i + 1] * b[3 + j] + a[3 * i + 2] * b[6 + j];
}
static unsigned short fU[NCL][NCL], fV[NCL][NCL], fW[NCL][NCL];
static int sand_min(int (*X)[3][9], int R_) {
  static int LU[NCL][MAXR][9], LV[NCL][MAXR][9], LW[NCL][MAXR][9];
  int Wm[MAXR][9];
  for (int t = 0; t < R_; t++) transpose3(X[t][2], Wm[t]);   // w index 3k+i -> W[i][k]
  for (int p = 0; p < ncl; p++) for (int t = 0; t < R_; t++) {
    mm3(CP[p], X[t][0], LU[p][t]); mm3(CQADJ[p], X[t][1], LV[p][t]); mm3(CPAT[p], Wm[t], LW[p][t]); }
  int tmp[9];
  for (int p = 0; p < ncl; p++) for (int q = 0; q < ncl; q++) {
    int su = 0, sv = 0, sw = 0;
    for (int t = 0; t < R_; t++) {
      mm3(LU[p][t], CQ[q], tmp); for (int c = 0; c < 9; c++) su += tmp[c] != 0;
      mm3(LV[p][t], CQ[q], tmp); for (int c = 0; c < 9; c++) sv += tmp[c] != 0;
      mm3(LW[p][t], CRADJT[q], tmp); for (int c = 0; c < 9; c++) sw += tmp[c] != 0; }
    fU[p][q] = su; fV[p][q] = sv; fW[p][q] = sw; }
  int best = 1 << 30;
  for (int q = 0; q < ncl; q++) {
    // min over p, r of fU[p][q] + fW[p][r] + fV[q][r]
    for (int p = 0; p < ncl; p++) { int base = fU[p][q]; if (base >= best) continue;
      const unsigned short *fw = fW[p], *fv = fV[q];
      for (int r = 0; r < ncl; r++) { int s = base + fw[r] + fv[r]; if (s < best) best = s; } } }
  return best;
}
