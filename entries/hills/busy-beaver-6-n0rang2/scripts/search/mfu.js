// "Max first use" search (dev tool; numbers are unofficial).
// For a complete halt-free 6-state machine M, let tau(e) be the number of transitions executed
// before entry e is used for the first time. Replacing e by a halting entry gives a machine that
// halts after exactly tau(e)+1 steps (nothing before that first use changes), and it visits all
// six states if M had visited them within the first tau(e) transitions.
// F(M) = max such tau(e)+1 that is <= cap. Simulation stops once all 12 entries are used, on an
// exact configuration repeat, on the runaway heuristic, or at Lmax.
// Elitist local search on F with single/double mutations; every halter with lo <= T <= hi is
// written out (with the halting entry chosen as [1, move, H]; both moves are emitted).
//
// usage: node mfu.js <seconds> <workers> <lo> <hi> <cap> <outfile>
'use strict';
const { Worker, isMainThread, parentPort, workerData } = require('worker_threads');
const fs = require('fs');

const LETTERS = 'ABCDEFH';
const Lmax = 262144;

function toJson(wr, mv, nx, haltIdx, haltMove) {
  const t = {};
  for (let s = 0; s < 6; s++) {
    t[LETTERS[s]] = {};
    for (let b = 0; b < 2; b++) {
      const i = 2 * s + b;
      t[LETTERS[s]][String(b)] = i === haltIdx ? [1, haltMove, 'H'] : [wr[i], mv[i] > 0 ? 'R' : 'L', LETTERS[nx[i]]];
    }
  }
  return { transitions: t };
}

function workerMain() {
  const { seconds, lo, hi, cap, seed } = workerData;
  let x = (seed * 2654435761) >>> 0 || 1;
  function rnd(n) {
    x ^= x << 13; x >>>= 0; x ^= x >>> 17; x ^= x << 5; x >>>= 0;
    return x % n;
  }
  const C = Lmax + 8;
  const tape = new Uint8Array(2 * C + 16);
  const snap = new Uint8Array(2 * C + 16);
  const wr = new Int8Array(12), mv = new Int8Array(12), nx = new Int8Array(12);
  const first = new Int32Array(12);
  let tAll = -1;
  const seen = new Set();

  function evaluate(report) {
    first.fill(-1);
    let s = 0, h = C, t = 0, minH = C, maxH = C, visited = 1, used = 0, nUsed = 0;
    tAll = -1;
    let nextSnap = 64, snapS = -1, snapH = -1, snapMin = C, snapMax = C;
    for (;;) {
      const idx = 2 * s + tape[h];
      if (first[idx] < 0) {
        first[idx] = t;
        if (++nUsed === 12) break;
      }
      tape[h] = wr[idx]; h += mv[idx]; t++;
      if (h < minH) minH = h; else if (h > maxH) maxH = h;
      s = nx[idx];
      if (visited !== 63) { visited |= 1 << s; if (visited === 63) tAll = t; }
      if (s === snapS && h === snapH) {
        const a = minH < snapMin ? minH : snapMin, b = maxH > snapMax ? maxH : snapMax;
        let same = true;
        for (let i = a; i <= b; i++) {
          const sv = (i >= snapMin && i <= snapMax) ? snap[i] : 0;
          if (tape[i] !== sv) { same = false; break; }
        }
        if (same) break;
      }
      if (t === nextSnap) {
        snapS = s; snapH = h; snapMin = minH; snapMax = maxH;
        for (let i = minH; i <= maxH; i++) snap[i] = tape[i];
        nextSnap *= 2;
        if (t >= 1024 && maxH - minH > (t >> 3)) break;
      }
      if (t >= Lmax) break;
    }
    tape.fill(0, minH, maxH + 1);
    let F = -1;
    if (tAll < 0) return F;
    for (let e = 0; e < 12; e++) {
      const tau = first[e];
      if (tau < tAll) continue;
      const T = tau + 1;
      if (T <= cap && T > F) F = T;
      if (report && T >= lo && T <= hi) {
        const key = T + ':' + e + ':' + Array.from(nx).join('') + Array.from(wr).join('') + Array.from(mv).join('');
        if (!seen.has(key)) {
          seen.add(key);
          parentPort.postMessage({ hit: { steps: T, haltEntry: LETTERS[e >> 1] + (e & 1),
            machines: [toJson(wr, mv, nx, e, 'R'), toJson(wr, mv, nx, e, 'L')] } });
        }
      }
    }
    return F;
  }

  function randomEntry(i) { wr[i] = rnd(2); mv[i] = rnd(2) ? 1 : -1; nx[i] = rnd(6); }

  const deadline = Date.now() + seconds * 1000;
  let restarts = 0, evals = 0;
  const bests = [];
  const sw = new Int8Array(12), sm = new Int8Array(12), sn = new Int8Array(12);
  while (Date.now() < deadline) {
    restarts++;
    let F = -1;
    for (let tries = 0; tries < 100000 && F < 0; tries++) {
      for (let i = 0; i < 12; i++) randomEntry(i);
      F = evaluate(true); evals++;
    }
    if (F < 0) continue;
    let stale = 0;
    while (stale < 3000 && Date.now() < deadline) {
      sw.set(wr); sm.set(mv); sn.set(nx);
      const k = rnd(3) === 0 ? 2 : 1;
      for (let j = 0; j < k; j++) randomEntry(rnd(12));
      const F2 = evaluate(true); evals++;
      if (F2 >= F) { if (F2 > F) stale = 0; else stale++; F = F2; }
      else { wr.set(sw); mv.set(sm); nx.set(sn); stale++; }
    }
    bests.push(F);
  }
  parentPort.postMessage({ done: true, restarts, evals, bests });
}

if (isMainThread) {
  const [seconds, workers, lo, hi, cap] = process.argv.slice(2, 7).map(Number);
  const outfile = process.argv[7];
  const out = fs.createWriteStream(outfile, { flags: 'a' });
  let finished = 0, hits = 0, restarts = 0, evals = 0, bests = [];
  const t0 = Date.now();
  for (let w = 0; w < workers; w++) {
    const wk = new Worker(__filename, { workerData: { seconds, lo, hi, cap, seed: Date.now() % 100000 + 7919 * (w + 1) } });
    wk.on('message', (m) => {
      if (m.hit) { hits++; out.write(JSON.stringify(m.hit) + '\n'); }
      if (m.done) {
        restarts += m.restarts; evals += m.evals; bests = bests.concat(m.bests);
        if (++finished === workers) {
          out.end();
          bests.sort((a, b) => b - a);
          console.log(JSON.stringify({ secs: (Date.now() - t0) / 1000, restarts, evals, hits }));
          console.log('restart bests (top 30): ' + bests.slice(0, 30).join(' '));
          const bins = {};
          for (const b of bests) { const k = b > 0 ? 31 - Math.clz32(b) : -1; bins[k] = (bins[k] || 0) + 1; }
          console.log('restart best log2 histogram: ' + JSON.stringify(bins));
        }
      }
    });
  }
}
else workerMain();
