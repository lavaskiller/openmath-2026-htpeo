"""Certificate data and space-time diagrams for one machine (dev tool, stdlib only).

Replays the machine exactly (README semantics, dict tape) and writes into <outdir>:
  certificate.json   metrics, first-use time of every entry, sweep statistics
  spacetime_start.png  the first <rows> steps, one row per step (3 px per cell)
  spacetime_full.png   the whole run, one row every <stride> steps (1 px per cell)
Colours: white = 0, dark = 1, red = head position.

Usage: python cert.py machine.json outdir [rows] [stride]
"""
import json
import os
import struct
import sys
import zlib

from check import load


def write_png(path, width, height, rows):
    """rows: list of bytes objects, each width*3 RGB bytes."""
    raw = b"".join(b"\x00" + r for r in rows)

    def chunk(tag, data):
        c = struct.pack(">I", len(data)) + tag + data
        return c + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)

    png = b"\x89PNG\r\n\x1a\n"
    png += chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(raw, 9))
    png += chunk(b"IEND", b"")
    with open(path, "wb") as f:
        f.write(png)


def main():
    tr = load(sys.argv[1])
    outdir = sys.argv[2]
    nrows = int(sys.argv[3]) if len(sys.argv) > 3 else 700
    stride = int(sys.argv[4]) if len(sys.argv) > 4 else 256
    os.makedirs(outdir, exist_ok=True)

    # pass 1: exact run, metrics, first uses, extent
    tape, pos, state, steps = {}, 0, "A", 0
    lo = hi = 0
    first = {}
    visited = {"A"}
    reversals = 0
    last_dir = 0
    while state != "H":
        b = tape.get(pos, 0)
        key = state + str(b)
        first.setdefault(key, steps)
        w, m, n = tr[state][str(b)]
        tape[pos] = w
        d = 1 if m == "R" else -1
        if last_dir and d != last_dir:
            reversals += 1
        last_dir = d
        pos += d
        lo, hi = min(lo, pos), max(hi, pos)
        state = n
        steps += 1
        if state != "H":
            visited.add(state)
        if steps > 10**7:
            raise SystemExit("no halt within 10^7 steps")
    ones = sum(tape.values())
    halting_entry = [k for k in first if tr[k[0]][k[1]][2] == "H"]
    cert = {
        "machine": "_".join("".join("%d%s%s" % tuple(tr[s][b]) for b in "01") for s in "ABCDEF"),
        "steps": steps,
        "ones": ones,
        "tape_span": hi - lo + 1,
        "leftmost": lo,
        "rightmost": hi,
        "states_reached": "".join(sorted(visited)),
        "halting_entry": halting_entry,
        "first_use_after_transitions": dict(sorted(first.items(), key=lambda kv: kv[1])),
        "direction_reversals": reversals,
    }
    with open(os.path.join(outdir, "certificate.json"), "w", encoding="utf-8") as f:
        json.dump(cert, f, indent=1)

    # pass 2: images
    width = hi - lo + 1
    white, dark, red = b"\xfb\xfb\xf9", b"\x22\x22\x22", b"\xd6\x3b\x3b"

    def row_bytes(tape, pos, scale):
        out = bytearray()
        for i in range(lo, hi + 1):
            px = red if i == pos else (dark if tape.get(i, 0) else white)
            out += px * scale
        return bytes(out)

    tape, pos, state, t = {}, 0, "A", 0
    start_rows, full_rows = [], []
    scale = 3
    while True:
        if t < nrows:
            r = row_bytes(tape, pos, scale)
            start_rows.append(r)
        if t % stride == 0 or state == "H":
            full_rows.append(row_bytes(tape, pos, 1))
        if state == "H":
            break
        w, m, n = tr[state][str(tape.get(pos, 0))]
        tape[pos] = w
        pos += 1 if m == "R" else -1
        state = n
        t += 1
    # enlarge the start image vertically too (3 px per step)
    start_rows = [r for r in start_rows for _ in range(scale)]
    write_png(os.path.join(outdir, "spacetime_start.png"), width * scale, len(start_rows), start_rows)
    write_png(os.path.join(outdir, "spacetime_full.png"), width, len(full_rows), full_rows)
    print(json.dumps({k: cert[k] for k in ("machine", "steps", "ones", "tape_span", "states_reached", "halting_entry", "direction_reversals")}))
    print("images:", len(start_rows) // scale, "rows (start),", len(full_rows), "rows (full, stride %d)" % stride)


if __name__ == "__main__":
    main()
