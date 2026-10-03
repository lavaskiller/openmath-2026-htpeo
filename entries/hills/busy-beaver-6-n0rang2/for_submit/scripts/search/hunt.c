/* C port of the max-first-use restart climb (dev tool; numbers are unofficial).
 * For a complete machine M, tau(e) = number of transitions executed before entry e is first
 * used; replacing e by a halting entry gives a machine halting after exactly tau(e)+1 steps
 * (valid if all six states were visited within the first tau(e) transitions).
 * Restart climbs maximise F = max valid tau(e)+1 subject to F <= cap; climbs ending at
 * F >= 200000 also scan all single mutants and `doubles` random double mutants of their end
 * point. Every halter with lo <= T <= hi is appended to <outfile> as "T machine", where the
 * machine is written A0A1_B0B1_..._F0F1 with entries like 1RB and the halting entry 1RH.
 *
 * Mode 2 (engine + tail): climb G = tau_(11)+1 (the second-to-last first use) subject to
 * G <= cap. At T0 = tau_(11) two entries are still unused, so they cannot affect the run up to
 * T0: for every engine with G >= glo, rerun to T0, define the 11th entry in all 24 ways and
 * halt at the first use of the 12th entry; each leaf is a machine halting at T0 + delta.
 * Mode 2 records the plain first-use halters too.
 *
 * usage: hunt <seed> <seconds> <lo> <hi> <cap> <doubles> <outfile> [mode glo]
 *        hunt --check <machine-string>     (prints first-use times; self-test)
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>

#ifndef LMAX
#define LMAX 262144L
#endif
#define CEN (LMAX + 8)
#define TAPESZ (2 * CEN + 16)

static uint8_t tape[TAPESZ], snapbuf[TAPESZ];
static int wr[12], mv[12], nx[12];
static long first_[12];
static uint64_t rs = 88172645463325252ULL;
static long lo_, hi_, cap_;
static FILE *out;
static long long evals, hits;

static inline uint64_t rnd64(void) { rs ^= rs >> 12; rs ^= rs << 25; rs ^= rs >> 27; return rs * 2685821657736338717ULL; }
static inline int rnd(int n) { return (int)((rnd64() >> 33) % (uint64_t)n); }
static inline void setEntry(int i, int code) { wr[i] = code & 1; mv[i] = ((code >> 1) & 1) ? 1 : -1; nx[i] = code >> 2; }
static double now(void) { struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts); return ts.tv_sec + 1e-9 * ts.tv_nsec; }

static void machineString(int haltIdx, char *buf) {
    int p = 0;
    for (int i = 0; i < 12; i++) {
        if (i == haltIdx) { buf[p++] = '1'; buf[p++] = 'R'; buf[p++] = 'H'; }
        else { buf[p++] = (char)('0' + wr[i]); buf[p++] = mv[i] > 0 ? 'R' : 'L'; buf[p++] = (char)('A' + nx[i]); }
        if ((i & 1) && i < 11) buf[p++] = '_';
    }
    buf[p] = 0;
}

#define ESIZE (1 << 18)
static uint64_t eset[ESIZE];
static long evaluate(long cap, long *Fu, int record);
/* for a machine that produced a hit, also run the relabelings that start in each other state */
static int inRelabel;
static void relabelVariants(void) {
    if (inRelabel) return;
    inRelabel = 1;
    int bw[12], bm[12], bn[12]; long Fu;
    memcpy(bw, wr, sizeof bw); memcpy(bm, mv, sizeof bm); memcpy(bn, nx, sizeof bn);
    for (int X = 1; X < 6; X++) {
        int p[6] = {0, 1, 2, 3, 4, 5}; p[0] = X; p[X] = 0;
        for (int s = 0; s < 6; s++) for (int b = 0; b < 2; b++) {
            int i = 2 * s + b, j = 2 * p[s] + b;
            wr[j] = bw[i]; mv[j] = bm[i]; nx[j] = p[bn[i]];
        }
        evaluate(LMAX, &Fu, 1);
    }
    memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
    inRelabel = 0;
}
static void emit(long T, int haltIdx) {
    char buf[64];
    machineString(haltIdx, buf);
    /* de-duplicate exact repeats (re-evaluations, mutations of the unused halting slot) */
    uint64_t k = 1469598103934665603ULL ^ (uint64_t)T;
    for (const char *p = buf; *p; p++) k = (k ^ (uint8_t)*p) * 1099511628211ULL;
    if (!k) k = 1;
    uint64_t i = (k * 0x9E3779B97F4A7C15ULL) >> 46;
    for (int probe = 0; probe < 32; probe++, i = (i + 1) & (ESIZE - 1)) {
        if (eset[i] == k) return;
        if (!eset[i]) { eset[i] = k; break; }
    }
    fprintf(out, "%ld %s\n", T, buf);
    fflush(out);
    hits++;
    relabelVariants();
}

