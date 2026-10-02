// Flip search (tabu and annealing) for weighted two-colour blow-ups, all flip deltas kept in tables.
// Colour c (red: cv=1, blue: cv=0): Z_c(a,k) = [k != a and A[a][k] == cv], d_c(a) = [A[a][a] == cv],
//   T_c(a,b) = sum_{k,l} w_k w_l Z_ak Z_bk Z_al Z_bl M_kl   (M = Z + diag(d))
//   S_c(a,b) = sum_k w_k Z_ak Z_bk,  V_c(a) = sum_{k,l} w_k w_l Z_ak Z_al M_kl,  zw_c = Z_c w
// G_c(a,b) = 12 wa wb [T + S (wa da + wb db)] + 4 wa^3 wb da + 4 wa wb^3 db + 6 wa^2 wb^2 da db
// G_c(a,a) = 6 wa^2 V + 4 wa^3 zw + wa^4 ;  flip delta = (1-2A)(G_red - G_blue)
// Tables: D = T_red - T_blue, Sr, Sb, Vd = V_red - V_blue, zd = zw_red - zw_blue.
#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct {
    int n; const double *w; int8_t *A; double *D, *Sr, *Sb, *Vd, *zd;
    double *g; int *idx;
} St;

static uint64_t rs;
static inline uint64_t rnd(void) { rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }

// e = change of this colour's entry Z_pq (+1/-1); sgn = +1 red, -1 blue.
static void flip_pair(St *s, int cv, double sgn, int p, int q, double e) {
    int n = s->n, m = 0; const double *w = s->w; double *g = s->g, *D = s->D; int *idx = s->idx;
    double *S = cv ? s->Sr : s->Sb;
    const int8_t *Ap = s->A + (size_t)p * n, *Aq = s->A + (size_t)q * n;
    for (int k = 0; k < n; k++) if (Ap[k] == cv && Aq[k] == cv && k != p && k != q) idx[m++] = k;
    for (int b = 0; b < n; b++) g[b] = 0;
    for (int t = 0; t < m; t++) {
        int k = idx[t]; double wk = w[k]; const int8_t *Ak = s->A + (size_t)k * n;
        for (int b = 0; b < n; b++) g[b] += (Ak[b] == cv) ? wk : 0.0;
        if (Ak[k] == cv) g[k] -= wk;
    }
    double c = sgn * 2 * e * w[p] * w[q];
    for (int t = 0; t < m; t++) {
        double *Da = D + (size_t)idx[t] * n;
        for (int u = 0; u < m; u++) Da[idx[u]] += c;
        s->Vd[idx[t]] += c;
    }
    double dp = (Ap[p] == cv), dq = (Aq[q] == cv), wp = w[p], wq = w[q];
    double spq = S[(size_t)p * n + q];
    for (int b = 0; b < n; b++) {
        if (b == p || b == q) continue;
        if (Aq[b] == cv) {
            double x = sgn * e * (2 * wq * g[b] + wq * wq * dq);
            D[(size_t)p * n + b] += x; D[(size_t)b * n + p] += x;
            S[(size_t)p * n + b] += e * wq; S[(size_t)b * n + p] += e * wq;
        }
        if (Ap[b] == cv) {
            double y = sgn * e * (2 * wp * g[b] + wp * wp * dp);
            D[(size_t)q * n + b] += y; D[(size_t)b * n + q] += y;
            S[(size_t)q * n + b] += e * wp; S[(size_t)b * n + q] += e * wp;
        }
    }
    s->Vd[p] += sgn * e * (2 * wq * spq + wq * wq * dq);
    s->Vd[q] += sgn * e * (2 * wp * spq + wp * wp * dp);
    s->zd[p] += sgn * e * wq; s->zd[q] += sgn * e * wp;
}

static void flip_loop(St *s, int cv, double sgn, int p, double e) {
    int n = s->n, m = 0; int *idx = s->idx; const int8_t *Ap = s->A + (size_t)p * n;
    for (int k = 0; k < n; k++) if (Ap[k] == cv && k != p) idx[m++] = k;
    double c = sgn * e * s->w[p] * s->w[p];
    for (int t = 0; t < m; t++) {
        double *Da = s->D + (size_t)idx[t] * n;
        for (int u = 0; u < m; u++) Da[idx[u]] += c;
        s->Vd[idx[t]] += c;
    }
}

