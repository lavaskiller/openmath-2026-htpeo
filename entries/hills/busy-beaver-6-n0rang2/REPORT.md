Research report · Openmath H06 · 2026-10-03

# Busy Beaver 6 hill: how we found 249,881 and 250,258, and how far we got toward proving 249,881 is the maximum

The AutoLab hill `alejandrozu/busy-beaver-6-certificates` accepts one 6-state, 2-symbol Turing machine. The machine is run from a blank tape. Its score is the exact number of steps, but it counts only if the machine halts within a private step budget after visiting all six working states.

This report answers two questions in plain terms.

1. **How did we find our machines?** In particular the accepted 249,881-step machine and the 250,258-step machine that was rejected for exceeding the budget.
2. **How did we try to prove that 249,881 is the best possible score under the budget, and where did that attempt stop?**

It ends with what is proved, what is not, and which file supports each claim.

## Summary

| | |
|---|---|
| Accepted machine | `0LE1LA_1LC1RH_1RA1RF_0RF0RD_1RD1LB_1LC1RD`: **249,881** steps, **554** ones, tape span **735**, all 6 states |
| Official result | validation run `8297fb64`, merged. Same metrics as the earlier board leader (eychcue, 2026-09-21) |
| Rejected probe | `1RE1RC_1RH0RA_0RD0LB_1LE1RB_0RF0LE_1LD1RF`: 250,258 steps, rejected as over budget (run `10b5bbca`) |
| Budget bracket | 249,881 ≤ validation budget ≤ 250,257, from three official runs |
| Proved in Lean | The 249,881-step run: exact halting time, all six states reached, span, ones, and the acceptance rule. Core Lean 4.34.1, axioms `propext` and `Quot.sound` only |
| **Not proved** | That no machine scores more than 249,881 under the budget. The attempt excluded 31 of 32 structural classes and most of the last one. It was stopped by the user on 2026-10-03 at 09:54 KST with ranges still open |

Each claim below carries one verification level, following the team repository's rules:

- **Lean kernel-checked:** compiled with exit code 0, with the `#print axioms` output in a log.
- **Computed:** checked by a program, which is named.
- **AI-written argument:** a proof written by the AI session that has not been independently reviewed by a person and is not in Lean.

## 1. The task in one paragraph

A machine is a table of twelve entries, one for each state A–F and each symbol 0/1. Each entry says what to write, which way to move, and which state comes next; H means halt. The evaluator starts in state A on an all-zero tape and counts every step, including the step into H. A machine is accepted if it halts within the private budget B and has visited A–F. Higher step counts win. The budget is hidden, but the public evaluator shows that acceptance means "steps ≤ B". So the game is to get as close to B as possible from below, without going over.

## 2. How we searched

### 2.1 Random machines do not reach the right scale

We first tried random machines in tree normal form, where entries are filled in only when the run first needs them. In 5.3 million random runs, no machine halted after more than 128 steps. A plain hill climb on the halting time stalled at 11,266 steps. Machines that halt after about 250,000 steps are far too rare to hit by chance.

### 2.2 The idea that worked: "first use"

Take a machine that never halts, and watch which entries it uses.

- Suppose entry *e* is used for the first time at step τ(*e*).
- Replace *e* by a halting entry. Nothing changes before step τ(*e*), because *e* was never read before then.
- So the new machine halts after exactly τ(*e*) + 1 steps.

One simulation therefore prices twelve candidate halting machines at once. A long-running halter is just a machine that works for a long time on eleven entries before it first touches the twelfth.

The search climbs on this score: the latest first use, among entries first used after all six states have been reached and at most a cap. Each step mutates one or two entries and keeps improvements, with random restarts. A run stops early when all twelve entries have been used, when an exact configuration repeats, or when the head runs off into blank tape. Most evaluations finish within a few hundred steps.

