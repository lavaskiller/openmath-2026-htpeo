// Neighbourhood BFS over long halters (dev tool; numbers are unofficial).
// A seed is a complete halt-free machine M whose max first-use time F(M) is large (see mfu.js).
// Each worker takes a seed, evaluates every single-entry mutant and `doubles` random
// double-entry mutants, reports every halter with lo <= T <= hi, and returns mutants with
// F >= fmin as new seeds. The main thread de-duplicates and prioritises seeds whose F is
// closest to `target`.
//
// usage: node nbr.js <seconds> <workers> <lo> <hi> <fmin> <target> <doubles> <seedfile> <outfile> [seedsOut]
'use strict';
const { Worker, isMainThread, parentPort, workerData } = require('worker_threads');
const fs = require('fs');

const LETTERS = 'ABCDEFH';
const Lmax = 262144;

function keyOf(wr, mv, nx) { let k = ''; for (let i = 0; i < 12; i++) k += wr[i] + (mv[i] > 0 ? 'R' : 'L') + nx[i]; return k; }

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
  const { lo, hi, fmin, doubles, seed } = workerData;
  let x = (seed * 2654435761) >>> 0 || 1;
  function rnd(n) { x ^= x << 13; x >>>= 0; x ^= x >>> 17; x ^= x << 5; x >>>= 0; return x % n; }
  const C = Lmax + 8;
  const tape = new Uint8Array(2 * C + 16);
  const snap = new Uint8Array(2 * C + 16);
  const wr = new Int8Array(12), mv = new Int8Array(12), nx = new Int8Array(12);
  const first = new Int32Array(12);

  // returns uncapped max first-use halting time (or -1); posts halters in [lo, hi]
  function evaluate(hits) {
    first.fill(-1);
    let s = 0, h = C, t = 0, minH = C, maxH = C, visited = 1, nUsed = 0, tAll = -1;
    let nextSnap = 64, snapS = -1, snapH = -1, snapMin = C, snapMax = C;
    for (;;) {
      const idx = 2 * s + tape[h];
      if (first[idx] < 0) { first[idx] = t; if (++nUsed === 12) break; }
      tape[h] = wr[idx]; h += mv[idx]; t++;
      if (h < minH) minH = h; else if (h > maxH) maxH = h;
      s = nx[idx];
      if (visited !== 63) { visited |= 1 << s; if (visited === 63) tAll = t; }
      if (s === snapS && h === snapH) {
        const a = minH < snapMin ? minH : snapMin, b = maxH > snapMax ? maxH : snapMax;
        let same = true;
        for (let i = a; i <= b; i++) { const sv = (i >= snapMin && i <= snapMax) ? snap[i] : 0; if (tape[i] !== sv) { same = false; break; } }
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
    if (tAll < 0) return -1;
    let F = -1;
    for (let e = 0; e < 12; e++) {
      const tau = first[e];
      if (tau < tAll) continue;
      const T = tau + 1;
      if (T > F) F = T;
      if (T >= lo && T <= hi) hits.push({ steps: T, haltEntry: LETTERS[e >> 1] + (e & 1), machine: toJson(wr, mv, nx, e, 'R') });
    }
    return F;
  }

  function setEntry(i, code) { // code in 0..23
    wr[i] = code & 1; mv[i] = (code >> 1) & 1 ? 1 : -1; nx[i] = code >> 2;
  }
  function codeOf(i) { return wr[i] | ((mv[i] > 0 ? 1 : 0) << 1) | (nx[i] << 2); }

  parentPort.on('message', (m) => {
    if (m.stop) process.exit(0);
    const base = m.seed;
    const hits = [], newSeeds = [];
    const bw = Int8Array.from(base.wr), bm = Int8Array.from(base.mv), bn = Int8Array.from(base.nx);
    let evals = 0;
    function consider() {
      const F = evaluate(hits); evals++;
      if (F >= fmin) newSeeds.push({ F, wr: Array.from(wr), mv: Array.from(mv), nx: Array.from(nx), key: keyOf(wr, mv, nx) });
    }
    for (let i = 0; i < 12; i++) {
      const c0 = (wr.set(bw), mv.set(bm), nx.set(bn), codeOf(i));
      for (let c = 0; c < 24; c++) {
        if (c === c0) continue;
        wr.set(bw); mv.set(bm); nx.set(bn); setEntry(i, c); consider();
      }
    }
    for (let d = 0; d < doubles; d++) {
      wr.set(bw); mv.set(bm); nx.set(bn);
      const i = rnd(12); let j = rnd(11); if (j >= i) j++;
      setEntry(i, rnd(24)); setEntry(j, rnd(24)); consider();
    }
    parentPort.postMessage({ hits, newSeeds, evals });
  });
}

function seedFromMachine(machine) {
  const wr = [], mv = [], nx = [];
  for (let s = 0; s < 6; s++) for (let b = 0; b < 2; b++) {
    const [w, m, n] = machine.transitions[LETTERS[s]][String(b)];
    wr.push(w); mv.push(m === 'R' ? 1 : -1); nx.push(n === 'H' ? 0 : LETTERS.indexOf(n));
  }
  return { wr, mv, nx, key: keyOf(wr, mv, nx) };
}

if (isMainThread) {
  const a = process.argv.slice(2);
  const [seconds, workers, lo, hi, fmin, target, doubles] = a.slice(0, 7).map(Number);
  const seedfile = a[7], outfile = a[8], seedsOut = a[9];
  const out = fs.createWriteStream(outfile, { flags: 'a' });
  const seen = new Set(), hitKeys = new Set();
  let queue = [];
  for (const line of fs.readFileSync(seedfile, 'utf8').trim().split('\n')) {
    const o = JSON.parse(line);
    const m = o.machine || (o.machines && o.machines[0]) || o;
    const sd = seedFromMachine(m); sd.F = o.steps || o.F || 0;
    if (!seen.has(sd.key)) { seen.add(sd.key); queue.push(sd); }
  }
  console.log('seeds loaded:', queue.length);
  const t0 = Date.now();
  let evals = 0, scanned = 0, idle = 0;
  const allSeeds = [];
  const dist = (sd) => Math.abs(sd.F - target) + (sd.F > target ? 20000 : 0);
  const pool = [];
  function next(wk) {
    if (Date.now() - t0 > seconds * 1000 || queue.length === 0) {
      wk.postMessage({ stop: true });
      if (++idle === workers) finish();
      return;
    }
    // take the seed closest to the target, with some randomness
    queue.sort((p, q) => dist(p) - dist(q));
    const pick = Math.random() < 0.7 ? 0 : Math.floor(Math.random() * Math.min(queue.length, 50));
    const sd = queue.splice(pick, 1)[0];
    scanned++;
    wk.postMessage({ seed: sd });
  }
  function finish() {
    out.end();
    const Ts = [...hitKeys].map(k => +k.split('|')[0]);
    const uniq = [...new Set(Ts)].sort((p, q) => p - q);
    console.log(JSON.stringify({ secs: (Date.now() - t0) / 1000, scanned, evals, seedsSeen: seen.size, queue: queue.length, distinctT: uniq.length }));
    const inWin = uniq.filter(t => t > 249881 && t <= 250000);
    console.log('T in (249881, 250000]: ' + inWin.join(' '));
    console.log('T in [240000, 262144]: ' + uniq.filter(t => t >= 240000).join(' '));
    if (seedsOut) fs.writeFileSync(seedsOut, allSeeds.map(s => JSON.stringify(s)).join('\n') + '\n');
  }
  for (let w = 0; w < workers; w++) {
    const wk = new Worker(__filename, { workerData: { lo, hi, fmin, doubles, seed: Date.now() % 100000 + 7919 * (w + 1) } });
    wk.on('message', (m) => {
      evals += m.evals;
      for (const h of m.hits) {
        const k = h.steps + '|' + JSON.stringify(h.machine);
        if (!hitKeys.has(k)) { hitKeys.add(k); out.write(JSON.stringify(h) + '\n'); }
      }
      for (const sd of m.newSeeds) {
        if (!seen.has(sd.key)) { seen.add(sd.key); queue.push(sd); allSeeds.push({ F: sd.F, wr: sd.wr, mv: sd.mv, nx: sd.nx }); }
      }
      if (queue.length > 20000) { queue.sort((p, q) => dist(p) - dist(q)); queue = queue.slice(0, 10000); }
      next(wk);
    });
    next(wk);
  }
}
else workerMain();
