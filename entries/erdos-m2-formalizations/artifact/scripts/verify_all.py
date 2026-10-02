#!/usr/bin/env python3
"""verify_all.py -- independent verification of the Erdos/FC proofs produced by the GPT sessions.

For every work/<session>/Erdos<n>.lean and every target marked DONE in that session's STATUS.md:
 (a) compile through leancheck.sh (cached by sha256 of the compiled bytes)
 (b) statement identical to the pinned formal-conjectures original + whole-file diff check
 (c) #print axioms subset of [propext, Classical.choice, Quot.sound]
 (d) forbidden tokens / sorry in the target proof
 (e) answer(sorry) substitutions recorded
Outputs: m2/VERIFIED.tsv, m2/verified.json, m2/STATUS.md (appended), m2/build/<session>/Erdos<n>.lean
Usage: verify_all.py [--no-compile]   (--no-compile: only use cached compile results)
"""
import re, sys, json, hashlib, subprocess, pathlib, difflib, datetime, concurrent.futures as cf

HOME = pathlib.Path.home()
ROOT = HOME / "erdos-fc"
FC = ROOT / "formal-conjectures/FormalConjectures/ErdosProblems"
WORK = ROOT / "work"
M2 = ROOT / "m2"
CACHE = M2 / "cache"
BUILD = M2 / "build"
OKAX = {"propext", "Classical.choice", "Quot.sound"}
NOCOMPILE = "--no-compile" in sys.argv
SLOTS = 2

DECL_KW = r"(?:theorem|lemma)"
MODS = r"(?:(?:private|protected|noncomputable|nonrec)\s+)*"
TOP = re.compile(r"^(@\[|/--|/-|theorem\b|lemma\b|def\b|abbrev\b|instance\b|noncomputable\b|private\b|protected\b|"
                 r"end\b|namespace\b|section\b|open\b|variable\b|#|example\b|structure\b|inductive\b|class\b|local\b|"
                 r"scoped\b|attribute\b|set_option\b|universe\b|macro\b|notation\b|syntax\b|elab\b|alias\b|omit\b|include\b)")


def strip_comments(s):
    """Remove /- -/ (nested) and -- comments, keeping newlines so line numbers survive."""
    out = []; i = 0; n = len(s); depth = 0
    while i < n:
        if s.startswith("/-", i):
            depth += 1; i += 2; continue
        if depth and s.startswith("-/", i):
            depth -= 1; i += 2; continue
        if depth:
            if s[i] == "\n": out.append("\n")
            i += 1; continue
        if s.startswith("--", i):
            j = s.find("\n", i)
            i = n if j < 0 else j
            continue
        out.append(s[i]); i += 1
    return "".join(out)


def norm(s):
    return re.sub(r"\s+", " ", s).strip()


def find_decl(text, name):
    """Return (attr_start, decl_start, end_of_span, matched_name) for theorem/lemma `name` (namespace prefixes stripped if needed)."""
    parts = name.split(".")
    for k in range(len(parts)):
        cand = ".".join(parts[k:])
        m = re.search(r"(?m)^(?P<attr>(?:@\[[^\]]*\]\s*)*)" + MODS + DECL_KW + r"\s+" + re.escape(cand) + r"(?=[\s:({\[])", text)
        if m:
            # span end: next top-level starter line after the declaration line
            pos = text.find("\n", m.end())
            end = len(text)
            while pos >= 0 and pos < len(text):
                nl = text.find("\n", pos + 1)
                line = text[pos + 1: nl if nl >= 0 else len(text)]
                if TOP.match(line):
                    end = pos + 1; break
                pos = nl
            return m.start(), m.start() + len(m.group("attr")), end, cand
    return None


def namespace_at(text, pos):
    stack = []
    for m in re.finditer(r"(?m)^(namespace|section|end)\b[ \t]*([^\s]*)", strip_comments(text[:pos])):
        kw, nm = m.group(1), m.group(2)
        if kw == "namespace": stack.append(("ns", nm))
        elif kw == "section": stack.append(("sec", nm))
        elif stack: stack.pop()
    return ".".join(n for k, n in stack if k == "ns")