This is exactly how the accepted machine looks. Eleven of its entries are in use by step 33. Entry B1 (state B reading 1) is first read at step 249,881, and that first read is the halt. *(Computed: `scripts/firstuse.py`. Lean kernel-checked: §4.)*

### 2.3 How 249,881 was found (2026-09-28)

1. `scripts/search/mfu.js`, the first-use climb in Node.js, found a machine halting after **255,799** steps within about two minutes.
2. `scripts/search/nbr.js` scanned that machine's neighbourhood: every single-entry change plus random double changes. The scan turned up **249,881**.
3. An independent replay (`scripts/check.py`) confirmed 249,881 steps, 554 ones, span 735, all six states.

The same metrics were already on the board, posted by eychcue on 2026-09-21. We found the machine independently, but it is very likely the same machine up to renaming states. We do not claim the 249,881 lower bound as new.

### 2.4 How 250,258 was found (2026-09-29)

The JS search found nothing between 249,881 and 250,000. We then ported the climb to C (`scripts/search/hunt.c`, gcc -O3) and ran 14 processes in 20-minute rounds. Some processes restarted from an archive of good intermediate machines, which gave about 2.5 times more climbs above 131,072 steps.

Rounds r2 and r3 found new halting times near the cap: 249,768, 246,654, 254,275/254,276, and **250,258**. The 250,258 machine was the closest one we ever found above 249,881, so we submitted it to probe the budget (§3). *(Computed: `scripts/check.py evidence/search/m250258-solution.json` gives halted, 250,258 steps, 865 ones, span 1,262, all six states.)*

### 2.5 An idea that did not pay off: engines with a free tail

If two entries are still unused at time T₀, both are free: changing them cannot affect the run before T₀. One such "engine" running about 249,000 steps would give dozens of machines halting at T₀ + Δ for small Δ, a fine-grained way to land just above 249,881. We implemented the exhaustive tail search and checked it on samples. But no ten-entry engine ran longer than about 130,000 steps, so the idea never reached the target window.

### 2.6 What the numbers show

| Method | Machines evaluated (approx.) | Best results near the cap |
|---|---|---|
| Random tree-normal-form runs | 5.3 M | nothing above 128 steps |
| Hill climb on halting time | 2.2 M | 11,266 |
| First-use climb + neighbour scans (JS) | 59 M | 249,881 · 248,820 · 248,160 · 255,799 |
| Engine + tail search | 36 M | no engine above ≈ 130,000 steps |
| First-use climb in C, 14 processes | 104 M | 249,768 · 246,654 · 250,258 · 254,276 |
| Exhaustive 1–2 entry changes around 30 machines above 200,000 | 0.88 M | nothing new |

The counts are approximate, taken from the run logs.

The machines near the cap turned out to be isolated. Changing one or two entries of a good machine almost never produced another halting time nearby. New values came only from new machine families. This is why the gap between 249,881 and 250,258 stayed empty. All 24 distinct halting times we kept between 240,533 and 255,799 are listed in `evidence/search/witness_one_per_T.txt`, and each one replays exactly. *(Computed: `scripts/verify_lines.py` gives `ok=24 bad=0`.)*

## 3. Narrowing down the hidden budget

Acceptance is monotone in B: if a machine is accepted with budget B, it is accepted with any larger budget. So each official run acts like an egg-drop test. An accepted run raises the floor, and a rejected run lowers the ceiling.

| Official run | Steps | Result | Bracket afterwards |
|---|---|---|---|
| `8297fb64` | 249,881 | accepted (merged) | 249,881 ≤ B ≤ 2,000,000 |
| `efe147cd` | 255,799 | over budget | 249,881 ≤ B ≤ 255,798 |
| `10b5bbca` | 250,258 | over budget ("did not halt within the private execution budget") | **249,881 ≤ B ≤ 250,257** |

The upper limit 2,000,000 comes from the public evaluator's range check. Three runs left 377 possible budget values. A useful next submission would need a machine halting in 249,882–250,257, and the search never found one.

