"""Independent replay checker for the BB6 hill submission format (dev tool, unofficial).

Implements the README semantics literally with a dict tape, independent of the JS search code:
start in state A at head position 0 on an all-zero tape; each step applies [write, move, next];
the transition into H counts as a step. Reports steps, ones, tape span, and visited states.

Usage: python check.py machine.json [max_steps]
"""
import json
import sys

STATES = "ABCDEF"


def load(path):
    with open(path, encoding="utf-8") as f:
        data = json.load(f)
    tr = data["transitions"]
    if set(data.keys()) != {"transitions"}:
        raise ValueError("unexpected top-level keys: %r" % sorted(data.keys()))
    if set(tr.keys()) != set(STATES):
        raise ValueError("states must be exactly A-F")
    for s in STATES:
        if set(tr[s].keys()) != {"0", "1"}:
            raise ValueError("state %s must have symbols 0 and 1" % s)
        for b in "01":
            w, m, n = tr[s][b]
            if w not in (0, 1) or isinstance(w, bool):
                raise ValueError("bad write in %s%s" % (s, b))
            if m not in ("L", "R"):
                raise ValueError("bad move in %s%s" % (s, b))
            if n not in STATES + "H":
                raise ValueError("bad next state in %s%s" % (s, b))
    return tr


def run(tr, max_steps):
    tape = {}
    pos = 0
    state = "A"
    steps = 0
    visited = {"A"}
    lo = hi = 0
    while state != "H":
        if steps >= max_steps:
            return {"halted": False, "steps": steps}
        w, m, n = tr[state][str(tape.get(pos, 0))]
        tape[pos] = w
        pos += 1 if m == "R" else -1
        lo = min(lo, pos)
        hi = max(hi, pos)
        state = n
        steps += 1
        if state != "H":
            visited.add(state)
    ones = sum(tape.values())
    return {
        "halted": True,
        "steps": steps,
        "ones": ones,
        "tape_span_incl_final_move": hi - lo + 1,
        "all_states_visited": visited == set(STATES),
        "visited": "".join(sorted(visited)),
    }


if __name__ == "__main__":
    path = sys.argv[1]
    max_steps = int(sys.argv[2]) if len(sys.argv) > 2 else 10**7
    print(json.dumps(run(load(path), max_steps)))