/* returns F (<= cap, or -1); *Fu = uncapped max */
static long evaluate(long cap, long *Fu, int record) {
    evals++;
    for (int i = 0; i < 12; i++) first_[i] = -1;
    int s = 0, visited = 1, nUsed = 0, snapS = -1;
    long h = CEN, t = 0, minH = CEN, maxH = CEN, tAll = -1;
    long nextSnap = 64, snapH = -1, snapMin = CEN, snapMax = CEN;
    for (;;) {
        int idx = 2 * s + tape[h];
        if (first_[idx] < 0) { first_[idx] = t; if (++nUsed == 12) break; }
        tape[h] = (uint8_t)wr[idx]; h += mv[idx]; t++;
        if (h < minH) minH = h; else if (h > maxH) maxH = h;
        s = nx[idx];
        if (visited != 63) { visited |= 1 << s; if (visited == 63) tAll = t; }
        if (s == snapS && h == snapH) {
            long a = minH < snapMin ? minH : snapMin, b = maxH > snapMax ? maxH : snapMax;
            int same = 1;
            for (long i = a; i <= b; i++) {
                int sv = (i >= snapMin && i <= snapMax) ? snapbuf[i] : 0;
                if (tape[i] != sv) { same = 0; break; }
            }
            if (same) break;
        }
        if (t == nextSnap) {
            snapS = s; snapH = h; snapMin = minH; snapMax = maxH;
            memcpy(snapbuf + minH, tape + minH, (size_t)(maxH - minH + 1));
            nextSnap *= 2;
            if (t >= 1024 && maxH - minH > (t >> 3)) break;
        }
        if (t >= LMAX) break;
    }
    memset(tape + minH, 0, (size_t)(maxH - minH + 1));
    *Fu = -1;
    if (tAll < 0) return -1;
    long F = -1, fl[12];
    memcpy(fl, first_, sizeof fl); /* emit() may re-enter evaluate() and overwrite first_ */
    for (int e = 0; e < 12; e++) {
        long tau = fl[e];
        if (tau < tAll) continue; /* also skips never-used entries (tau = -1) */
        long T = tau + 1;
        if (T > *Fu) *Fu = T;
        if (T <= cap && T > F) F = T;
        if (record && T >= lo_ && T <= hi_) emit(T, e);
    }
    memcpy(first_, fl, sizeof fl);
    return F;
}

/* ---------- mode 2: engine + tail ---------- */
static int mode_ = 1;
static long glo_ = 200000;
static long long engines, leaves;
#define HSIZE (1 << 20)
static uint64_t hset[HSIZE];
static int hinsert(uint64_t k) { /* 1 if newly inserted */
    if (!k) k = 1;
    uint64_t i = (k * 0x9E3779B97F4A7C15ULL) >> 44;
    for (int probe = 0; probe < 64; probe++, i = (i + 1) & (HSIZE - 1)) {
        if (hset[i] == k) return 0;
        if (!hset[i]) { hset[i] = k; return 1; }
    }
    hset[(k * 0x9E3779B97F4A7C15ULL) >> 44] = k; /* table crowded: overwrite */
    return 1;
}

/* second-largest finite first-use time among entries (after an evaluate), and the two free entries */
static long secondLast(int *e11, int *e12) {
    long a = -1, b = -1; int ia = -1, ib = -1;
    for (int e = 0; e < 12; e++) {
        long t = first_[e]; if (t < 0) continue;
        if (t > a) { b = a; ib = ia; a = t; ia = e; } else if (t > b) { b = t; ib = e; }
    }
    int unused = -1, nun = 0;
    for (int e = 0; e < 12; e++) if (first_[e] < 0) { unused = e; nun++; }
    if (nun == 1) { *e11 = ia; *e12 = unused; return a; }      /* 11 used: tau_(11) = max */
    if (nun == 0) { *e11 = ib; *e12 = ia; return b; }          /* 12 used: tau_(11) = second max */
    return -1;
}