The final (held-out) test split uses a different budget. Its board lists an accepted 572,171-step run, so that budget is far higher. We did not evaluate on the final split.

We deliberately did not use one shortcut. The hill's public `private.lock` lists the SHA-256 hash and byte size of the tiny budget files, so the budgets could have been recovered by brute force. We reported this as a leak instead of exploiting it.

## 4. What is proved about the 249,881-step machine

All results in this section are Lean kernel-checked (`LeanProject/`, log in `LeanProject/logs/build.log`).

We stated the evaluator's rules directly in Lean (`Model.lean`) and proved, for the accepted machine:

- it halts after exactly 249,881 steps, with no earlier halt;
- it reaches all six states A–F before halting;
- its tape span is 735;
- 554 cells of the span hold 1, and every cell outside it holds 0;
- for every budget B, it is accepted exactly when B ≥ 249,881.

The same statement is proved in four independent ways:

| Route | Idea | Machine steps the kernel simulates |
|---|---|---|
| `bb6_certificate` | step through the whole run on a two-list "zipper" tape | 249,880 |
| `bb6_certificate_structural` | sweep rules proved for every length: a left sweep over k blocks takes 6k steps, a right sweep 4k | 7,900 |
| `bb6_certificate_counter` | the machine is a base-3 counter; a law for one increment, proved for every counter state | 74 |
| `bb6_certificate_phase` | a closed-form law for whole counting cycles | 74 |

The last route also yields an infinite family of start tapes with exactly known halting times. One of them halts after about 3.2·10²⁹ steps (`big_halting`), far beyond any simulation.

The derivations are in `proof.md`. Only the link between the Python evaluator and `Model.lean` is argued in prose, because Lean cannot run `eval.py`.

## 5. Trying to prove that 249,881 is the maximum

### 5.1 The exact goal

Write T(M) for the halting time of machine M from a blank tape. We call M *admissible* if it is a complete 6-state machine that halts and visits all six states. We wanted:

> **(G)** No admissible machine halts in 249,882 … 249,999 steps.

Together with the 249,881 machine this gives "249,881 is the largest halting time below 250,000". The cutoff 250,000 was the user's choice, since the true budget is hidden. A second run targeted the rest of the budget bracket:

> **(G′)** No admissible machine halts in 250,000 … 250,257 steps.

(G) and (G′) together would show that 249,881 is optimal for any budget the official runs allow.

**Why this is hard.** Each of the 12 entries has 2 × 2 × 7 = 28 choices, so there are about 2.3·10¹⁷ tables, and a single run can take 250,000 steps. Checking machines one by one is hopeless. The plan has two parts:

- cut away whole classes of machines with general arguments (§5.2–5.4);
- cover what remains with an exhaustive search whose every step leaves a checkable certificate (§5.5).

### 5.2 Step 1: small machines are fast, so new states must appear early

**Zero prefix.** Before a machine first writes a 1, the tape is blank, so the run depends only on the state. That phase lasts at most 5 steps, and after renaming states we may assume the first move is "A reads 0, writes 1, moves right, goes to B". This is the same normal form the search used.

**Small-state bounds.** For m working states we determined B_m, the largest halting time below 250,000 among m-state machines that visit all m states:

| m | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| B_m | 1 | 6 | 21 | 107 | 134,467 |

For m = 2, 3, 4 these are the classical busy beaver values. For m = 5 the true busy beaver value is far above 250,000. 134,467 is the largest 5-state halting time *below* 250,000. Its certificate covers every 5-state machine and excludes 134,468–249,999. *(Computed: `evidence/maximality/bb5-chain-verification.json`: 120,546,746 closed subtrees, 0 open, 0 halts in range.)*

**First-event substitution.** Suppose a machine enters its sixth state for the first time at step k. Replace that transition by a halt. The result is a five-state machine that halts at step k and visits five states, so k ≤ 134,467. In the same way, the third, fourth, fifth and sixth states must appear by steps 6, 21, 107 and 134,467. A counterexample to (G) must therefore use all six states and bring in the last one early. *(AI-written argument.)*