static void apply(St *s, int a, int b) {
    int n = s->n;
    double e = 1.0 - 2.0 * s->A[(size_t)a * n + b];   // change of the red entry
    if (a == b) {
        flip_loop(s, 1, 1.0, a, e); flip_loop(s, 0, -1.0, a, -e);
        s->A[(size_t)a * n + a] ^= 1;
    } else {
        flip_pair(s, 1, 1.0, a, b, e); flip_pair(s, 0, -1.0, a, b, -e);
        s->A[(size_t)a * n + b] ^= 1; s->A[(size_t)b * n + a] ^= 1;
    }
}

static inline double delta(const St *s, int a, int b) {
    int n = s->n; size_t r = (size_t)a * n; const double *w = s->w; const int8_t *A = s->A;
    double wa = w[a];
    if (a == b) return (1 - 2 * A[r + a]) * (6 * wa * wa * s->Vd[a] + 4 * wa * wa * wa * s->zd[a]);
    double wb = w[b], da = A[r + a], ea = 1 - da, d2 = A[(size_t)b * n + b], e2 = 1 - d2;
    double gd = wa * wb * (12 * (s->D[r + b] + s->Sr[r + b] * (wa * da + wb * d2) - s->Sb[r + b] * (wa * ea + wb * e2))
                           + 4 * wa * wa * (da - ea) + 4 * wb * wb * (d2 - e2) + 6 * wa * wb * (da * d2 - ea * e2));
    return (1 - 2 * A[r + b]) * gd;
}

static St mk(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb, double *Vd, double *zd) {
    St s = {n, w, A, D, Sr, Sb, Vd, zd, malloc(sizeof(double) * n), malloc(sizeof(int) * n)};
    return s;
}

static double elapsed(const struct timespec *t0) {
    struct timespec t1; clock_gettime(CLOCK_MONOTONIC, &t1);
    return (t1.tv_sec - t0->tv_sec) + 1e-9 * (t1.tv_nsec - t0->tv_nsec);
}

double mean_abs_delta(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb,
                      double *Vd, double *zd, uint64_t seed) {
    St s = mk(n, w, A, D, Sr, Sb, Vd, zd);
    rs = seed * 0x9E3779B97F4A7C15ULL + 88172645463325252ULL;
    double t = 0; int m = 20000;
    for (int i = 0; i < m; i++) { int a = rnd() % n, b = rnd() % n; t += fabs(delta(&s, a, b)); }
    free(s.g); free(s.idx);
    return t / m;
}

// Best-move tabu with random tenure in [tlo, thi]; aspiration on a new best.
long tabu_run(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb, double *Vd, double *zd,
              int32_t *tabu, long it0, long steps, double seconds, int tlo, int thi, uint64_t seed, double tol,
              double *cur, double *best, int8_t *bestA, long *nbest) {
    St s = mk(n, w, A, D, Sr, Sb, Vd, zd);
    rs = seed * 0x9E3779B97F4A7C15ULL + 88172645463325252ULL;
    struct timespec t0; clock_gettime(CLOCK_MONOTONIC, &t0);
    long it;
    for (it = 0; it < steps; it++) {
        if ((it & 15) == 0 && elapsed(&t0) > seconds) break;
        long now = it0 + it;
        double bd = 1e300; int ba = -1, bb = -1; long ties = 0;
        for (int a = 0; a < n; a++) {
            const int32_t *tr = tabu + (size_t)a * n;
            for (int b = a; b < n; b++) {
                double dl = delta(&s, a, b);
                if (dl > bd) continue;
                if (tr[b] > now && !(*cur + dl < *best - tol)) continue;
                if (dl < bd) { bd = dl; ba = a; bb = b; ties = 1; }
                else { ties++; if (rnd() % ties == 0) { ba = a; bb = b; } }
            }
        }
        if (ba < 0) break;
        apply(&s, ba, bb);
        int ten = tlo + (int)(rnd() % (uint64_t)(thi - tlo + 1));
        tabu[(size_t)ba * n + bb] = tabu[(size_t)bb * n + ba] = (int32_t)(now + 1 + ten);
        *cur += bd;
        if (*cur < *best - tol) { *best = *cur; memcpy(bestA, A, (size_t)n * n); (*nbest)++; }
    }
    free(s.g); free(s.idx);
    return it;
}