static uint8_t cfgTape[TAPESZ];
static void tail(int e11, int e12, long T0) {
    /* run the engine to T0 (entries e11/e12 are never used before T0) */
    int s = 0, visited = 1; long h = CEN, t = 0, minH = CEN, maxH = CEN;
    while (t < T0) {
        int idx = 2 * s + tape[h];
        tape[h] = (uint8_t)wr[idx]; h += mv[idx]; t++;
        if (h < minH) minH = h; else if (h > maxH) maxH = h;
        s = nx[idx]; visited |= 1 << s;
    }
    int cs = s, cv = visited; long ch = h, cmin = minH, cmax = maxH;
    memcpy(cfgTape + minH, tape + minH, (size_t)(maxH - minH + 1));
    int ow = wr[e11], om = mv[e11], on = nx[e11];
    for (int code = 0; code < 24; code++) {
        setEntry(e11, code);
        /* restore configuration */
        memset(tape + minH, 0, (size_t)(maxH - minH + 1));
        memcpy(tape + cmin, cfgTape + cmin, (size_t)(cmax - cmin + 1));
        s = cs; visited = cv; h = ch; minH = cmin; maxH = cmax; t = T0;
        long nextSnap = T0 + 64, snapH = -1, snapMin = 0, snapMax = -1; int snapS = -1;
        leaves++;
        for (;;) {
            int idx = 2 * s + tape[h];
            if (idx == e12) {
                if (visited == 63 && t + 1 >= lo_ && t + 1 <= hi_) {
                    int sw = wr[e12], sm = mv[e12], sn = nx[e12];
                    emit(t + 1, e12);
                    wr[e12] = sw; mv[e12] = sm; nx[e12] = sn;
                }
                break;
            }
            tape[h] = (uint8_t)wr[idx]; h += mv[idx]; t++;
            if (h < minH) minH = h; else if (h > maxH) maxH = h;
            s = nx[idx]; visited |= 1 << s;
            if (t > hi_) break;
            if (s == snapS && h == snapH) {
                long a = minH < snapMin ? minH : snapMin, b = maxH > snapMax ? maxH : snapMax;
                int same = 1;
                for (long i = a; i <= b; i++) {
                    int sv = (i >= snapMin && i <= snapMax) ? snapbuf[i] : 0;
                    if (tape[i] != sv) { same = 0; break; }
                }
                if (same) break;
            }
            if (t == nextSnap) {
                snapS = s; snapH = h; snapMin = minH; snapMax = maxH;
                memcpy(snapbuf + minH, tape + minH, (size_t)(maxH - minH + 1));
                nextSnap = T0 + 2 * (nextSnap - T0);
            }
        }
    }
    memset(tape + minH, 0, (size_t)(maxH - minH + 1));
    memset(tape + cmin, 0, (size_t)(cmax - cmin + 1));
    wr[e11] = ow; mv[e11] = om; nx[e11] = on;
}

/* mode-2 objective with tail enumeration for new engines */
static long evaluate2(long cap) {
    long Fu;
    evaluate(LMAX, &Fu, 1);
    int e11 = -1, e12 = -1;
    long T0 = secondLast(&e11, &e12);
    if (T0 < 0) return -1;
    long G = T0 + 1;
    if (G > cap) return -1;
    if (G >= glo_) {
        uint64_t k = 1469598103934665603ULL;
        for (int e = 0; e < 12; e++) {
            if (e == e11 || e == e12) { k = (k ^ 255) * 1099511628211ULL; continue; }
            k = (k ^ (uint64_t)(wr[e] + 2 * (mv[e] > 0) + 4 * nx[e])) * 1099511628211ULL;
        }
        k = (k ^ (uint64_t)(e11 * 16 + e12)) * 1099511628211ULL;
        if (hinsert(k)) { engines++; inRelabel = 1; tail(e11, e12, T0); inRelabel = 0; }
    }
    return G;
}