### 5.3 Step 2: sort machines by how their states are connected

Draw the states a run actually uses as a graph, with an arrow for each transition taken. Split it into strongly connected components: groups of states that can reach each other. Once a run leaves a group, it never comes back. A halting run therefore passes through a sequence of groups whose sizes add up to 6. There are exactly 2⁵ = **32** such ordered size sequences, from (1,1,1,1,1,1) to (6).

We then excluded the target window class by class, using the size of the **last** group:

| Classes | How (G) was excluded | Level |
|---|---|---|
| all groups of size 1 or 2 (13 classes) | general time bound ≤ 75,218 | AI-written argument |
| last group has 1 state (8 classes) | T ≤ 134,467 + 115,260 = **249,727** < 249,882 | AI-written argument |
| last group has 2 states (3 classes) | T ≤ 107 + 49,285 = **49,392** | AI-written argument |
| last group has 3 states (4 classes) | the possible tapes on entry to that group (205 exact inputs) were listed, then every 3-state program on them was certified | computed: 95 input classes, 3,806,899 closed subtrees, 0 halts in range |
| last group has 4 states (2 classes) | same method, 35 exact inputs | computed: 17 input classes, 90,453,941 closed subtrees, 0 halts in range |
| last group has 5 states (class (1,5)) | the entry tape is blank or a single 1 next to the head; certified on that input | computed: 249 parts, 619,865,678 closed subtrees, 0 halts in range |
| **one group of all 6 states (class (6))** | **not settled by these arguments** | — |

The single-state bound works as follows. The 5-state part ends by step 134,467, and by then it can have visited at most 115,259 cells. A single state that ends a halting run moves in one direction only, so it needs at most one more step than the number of visited cells.

Evidence: `evidence/maximality/component-classes.json` and `terminal-{three,four,five}-spectrum-audit.json`.

After this step, **31 of 32 classes** are excluded. The remaining class (6), where all six states form one connected group, is exactly where the 249,881 machine itself lives. So general bounds cannot finish the job, and the last class needs an exhaustive search.

### 5.4 Step 3: proving whole families of machines never halt

A large part of the remaining work is to show, for a partial table, that **no way of completing it** halts. Two kinds of argument did this:

- **Closed local patterns.** Find a finite set of short tape windows around the head, together with the state, that contains the start and is closed under the machine's step, and in which only defined, non-halting entries are ever read. Then the machine can never reach an undefined entry, so no completion halts. A separate string-based checker re-verifies every closure, so the generator's word is not trusted.
- **Exact repetition.** If the same state, head and whole tape recur, the run loops forever.

### 5.5 Step 4: an exhaustive search that leaves certificates

For the last class we enumerated machines as a tree, using the same first-use idea as the search, but exhaustively:

- **Branching.** Start from an empty table. Run until an undefined entry is read. Branch on every possible value for it, plus "halt here".
- **Closing a leaf.** A leaf is closed when it halts outside the target window, is proved non-halting (§5.4), passes the budget, or fails the visit-all-states rule.
- **Open leaves.** Anything else stays **open** and goes back on the queue.