// Metropolis at fixed temperature for `seconds`. Returns accepted moves; *props counts proposals.
long sa_run(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb, double *Vd, double *zd,
            double temp, double seconds, uint64_t seed, double tol,
            double *cur, double *best, int8_t *bestA, long *nbest, long *props,
            const int32_t *pl, long npl, double pmix) {
    uint64_t mixthr = (uint64_t)(pmix * 4294967296.0);
    St s = mk(n, w, A, D, Sr, Sb, Vd, zd);
    rs = seed * 0x9E3779B97F4A7C15ULL + 88172645463325252ULL;
    struct timespec t0; clock_gettime(CLOCK_MONOTONIC, &t0);
    long acc = 0, pr = 0; int dirty = 0;
    for (;;) {
        if ((pr & 1023) == 0 && elapsed(&t0) > seconds) break;
        pr++;
        uint64_t r = rnd();
        int a = (int)((r & 0xffffffffULL) * (uint64_t)n >> 32), b = (int)((r >> 32) * (uint64_t)n >> 32);
        if (npl > 0) {
            uint64_t r2 = rnd();
            if ((r2 & 0xffffffffULL) < mixthr) {
                long k = (long)((r2 >> 32) * (uint64_t)npl >> 32);
                a = pl[2 * k]; b = pl[2 * k + 1];
            }
        }
        double dl = delta(&s, a, b);
        if (dl > 0) {
            if (temp <= 0) continue;
            double u = (double)(rnd() >> 11) * (1.0 / 9007199254740992.0);
            if (u >= exp(-dl / temp)) continue;
            if (dirty) { memcpy(bestA, A, (size_t)n * n); dirty = 0; }   // leaving a new best: snapshot it
        }
        apply(&s, a, b);
        acc++;
        *cur += dl;
        if (*cur < *best - tol) { *best = *cur; dirty = 1; (*nbest)++; }
    }
    if (dirty) memcpy(bestA, A, (size_t)n * n);
    free(s.g); free(s.idx);
    *props = pr;
    return acc;
}

// ---- compound moves ---------------------------------------------------------------------------
// Two flips sharing vertex v: (v,p) and (v,q). E contains x_vp * x_vq * C with
// C = [colour c of pq] * (24 wv wp wq * sum_{l not in {v,p,q}} w_l [vl, pl, ql all c] + 12 wv wp wq (wv dv + wp dp + wq dq)).
// Joint delta = delta(v,p) + delta(v,q) + sigma_vp sigma_vq C  (exact).
static inline double coupl(const St *s, int v, int p, int q) {
    int n = s->n; const double *w = s->w; const int8_t *A = s->A;
    const int8_t *Av = A + (size_t)v * n, *Ap = A + (size_t)p * n, *Aq = A + (size_t)q * n;
    int8_t cv = Ap[q];
    double sum = 0;
    for (int l = 0; l < n; l++) sum += (Av[l] == cv && Ap[l] == cv && Aq[l] == cv) ? w[l] : 0.0;
    // remove l in {v,p,q} (their terms used loops or the flipped pairs)
    if (Av[v] == cv && Ap[v] == cv && Aq[v] == cv) sum -= w[v];
    if (Av[p] == cv && Ap[p] == cv && Aq[p] == cv) sum -= w[p];
    if (Av[q] == cv && Ap[q] == cv && Aq[q] == cv) sum -= w[q];
    double c = 24 * w[v] * w[p] * w[q] * sum
             + 12 * w[v] * w[p] * w[q] * (w[v] * (Av[v] == cv) + w[p] * (Ap[p] == cv) + w[q] * (Aq[q] == cv));
    return (1 - 2 * Av[p]) * (1 - 2 * Av[q]) * c;
}

double pair_delta_x(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb, double *Vd, double *zd,
                    int a, int b) {
    St s = {n, w, A, D, Sr, Sb, Vd, zd, 0, 0};
    return delta(&s, a, b);
}
double coupl_x(int n, const double *w, int8_t *A, int v, int p, int q) {
    St s = {n, w, A, 0, 0, 0, 0, 0, 0, 0};
    return coupl(&s, v, p, q);
}