static int doubles_;
static void scan(void) {
    int bw[12], bm[12], bn[12];
    long Fu;
    memcpy(bw, wr, sizeof bw); memcpy(bm, mv, sizeof bm); memcpy(bn, nx, sizeof bn);
    for (int i = 0; i < 12; i++) {
        for (int c = 0; c < 24; c++) {
            memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
            setEntry(i, c);
            if (wr[i] == bw[i] && mv[i] == bm[i] && nx[i] == bn[i]) continue;
            evaluate(LMAX, &Fu, 1);
        }
    }
    for (int d = 0; d < doubles_; d++) {
        memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
        int i = rnd(12), j = rnd(11); if (j >= i) j++;
        setEntry(i, rnd(24)); setEntry(j, rnd(24));
        evaluate(LMAX, &Fu, 1);
    }
    memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
}

static long objective(void) {
    long Fu;
    return mode_ == 2 ? evaluate2(cap_) : evaluate(cap_, &Fu, 1);
}

/* archive of mid-level climb end points (mode 1b restarts from them) */
#define ARCH 4096
static int archive_[ARCH][12];
static int narch;
static int useArchive;

static long climb(void) {
    long F = -1;
    if (useArchive && narch > 16 && rnd(2) == 0) {
        const int *a = archive_[rnd(narch)];
        for (int i = 0; i < 12; i++) setEntry(i, a[i]);
        int k = 2 + rnd(2);
        for (int j = 0; j < k; j++) setEntry(rnd(12), rnd(24));
        F = objective();
    }
    for (int tries = 0; tries < 100000 && F < 0; tries++) {
        for (int i = 0; i < 12; i++) setEntry(i, rnd(24));
        F = objective();
    }
    if (F < 0) return F;
    int sw[12], sm[12], sn[12], stale = 0;
    while (stale < (F >= 200000 ? 20000 : F >= 1000 ? 3000 : 500)) {
        memcpy(sw, wr, sizeof sw); memcpy(sm, mv, sizeof sm); memcpy(sn, nx, sizeof sn);
        int k = rnd(3) == 0 ? 2 : 1;
        for (int j = 0; j < k; j++) setEntry(rnd(12), rnd(24));
        long F2 = objective();
        if (F2 >= F) { if (F2 > F) stale = 0; else stale++; F = F2; }
        else { memcpy(wr, sw, sizeof sw); memcpy(mv, sm, sizeof sm); memcpy(nx, sn, sizeof sn); stale++; }
    }
    if (F >= 200000 && mode_ == 1) scan();
    if (useArchive && F >= 2000 && F < 200000) {
        int slot = narch < ARCH ? narch++ : rnd(ARCH);
        for (int i = 0; i < 12; i++) archive_[slot][i] = wr[i] | ((mv[i] > 0) << 1) | (nx[i] << 2);
    }
    return F;
}

static int parseMachine(const char *m) {
    /* A0A1_B0B1_... ; halt entries become free slots (nx = 0) */
    int i = 0;
    for (const char *p = m; *p && i < 12; ) {
        if (*p == '_') { p++; continue; }
        wr[i] = p[0] - '0'; mv[i] = p[1] == 'R' ? 1 : -1; nx[i] = p[2] == 'H' ? 0 : p[2] - 'A';
        i++; p += 3;
    }
    return i == 12;
}