def parse_status(p):
    res = []
    if not p.exists(): return res
    for line in p.read_text(errors="replace").splitlines():
        m = re.match(r"\s*[-*]?\s*(\d+)\s+(\S+?):\s*(DONE|SKIPPED\S*|FAILED)\b(.*)", line)
        if m: res.append((m.group(1), m.group(2), m.group(3), m.group(4).strip()))
    return res


def compile_cached(path):
    data = path.read_bytes()
    h = hashlib.sha256(data).hexdigest()
    c = CACHE / (h + ".json")
    if c.exists():
        return json.loads(c.read_text())
    if NOCOMPILE:
        return {"rc": None, "out": "", "sha": h}
    r = subprocess.run([str(ROOT / "leancheck.sh"), str(path)], capture_output=True, text=True)
    if path.read_bytes() != data:  # file changed under us
        return {"rc": None, "out": "changed during compile", "sha": h}
    res = {"rc": r.returncode, "out": (r.stdout + r.stderr)[-200000:], "sha": h,
           "when": datetime.datetime.now().isoformat(timespec="seconds"), "path": str(path)}
    if r.returncode != 3:
        c.write_text(json.dumps(res))
    return res


BAD_ADDED = [
    (r"^\s*import\b", "REVIEW:added_import"),
    (r"\bset_option\b", "REVIEW:added_set_option"),
    (r"^\s*open\b", "REVIEW:added_open"),
    (r"^\s*(?:local\s+|scoped\s+)?(?:notation|infixl?|infixr|prefix|postfix|macro|macro_rules|syntax|elab)\b", "REVIEW:added_notation/macro"),
    (r"^\s*variable\b", "REVIEW:added_variable"),
    (r"^\s*universe\b", "REVIEW:added_universe"),
    (r"\binstance\b", "REVIEW:added_instance"),
    (r"^\s*attribute\s*\[", "REVIEW:added_attribute"),
    (r"^(?:namespace|section|end)\b", "info:added_section/namespace"),
    (r"@\[[^\]]*\b(?:simp|reducible|irreducible|coe|ext)\b", "info:added_attr_on_aux"),
]
FORBID = [("native_decide", r"\bnative_decide\b"), ("axiom", r"\baxiom\b"), ("unsafe", r"\bunsafe\b"),
          ("implemented_by", r"\bimplemented_by\b"), ("admit", r"\badmit\b"), ("ofReduceBool", r"ofReduceBool|reduceBool"),
          ("extern", r"@\[\s*extern"), ("csimp", r"\bcsimp\b")]