Every finished piece of the tree is written out as a certificate. An untrusted generator (C#, and later CUDA on a GPU) produces the certificates. A separate C# checker re-runs every obligation and must accept the certificate before it counts. Pieces are joined into a chain with exact bookkeeping: an open range R is replaced by the certificate's leftover open ranges O, giving F′ = (F \ R) ∪ O, so no machine can be lost or counted twice. When no open range is left and no halt was found in the window, (G) follows.

### 5.6 Where it stopped

The user stopped the computation on 2026-10-03 at 09:54 KST (00:54 UTC). At that moment:

| Range | Committed certificates | Closed subtrees (verified) | Open subtrees left | Halts found in range |
|---|---|---|---|---|
| (G) 249,882–249,999 | 6,784 replacement + 453 epoch | 31,226,702,460 | **634** | 0 |
| (G′) 250,000–250,257 | 53 replacement + 1 epoch | 977,956,372 | **113** | 0 |

Evidence: `evidence/maximality/cancelled-results-20261003-0954KST.json`.

For comparison, the earlier stop at 03:38 KST had 20,322 open subtrees in the (G) range (`stopped-results-20261003-0338KST.json`). The last progress report, at 09:37 KST, projected the (G) range might close within about an hour if the rate held. The (G′) range was projected at about 42 hours. These are rough extrapolations, not promises (`progress-report-20261003-0937KST.json`).

How to read these numbers:

- **"0 halts" covers only the verified part.** The 634 + 113 open subtrees may still contain a machine that beats 249,881.
- **Counts are not percentages.** Closed and open counts are subtrees of different sizes, not machines, and opening a subtree can create more open ones.
- **The final state was not re-audited.** No full-chain audit was run after the forced stop. Part files that were unfinished at that moment were kept but not adopted into the chain.
- **No Lean, no human review.** None of the maximality work is in Lean, and none of it has been independently reviewed by a person.

**Conclusion: the maximality of 249,881 under the budget is not proved.** What exists is a reduction to a single structural class, plus a partly finished, checker-verified search of that class.

## 6. What is and is not claimed

| Claim | Status |
|---|---|
| The machine halts after exactly 249,881 steps, visits A–F, span 735, ones 554 | Lean kernel-checked; also computed by `scripts/check.py` and the official evaluator |
| It is accepted exactly for budgets B ≥ 249,881 | Lean kernel-checked, against the Lean model of `eval.py` |
| 249,881 ≤ validation budget ≤ 250,257 | official AutoLab results (runs `8297fb64`, `10b5bbca`) |
| 250,258 and 255,799 machines halt with all six states | computed (`scripts/check.py`) |
| 5-state machines halt within 249,999 steps only by step 134,467 | computed (certificate chain) |
| 31 of 32 structural classes contain no halt in 249,882–249,999 | AI-written arguments plus computed certificates; not human-reviewed, not Lean |
| 249,881 is the maximum under the budget | **not proved** |
| 249,881 as a new lower bound | **not claimed**; the same metrics were on the board before the event |

**Tools.** The search, the Lean proofs and their reviews were done with Claude in Claude Code. Per the workspace records, the maximality computation ran in a separate OpenAI Codex session. Other tools: Lean 4.34.1, Python 3.10, Node.js, gcc, .NET C#, and CUDA (one GPU). Everything ran on one local PC.

## 7. Files in this folder

| Path | What it is |
|---|---|
| `README.md` | Submission packet: exact claim, Lean declarations, reproduction commands |
| `REPORT.md` | This report |
| `solution.json` | The accepted machine, as evaluated |
| `proof.md` | Mathematical derivation of the Lean proofs (stages 4–7) |
| `LeanProject/` | Lean 4 sources; `logs/build.log` holds the build and `#print axioms` output |
| `scripts/check.py`, `verify_lines.py`, `firstuse.py` | Independent replay, batch replay, first-use times |
| `scripts/gen_witness_data.py`, `zipper_lit.py` | Generates `LeanProject/LeanProject/WitnessData.lean` |
| `scripts/search/` | Search code: `mfu.js` (first-use climb), `nbr.js` (neighbour scans), `hunt.c` (C climb) |
| `evidence/search/` | 24 kept witnesses; the 250,258 and 255,799 machines as submitted |
| `evidence/maximality/` | Status files of the maximality attempt (classes, terminal audits, 5-state chain, stop and cancel snapshots, GPU audit) |

The full maximality certificate chains (tens of GB) and the working notes are not included. They are kept in the local workspace `H06. Busy Beaver 6 Certificates/` under `global-maximality/` and `structural-maximality/`.