/* exhaustive single + double mutation scan of seed machines ("T machine" lines) */
static int scanSeeds(const char *seedfile, int part, int nparts) {
    FILE *f = fopen(seedfile, "r");
    if (!f) { perror("seedfile"); return 1; }
    char line[256]; long ln = 0, done = 0;
    while (fgets(line, sizeof line, f)) {
        if (ln++ % nparts != part) continue;
        char ms[128]; long T0;
        if (sscanf(line, "%ld %127s", &T0, ms) != 2 || !parseMachine(ms)) continue;
        int halt = -1;
        for (int i = 0, k = 0; ms[k] && i < 12; k++) { if (ms[k] == '_') continue; if (ms[k + 2] == 'H') halt = i; i++; k += 2; }
        int bw[12], bm[12], bn[12]; long Fu;
        memcpy(bw, wr, sizeof bw); memcpy(bm, mv, sizeof bm); memcpy(bn, nx, sizeof bn);
        for (int i = 0; i < 12; i++) {
            if (i == halt) continue;
            for (int c = 0; c < 24; c++) {
                memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
                setEntry(i, c);
                if (wr[i] == bw[i] && mv[i] == bm[i] && nx[i] == bn[i]) continue;
                evaluate(LMAX, &Fu, 1);
                for (int j = i + 1; j < 12; j++) {
                    if (j == halt) continue;
                    int si = wr[i], sm = mv[i], sn = nx[i];
                    for (int d = 0; d < 24; d++) {
                        memcpy(wr, bw, sizeof bw); memcpy(mv, bm, sizeof bm); memcpy(nx, bn, sizeof bn);
                        wr[i] = si; mv[i] = sm; nx[i] = sn;
                        setEntry(j, d);
                        if (wr[j] == bw[j] && mv[j] == bm[j] && nx[j] == bn[j]) continue;
                        evaluate(LMAX, &Fu, 1);
                    }
                }
            }
        }
        done++;
        fprintf(stderr, "seed %ld done (T=%ld), evals=%lld hits=%lld\n", ln, T0, evals, hits);
    }
    fclose(f);
    printf("{\"scan_part\":%d,\"seeds\":%ld,\"evals\":%lld,\"hits\":%lld}\n", part, done, evals, hits);
    return 0;
}

int main(int argc, char **argv) {
    if (argc == 8 && strcmp(argv[1], "--scan") == 0) {
        /* hunt --scan <seedfile> <outfile> <lo> <hi> <part> <nparts> */
        lo_ = atol(argv[4]); hi_ = atol(argv[5]);
        out = fopen(argv[3], "a");
        if (!out) { perror("open"); return 1; }
        int r = scanSeeds(argv[2], atoi(argv[6]), atoi(argv[7]));
        fclose(out);
        return r;
    }
    if (argc == 3 && strcmp(argv[1], "--check") == 0) {
        if (!parseMachine(argv[2])) { fprintf(stderr, "bad machine\n"); return 1; }
        long Fu; lo_ = 1; hi_ = 0; out = stdout;
        long F = evaluate(LMAX, &Fu, 0);
        printf("F=%ld Fu=%ld first:", F, Fu);
        for (int e = 0; e < 12; e++) printf(" %c%d=%ld", 'A' + e / 2, e & 1, first_[e]);
        printf("\n");
        return 0;
    }
    if (argc != 8 && argc != 10) { fprintf(stderr, "usage: hunt <seed> <seconds> <lo> <hi> <cap> <doubles> <outfile> [mode glo]\n"); return 2; }
    if (argc == 10) { mode_ = atoi(argv[8]); glo_ = atol(argv[9]); }
    if (mode_ == 3) { mode_ = 1; useArchive = 1; } /* mode 3 = mode 1 with archive restarts */
    rs ^= (uint64_t)strtoull(argv[1], 0, 10) * 0x9E3779B97F4A7C15ULL; if (!rs) rs = 1;
    for (int i = 0; i < 20; i++) rnd64();
    double seconds = atof(argv[2]);
    lo_ = atol(argv[3]); hi_ = atol(argv[4]); cap_ = atol(argv[5]); doubles_ = atoi(argv[6]);
    out = fopen(argv[7], "a");
    if (!out) { perror("open"); return 1; }
    double t0 = now();
    long restarts = 0, hist[40] = {0}, top[8] = {0};
    while (now() - t0 < seconds) {
        long F = climb();
        restarts++;
        if (F > 0) {
            int k = 63 - __builtin_clzll((unsigned long long)F); hist[k]++;
            for (int j = 0; j < 8; j++) if (F > top[j]) { memmove(top + j + 1, top + j, (7 - j) * sizeof(long)); top[j] = F; break; }
        }
    }
    printf("{\"seed\":%s,\"mode\":%d,\"secs\":%.0f,\"restarts\":%ld,\"evals\":%lld,\"engines\":%lld,\"leaves\":%lld,\"hits\":%lld,\"top\":[",
           argv[1], mode_, now() - t0, restarts, evals, engines, leaves, hits);
    for (int j = 0; j < 8; j++) printf("%s%ld", j ? "," : "", top[j]);
    printf("],\"hist\":{");
    int first = 1;
    for (int k = 0; k < 40; k++) if (hist[k]) { printf("%s\"%d\":%ld", first ? "" : ",", k, hist[k]); first = 0; }
    printf("}}\n");
    fclose(out);
    return 0;
}