def analyse_file(sess, f, targets):
    """targets: list of (num, name) DONE. returns list of row dicts."""
    num = re.match(r"Erdos(\d+)\.lean$", f.name).group(1)
    new = f.read_text(errors="replace")
    fcp = FC / f"{num}.lean"
    rows = []
    if not fcp.exists():
        return [dict(session=sess, problem=num, theorem=t, category="?", compile="?", statement_same="NO_FC_FILE",
                     axioms="?", flags="REVIEW:no_fc_file") for _, t in targets]
    old = fcp.read_text()
    fileflags = []
    # strip trailing #print axioms lines for the diff
    new_lines = new.splitlines()
    core = [l for l in new_lines if not re.match(r"\s*#print\s+axioms\b", l)]
    old_lines = old.splitlines()
    # extra targets: FC sorry-theorems that the session filled without marking them DONE
    n_marked = len(targets)
    targets = list(targets)
    for m in re.finditer(r"(?m)^" + MODS + DECL_KW + r"\s+([^\s:({\[]+)", strip_comments(old)):
        nm = m.group(1)
        if any(t == nm or t.endswith("." + nm) for _, t in targets): continue
        fo, fn = find_decl(old, nm), find_decl(new, nm)
        if not fo or not fn: continue
        ob = strip_comments(old[fo[0]:fo[2]]); nb = strip_comments(new[fn[0]:fn[2]])
        if re.search(r":=\s*(?:by\s+)?sorry\s*\Z", ob.rstrip()) and not re.search(r"\bsorry\b", nb):
            targets.append((num, nm))
    marked = set(t for _, t in targets[:n_marked])
    # target info
    info = {}
    allowed_old = set()
    extra_prints = []
    for _, t in targets:
        d = dict(name=t, flags=[] if t in marked else ["info:filled_but_not_marked_DONE_in_STATUS"])
        info[t] = d
        fo = find_decl(old, t)
        fn = find_decl(new, t)
        if not fo: d["stmt"] = "NOT_IN_FC"; d["flags"].append("REVIEW:target_not_in_fc"); d["category"] = "?"; continue
        if not fn: d["stmt"] = "NOT_IN_NEW"; d["flags"].append("REVIEW:target_missing_in_file"); d["category"] = "?"; continue
        a0, d0, e0, short = fo
        a1, d1, e1, _ = fn
        odecl = old[a0:e0]; ndecl = new[a1:e1]
        attr = old[a0:d0]
        cm = re.search(r"category\s+([^,\]]+)", attr)
        d["category"] = norm(cm.group(1)) if cm else "?"
        d["attr"] = norm(attr)
        if "formal_proof" in attr: d["flags"].append("DUP:fc_formal_proof_tag_at_pinned_commit")
        # docstring preceding the attribute
        dm = re.search(r"/--((?:(?!/--).)*?)-/\s*$", old[:a0], re.S)
        d["doc"] = dm.group(1).strip() if dm else ""
        ns = namespace_at(new, d1)
        d["full"] = (ns + "." if ns else "") + short
        d["ns_fc"] = namespace_at(old, d0); d["short"] = short
        d["fc_decl_noattr"] = old[d0:e0]
        sm = re.search(r":=\s*(?:by\s+)?sorry\s*$", odecl.rstrip() + "\n", re.M) if False else re.search(r":=\s*(?:by\s+)?sorry\s*\Z", strip_comments(odecl).rstrip())
        if not sm:
            d["fc_has_proof"] = True
            if norm(odecl) == norm(ndecl):
                d["stmt"] = "IDENTICAL_DECL"; d["flags"].append("TRIVIAL:proof_already_in_FC_and_unchanged")
            else:
                d["stmt"] = "FC_ALREADY_PROVED"; d["flags"].append("REVIEW:FC_target_was_not_sorry")
            d["fc_stmt"] = norm(odecl)
        else:
            # statement = declaration text up to the final `:= (by) sorry`
            so = strip_comments(odecl).rstrip()
            fc_stmt = norm(so[:sm.start()])
            d["fc_stmt"] = fc_stmt
            nn = norm(strip_comments(ndecl))
            if "answer(sorry)" in fc_stmt:
                pat = re.escape(fc_stmt).replace(re.escape("answer(sorry)"), r"answer\((.+?)\)") + r" ?:="
                m = re.match(pat, nn)
                if m:
                    d["stmt"] = "ANSWER_SUBSTITUTED"; d["answer"] = " ;; ".join(m.groups())
                    d["flags"].append("REVIEW:answer(sorry)->answer(%s)" % d["answer"])
                else:
                    d["stmt"] = "DIFFERENT"; d["flags"].append("REVIEW:statement_differs(answer target)")
            elif nn.startswith(fc_stmt) and nn[len(fc_stmt):].lstrip().startswith(":="):
                d["stmt"] = "SAME"
            else:
                d["stmt"] = "DIFFERENT"; d["flags"].append("REVIEW:statement_differs")
            # sorry in the new proof?
            body = nn[len(fc_stmt):] if d["stmt"] == "SAME" else nn
            if re.search(r"\bsorry\b", body) and d["stmt"] != "ANSWER_SUBSTITUTED": d["flags"].append("FAIL:sorry_in_target_proof")
            if d["stmt"] == "ANSWER_SUBSTITUTED" and re.search(r"\bsorry\b", nn): d["flags"].append("FAIL:sorry_in_target_decl")
            if re.search(r"\badmit\b", nn): d["flags"].append("FAIL:admit_in_target_proof")
        # allowed old lines: from the line containing the statement end to end of decl span
        l_start = old[:a0].count("\n")
        l_end = old[:e0].count("\n")
        sc = strip_comments(odecl)
        k = sc.rfind(":=")
        l_stmt_end = l_start + (sc[:k].count("\n") if k >= 0 else 0)
        d["old_span"] = (l_start, l_stmt_end, l_end)
        rng = range(l_start, l_end) if d["stmt"] == "ANSWER_SUBSTITUTED" else range(l_stmt_end, l_end)
        allowed_old.update(rng)
        if not re.search(r"(?m)^\s*#print\s+axioms\s+(?:_root_\.)?" + re.escape(d["full"]) + r"\s*$", new):
            extra_prints.append(d["full"])
    # whole-file diff
    sm_ = difflib.SequenceMatcher(None, old_lines, core, autojunk=False)
    added = []
    for tag, i1, i2, j1, j2 in sm_.get_opcodes():
        if tag == "equal": continue
        for i in range(i1, i2):
            if old_lines[i].strip() and i not in allowed_old:
                fileflags.append("REVIEW:changed_FC_line_%d:%s" % (i + 1, old_lines[i].strip()[:60]))
        added.extend((j, core[j]) for j in range(j1, j2))
    added_txt = strip_comments("\n".join(l for _, l in added))
    seen = set()
    for l in added_txt.splitlines():
        for pat, fl in BAD_ADDED:
            if re.search(pat, l) and fl not in seen:
                seen.add(fl); fileflags.append(fl + ("" if fl.startswith("info") else ":" + l.strip()[:50]))
    # shadowing: added definitions whose name occurs in a target statement
    newdefs = re.findall(r"(?m)^\s*(?:@\[[^\]]*\]\s*)?" + MODS + r"(?:def|abbrev|structure|inductive|class)\s+([^\s:({\[]+)", added_txt)
    for nd in newdefs:
        last = nd.split(".")[-1]
        for t, d in info.items():
            if "fc_stmt" in d and re.search(r"(?<![\w.'])" + re.escape(last) + r"(?![\w'])", d["fc_stmt"]):
                fileflags.append("REVIEW:added_def_%s_occurs_in_statement_of_%s" % (nd, t))
    snew, sold = strip_comments(new), strip_comments(old)
    for nm, pat in FORBID:
        c = len(re.findall(pat, snew))
        if c:
            fileflags.append("FAIL:forbidden_%s(x%d%s)" % (nm, c, ", also %d in FC original" % len(re.findall(pat, sold)) if re.search(pat, sold) else ""))
    # build copy (identical to the session file unless #print axioms lines were missing)
    bdir = BUILD / sess; bdir.mkdir(parents=True, exist_ok=True)
    bfile = bdir / f.name
    content = new if not extra_prints else new.rstrip("\n") + "\n\n" + "".join("#print axioms %s\n" % x for x in extra_prints)
    if extra_prints: fileflags.append("info:m2_appended_print_axioms")
    if not bfile.exists() or bfile.read_text(errors="replace") != content:
        bfile.write_text(content)
    # semantic statement check for files whose added lines could change elaboration of a statement:
    # re-state each target verbatim from FC at the end of the file (outside the added opens) and require type equality by rfl
    sem = None
    if any(re.match(r"REVIEW:added_(open|variable|universe|notation|instance|attribute|set_option)", x) for x in fileflags):
        chk = []
        for k, (_, t) in enumerate(targets):
            d = info[t]
            if d.get("stmt") != "SAME": continue
            body = strip_comments(d["fc_decl_noattr"]).rstrip()
            body = re.sub(r":=\s*(?:by\s+)?sorry\s*\Z", ":= sorry", body)
            body = re.sub(r"\b(theorem|lemma)\s+" + re.escape(d["short"]) + r"(?=[\s:({\[])", "theorem m2chk_%d" % k, body, count=1)
            ns = d["ns_fc"]
            # FC's own `open` lines preceding the target are reproduced (over-approximation of the FC scope)
            pre = strip_comments(old[:old.find(d["fc_decl_noattr"])])
            fc_opens = "".join(l + "\n" for l in pre.splitlines() if re.match(r"open\b", l) and not re.search(r"\bin\s*$", l))
            chk.append(("namespace %s\n" % ns if ns else "section\n") + fc_opens + body + "\n"
                       + "example : type_of%% @m2chk_%d = type_of%% @%s := rfl\n" % (k, d["short"])
                       + ("end %s\n" % ns if ns else "end\n"))
        if chk:
            sem = bdir / (f.stem + ".semcheck.lean")
            sc_content = content.rstrip("\n") + "\n\n-- m2 semantic statement check (sorry below is only in the check copies)\n" + "\n".join(chk)
            if not sem.exists() or sem.read_text(errors="replace") != sc_content: sem.write_text(sc_content)
    return dict(sess=sess, num=num, bfile=bfile, info=info, fileflags=fileflags, targets=targets, sem=sem,
                src_sha=hashlib.sha256(f.read_bytes()).hexdigest())