// SA with single flips, rotations (two soft pairs at a vertex) and 4-cycle switches over soft pairs.
// nb: n*maxd soft neighbours, cnt: per-vertex counts, sm: n*n byte soft-pair indicator.
// pm[0..2]: probabilities of single / rotation / 4-cycle. stats[0..5]: proposed/accepted per type.
long sa2_run(int n, const double *w, int8_t *A, double *D, double *Sr, double *Sb, double *Vd, double *zd,
             double temp, double seconds, uint64_t seed, double tol,
             double *cur, double *best, int8_t *bestA, long *nbest,
             const int32_t *nb, const int32_t *cnt, int maxd, const int8_t *sm,
             const double *pm, long *stats) {
    St s = mk(n, w, A, D, Sr, Sb, Vd, zd);
    rs = seed * 0x9E3779B97F4A7C15ULL + 88172645463325252ULL;
    struct timespec t0; clock_gettime(CLOCK_MONOTONIC, &t0);
    long pr = 0, acc = 0; int dirty = 0;
    uint64_t th1 = (uint64_t)(pm[0] * 4294967296.0), th2 = (uint64_t)((pm[0] + pm[1]) * 4294967296.0);
    int fa[4], fb[4], cand[1024];
    uint64_t thalt = (uint64_t)(pm[3] * 4294967296.0);
    for (;;) {
        if ((pr & 255) == 0 && elapsed(&t0) > seconds) break;
        pr++;
        uint64_t r = rnd();
        uint64_t sel = r & 0xffffffffULL;
        int a = (int)((r >> 32) * (uint64_t)n >> 32);
        int nf = 0, type; double da;
        if (cnt[a] < 2) continue;
        uint64_t r2 = rnd();
        int b = nb[(size_t)a * maxd + (int)((r2 & 0xffffffffULL) * (uint64_t)cnt[a] >> 32)];
        int d = nb[(size_t)a * maxd + (int)((r2 >> 32) * (uint64_t)cnt[a] >> 32)];
        if (sel < th1) {
            type = 0; nf = 1; fa[0] = a; fb[0] = b;
            da = delta(&s, a, b);
        } else if (sel < th2) {
            if (b == d) continue;
            if (A[(size_t)a * n + b] == A[(size_t)a * n + d] && (rnd() & 0xffffffffULL) >= thalt) continue;
            type = 1; nf = 2; fa[0] = a; fb[0] = b; fa[1] = a; fb[1] = d;
            da = delta(&s, a, b) + delta(&s, a, d);
            da += coupl(&s, a, b, d);
        } else {
            if (b == d) continue;
            int m = 0;
            const int32_t *nbb = nb + (size_t)b * maxd;
            for (int t = 0; t < cnt[b]; t++) { int c = nbb[t]; if (c != a && c != d && sm[(size_t)c * n + d]) cand[m++] = c; }
            if (m == 0) continue;
            int c = cand[rnd() % (uint64_t)m];
            {
                int8_t c1 = A[(size_t)a * n + b], c2 = A[(size_t)b * n + c], c3 = A[(size_t)c * n + d], c4 = A[(size_t)d * n + a];
                if (!(c1 != c2 && c2 != c3 && c3 != c4) && (rnd() & 0xffffffffULL) >= thalt) continue;
            }
            type = 2; nf = 4;
            fa[0] = a; fb[0] = b; fa[1] = b; fb[1] = c; fa[2] = c; fb[2] = d; fa[3] = d; fb[3] = a;
            da = delta(&s, a, b) + delta(&s, b, c) + delta(&s, c, d) + delta(&s, d, a);
            da += coupl(&s, b, a, c) + coupl(&s, c, b, d) + coupl(&s, d, c, a) + coupl(&s, a, d, b);
        }
        stats[type]++;
        double u = 2.0;
        if (da > 0) {
            if (temp <= 0) continue;
            u = (double)(rnd() >> 11) * (1.0 / 9007199254740992.0);
            if (u >= exp(-da / temp)) continue;
        }
        if (dirty) { memcpy(bestA, A, (size_t)n * n); dirty = 0; }
        double de = 0;
        for (int i = 0; i < nf; i++) { de += delta(&s, fa[i], fb[i]); apply(&s, fa[i], fb[i]); }
        int ok = 1;
        if (de > 0) {
            if (temp <= 0) ok = 0;
            else {
                if (u > 1.0) u = (double)(rnd() >> 11) * (1.0 / 9007199254740992.0);
                if (u >= exp(-de / temp)) ok = 0;
            }
        }
        if (!ok) {   // exact delta disagrees with the estimate: undo
            for (int i = nf - 1; i >= 0; i--) apply(&s, fa[i], fb[i]);
            stats[6]++;
            continue;
        }
        acc++; stats[3 + type]++;
        *cur += de;
        if (*cur < *best - tol) { *best = *cur; dirty = 1; (*nbest)++; }
    }
    if (dirty) memcpy(bestA, A, (size_t)n * n);
    free(s.g); free(s.idx);
    stats[7] += pr;
    return acc;
}