def finish(fa, res):
    rows = []
    out = res.get("out", "")
    rc = res.get("rc")
    axs = {}
    for m in re.finditer(r"'([^']+)' depends on axioms: \[([^\]]*)\]", out, re.S):
        axs[m.group(1)] = [a.strip() for a in m.group(2).replace("\n", " ").split(",") if a.strip()]
    for m in re.finditer(r"'([^']+)' does not depend on any axioms", out):
        axs[m.group(1)] = []
    errs = [l for l in out.splitlines() if re.search(r"\berror\b", l)]
    for _, t in fa["targets"]:
        d = fa["info"][t]
        flags = list(d["flags"]) + list(fa["fileflags"])
        full = d.get("full", t)
        a = axs.get(full)
        if a is None:
            cands = [k for k in axs if k == t or k.endswith("." + t) or t.endswith("." + k)]
            a = axs[cands[0]] if cands else None
        if rc is None: comp = "PENDING"
        elif rc == 0 and not errs: comp = "OK"
        else: comp = "FAIL(rc=%s)" % rc; flags.append("FAIL:compile:" + (errs[0][:80] if errs else out.strip()[-80:]))
        if a is None: axstr = "MISSING" if rc is not None else "PENDING"
        else:
            axstr = "[" + ", ".join(a) + "]"
            if not set(a) <= OKAX: flags.append("FAIL:axioms")
        if a is None and rc is not None: flags.append("FAIL:no_axioms_output")
        if "sorryAx" in out and a is not None and "sorryAx" in a: flags.append("FAIL:sorryAx")
        ok = comp == "OK" and a is not None and set(a) <= OKAX and d.get("stmt") in ("SAME", "ANSWER_SUBSTITUTED") \
             and not any(x.startswith("FAIL") for x in flags)
        if any(x.startswith("TRIVIAL") for x in flags): ok = False
        hard = [x for x in flags if x.startswith(("FAIL", "REVIEW", "TRIVIAL", "DUP"))]
        verdict = "PENDING" if rc is None else ("VERIFIED" if ok and not hard else ("VERIFIED-REVIEW" if ok else "REJECTED"))
        rows.append(dict(session=fa["sess"], problem=fa["num"], theorem=full, category=d.get("category", "?"), compile=comp,
                         statement_same=d.get("stmt", "?"), axioms=axstr, flags=";".join(flags) or "-", verdict=verdict,
                         sha256=res.get("sha", ""), src_sha256=fa["src_sha"], fc_stmt=d.get("fc_stmt", ""), doc=d.get("doc", ""),
                         attr=d.get("attr", ""), answer=d.get("answer", ""), build=str(fa["bfile"]), status_name=t))
    return rows


def main():
    for p in (M2, CACHE, BUILD): p.mkdir(parents=True, exist_ok=True)
    jobs = []
    notes = []
    for sdir in sorted(p for p in WORK.iterdir() if p.is_dir()):
        st = parse_status(sdir / "STATUS.md")
        done = [(n, t) for n, t, s, _ in st if s == "DONE"]
        byn = {}
        for n, t in done: byn.setdefault(n, []).append((n, t))
        for n, ts in sorted(byn.items(), key=lambda x: int(x[0])):
            f = sdir / f"Erdos{n}.lean"
            if not f.exists():
                notes.append(f"{sdir.name}: DONE target(s) for {n} but no Erdos{n}.lean"); continue
            try:
                jobs.append(analyse_file(sdir.name, f, ts))
            except Exception as e:
                notes.append(f"{sdir.name}/Erdos{n}.lean: analysis error {e!r}")
    with cf.ThreadPoolExecutor(SLOTS) as ex:
        results = list(ex.map(lambda fa: compile_cached(fa["bfile"]), jobs))
    semjobs = [fa for fa in jobs if fa.get("sem")]
    with cf.ThreadPoolExecutor(SLOTS) as ex:
        semres = list(ex.map(lambda fa: compile_cached(fa["sem"]), semjobs))
    for fa, sr in zip(semjobs, semres):
        o = sr.get("out", "")
        errs = [l for l in o.splitlines() if re.search(r"\berror\b", l)]
        if sr.get("rc") == 0 and not errs:
            fa["fileflags"] = [x.replace("REVIEW:added_", "info:semcheck_ok_added_") if re.match(r"REVIEW:added_(open|variable|universe|notation|instance|attribute|set_option)", x) else x for x in fa["fileflags"]]
        elif sr.get("rc") is not None:
            fa["fileflags"].append("REVIEW:semcheck_failed:" + (errs[0][:80] if errs else "rc=%s" % sr.get("rc")))
    rows = []
    for fa, res in zip(jobs, results):
        rows.extend(finish(fa, res))
    # duplicates across sessions
    seen = {}
    for r in rows:
        key = (r["problem"], r["theorem"].split(".", 1)[-1] if r["theorem"].startswith("Erdos") else r["theorem"])
        key = (r["problem"], r["status_name"].split(".")[-1] if False else re.sub(r"^Erdos\d+\.", "", r["theorem"]))
        seen.setdefault(key, []).append(r)
    for key, rs in seen.items():
        if len(rs) > 1:
            for r in rs:
                others = ",".join(x["session"] for x in rs if x is not r)
                r["flags"] = (r["flags"] + ";" if r["flags"] != "-" else "") + "info:also_proved_in_" + others
    cols = ["session", "problem", "theorem", "category", "compile", "statement_same", "axioms", "flags", "verdict", "sha256"]
    with open(M2 / "VERIFIED.tsv", "w") as fh:
        fh.write("\t".join(cols) + "\n")
        for r in rows: fh.write("\t".join(str(r[c]).replace("\t", " ").replace("\n", " ") for c in cols) + "\n")
    (M2 / "verified.json").write_text(json.dumps(rows, indent=1))
    cnt = {}
    for r in rows: cnt[r["verdict"]] = cnt.get(r["verdict"], 0) + 1
    line = "%s pass: files=%d targets=%d %s%s" % (datetime.datetime.now().isoformat(timespec="seconds"), len(jobs), len(rows),
                                                  json.dumps(cnt, sort_keys=True), (" notes: " + " | ".join(notes)) if notes else "")
    with open(M2 / "STATUS.md", "a") as fh: fh.write(line + "\n")
    print(line)
    for r in rows:
        print(r["session"], r["problem"], r["theorem"], r["compile"], r["statement_same"], r["axioms"], r["verdict"], r["flags"][:150], sep=" | ")


if __name__ == "__main__":
    main()
