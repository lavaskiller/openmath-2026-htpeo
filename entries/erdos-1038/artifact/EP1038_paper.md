# The measure of the sublevel set $\{|f|<1\}$ for monic polynomials with roots in $[-1,1]$: the supremum $2\sqrt2$ and the infimum $D=1.8344304757\ldots$ (Erdős Problem #1038)

*Submission exposition updated 2026-10-03. This presents a Lean implementation of known #1038 mathematics following Wang’s acknowledged proof architecture. Appendix B records implementation differences; Appendix D gives the completed formal status. It is not a claim of a new solution or first formalization.*

---

## Abstract

Let $\mathcal P$ be the set of non-constant monic polynomials $f\in\mathbb R[x]$ all of whose roots are real and lie in $[-1,1]$, and let $S_f=\{x\in\mathbb R:|f(x)|<1\}$. We prove that
$$\sup_{f\in\mathcal P}|S_f|=2\sqrt2,$$
attained exactly by $f=(x^2-1)^m$, $m\ge1$, and that
$$\inf_{f\in\mathcal P}|S_f|=D:=\inf_{0<q<q_s}\Lambda(q),\qquad 1.8344304757\le D\le 1.8344304757628,$$
where $\Lambda(q)$ is the length of the negativity set of the logarithmic potential of an explicit one-cut probability measure (an atom at $-1$ plus a density on an interval $[a^\circ,1]$). The infimum is **not attained**: $|S_f|>D$ for every $f\in\mathcal P$.

The supremum is proved by an expansive quantile map and explicit witness measures with positive potential. The upper bound $\inf\le D$ comes from discretising the one-cut measures. The lower bound reduces, by component atomization and an endpoint normalization, to a weighted two-scale energy problem in a mass ratio $k$. Small $k$ is handled by hand. For $k>29/20$ we compare the target with a reference measure $\eta_{k,a}$: a convex supporting inequality for the width of the main component, an endpoint-corrected adjoint identity, a block reduction, and a circle rearrangement inequality reduce everything to a scalar inequality in two variables. That inequality is certified on a cover of the parameter range by outward-rounded interval arithmetic, implemented twice independently. The circle rearrangement inequality is proved from scratch by a discrete two-point rearrangement argument, so the proof uses no external theorem beyond textbook analysis.

The mathematical architecture follows Shouqiao Wang’s public proof and formalization. His final Lean project has also been successfully compiled and axiom-audited. This write-up and its associated Lean sources use different implementations of selected analytic, rearrangement and certification steps (Appendix B); they do not claim to repair Wang’s completed theorem. The primary possible formal contribution is the reusable auxiliary development, subject to novelty and admission review.

**국문 초록.** 근이 모두 실수이고 $[-1,1]$에 있는 모닉 다항식 $f$에 대해 $S_f=\{x:|f(x)|<1\}$의 길이를 다룬다.
- **상한.** $|S_f|$의 상한은 $2\sqrt2$이고, 정확히 $f=(x^2-1)^m$일 때 달성된다.
- **하한.** 하한은 명시적인 one-cut 측도로 정의되는 상수 $D=1.8344304757\ldots$이며, 어떤 다항식도 이 값에 도달하지 않는다. 증명은 다음 순서로 진행된다.
  - 성분별 원자화와 끝점 정규화로 질량비 $k$에 대한 에너지 문제로 바꾼다.
  - 작은 $k$($\le29/20$)는 직접 처리한다.
  - 큰 $k$는 기준 측도와의 비교, 볼록 지지 부등식, 끝점 보정 adjoint 항등식, 블록 환원, 원 위 재배열 부등식으로 두 변수 스칼라 부등식으로 줄인다.
  - 그 스칼라 부등식을 서로 독립인 두 구간 산술 구현으로 인증한다.
- **외부 정리.** 교과서 수준의 해석학 외에는 쓰지 않는다. 원 위 재배열 부등식도 이산 두 점 재배열 논법으로 여기서 직접 증명한다.
- **형식화.** 상한 정리 전체와 하한 $61/40$은 Lean 4로 형식화되어 있다(부록 D).

---

## Contents

1. Statement and history
2. The supremum
3. Reductions for the infimum
4. The small mass-ratio range
5. The one-cut family, the constant $D$, and sharpness
6. Reference measures and the convex supporting inequality
7. The endpoint-corrected adjoint inequality
8. Block reduction and circle rearrangement
9. The parameter cover and the certificates
10. Assembly

Appendix A. Interval-arithmetic certificates
Appendix B. Repairs relative to Wang's claim
Appendix C. Dependencies
Appendix D. Lean formalisation status
Numbering correspondence with `proof.md`

---

## 1. Statement and history

### 1.1 The theorem

Throughout, $|X|$ is the Lebesgue measure of $X\subset\mathbb R$, roots are counted with multiplicity, and
$$\mathcal P=\{f\in\mathbb R[x]\ \text{monic},\ \deg f\ge1,\ \text{all roots real and in }[-1,1]\},\qquad S_f=\{x\in\mathbb R:|f(x)|<1\}.$$

**The one-cut constant $D$.** For $q\in(0,1)$ put
$$H(q)=\frac{2q}{(1+q)^2},\qquad A(q)=\frac{\log H(q)}{\log q},\qquad s(q)=\frac{1-q}{1+q},\qquad \mathfrak f(q)=(1+q)\log\frac{2}{(1+q)^2}+2q\log q .$$
$\mathfrak f$ is strictly decreasing on $(0,1)$ with $\mathfrak f(0^+)=\log2$, and its unique zero $q_s$ lies in $(0.1236,0.1237)$ (Definition 5.3, Certificate 5.5). For $0<q<q_s$ the function
$$F_{A(q)}(u)=A(q)\log\frac{u-q}{|1-qu|}-\log u\qquad(u>1,\ u\neq1/q)$$
vanishes at $u=1$, decreases and then increases on $(1,1/q)$, and decreases from $+\infty$ to $-\infty$ on $(1/q,\infty)$. It has exactly one zero $u_+$ on the increasing part of $(1,1/q)$ and exactly one zero $u_->1/q$ (Lemma 5.2). Put
$$\Lambda(q)=H(q)\Big(u_-+u_-^{-1}-u_+-u_+^{-1}\Big),\qquad D:=\inf_{0<q<q_s}\Lambda(q).$$
Equivalently, $\Lambda(q)=|\{V_{\mu_q}<0\}|$ with $V_\mu(x)=\int\log|x-t|\,d\mu(t)$ and the one-cut probability measure
$$\mu_q=A\,\delta_{-1}+\frac{t+1-2As}{\pi(t+1)\sqrt{(t-a^\circ)(1-t)}}\,\mathbf 1_{[a^\circ,1]}(t)\,dt,\qquad A=A(q),\ s=s(q),\ a^\circ=2s^2-1$$
(Definition 5.3). A floating-point scan places the infimum at an interior point $q\approx0.0257155$; this is not used.

> **Theorem 1.1 (main theorem).**
> 1. For every $f\in\mathcal P$, $|S_f|\le2\sqrt2$, with equality if and only if $f=(x^2-1)^m$ for some $m\ge1$. Hence $\sup_{f\in\mathcal P}|S_f|=2\sqrt2$, and it is attained.
> 2. For every $f\in\mathcal P$, $|S_f|>D$, and $\inf_{f\in\mathcal P}|S_f|=D$. Hence the infimum equals $D$ and is not attained.
> 3. $1.8344304757\le D\le1.8344304757628$.

Part 1 is Theorem 2.7. Parts 2 and 3 are Theorem 10.2, which combines the lower bound (Theorem 10.1), the sharpness construction (Theorem 5.4) and the certified enclosures of $D$ (Certificates 5.5 and 9.3). Part 3 is needed only for the digits of $D$.

### 1.2 History and sources

The historical background below derives from a survey ending 2026-09-03. Those dated reports are not current open-status evidence. The current formalization comparison is Appendix B and `CONTRIBUTIONS.md`: Wang’s final Lean has been compiled, and plby/lean-proofs also publicly imports/ports it. The earlier draft’s acceptance labels must not be used to claim competition novelty.

- **Erdős–Herzog–Piranian** (*Metric properties of polynomials*, J. Analyse Math. 6 (1958), 125–148) posed the problem. They showed $|S_f|\le2\sqrt2$ when all roots lie in $\{-1,1\}$, conjectured that $2\sqrt2$ is the best upper bound, and showed $\inf<2$ using $f=(x+1)(x-1)^m$, $m\ge3$. With roots allowed in $[-2,2]$ the infimum is $0$; Pommerenke (1961) showed that the set then contains an interval of width $\gg n^{-4}$.
- **Supremum.** Proofs of $\sup=2\sqrt2$ are attributed to **Á. Elbert** (1966/1968) and were given by **T. Tao** (notes, December 2025). These attributions come from the problem page and forum; they are background and have not been verified here. Section 2 gives an independent proof.
- **Infimum.** The problem page lists $2^{4/3}-1\approx1.519\le\inf\le1.835$. Forum contributors later reported certified lower bounds $1.814605$ and $1.828$, and a limiting construction with value $1.834430475762\ldots$ (an atom of mass $\approx0.8245$ at an endpoint plus a density on $\approx[0.8045,1]$), which no finite-degree polynomial attains.
- **Three public proof claims**, by **Wang**, by **Darvas–Peng–R. Tao**, and by **Budala**, assert $\inf=D$, not attained. This describes the old survey only. Wang’s source has since been independently compiled in this workspace; journal acceptance is not required for prior formal work to exist.

**Use of the sources.** Wang’s mathematical architecture and the supremum/reduction ideas attributed to Tao were known sources of ideas. The initial informal draft was supplied by @n0rang2 and continued under Hyunjin Lee’s direction with ChatGPT/Codex. The implementation re-derives selected steps using different formal interfaces and certificate methods; “independent” here must not imply independence of the mathematical ideas or certified independent authorship. No unproved assertion of Wang is used as an axiom. Earlier drafting claims about repairing his prose are superseded by the comparison of his completed, checked Lean project in Appendix B.

### 1.3 Outline

- **§2 (supremum).** If $|S_f|\ge2\sqrt2$ and the sublevel set reaches beyond $\pm\sqrt2$, an expansive quantile map together with a measure $\lambda$ on $[0,2\sqrt2]$ with positive potential on a window gives a contradiction. Two explicit families of witness measures cover all cases. Equality forces $f=(x^2-1)^m$.
- **§3 (reductions).** Collapsing the roots in each component of $S_f$ to their mean only shrinks $S_f$ (atomization). A reflection gives $(-1,0)\subset S_f$. A translation puts the main root at $-1$ with mass fraction $A\ge1/2$. Shifting by $1$ gives the normal form $W(x)=k\log|x|+\sum_iq_i\log|x-d_i|$, with $k=A/(1-A)\ge1$ and $d_i\in[1,2]$, and the bound $|S_f|\ge\mathcal J_k=M_k+2\sum_iR_i$ (main width plus residual radii).
- **§4.** For $1\le k\le29/20$, $\mathcal J_k>2$.
- **§5.** The one-cut family $\mu_{A(q)}$, the constant $D$, and $\inf\le D$.
- **§§6–8 (large $k$).** For a reference $\eta_{k,a}$ on $[a,2]$ with constant potential platform:
  - §6: the main width is convex along quantile segments, which gives $M_k(T)\ge M_k(T_0)+\dot M_k(T_0;T-T_0)$;
  - §7: $\dot M_k$ is rewritten as $\int g\,d\xi$ plus an endpoint term of the right sign;
  - §8: a pointwise tangent inequality and a minimisation in each residual radius reduce $\mathcal J_k\ge L$ to a block energy inequality, which a circle rearrangement inequality (Theorem 8.8, proved here) reduces to a scalar inequality in two variables $(Q,R)$.
- **§9.** The scalar inequality and the hypotheses on the reference are certified on a cover of $k\ge36/25$ by interval arithmetic (two independent implementations).
- **§10.** Assembly.

### 1.4 Status

- This is a **computer-assisted proof**: finitely many numerical inequalities are certified in exact rational / outward-rounded interval arithmetic (Appendix A). **Every** numerical certificate was implemented twice, independently (`cert2/`, `cert3/`): the witness inequalities of §2, the constant $D$ of §5, and the parameter cover of §9. The constants of §4 are proved in Lean.
- The mathematics of `proof.md`, Phase II, passed independent Math RED reviews: Reviews 4–9 cover Stages 6–14, Review 10 covers Stage 12b (Theorem 8.8 here), and Review 11 was an end-to-end integration red team (complete chain, no blocking gap). Each passed (with minor fixes), and all findings M-20 … M-138 were fixed or answered; this paper integrates the fixes. The reviews are recorded in `math-red.md`. They were carried out by independent AI reviewer agents; the proof has not been peer-reviewed outside this workspace.
- **No external theorem** is used beyond textbook analysis (Appendix C). The circle Riesz rearrangement inequality, cited in an earlier version, is now proved in the form needed (Theorem 8.8); the literature is listed only as an alternative citation.
- Parts of the proof are formalised in Lean 4 / Mathlib (Appendix D), with only the standard axioms:
  - **part 1 of Theorem 1.1 (the supremum, with its equality case), completely**;
  - the elementary lower bound $61/40\le|S_f|$ (Corollary 4.2);
  - $m_1=m_2=m_3=2>m_4$;
  - the discrete cyclic Riesz inequality (Theorem 8.13) and Lemma 8.7;
  - **§5 completely**: the one-cut family, $D$ as an infimum, and the sharpness bound $\inf_{f\in\mathcal P}|S_f|\le D$ (Theorem 5.4). Only the printed digits of $q_s$ and $D$ are interval certificates.

  The lower bound $|S_f|>D$ (§§6–10) is not yet formalised.

### 1.5 Notation

Symbols introduced inside a proof are local to that proof. The table lists the global symbols and every symbol that `proof.md` used with more than one meaning, together with the name used here.

| symbol here | meaning | scope | `proof.md` name / clash resolved |
|---|---|---|---|
| $\mathcal P$, $S_f$, $\lvert\cdot\rvert$ | the class; the sublevel set; Lebesgue measure | global | — |
| $V_\mu$, $E_\mu$ | $\int\log\lvert x-t\rvert\,d\mu(t)$; $\{V_\mu<0\}$ | §§3, 5 | — |
| $B_\ast$ | $2\sqrt2$ | §2 | $B$ (clashed with the residual mass, $B_A$ and the density $B(\theta)$; M-31) |
| $G(y)$ | $\lvert K\cap[0,y]\rvert$ | §2 | $H(y)$ (M-31) |
| $\Delta(u)$, $p$, $\ell_p$, $\vartheta(t)$ | Lemma 2.4: witness function, $1+\sqrt2$, $\log(1+\sqrt2)$, $\log(1+t)\log(1-t)$ | §2 | $\varphi(u)$, $P$, $L$, $A(t)$ |
| $\omega_c$ | arcsine probability measure on $[c,B_\ast]$ | §2 | $\rho_c$ |
| $A$ | mass fraction of the main root; $A=k/(k+1)$ | §§3–5, 9, 10 | — |
| $1-A$ | residual mass | §3 | $B$ (M-31) |
| $\mathcal C_j$, $\mathcal C_0$ | components of $S_f$; the main component | §3 | $I_j$, $I_0$ |
| $V_i$ | potential without the self-term (Lemma 3.6) | §3 | $H_i$ (M-31) |
| $(\lambda_i^-,\lambda_i^+)$ | residual component containing $d_i$ | §3 | $(\ell_i,r_i)$ |
| $\rho_{\rm w}(k)$ | endpoint window, $\rho^k(2+\rho)=1$ | §§3–4 | $\rho(k)$ |
| $k,\ q_i,\ d_i,\ N,\ W,\ M_k,\ R_i,\ \mathcal J_k$ | normal form (Definition 3.5) | global from §3 | — |
| $\bar k$, $\bar\varepsilon$, $Q_2$, $\Sigma_R$ | $29/20$; $2-(\bar k+1)\bar k^{-\bar k/(\bar k+1)}$; $\sum q_i^2$; $\sum R_i$ | §4 | $K$, $\varepsilon_K$, $Q$, $S$ |
| $q$ | one-cut parameter | §§1, 5, 9 | — (also $=\rho_0$ of the terminal reference, §9) |
| $a^\circ$ | $2s^2-1$, left end of the one-cut support in $[-1,1]$ | §5 | $a$ (the shifted edge is $a=a^\circ+1$) |
| $\ell$ | half-length of the support interval | §§5–9 | $h$ (Stage 9), $\varrho$ (Stage 10), $r$ (Stage 11), $\ell$ (Stage 12) |
| $H$ | $\ell/2$; $=2q/(1+q)^2$ in §5, $=(2-a)/4$ in §§6–9 | §§5–9 | — (M-31) |
| $b_A$ | $1+q^2-A(1-q^2)$ | §5 | $B_A$ (M-31) |
| $\mathfrak f(q)$, $d_q$ | $(1+q)\log\frac2{(1+q)^2}+2q\log q$; $\log\frac2{(1+q)^2}$ | §§1, 5, 9 | $f(q)$, $d$ |
| $\Lambda(q)$, $D$, $q_s$ | one-cut width; its infimum; the zero of $\mathfrak f$ | global | — |
| $L_{\rm hi}$, $D_{\rm lo}$ | $1.8344304757628$; $1.8344304757$ | global | — |
| $\rho_0$ | $\frac{\sqrt2-\sqrt a}{\sqrt2+\sqrt a}=e^{-\tau_0}$ | §§6–9 | $q$ in Stage 10 (M-43) |
| $P_\rho(\theta)$ | Poisson kernel $\frac{1-\rho^2}{1-2\rho\cos\theta+\rho^2}$ | §§6–8 | $P_q$ |
| $\rho_x$ | $e^{-\tau_x}$, the Poisson parameter of the point $x<a$ | §§6–7 | $p=e^{-\tau_x}$ |
| $D_0(a)$ | $\big(\frac{\sqrt a+\sqrt2}2\big)^2$ | §§6–9 | unrelated to $D$ (M-43) |
| $\mathcal R_S(y)$ | $\exp(-\frac1k\int\operatorname{Log}(S-y))$ | §6 | $E_S$ |
| $\Psi^\ast(S)$ | separation level $\sup_{(0,a_S)}\Psi_S$ | §6 | $P(S)$ (M-43) |
| $\varrho$ | a point of $(0,a_S)$ (Cauchy radius) | §6 | $r$ (M-43) |
| $m_p(S)$ | moments $\int S^{-p}$ | §6 | $m_\ell(S)$ |
| $\operatorname{rad}(S)$ | radius of convergence of $\Phi_S$ | §6 | $\rho(S)$ |
| $\varkappa(s)$, $\varkappa_\ast$ | ratio $R(T_s)/\Psi_{T_s}(\varrho)$ and its bound | §6 | $\theta(s)$, $\theta_\ast$ |
| $\alpha(d)$, $\alpha(\theta)$ | density factor $k+1-k\sqrt{2a}/d$ of $\eta$ | §§7–8 | $A(d)$, $A(\theta)$ (clashed with the main mass $A$) |
| $D_\xi$ | $\sum_\pm\sigma_\pm P_{\rho_\pm}(0)$ | §§7–8 | $D$ (M-43, M-81) |
| $B(\theta)$, $\xi$, $b_\pi$, $R_\xi$ | adjoint density, measure, $B(\pi)$, $\xi(I)$ | §§7–9 | $R_0=\xi(I)$ ("Wang's $R_0$") |
| $u_i$ | cumulative masses $q_1+\dots+q_i$; blocks $I_i=[u_{i-1},u_i)$ | §§7–8 | $Q_i$ (Stage 11), $s_i$ (Stage 12) (M-81) |
| $\mathcal I_i$ | spatial block $[\beta_{i-1},\beta_i]=T_0(\bar I_i)$ | §7 | $J_i$ |
| $\mathcal M(s)$ | $M_k(T_s)$ | §7 | $\varphi(s)$ |
| $\lambda_{\mathcal H}(\theta)$, $\operatorname{Lip}(f)$ | majorant in Lemma 7.2(iv); Lipschitz constant | §7 | $\Lambda(\theta)$, $L$ |
| $\Sigma_n(\rho)$ | Chebyshev–Poisson integrals | §7 | $S_n(\rho)$ |
| $\psi_S(y)$ | $\Psi_S(y)/y$ | §7 | $h_S(y)$ |
| $\mathfrak L(f)$ | the endpoint functional | §7 | $\mathcal L(f)$ |
| $g$ | first variation (7.2) / (8.1) | §§7–8 | also the circle function in Stage 12 (M-81) |
| $q',r'$ | $\lvert I'\rvert$, $\hat\xi(I')$ for a quantile interval $I'$ | §8 | $q,r$ |
| $\Xi_i$ | function minimised in Proposition 8.6 | §8 | $\Phi_i$ (M-81) |
| $\Phi$ | $F_0\circ d$ | §8 | — |
| $\varphi_1,\varphi_2$ | $[0,1]$-valued functions on $\mathbb T$ | §8 | $f,g$ (M-81) |
| $K(t)$ | $\log\lvert e^{it}-1\rvert=\log\lvert2\sin(t/2)\rvert$ | §8 | keeps its name (M-131) |
| $\mathcal L$, $\mathcal L_N$ | $\log2-K=-\log\lvert\sin(t/2)\rvert$; its truncation $\min(\mathcal L,N)$ ($N$ a truncation level) | §8 | — |
| $\mathcal E(I')$ | block energy of a quantile interval | §8 | — |
| $\kappa$, $\bar\kappa$ | generic bounded kernel of Theorem 8.8 and its bound | §8 | $K$, $M$ in Stage 12b (M-131) |
| $\delta_n$, $\Delta_i$, $\gamma^{(n)}$ | mesh $2\pi/n$; cells; cell kernel | §8 | $h$, $C_i$, $c$ (M-131) |
| $\gamma$, $S_\gamma$ | generic symmetric decreasing kernel on $\mathbb Z_n$; its bilinear form | §8 | $c$, $S_c$ |
| $\iota_m$, $\Omega_m$, $\operatorname{Fix}_m$, $\operatorname{Pol}_m$, $\operatorname{Pot}$ | reflection, half-set, fixed set, polarization, potential on $\mathbb Z_n$ | §8 | $\sigma_m$, $H_m$, $F_m$, $P_m$, $\Pi$ (M-131, M-134) |
| $\mathbb E_n$ | cell averages | §8 | $E_n$ |
| $\Upsilon$, $\varpi$, $\mathcal S(Q,R)$ | constant term, $-\pi C_{\rm eff}/a_\pi$, scalar function (Corollary 8.20) | §§8–9 | $\mathcal B$, $P$, $\Lambda(Q,R)$ (M-81) |
| $\mathfrak E(v)$ | exterior function in the variable $v$ | §9 | $E(v)$ |
| $\varsigma$ | $1/\log(1/q)$, terminal parametrisation | §9, App. A | $\varrho$ (Stage 13), "rho" in the scripts |

### 1.6 Preliminaries

**Lemma 1.2 (localisation and structure).** Let $f\in\mathcal P$ have degree $n$ and roots $r_1,\dots,r_n\in[-1,1]$.
- (a) $S_f\subseteq(\min_ir_i-1,\ \max_ir_i+1)\subseteq(-2,2)$.
- (b) $S_f$ is open and is a union of at most $2n$ pairwise disjoint open intervals, whose endpoints lie in $Z:=\{x:f(x)^2=1\}$, a set of at most $2n$ points.

*Proof.*
- (a) If $x\ge\max_ir_i+1$, every factor satisfies $|x-r_i|\ge1$, so $|f(x)|\ge1$. The case $x\le\min_ir_i-1$ is the same.
- (b) $S_f$ is the preimage of an open set under a continuous map, hence open, and it is bounded by (a). So it is a disjoint union of countably many open intervals, whose endpoints lie in $\partial S_f\subseteq\{|f|=1\}=Z$.
  - $Z$ is the zero set of $f^2-1$, a nonzero (monic) polynomial of degree $2n$, so $|Z|\le2n$.
  - Distinct components have distinct left endpoints in $Z$, so there are at most $2n$ components. $\square$

*Remark.* Every component of $S_f$ contains a root of $f$ (Lemma 3.1 below), so $S_f$ has at most $n$ components.

**Lemma 1.3 (continuity; existence of a minimiser).** For $n\ge1$ and $r=(r_1,\dots,r_n)\in[-1,1]^n$ put $f_r(x)=\prod_i(x-r_i)$ and $L(r)=|S_{f_r}|$. Then $L:[-1,1]^n\to\mathbb R$ is continuous. Hence the fixed-degree minimum $m_n:=\min\{|S_f|:f\in\mathcal P,\ \deg f=n\}=\min L$ is attained.

*Proof.* Let $r^{(j)}\to r$. For every $x$ with $f_r(x)^2\ne1$, continuity of $(r,x)\mapsto f_r(x)$ gives $\mathbf 1_{S_{f_{r^{(j)}}}}(x)\to\mathbf 1_{S_{f_r}}(x)$: if $|f_r(x)|<1$, then eventually $|f_{r^{(j)}}(x)|<1$; if $|f_r(x)|>1$, then eventually $>1$. The exceptional set $\{f_r^2=1\}$ is finite, hence null. All indicators are dominated by $\mathbf 1_{(-2,2)}$ (Lemma 1.2(a)). Dominated convergence gives $L(r^{(j)})\to L(r)$. $[-1,1]^n$ is compact, and the monic real polynomials of degree $n$ with all roots in $[-1,1]$ are exactly the $f_r$. $\square$

Lemmas 1.2 and 1.3 are Lemmas 1.1 and 1.3 of `proof.md` (Phase I). The other Phase I results of `proof.md` — the exact fixed-degree minima $m_1=m_2=m_3=2$ and $m_4,\dots,m_7$, proved there by hand for $n\le3$ and by exact certificates for $4\le n\le7$ — are quoted in Corollary 10.3 but not reproved here.

---

## 2. The supremum

*Idea source:* the duality / expansive-quantile argument of Tao's note, as presented in Budala §9. Every step is re-proved; the numerical inequalities are certified by `cert2/sup_check.py` (Appendix A).

**Notation for this section.**
- $f\in\mathcal P$ has degree $n$ and roots $r_1,\dots,r_n\in[-1,1]$.
- $\bar S=\{|f|\le1\}$, which is closed, and $S=S_f=\{|f|<1\}$.
- $V(x)=\frac1n\log|f(x)|=\frac1n\sum_j\log|x-r_j|\in[-\infty,\infty)$.
- $B_\ast:=2\sqrt2$.
- $\bar S\setminus S\subseteq\{f^2=1\}$ is finite (Lemma 1.2), so $|\bar S|=|S|$.

### Lemma 2.1 (extreme points)
$\bar S$ is a nonempty compact subset of $[-2,2]$. Put $\alpha=\min\bar S$ and $\beta=\max\bar S$. Then $|f(\alpha)|=|f(\beta)|=1$, and $\beta-\alpha\ge|\bar S|$.

*Proof.*
- $\bar S$ is closed. It contains the roots, so it is nonempty. For $|x|>2$ every factor satisfies $|x-r_j|>1$, so $|f(x)|>1$; hence $\bar S\subseteq[-2,2]$.
- $|f(\alpha)|\le1$, and $|f|>1$ on $(-\infty,\alpha)$, so continuity gives $|f(\alpha)|=1$. The same argument works for $\beta$.
- $\bar S\subseteq[\alpha,\beta]$. $\square$

### Lemma 2.2 (expansive quantile map)
Let $K\subset[0,\infty)$ be compact with $0\in K$ and $|K|\ge B_\ast$. Put $G(y)=|K\cap[0,y]|$ for $y\ge0$, and $\phi(s)=\min\{y\ge0:G(y)\ge s\}$ for $s\in[0,B_\ast]$. Then:
- (i) $G(\phi(s))=s$;
- (ii) $\phi(s)\in K$;
- (iii) $\phi(t)-\phi(s)\ge t-s$ for $0\le s\le t\le B_\ast$;
- (iv) if $[0,a]\subseteq K$, then $\phi(s)=s$ for $s\le a$;
- (v) for every $y\ge0$, with $x(y):=\min(G(y),B_\ast)$: $|y-\phi(s)|\ge|x(y)-s|$ for all $s\in[0,B_\ast]$.

*Proof.*
- $G$ is nondecreasing and 1-Lipschitz, with $G(0)=0$ and $G(\max K)=|K|\ge B_\ast$. So $\{G\ge s\}$ is a nonempty closed subset of $[0,\infty)$ and the minimum exists.
- (i) For $s=0$, $\phi(0)=0$. For $s>0$: $G(\phi(s))\ge s$, $G<s$ on $[0,\phi(s))$, and $\phi(s)>0$; continuity gives equality.
- (ii) For $s=0$ this is $0\in K$. For $s>0$, if $\phi(s)\notin K$, some $(\phi(s)-\epsilon,\phi(s)]$ with $\phi(s)-\epsilon\ge0$ misses $K$. Then $G(\phi(s)-\epsilon)=G(\phi(s))=s$, contradicting minimality.
- (iii) $\phi$ is nondecreasing, and by (i) and the 1-Lipschitz property, $t-s=G(\phi(t))-G(\phi(s))\le\phi(t)-\phi(s)$.
- (iv) $G(y)=y$ on $[0,a]$.
- (v) Two cases.
  - If $s\le x(y)$: then $G(y)\ge s$, so $\phi(s)\le y$, and $y-\phi(s)\ge G(y)-G(\phi(s))=G(y)-s\ge x(y)-s\ge0$.
  - If $s>x(y)$: then $x(y)=G(y)<s$ (as $s\le B_\ast$), so $G\le G(y)<s$ on $[0,y]$ and $\phi(s)>y$. Hence $\phi(s)-y\ge s-G(y)=s-x(y)$. $\square$

### Lemma 2.3 (witness contradiction)
Let $f\in\mathcal P$ with $|\bar S|\ge B_\ast$, and suppose $M:=\max(-\alpha,\beta)>\sqrt2$. Put $a:=M-1$, so $\sqrt2-1<a\le1$. Suppose there is a finite positive Borel measure $\lambda$ on $[0,B_\ast]$ whose potential $W_\lambda(x)=\int\log|x-s|\,d\lambda(s)$ satisfies $W_\lambda(x)>0$ for every $x\in[a,\min(B_\ast,a+2)]$. Then we reach a contradiction.

*Proof.*
- $M\le2$ by Lemma 2.1.
- Replacing $f$ by $(-1)^nf(-x)$ (same class, $\bar S\mapsto-\bar S$) we may assume $\alpha=-M$.
- Put $\tilde f(x)=f(x-M)$, with roots $\tilde r_j=r_j+M\in[a,a+2]$, $K=\{|\tilde f|\le1\}=\bar S+M$ (so $\min K=0$ and $|K|\ge B_\ast$), and $\tilde V(x)=\frac1n\sum_j\log|x-\tilde r_j|$.
- *$[0,a]\subseteq K$.* $\tilde V(0)=0$ by Lemma 2.1. On $(0,a)$ every $\tilde r_j>x$, so $\tilde V'=\frac1n\sum_j1/(x-\tilde r_j)<0$. Hence $\tilde V<0$ on $(0,a)$, i.e. $(0,a)\subseteq K$. Since $\tilde f$ is continuous, $K$ is closed, so $a\in K$ (equivalently $\tilde V(a)\le0$).
- *Range of $x(\tilde r_j)$.* $G(\tilde r_j)\ge G(a)=a$ and $G(\tilde r_j)\le\tilde r_j\le a+2$, so $x(\tilde r_j)\in[a,\min(B_\ast,a+2)]$ (note $a\le1<B_\ast$).
- *Two-sided estimate of $I:=\int\tilde V(\phi(s))\,d\lambda(s)$.* $\phi$ is monotone and $\tilde V$ is upper semicontinuous, so $I$ is well defined in $[-\infty,\infty)$.
  - By Lemma 2.2(ii), $\phi(s)\in K$, where $\tilde V\le0$. So $I\le0$.
  - By Lemma 2.2(v), $\tilde V(\phi(s))=\frac1n\sum_j\log|\tilde r_j-\phi(s)|\ge\frac1n\sum_j\log|x(\tilde r_j)-s|$. Integrating gives $I\ge\frac1n\sum_jW_\lambda(x(\tilde r_j))>0$. (Each $s\mapsto\log|x-s|$ is bounded above on $[0,B_\ast]$, so all integrals are defined.)
- These two bounds contradict each other. $\square$

### Lemma 2.4 (witness for $\sqrt2-1<a\le3/4$)
**Setup.** Put $\lambda=\delta_0+C\delta_{B_\ast}$, so $W(x)=\log x+C\log(B_\ast-x)$ on $(0,B_\ast)$. $W$ is concave. Since $a+2\le11/4<B_\ast$, it suffices to have $W(a)>0$ and $W(a+2)>0$.
- Here $B_\ast-a>1$ and $0<B_\ast-a-2<1$ (because $a>\sqrt2-1$ and $a\le3/4<B_\ast-2$).
- So the two conditions read $C>C_-:=-\log a/\log(B_\ast-a)$ and $C<C_+:=\log(a+2)/(-\log(B_\ast-a-2))$.
- A suitable $C$ exists iff $C_-<C_+$, i.e. $\log a\cdot\log(B_\ast-a-2)<\log(a+2)\log(B_\ast-a)$.

**Reduction.** Put $p=1+\sqrt2$, so $p^{-1}=\sqrt2-1$, and $a=p^{-1}+u$ with $0<u\le U:=7/4-\sqrt2$. Then $a+2=p+u$, $B_\ast-a=p-u$ and $B_\ast-a-2=p^{-1}-u$. The condition becomes
$$\Delta(u):=\log(p+u)\log(p-u)-\log(p^{-1}+u)\log(p^{-1}-u)>0 .$$

**(A1) Small $u$: $0<u\le1/10$.** Write $\ell_p=\log p=-\log p^{-1}$ and $\vartheta(t)=\log(1+t)\log(1-t)$. For $c>0$ and $t=u/c$, $\log(c+u)\log(c-u)=(\log c)^2+(\log c)\log(1-t^2)+\vartheta(t)$. The $(\log c)^2$ terms cancel between $c=p$ and $c=p^{-1}$, and
$$\Delta(u)=\ell_p\big[\log(1-u^2/p^2)+\log(1-u^2p^2)\big]+\vartheta(u/p)-\vartheta(up).$$
- Series coefficients:
  - $\vartheta(t)=\sum_{k\ge1}c_{2k}t^{2k}$, where $c_N=\sum_{i=1}^{N-1}(-1)^i/(i(N-i))$; odd $N$ give $0$.
  - For even $N=2k$, $c_{2k}=-s_k/k$ with $s_k=\sum_{i=1}^{2k-1}(-1)^{i+1}/i\in(\log2,1]$. This uses $\frac1{i(2k-i)}=\frac1{2k}\big(\frac1i+\frac1{2k-i}\big)$.
- Hence, for $u<p^{-1}$ (where all series converge),
$$\Delta(u)=\sum_{k\ge1}e_ku^{2k},\qquad e_k=\frac{p^{2k}(s_k-\ell_p)-p^{-2k}(s_k+\ell_p)}{k}.$$
- Since $|s_k-\ell_p|\le1$ and $s_k+\ell_p\le2$, we have $|e_k|\le(p^{2k}+2)/k$. For $0<u\le u_0=1/10$:
$$\Delta(u)/u^2\ge e_1-T,\qquad T=\tfrac12\Big[\frac{p^4u_0^2}{1-p^2u_0^2}+\frac{2u_0^2}{1-u_0^2}\Big].$$
- `sup_check.py` (A1) certifies $e_1=p^2(1-\ell_p)-p^{-2}(1+\ell_p)\in[0.368612727375,0.368612727376]$, $T\le0.19047$, and $e_1-T>0.178$.

**(A2) Remaining range: $1/10\le u\le0.3358$** (and $U<0.3358<p^{-1}$ is certified). Adaptive bisection with interval evaluation of $\Delta$ certifies $\Delta>0$ in 95 boxes. The smallest box-enclosure lower bound is $1.77\cdot10^{-5}$; the true minimum of $\Delta$ on $[0.1,U]$ is about $0.0036$, at $u=0.1$. $\square$

*Remark.* $\Delta(u)\sim e_1u^2$ as $u\to0$. This second-order tangency is forced: $a=\sqrt2-1$ is the equality configuration $(x^2-1)^m$. (In `sup_check.py` the function $\Delta$ is called `phi`.)

*Remark (a shorter route; not used above).* For $k\ge2$, $s_k\le s_2=5/6<\ell_p=\log(1+\sqrt2)$. Hence $e_k<0$ for all $k\ge2$, and $\Delta(u)/u^2$ is nonincreasing on $(0,p^{-1})$.
- So $\Delta(u)\ge(u/U)^2\Delta(U)>0$ on $(0,U]$, and Lemma 2.4 needs only the value $\Delta(U)\in[0.007779484229,0.007779484230]$ (certified by `cert3/sup3.py`).
- The same argument shows that the two-atom witness works exactly for $a<a^\ast\approx0.7624575$.

### Lemma 2.5 (arcsine potentials)
For $c<B_\ast$ let $\omega_c(dt)=dt/(\pi\sqrt{(t-c)(B_\ast-t)})$ on $[c,B_\ast]$ (a probability measure), and put $U_c(x)=\int\log|x-t|\,d\omega_c(t)$. Then:
- $U_c(x)=\log\frac{B_\ast-c}4$ for $x\in[c,B_\ast]$;
- $U_c(x)=\log\frac{\frac{c+B_\ast}2-x+\sqrt{(c-x)(B_\ast-x)}}2$ for $x\le c$;
- $U_c'(x)=-1/\sqrt{(c-x)(B_\ast-x)}$ for $x<c$.

*Proof.* Put $t=\frac{c+B_\ast}2+\ell_c\cos\theta$ with $\ell_c=\frac{B_\ast-c}2$, so $d\omega_c=d\theta/\pi$ on $[0,\pi]$. Then $x-t=\ell_c(z-\cos\theta)$, i.e. $\log|x-t|=\log\ell_c+\log|z-\cos\theta|$, with $z=(x-\frac{c+B_\ast}2)/\ell_c$.
- *Case $|z|\le1$, $z=\cos\psi$.* Here $|z-\cos\theta|=2|\sin\frac{\theta+\psi}2|\,|\sin\frac{\theta-\psi}2|$. Reflecting $\theta\mapsto-\theta$ in the first factor, $\frac1\pi\int_0^\pi\log|z-\cos\theta|\,d\theta=-\log2+\frac1\pi\int_{-\pi}^{\pi}\log|2\sin\frac{\theta-\psi}2|\,d\theta=-\log2$. The last step uses $\int_0^{2\pi}\log|1-e^{i\tau}|\,d\tau=0$, which is classical and equivalent to $\int_0^\pi\log\sin=-\pi\log2$.
- *Case $|z|>1$.* Write $|z|=\frac12(w+w^{-1})$ with $w=|z|+\sqrt{z^2-1}>1$. For $z>1$, $|z-\cos\theta|=z-\cos\theta=\frac1{2w}|w-e^{i\theta}|\,|w-e^{-i\theta}|$. For $z<-1$, $|z-\cos\theta|=|z|+\cos\theta$, which becomes the previous expression after $\theta\mapsto\pi-\theta$; this change leaves the average over $[0,\pi]$ unchanged. Since $\frac1{2\pi}\int_0^{2\pi}\log|w-e^{i\theta}|\,d\theta=\log w$ for $w>1$ (expand $\log|1-e^{i\theta}/w|$), the average is $\log(w/2)$.
- Undo the scaling. For $x\le c$, $w=(\frac{c+B_\ast}2-x+\sqrt{(c-x)(B_\ast-x)})/\ell_c$, because $(\frac{c+B_\ast}2-x)^2-\ell_c^2=(c-x)(B_\ast-x)$.
- The derivative is a direct computation. $\square$

### Lemma 2.6 (witness for $3/4\le a\le1$)
Let $h_0=9/25$, $q_0=2^{1/4}$, $w(c)=\sqrt{B_\ast}/(2c^{3/2})$ on $[2,B_\ast]$, and
$$\lambda=\delta_0+h_0\omega_2+\int_2^{B_\ast}w(c)\,\omega_c\,dc,\qquad W(x)=\log|x|+h_0U_2(x)+\int_2^{B_\ast}w(c)U_c(x)\,dc .$$
Then $W>0$ on $[3/4,B_\ast]$. This interval contains $[a,\min(B_\ast,a+2)]$ for $a\ge3/4$.

*Proof.*
- *Definitions.* $\lambda$ is the Borel measure $E\mapsto\delta_0(E)+h_0\omega_2(E)+\int_2^{B_\ast}w(c)\omega_c(E)\,dc$. Tonelli, applied to the positive and negative parts of $\log|x-s|$, gives $W_\lambda(x)=\log|x|+h_0U_2(x)+\int_2^{B_\ast}w(c)U_c(x)\,dc$; this is the identity Lemma 2.3 uses.
- *Continuity.* $|U_c(x)|\le|\log\frac{B_\ast-c}4|+\log4$ for $x\in[3/4,B_\ast]$, $c\in[2,B_\ast]$, and this bound is $w\,dc$-integrable. So $W$ is finite and continuous on $[3/4,B_\ast]$ by dominated convergence. The fundamental-theorem identities used below involve integrable $(\cdot)^{-1/2}$ singularities. They are valid because $U_c$ and $W$ are continuous and absolutely continuous on the relevant intervals.
- *Constant on $[2,B_\ast]$.* For $2\le x_1<x_2\le B_\ast$:
  - Lemma 2.5 gives $U_c(x_2)-U_c(x_1)=\int_{x_1}^{x_2}\partial_xU_c\,dx$, with $\partial_xU_c(x)=-\mathbf 1_{x<c}/\sqrt{(c-x)(B_\ast-x)}\le0$.
  - By Tonelli (a sign-definite integrand), $\int_2^{B_\ast}w(c)[U_c(x_2)-U_c(x_1)]\,dc=-\int_{x_1}^{x_2}\int_x^{B_\ast}\frac{w(c)\,dc}{\sqrt{(c-x)(B_\ast-x)}}\,dx$.
  - The inner integral equals $\frac{\sqrt{B_\ast}}{2\sqrt{B_\ast-x}}\cdot\frac{2\sqrt{B_\ast-x}}{x\sqrt{B_\ast}}=\frac1x$, using $\int_x^{B_\ast}c^{-3/2}(c-x)^{-1/2}dc=\big[\frac{2\sqrt{c-x}}{x\sqrt c}\big]_x^{B_\ast}$.
  - $U_2$ is constant on $[2,B_\ast]$. Hence $W(x_2)-W(x_1)=\log\frac{x_2}{x_1}-\log\frac{x_2}{x_1}=0$.
- *Shape on $(0,2)$.* Here $x<c$ for every $c$ in the support. Differentiation under the integral is dominated on compact subsets of $(0,2)$, and
$$W'(x)=\frac1x-\frac{h_0}{\sqrt{(2-x)(B_\ast-x)}}-\int_2^{B_\ast}\frac{w(c)\,dc}{\sqrt{(c-x)(B_\ast-x)}}=\frac{q_0(2-x)/x-h_0}{\sqrt{(2-x)(B_\ast-x)}}.$$
  - The numerator is strictly decreasing in $x$, so $W$ is unimodal (increasing, then decreasing) on $(0,2)$.
  - Therefore $\min_{[3/4,B_\ast]}W=\min(W(3/4),W(2))$.
- *Closed forms.* $W(2)=W(B_\ast)=\log B_\ast+h_0\log\frac{B_\ast-2}4+\frac{\sqrt{B_\ast}}2\big[J-2\log4\,(2^{-1/2}-B_\ast^{-1/2})\big]$, where:
  - $J=\int_2^{B_\ast}c^{-3/2}\log(B_\ast-c)\,dc=B_\ast^{-1/2}\big[2\log B_\ast\,(s_0^{-1/2}-1)+F(1^-)-F(s_0)\big]$ with $s_0=2/B_\ast$;
  - $F(s)=-2s^{-1/2}\log(1-s)-4\operatorname{atanh}\sqrt s$ (so $F'=s^{-3/2}\log(1-s)$), and $F(1^-)=-4\log2$.

  Also $W(3/4)=W(2)-\int_{3/4}^2W'$, where:
  - $\int_{3/4}^2\frac{dx}{\sqrt{(2-x)(B_\ast-x)}}=2\log\frac{\sqrt{5/4}+\sqrt{B_\ast-3/4}}{\sqrt{B_\ast-2}}$;
  - $\int_{3/4}^2\frac{\sqrt{2-x}}{x\sqrt{B_\ast-x}}dx=\frac4{\sqrt{2B_\ast}}\operatorname{atanh}\big(y_1\sqrt{B_\ast/2}\big)-2\operatorname{atanh}y_1$ with $y_1=\sqrt{(5/4)/(B_\ast-3/4)}$. This comes from the substitution $y=\sqrt{(2-x)/(B_\ast-x)}$, which turns the integrand into $\big(-\frac4{2-B_\ast y^2}+\frac2{1-y^2}\big)dy$ on $[0,y_1]$. Here $y$ decreases as $x$ increases, and the orientation reversal absorbs the sign.
- *Certificate.* `sup_check.py` (B) certifies $W(2)\in[0.0091936718243,0.0091936718244]$ and $W(3/4)\in[0.0053231607854,0.0053231607855]$, both $>0$. $\square$

### Theorem 2.7 (supremum)
For every $f\in\mathcal P$, $|S_f|\le2\sqrt2$, with equality iff $f=(x^2-1)^m$ for some $m\ge1$. Hence $\sup_{\mathcal P}|S_f|=2\sqrt2$, and it is attained.

*Proof.*
- *Bound.* If $|S|>B_\ast$, then $|\bar S|>B_\ast$ and, by Lemma 2.1, $M=\max(-\alpha,\beta)\ge\frac{\beta-\alpha}2>\sqrt2$. Lemmas 2.4 and 2.6 supply a witness for every $a\in(\sqrt2-1,1]$, and Lemma 2.3 then gives a contradiction.
- *Equality forces the endpoints.* If $|S|=B_\ast$, the same lemmas give $M\le\sqrt2$, while $\beta-\alpha\ge B_\ast$. Hence $\alpha=-\sqrt2$ and $\beta=\sqrt2$.
- *Equality forces the roots.*
  - $0=V(\sqrt2)+V(-\sqrt2)=\frac1n\sum_j\log(2-r_j^2)$, and each term is $\ge0$ with equality iff $r_j=\pm1$. So all roots are $\pm1$.
  - With $k$ roots at $-1$, $0=V(\sqrt2)=\frac1n[k\log(\sqrt2+1)+(n-k)\log(\sqrt2-1)]=\frac{2k-n}n\log(\sqrt2+1)$, so $n=2k$ and $f=(x^2-1)^k$.
- *Converse.* $|(x^2-1)^k|<1\iff0<x^2<2$, which has measure $2\sqrt2$. $\square$

**Certificate record.** `python sup_check.py` (in `cert2/`) → PASS (9 s). The interval library `cert2/ia.py` uses exact dyadic rationals with $2^{-220}$ outward rounding; its series for $\log$, $\operatorname{atanh}$, $\exp$, $\sin$ and $\cos$ carry explicit remainder bounds, and $\pi$ comes from Machin's formula (Appendix A). The reviewer's independent check `cert2/replay6/indep_check.py` (60-digit decimal arithmetic, three quadrature methods, not using the closed forms) reproduces $W(3/4)=0.00532316078544433831\ldots$ and $W(2)=0.00919367182438675784\ldots$ inside the certified intervals.

**Facts used.** Classical integrals only: $\int_0^{2\pi}\log|1-e^{i\tau}|\,d\tau=0$, the mean value of $\log|w-e^{i\theta}|$ for $|w|>1$, and Tonelli / dominated convergence.

---

## 3. Reductions for the infimum

*Idea source:* Wang §2 and Tao's reductions. Every step is re-proved; the proofs of Lemma 3.2 (component structure) and Lemma 3.6 (AM–GM) are simpler than in the source.

**Notation.** For a probability measure $\mu$ on $[-1,1]$ put $V_\mu(x)=\int\log|x-t|\,d\mu(t)\in[-\infty,\infty)$ and $E_\mu=\{V_\mu<0\}$. For $f\in\mathcal P$ of degree $n$ with roots $r_j$, let $\mu_f=\frac1n\sum_j\delta_{r_j}$. Then $V_{\mu_f}=\frac1n\log|f|$ and $E_{\mu_f}=S_f$. Such $\mu$ are called *empirical* (finitely many atoms, rational masses).

### Lemma 3.1 (components)
For $f\in\mathcal P$, $S_f$ is a finite disjoint union of bounded open intervals (Lemma 1.2). Each component contains a root.

*Proof.* On a root-free open interval, $V''=-\frac1n\sum_j(x-r_j)^{-2}<0$. A root-free component $(p_1,p_2)$ would have $V(p_1)=V(p_2)=0$ (its boundary points satisfy $|f|=1$) and $V$ strictly concave, hence $V>0$ inside — a contradiction. $\square$

### Lemma 3.2 (simultaneous component atomization)
Let $f\in\mathcal P$, and let $\mathcal C_1,\dots,\mathcal C_J$ be the components of $S_f$. Let $n_j$ be the number of roots in $\mathcal C_j$ (all roots lie in $S_f$, since $V=-\infty$ at roots), and $c_j$ their mean. Put $\tilde f=\prod_j(x-c_j)^{n_j}$. Then:
- $\tilde f\in\mathcal P$ and $\deg\tilde f=n$;
- the mean of the roots is unchanged;
- $S_{\tilde f}\subseteq S_f$;
- every component of $S_{\tilde f}$ contains exactly one distinct root of $\tilde f$.

A polynomial with the last property is called **atomized**.

*Proof.*
- $c_j$ is a mean of points of the interval $\mathcal C_j\cap[-1,1]$, so $c_j\in\mathcal C_j\cap[-1,1]$. The mean is preserved by construction.
- *Inclusion.* Let $x\notin S_f$, so $V(x)\ge0$ and $x\notin\mathcal C_j$ for all $j$. Then $t\mapsto\log|x-t|$ is concave on $\mathcal C_j$, because $x-t$ has constant sign there. Jensen gives $\sum_{r_i\in\mathcal C_j}\log|x-r_i|\le n_j\log|x-c_j|$. Summing over $j$ gives $V_{\tilde f}(x)\ge V_f(x)\ge0$, so $x\notin S_{\tilde f}$.
- *Component structure.* Each component of $S_{\tilde f}$ is a connected subset of $S_f$, hence lies in a single $\mathcal C_j$, and it contains a root of $\tilde f$ (Lemma 3.1). The only root of $\tilde f$ in $\mathcal C_j$ is $c_j$. So each $\mathcal C_j$ contains at most one component of $S_{\tilde f}$, and that component contains exactly the one cluster $c_j$. $\square$

### Lemma 3.3 (orientation)
If the root mean $m$ of $f$ satisfies $m\le0$, then $(-1,0)\subseteq S_f$.

*Proof.*
- For $x\in(-1,0)$ and $t\in[-1,1]$: $(1-xt)^2-(x-t)^2=(1-x^2)(1-t^2)\ge0$ and $1-xt>0$, so $|x-t|\le1-xt$.
- By Jensen, $V(x)\le\int\log(1-xt)\,d\mu\le\log(1-xm)\le0$, since $xm\ge0$.
- If $V(x)=0$, all three inequalities are equalities. Jensen's equality case forces $\mu=\delta_{t_0}$, and then $m=0$ gives $\mu=\delta_0$. But then $V(x)=\log|x|<0$, a contradiction. $\square$

Reflection $f(x)\mapsto(-1)^nf(-x)$ preserves $\mathcal P$, $|S_f|$ and atomization, and negates $m$. So $m\le0$ can always be assumed.

### Lemma 3.4 (endpoint normalization)
Let $f\in\mathcal P$ be atomized with root mean $m\le0$. Let $c$ be the root in the component $\mathcal C_0$ of $S_f$ that contains $(-1,0)$ (Lemma 3.3), and let $A$ be its multiplicity fraction. Then:
- (i) every root is $\ge c$, and $-1\le c\le m\le0$;
- (ii) after translating by $-c-1$, all roots lie in $[-1,1]$, the main root is $-1$, the mean is still $\le0$, and $|S|$ is unchanged;
- (iii) in the translated picture, the right end $\beta$ of the main component satisfies $\beta\ge0$, every other root lies in $(\beta,1]$, and $A\ge1/2$;
- (iv) if $A=1$, then $|S_f|=2$.

*Proof.*
- (i) Suppose some root $t<c$ existed; then $t\in[-1,c)$.
  - If $t>-1$: when $c<0$, $t\in(-1,c)\subset(-1,0)\subseteq\mathcal C_0$; when $c\ge0$, $t\in(-1,c]\subseteq\mathcal C_0$, since $\mathcal C_0$ is an interval containing $(-1,0)$ and $c$.
  - If $t=-1$, then $-1\in S_f$ (a root), and $S_f$ is open, so $-1\in\mathcal C_0$.
  - Either way $\mathcal C_0$ would contain two distinct roots, contradicting atomization. So $c=\min$ root $\le m$.
- (ii) A root $t\in[c,1]$ goes to $t-c-1\in[-1,-c]\subseteq[-1,1]$. The mean becomes $m-c-1\le0$.
- (iii) Work before the translation, with $b_0$ the right end of $\mathcal C_0$.
  - $b_0\ge0$ because $(-1,0)\subseteq\mathcal C_0$.
  - The other roots lie outside $\mathcal C_0$ and are $\ge c$. Since $[c,b_0)\subseteq\mathcal C_0$ and $b_0$ is not a root ($|f(b_0)|=1$), they are $>b_0$. They are $\le1$, so their distances to $b_0$ are $\le1-b_0\le1$.
  - If $b_0-c<1$, then $1=e^{V(b_0)}$ would be a product of powers of numbers $\le1$, one of them $<1$ with positive weight — impossible. Thus $\beta:=b_0-c-1\ge0$.
  - After translation, the other roots lie in $(\beta,1]$. At $\beta$, weighted AM–GM gives $1=e^{V(\beta)}\le\int|\beta-t|\,d\mu\le A(1+\beta)+(1-A)(1-\beta)=1+(2A-1)\beta$.
  - If $\beta>0$, then $A\ge1/2$.
  - If $\beta=0$, equality holds throughout. When $A<1$ (residual mass present), this forces every residual root to be at $1$. Then the mean $-A+(1-A)\le0$ gives $A\ge1/2$. When $A=1$ there is nothing to prove.
- (iv) If $A=1$, then $f=(x+1)^n$ after translation and $S=(-2,0)$. $\square$

### Definition 3.5 (normal form)
Let $f$ be as in Lemma 3.4, translated, with $A<1$, and put $k=A/(1-A)\ge1$. The residual roots have distinct values $t_1<\dots<t_N$ in $(\beta,1]\subseteq[0,1]$, with multiplicity fractions $(1-A)q_i$, where $q_i>0$ and $\sum_iq_i=1$. Shift $x\mapsto x+1$ and put $d_i=1+t_i\in[1,2]$. Then $S$ (shifted) $=\{W<0\}$ with
$$W(x)=k\log|x|+\sum_iq_i\log|x-d_i|=\frac1{(1-A)n}\log|f(x-1)|,$$
where $f$ denotes the translated polynomial; that is, $W=V/(1-A)$ in the shifted variable. $M_k$ denotes the width of the component of $\{W<0\}$ containing $0$ (the **main component**). Put
$$R_i=\exp\Big[-\frac1{q_i}\Big(k\log d_i+\sum_{j\ne i}q_j\log|d_i-d_j|\Big)\Big],\qquad\mathcal J_k=M_k+2\sum_iR_i .$$

Atomization, reflection, translation and the shift each map components to components, so in the normal form $0$ and each $d_i$ lie in pairwise different components of $\{W<0\}$.

### Lemma 3.6 (residual radius; $|S|\ge\mathcal J_k$)
- (a) $(0,1)$ lies in the main component, and each residual component $(\lambda_i^-,\lambda_i^+)\ni d_i$ has $\lambda_i^-\ge1$.
- (b) $\lambda_i^+-\lambda_i^-\ge2R_i$.
- Hence $|S_f|\ge\mathcal J_k=M_k+2\sum_iR_i$.

*Proof.*
- (a) For $0<x<1$: $|x-d_i|\le2-x$ and $k\log x\le\log x$, so $W(x)\le\log(x(2-x))<0$. The residual component containing $d_i$ is not the main one (atomization), so it lies to the right of $(0,1)$.
- (b) On $[\lambda_i^-,\lambda_i^+]$ put $V_i(x)=k\log x+\sum_{j\ne i}q_j\log|x-d_j|$. No $d_j$ with $j\ne i$ lies in $[\lambda_i^-,\lambda_i^+]$ (one cluster per component; the endpoints are not roots), and $x\ge1$. So $V_i$ is smooth with $V_i''<0$.
  - Put $s=d_i-\lambda_i^-$, $u=\lambda_i^+-d_i$, $\tau=s+u$ and $w=s/\tau$. The boundary equations $W(\lambda_i^-)=W(\lambda_i^+)=0$ read $V_i(\lambda_i^-)=-q_i\log s$ and $V_i(\lambda_i^+)=-q_i\log u$. By definition $V_i(d_i)=-q_i\log R_i$.
  - Concavity at $d_i=(1-w)\lambda_i^-+w\lambda_i^+$ gives $-q_i\log R_i\ge-q_i[(1-w)\log s+w\log u]$. Hence $R_i\le s^{1-w}u^w=\tau\,w^{1-w}(1-w)^w$.
  - Weighted AM–GM gives $w^{1-w}(1-w)^w\le(1-w)w+w(1-w)=2w(1-w)\le\frac12$. So $\tau\ge2R_i$.
- The components are disjoint, and the shift and the division by $1-A$ change neither lengths nor sets. $\square$

### Lemma 3.7 (endpoint window)
Let $\rho_{\rm w}(k)\in(0,1)$ solve $\rho^k(2+\rho)=1$. Then $M_k\ge1+\rho_{\rm w}(k)$, $\rho_{\rm w}(1)=\sqrt2-1$, and $\rho_{\rm w}$ is increasing in $k$.

*Proof.*
- $r\mapsto r^k(2+r)$ increases from $0$ to $3$ on $[0,1]$, so $\rho_{\rm w}(k)$ exists and is unique.
- For $0<r<\rho_{\rm w}(k)$, $W(-r)\le k\log r+\log(2+r)<0$. So $(-\rho_{\rm w}(k),1)$ lies in the main component.
- $r^k(2+r)$ decreases in $k$ for fixed $r\in(0,1)$, so $\rho_{\rm w}(k)$ increases in $k$. $\square$

### Corollary 3.8 (an elementary universal lower bound)
For every $f\in\mathcal P$, $\sqrt2\le|S_f|$.

*Proof.* By reflection assume the mean of the roots is $\le0$, and atomize (Lemma 3.2): $|S_f|\ge|S_{\tilde f}|$, the roots of $\tilde f$ lie in $[-1,1]$, the mean is unchanged, and each component of $S_{\tilde f}$ carries one root value. (The classes "the segment between two roots lies in $S_f$" coincide with the component classes, since components are intervals.) For $\tilde f$:
- Let $c_0$ be the least root, with multiplicity $a$, and let $b=n-a$ be the number of other roots. Then $-1\le c_0\le0$.
- The roots $t-c_0-1$ lie in $[-1,1]$ with mean $\le0$, so Lemma 3.3 gives $(c_0,c_0+1)\subseteq S_{\tilde f}$.
- Let $r_0=\min\{y\ge c_0:y\notin S_{\tilde f}\}$ (a closed nonempty set, since $2\notin S$).
  - Then $[c_0,r_0)\subseteq S_{\tilde f}$, $r_0\ge c_0+1$ and $|\tilde f(r_0)|=1$.
  - Every root $t\ne c_0$ satisfies $t>r_0$, since otherwise two root values would share a component.
- *$a\ge b$.* AM–GM at $r_0$ and the mean condition $\sum_{t\ne c_0}t\le-ac_0$ give
$$n\le\sum_i|r_0-t_i|=a(r_0-c_0)+\sum_{t\ne c_0}(t-r_0)\le(a-b)r_0-2ac_0\le(a-b)r_0+2a .$$
  If $a<b$, this is $\le2a<n$ (note $r_0\ge0$; $r_0=0$ occurs, e.g. for $(x+1)(x-1)$). So $a\ge b$.
- *Window.* For $0<u<\sqrt2-1$ and $x=c_0-u$: $|\tilde f(x)|=u^a\prod_{t\ne c_0}(t-x)\le u^a(2+u)^b\le(u(2+u))^b<1$ if $b\ge1$, and $|\tilde f(x)|=u^a<1$ if $b=0$.
- Hence $(c_0-(\sqrt2-1),c_0+1)\subseteq S_{\tilde f}$, an interval of length $\sqrt2$. $\square$

---

## 4. The small mass-ratio range

### Proposition 4.1
If $1\le k\le\bar k:=29/20$, then $\Sigma_R:=\sum_iR_i>1/3$ and $\mathcal J_k>\sqrt2+2/3>2$.

*Proof* (idea source Wang Prop. 3.1; re-derived).
- *A separating point.* The main component and the component of $d_1$ are distinct, so some $b\in(0,d_1)$ has $W(b)\ge0$; take the right end of the main component, which is $\ge1$ by Lemma 3.6(a).
  - Put $y_i=2-d_i\ge0$ and $\bar y=\sum_iq_iy_i$. Since $b<d_1\le d_i$ (the component of $d_1$ lies to the right of the main one), $|b-d_i|=2-y_i-b$, and Jensen gives $0\le k\log b+\log(2-\bar y-b)$. So $b^k(2-b)\ge1$.
  - Hence $b\ge1$ (as in Lemma 3.6(a), $b^k(2-b)\le b(2-b)<1$ for $b<1$).
  - Therefore $\bar y\le2-b-b^{-k}\le2-b-b^{-\bar k}\le\bar\varepsilon:=2-(\bar k+1)\bar k^{-\bar k/(\bar k+1)}$, the maximum over $b\ge1$ being at $b=\bar k^{1/(\bar k+1)}$.
- *Pair terms.* Put $Q_2=\sum_iq_i^2$ and $t=1-Q_2=2\sum_{i<j}q_iq_j$. For $t>0$, Jensen with weights $2q_iq_j/t$ and $|d_i-d_j|=|y_i-y_j|\le y_i+y_j$ give
$$2\sum_{i<j}q_iq_j\log|d_i-d_j|\le t\log\frac{2\sum_iq_i(1-q_i)y_i}{t}\le t\log\frac{2\bar\varepsilon}{t}.$$
  This uses $\sum_{i<j}q_iq_j(y_i+y_j)=\sum_iq_i(1-q_i)y_i\le\bar y$. For $t=0$ the term is read as $0$.
- *Exact identity.* $\sum_iq_i^2\log R_i=-k\sum_iq_i\log d_i-2\sum_{i<j}q_iq_j\log|d_i-d_j|\ge-k\log2-t\log(2\bar\varepsilon/t)$.
- *AM–GM.* With weights $q_i^2/Q_2\le1$, $\Sigma_R\ge\sum_i\frac{q_i^2}{Q_2}R_i\ge\exp\big(\frac1{Q_2}\sum_iq_i^2\log R_i\big)$. Therefore
$$Q_2\log(3\Sigma_R)\ge\log3-k\log2-t\log\frac{6\bar\varepsilon}t\ge\log3-\bar k\log2-\frac{6\bar\varepsilon}e,$$
  using $\max_{t>0}t\log(\hat a/t)=\hat a/e$.
- `cert2/smallk_check.py` certifies $\bar\varepsilon\in[0.033642075,0.033642076]$ and that the right side is $\ge0.01929>0$. Hence $\Sigma_R>1/3$.
- Finally, $\mathcal J_k=M_k+2\Sigma_R>1+(\sqrt2-1)+2/3$ by Lemma 3.7 ($\rho_{\rm w}(k)\ge\rho_{\rm w}(1)$). $\square$

*Consequence.* For the infimum problem, the range $1\le k\le29/20$ gives $|S_f|>2$. Together with Lemma 3.4(iv) ($A=1$ gives $|S_{\tilde f}|=2$ for the atomized polynomial, hence $|S_f|\ge2$), this leaves $k>29/20$ for §§6–9.

### Corollary 4.2 (the universal lower bound $61/40$)
For every $f\in\mathcal P$, $61/40\le|S_f|$. Note $61/40=1.525>2^{4/3}-1\approx1.5198$, the classical lower bound.

*Proof.* Take $\tilde f$, $c_0$, $a$, $b$, $r_0$ as in the proof of Corollary 3.8.
- *Window.* If $u>0$ and $u^a(2+u)^b<1$, then $(c_0-u,c_0)\subseteq S$. Indeed, for $x=c_0-w$ with $0<w<u$, $|\tilde f(x)|=w^a\prod_{t\ne c_0}(t-x)\le u^a(2+u)^b$, because $t-x\le1-c_0+w\le2+u$.
- *Case $20a\ge29b$.* Take $u=21/40$.
  - If $b=0$, then $u^a<1$.
  - If $b\ge1$, then $X=u^a(101/40)^b$ satisfies $X^{20}\le\big((21/40)^{29}(101/40)^{20}\big)^b<1$, since $21^{29}\cdot101^{20}<40^{49}$ (the ratio is $\approx0.851$).
  - So $(c_0-21/40,c_0+1)\subseteq S$, of length $61/40$. This is Lemma 3.7 with $\rho_{\rm w}(29/20)\approx0.52756>21/40$.
- *Case $20a<29b$.* Then $b\ge1$ and $1\le k:=a/b<29/20$.
  - Take $u=2/5$: $u^a(2+u)^b\le(24/25)^b<1$, so $(c_0-2/5,r_0)\subseteq S$, of length $\ge7/5$.
  - Translating by $-c_0-1$ gives the normal form of Lemma 3.4 with $d_v=v-c_0\in[1,2]$, $q_v=m_v/b$ and $k=a/b$. Here $m_v$ is the multiplicity of the root value $v\ne c_0$.
  - The point $b_*=r_0-c_0\in[1,d_v)$ is the right end of the main component. $|\tilde f(r_0)|=1$ reads $k\log b_*+\sum_vq_v\log(d_v-b_*)=0$.
  - The residual component $(\lambda_v^-,\lambda_v^+)$ of $v$ has width $\ge2R_v$ (Lemma 3.6(b)) and lies right of $r_0$. The residual components are pairwise disjoint.
  - Proposition 4.1 gives $\sum_vR_v>1/3$. Hence $|S|\ge7/5+2/3=31/15>61/40$. $\square$

*Remark.* The case-1 bound $1+\rho_{\rm w}(29/20)\approx1.52756$ is the main-component width of $(x+1)^{29}(x-1)^{20}$. So $61/40$ is essentially the limit of this elementary argument; the true infimum $D\approx1.8344$ needs §§5–10.

---

## 5. The one-cut family, the constant $D$, and sharpness ($\inf\le D$)

*Idea source:* Tao's one-cut ansatz as presented in Wang §§6, 8. All formulas are re-derived: the potentials by Chebyshev/Poisson series, and the zero count in the Joukowski variable $u$.

### Lemma 5.1 (arcsine measure, balayage of $\delta_{-1}$, exterior potentials)
Fix $s\in(0,1)$. Put $a^\circ=2s^2-1$, $c_0=s^2$, $\ell=1-s^2$ (so $[a^\circ,1]=[c_0-\ell,c_0+\ell]$), $q=\frac{1-s}{1+s}$, and $H=\ell/2=\frac{2q}{(1+q)^2}$. Parametrize $t=c_0+\ell\cos\theta$, $\theta\in[0,\pi]$. Let $\omega$ be the arcsine probability measure on $[a^\circ,1]$ ($d\omega=d\theta/\pi$) and $\omega_{-1}:=\frac{2s}{t+1}\,\omega$.
- (i) $\frac{2s}{t+1}=\Pi(\theta):=\frac{1-q^2}{1+2q\cos\theta+q^2}=1+2\sum_{n\ge1}(-1)^nq^n\cos n\theta$. In particular $\omega_{-1}$ is a probability measure.
- (ii) For $x\in[a^\circ,1]$: $V_\omega(x)=\log H$ and $V_{\omega_{-1}}(x)=\log(x+1)+\log q$.
- (iii) For $x<a^\circ$, write $x=c_0-H(u+u^{-1})$ with a unique $u>1$. Then $V_\omega(x)=\log(Hu)$, $V_{\omega_{-1}}(x)=\log(Hu)+2\log(1-q/u)$, and $x+1=H\,\frac{(u-q)(1-qu)}{qu}$. The map $u\mapsto x$ is a decreasing bijection $(1,\infty)\to(-\infty,a^\circ)$, and $u=1/q\leftrightarrow x=-1$.

*Proof.*
- (i) $t+1=\ell(Z+\cos\theta)$ with $Z=\frac{1+s^2}{1-s^2}=\frac12(w_0+w_0^{-1})$ and $w_0=\frac{1+s}{1-s}=1/q$. Then $Z+\cos\theta=\frac{|w_0+e^{i\theta}|^2}{2w_0}=\frac{1+2q\cos\theta+q^2}{2q}$. Using $4sq/\ell=1-q^2$ gives the formula, and the Poisson series is standard. The $\theta$-average of $\Pi$ is $1$.
- (ii) For $x=c_0+\ell\cos\psi$:
  - $\log|x-t|=\log(\ell/2)-2\sum_{n\ge1}\frac{\cos n\psi\cos n\theta}n$. This follows from $\log|2\sin\frac\tau2|=-\sum_n\frac{\cos n\tau}n$ in $L^2$, applied at $\tau=\psi\pm\theta$.
  - Pairing with $1$ and with $\Pi$ (Parseval in $L^2(0,\pi)$; $\Pi$ has absolutely summable coefficients) gives $V_\omega=\log(\ell/2)=\log H$ and $V_{\omega_{-1}}(x)=\log(\ell/2)-2\sum_n\frac{(-1)^nq^n\cos n\psi}n$.
  - On the other hand, $x+1=\ell(Z+\cos\psi)$ and $\log(Z+\cos\psi)=-\log2-\log q+2\log|1+qe^{i\psi}|$, which gives $\log(x+1)=\log(\ell/2)-\log q-2\sum_n\frac{(-1)^nq^n\cos n\psi}n$.
  - Subtracting the two expansions gives the claim.
- (iii)
  - $|x-t|=H(u+u^{-1}+2\cos\theta)$, so $\log|x-t|=\log(Hu)+2\log|1+e^{i\theta}/u|$, whose series $2\sum_n(-1)^{n+1}u^{-n}\cos n\theta/n$ converges uniformly.
  - Integrating against $d\theta/\pi$ and against $\Pi\,d\theta/\pi$ (coefficients $(-1)^nq^n$) gives the two potentials; the second is $\log(Hu)-2\sum_n(q/u)^n/n$.
  - Finally, $c_0+1=\ell Z=H(q^{-1}+q)$, so $x+1=H(q^{-1}+q-u-u^{-1})=H(u-q)(1-qu)/(qu)$. $\square$

### Lemma 5.2 (the family $\mu_A$ and its zero set)
Fix $q\in(0,1)$ (equivalently $s$) and $A\in(0,s)$. Put
$$\mu_A:=\omega+A(\delta_{-1}-\omega_{-1})=A\delta_{-1}+\frac{t+1-2As}{\pi(t+1)\sqrt{(t-a^\circ)(1-t)}}\mathbf 1_{[a^\circ,1]}(t)\,dt .$$
- (i) $\mu_A$ is a probability measure on $[-1,1]$ with positive density on $[a^\circ,1]$. The numerator is increasing in $t$, with minimum $2s(s-A)>0$.
- (ii) $V_{\mu_A}\equiv C(A):=\log H-A\log q$ on $[a^\circ,1]$. Moreover $V_{\mu_A}>C(A)$ on $(1,\infty)$: there $V'=\int d\mu_A/(x-t)>0$, and $V(x)\downarrow V(1)=C(A)$ as $x\downarrow1$ by monotone convergence.
- (iii) For $x=x(u)<a^\circ$: $V_{\mu_A}(x(u))=C(A)-F_A(u)$ with $F_A(u):=A\log\frac{u-q}{|1-qu|}-\log u$.
- (iv) Shape of $F_A$:
  - On $(1/q,\infty)$: $F_A'=-\frac{A(1-q^2)}{(u-q)(qu-1)}-\frac1u<0$, with $F_A\to+\infty$ at $1/q^+$ and $F_A\to-\infty$ at $\infty$.
  - On $(1,1/q)$: $F_A'=\frac{qu^2-b_Au+q}{u(u-q)(1-qu)}$, where $b_A=1+q^2-A(1-q^2)$. The numerator is $<0$ at $u=1$ (it equals $(1-q)[A(1+q)-(1-q)]$, and $A<s$), $>0$ at $u=1/q$, and its roots have product $1$. So $F_A$ decreases, then increases, with $F_A(1)=0$ and $F_A\to+\infty$ at $1/q^-$.
- (v) Hence, if $C(A)\ge0$, $E_{\mu_A}=(x(u_-),x(u_+))$, where $u_->1/q$ and $u_+\in(1,1/q)$ are the unique solutions of $F_A(u)=C(A)$ on these branches ($u_+$ on the increasing branch). Both are simple, and
$$|E_{\mu_A}|=H\big(u_-+u_-^{-1}-u_+-u_+^{-1}\big).$$

*Proof.*
- (i) Density: Lemma 5.1(i). Total mass $1+A-A=1$.
- (ii) and (iii) follow from Lemma 5.1(ii) and (iii) by linearity. In (iii), $\log|x+1|-V_{\omega_{-1}}(x)=\log|1-qu|-\log q-\log(u-q)$.
- (iv) is a direct computation.
- (v)
  - On $[a^\circ,\infty)$, $V\ge C(A)\ge0$, so there are no points of $E$ there.
  - On $(-\infty,a^\circ)$, $V<0\iff F_A(u)>C(A)$. By (iv), this is the $u$-set $(u_+,1/q)\cup(1/q,u_-)$, together with $u=1/q$ (the atom, $V=-\infty$).
  - The image under the decreasing map $u\mapsto x$ is the interval $(x(u_-),x(u_+))$.
  - Simplicity: $F_A'(u_\pm)\ne0$ and $x'(u)=-H(1-u^{-2})\ne0$. $\square$

### Definition 5.3 (the terminal family and $D$)
- For $q\in(0,1)$ put $A(q):=\log H(q)/\log q$; this is exactly the choice $C(A)=0$ (zero platform).
- $A(q)\in(0,1)$ for $0<q<\sqrt2-1$, because then $q<H<1$. This covers every $q<q_s$ used below.
- $A(q)<s(q)\iff\mathfrak f(q):=(1+q)\log\frac2{(1+q)^2}+2q\log q>0$. Indeed $A=1-d_q/\tau$ with $d_q=\log\frac2{(1+q)^2}>0$ and $\tau=-\log q$, and $1-s=\frac{2q}{1+q}$.
- $\mathfrak f(0^+)=\log2>0$ and $\mathfrak f'(q)=\log\frac{2q^2}{(1+q)^2}<0$ on $(0,1)$. So $\mathfrak f$ has a unique zero $q_s$, and `onecut_check.py` certifies $q_s\in(0.1236,0.1237)$ (Certificate 5.5).
- For $0<q<q_s$ put $\Lambda(q):=|E_{\mu_{A(q)}}|=H(q)\big(u_-+u_-^{-1}-u_+-u_+^{-1}\big)$, with $u_\pm$ from Lemma 5.2(v) at $A=A(q)$, $C=0$. Then
$$\boxed{D:=\inf_{0<q<q_s}\Lambda(q).}$$

### Theorem 5.4 (sharpness: $\inf_{f\in\mathcal P}|S_f|\le D$)
*Proof.* Fix $q\in(0,q_s)$.
- *Continuity in $A$.* For $A\in(A(q),s)$ we have $C(A)=\log H-A\log q>0$ (since $\log q<0$).
  - The roots $u_\pm(A)$ of $F_A(u)-C(A)=0$ are simple and unique on their branches (Lemma 5.2).
  - $(A,u)\mapsto F_A(u)-C(A)$ is $C^1$ for $u\ne1,1/q$.
  - By the implicit function theorem and uniqueness, $u_\pm(A)\to u_\pm(A(q))$ as $A\downarrow A(q)$. Hence $|E_{\mu_A}|\to\Lambda(q)$.
- *Discretization.* Fix such an $A$. Let $\nu_N=\frac1N\sum_{j=1}^N\delta_{t_j}$, where $t_j=\inf\{t:\mu_A([-1,t])\ge(j-\frac12)/N\}\in[-1,1]$ are quantiles of $\mu_A$.
  - For bounded continuous $\chi$, $\int\chi\,d\nu_N$ is a midpoint Riemann sum of the bounded, a.e.-continuous function $\chi\circ(\text{quantile function of }\mu_A)$ on $(0,1)$, so $\nu_N\Rightarrow\mu_A$.
  - Put $f_N=\prod_j(x-t_j)\in\mathcal P$.
- *Step A ($L^1$ convergence of potentials on $(-2,2)$).*
  - The map $t\mapsto\lambda_t:=\log|\cdot-t|\in L^1(-2,2)$ is uniformly continuous on $[-1,1]$, by $L^1$-continuity of translations of $\log|x|$ on a bounded set.
  - Given $\epsilon>0$, choose grid points $\tau_j$ and hat functions $\varphi_j$ with $\|\lambda_t-\sum_j\varphi_j(t)\lambda_{\tau_j}\|_1\le\epsilon$ for all $t\in[-1,1]$. The $\varphi_j$ form a nonnegative partition of unity on $[-1,1]$ with supports of small diameter, so the $\epsilon$-estimate follows from uniform continuity and Minkowski's inequality under Tonelli.
  - By Tonelli, $\|V_{\nu_N}-V_{\mu_A}\|_1\le2\epsilon+\sum_j\big|\int\varphi_j\,d\nu_N-\int\varphi_j\,d\mu_A\big|\,\|\lambda_{\tau_j}\|_1\to2\epsilon$.
- *Step B (sign sets).* If $v_N\to v$ in measure on $(-2,2)$ and $|\{v=0\}|=0$, then $|\{v_N<0\}\triangle\{v<0\}|\to0$. Indeed, the symmetric difference lies in $\{|v|\le\delta\}\cup\{|v_N-v|\ge\delta\}$. ($L^1$ convergence implies convergence in measure, by Chebyshev's inequality.)
- *Conclusion for fixed $A$.* $\{V_{\mu_A}=0\}$ has two points (Lemma 5.2(v)). This uses $V\ge C(A)>0$ on $[a^\circ,\infty)$ and uniqueness of the solutions of $F_A=C$ on both $u$-branches. Here $A>A(q)$ is essential: at $A=A(q)$ the zero set contains all of $[a^\circ,1]$, which has positive measure, and Step B would not apply. All sets $E$ involved lie in $(-2,2)$ (Lemma 1.2(a); $V_\mu\ge0$ for $|x|\ge2$). So $|S_{f_N}|=|E_{\nu_N}|\to|E_{\mu_A}|$.
- *Two successive limits.* Hence $\inf_{\mathcal P}|S_f|\le|E_{\mu_A}|$ for every $A\in(A(q),s)$ (first $N\to\infty$). Letting $A\downarrow A(q)$ gives $\inf_{\mathcal P}|S_f|\le\Lambda(q)$. Taking the infimum over $q$ gives $\inf_{\mathcal P}|S_f|\le D$. $\square$

### Certificate 5.5 (one-cut numerics)
`cert2/onecut_check.py` → PASS (6 s). In outward-rounded interval arithmetic it certifies:
- $\mathfrak f$ changes sign on $[0.1236,0.1237]$, so $q_s\in(0.1236,0.1237)$;
- at $\hat q=257155\cdot10^{-7}$ (so $\hat q<q_s$): $A(\hat q)\in[0.824521778338276,0.824521778338277]$, $u_+\approx17.8619244145$, $u_-\approx55.4256815305$, with the roots bracketed by strict sign changes of $F_A$;
- $\Lambda(\hat q)\in[1.834430475762706,1.834430475762707]$, and the script asserts $\operatorname{hi}(\Lambda(\hat q))<L_{\rm hi}:=1.8344304757628$.

Hence $D\le\Lambda(\hat q)<L_{\rm hi}$. The independent side check `cert3/side3.py` (S1, S3b) encloses $\Lambda(\hat q)=1.8344304757627065877590\ldots$ to about $10^{-25}$, with $L_{\rm hi}-\Lambda(\hat q)\ge9.3\cdot10^{-14}$, and $\mathfrak f(\hat q)>0$. A certified *lower* enclosure of $D$ is Certificate 9.3; the main theorem does not need it, since $D$ is defined as an infimum.

---

## 6. Reference measures and the convex supporting inequality

*Idea source:* Wang §4, "Constant-platform references and convex calibration" (eqs. (4.2)–(4.16) and the lemmas "Separation–contact criterion" and "Convex supporting inequality"). Every step is re-proved; Appendix B lists where the proof departs from the source. Pringsheim's theorem, used by the source, is **not** needed (Remark 6.10a).

We work in the normal form of Definition 3.5: mass ratio $k>0$ (in the application $k\ge1$), residual measure $\nu=\sum_iq_i\delta_{d_i}$ with $d_i\in[1,2]$, potential $W(x)=k\log|x|+\sum_iq_i\log|x-d_i|$, and $M_k$ the width of the main component.

### 6.0 Conventions: quantile functions
- $\mathcal Q$ denotes the set of Lebesgue-measurable $S:(0,1)\to[1,2]$. Monotonicity is *not* assumed. (In this section $S$ denotes an element of $\mathcal Q$, not a sublevel set.)
- For $S\in\mathcal Q$ put $a_S:=\operatorname{ess\,inf}S\in[1,2]$, so $S(u)\ge a_S$ for a.e. $u$.
- For $S_0,S_1\in\mathcal Q$ and $t\in[0,1]$, $S_t:=(1-t)S_0+tS_1\in\mathcal Q$.
- The *quantile* of a Borel probability measure $\nu$ on $[1,2]$ is $T_\nu(u)=\inf\{d\in[1,2]:\nu([1,d])\ge u\}$.
  - With $F_\nu(d)=\nu([1,d])$ right-continuous, $T_\nu(u)\le d\iff u\le F_\nu(d)$.
  - Hence $|\{u:T_\nu(u)\le d\}|=F_\nu(d)$, so $T_\nu$ pushes Lebesgue measure on $(0,1)$ forward to $\nu$. Thus $\int_0^1h(T_\nu(u))\,du=\int h\,d\nu$ for every bounded or nonnegative Borel $h$.
  - For $\nu=\sum_iq_i\delta_{d_i}$ with $d_1<\dots<d_N$, $T_\nu=d_i$ on an interval of length $q_i$, and $a_{T_\nu}=d_1$.

For $S\in\mathcal Q$ define
$$W_S(x)=k\log|x|+\int_0^1\log|x-S(u)|\,du\in[-\infty,\infty),\quad W_S(0):=-\infty,\qquad R(S)=\exp\Big(-\tfrac1k\int_0^1\log S\Big),\qquad m_p(S)=\int_0^1S(u)^{-p}\,du\ \ (p\ge1).$$
- The integral defining $W_S(x)$ exists because the integrand is bounded above by $\log(|x|+2)$.
- $M_k(S)$ denotes the width of the component of $\{W_S<0\}$ containing $0$, whenever that component is bounded.
- For $S=T_\nu$ with $\nu$ atomic, $W_S$ is exactly the function $W$ of Definition 3.5.

### Part (a). The reference measure $\eta_{k,a}$

#### Lemma 6.1 (Poisson–logarithm lemma)
Let $P_\rho(\theta)=\dfrac{1-\rho^2}{|1-\rho e^{i\theta}|^2}=1+2\sum_{m\ge1}\rho^m\cos m\theta$ for $0\le\rho<1$ (so $P_0\equiv1$). For every real $\varphi$:
$$\text{(i)}\quad\frac1{2\pi}\int_{-\pi}^{\pi}\log|1-e^{i(\theta+\varphi)}|\,P_\rho(\theta)\,d\theta=\log|1-\rho e^{i\varphi}|;\qquad\text{(ii)}\quad\frac1{2\pi}\int_{-\pi}^{\pi}\log|1-\rho e^{i\theta}|\,d\theta=0.$$
The integrand in (i) is absolutely integrable.

*Proof.*
- *Series for $r<1$.* For $0\le r<1$, $\log|1-re^{it}|=\operatorname{Re}\operatorname{Log}(1-re^{it})=-\sum_{m\ge1}r^m\cos(mt)/m$, uniformly and absolutely convergent in $t$.
  - This already gives (ii): take $r=\rho$ and integrate termwise.
  - Multiply the series with $t=\theta+\varphi$ by the uniformly convergent series of $P_\rho$ and integrate termwise. By orthogonality, $\frac1{2\pi}\int\cos(m(\theta+\varphi))d\theta=0$ and $\frac1{2\pi}\int\cos(m(\theta+\varphi))\cos(m'\theta)d\theta=\frac12\delta_{mm'}\cos m\varphi$ for $m,m'\ge1$.
  - Hence $\frac1{2\pi}\int\log|1-re^{i(\theta+\varphi)}|P_\rho(\theta)d\theta=-\sum_m(r\rho)^m\cos(m\varphi)/m=\log|1-r\rho e^{i\varphi}|$.
- *Limit $r\uparrow1$.* The right side tends to $\log|1-\rho e^{i\varphi}|$, which is finite because $\rho<1$. For the left side, use dominated convergence.
  - For $r\in[\frac12,1]$: $|1-re^{it}|^2=(1-r)^2+2r(1-\cos t)\ge1-\cos t=2\sin^2(t/2)$, and $|1-re^{it}|\le2$.
  - So $|\log|1-re^{it}||\le\log2+|\log(\sqrt2|\sin(t/2)|)|$.
  - This bound is integrable on a period, since $|\sin(t/2)|\ge|t|/\pi$ on $[-\pi,\pi]$. Also $0\le P_\rho\le\frac{1+\rho}{1-\rho}$.
  - Pointwise convergence holds for $\theta\ne-\varphi\pmod{2\pi}$.
- The same bound (with $r=1$) gives absolute integrability. $\square$

#### The interval $I$ and its parametrisation
Fix $0<a<2$ (in the application $1\le a<2$), and put $I=[a,2]$,
$$c=\frac{a+2}2,\quad\ell=\frac{2-a}2,\quad H=\frac\ell2=\frac{2-a}4,\quad D_0(a)=\frac{a+2+2\sqrt{2a}}4=\Big(\frac{\sqrt a+\sqrt2}2\Big)^2.$$
- Since $c/\ell>1$, put $\tau_0=\operatorname{arccosh}(c/\ell)>0$ and $\rho_0=e^{-\tau_0}\in(0,1)$.
- Then $\ell\sinh\tau_0=\sqrt{c^2-\ell^2}=\sqrt{2a}$, so $e^{\tau_0}=(c+\sqrt{2a})/\ell=\frac{\sqrt2+\sqrt a}{\sqrt2-\sqrt a}$ and $\rho_0=\frac{\sqrt2-\sqrt a}{\sqrt2+\sqrt a}$.
- Also $\ell e^{\tau_0}/2=(c+\sqrt{2a})/2=D_0(a)$ and $(1-\rho_0^2)D_0(a)=\ell\sinh\tau_0=\sqrt{2a}$.

The map $\theta\mapsto d(\theta)=c-\ell\cos\theta$ is an increasing homeomorphism $[0,\pi]\to I$, with $d-a=\ell(1-\cos\theta)$, $2-d=\ell(1+\cos\theta)$, $\sqrt{(d-a)(2-d)}=\ell\sin\theta$ and $\mathrm dd=\ell\sin\theta\,d\theta$. Moreover
$$d(\theta)=\ell(\cosh\tau_0-\cos\theta)=\frac{\ell e^{\tau_0}}2\,|1-\rho_0e^{i\theta}|^2=D_0(a)\,|1-\rho_0e^{i\theta}|^2.\tag{6.1}$$
To check (6.1), expand $|1-\rho_0e^{i\theta}|^2=1-2\rho_0\cos\theta+\rho_0^2$ and multiply by $e^{\tau_0}/2$.

**Definition.** $e_I$ is the image of $d\theta/\pi$ on $[0,\pi]$ under $\theta\mapsto d(\theta)$, and $\omega_{0,I}$ is the image of $P_{\rho_0}(\theta)\,d\theta/\pi$. By the substitution above and (6.1) (which gives $P_{\rho_0}(\theta)=(1-\rho_0^2)D_0/d=\sqrt{2a}/d$), these are exactly the measures of Wang's (4.2):
$$de_I(d)=\frac{\mathrm dd}{\pi\sqrt{(d-a)(2-d)}},\qquad d\omega_{0,I}(d)=\frac{\sqrt{2a}}d\,de_I(d).$$

#### Lemma 6.2 (equilibrium and balayage potentials)
- (i) $e_I$ and $\omega_{0,I}$ are probability measures on $I$, and $\omega_{0,I}$ has positive density.
- (ii) For every $x\in I$ (all integrals absolutely convergent):
$$U_e(x):=\int\log|x-d|\,de_I(d)=\log H,\qquad U_\omega(x):=\int\log|x-d|\,d\omega_{0,I}(d)=\log x+\log H-\log D_0(a).$$
- (iii) For $x<a$, $x\ne0$, let $\tau_x=\operatorname{arccosh}((c-x)/\ell)>0$ and $\rho_x=e^{-\tau_x}\in(0,1)$. Then
$$U_e(x)=\log H+\tau_x,\qquad U_\omega(x)=\log H+\tau_x+2\log(1-\rho_0\rho_x).$$
($\rho_x$ is the root in $(0,1)$ of $\rho+\rho^{-1}=2(c-x)/\ell$; it coincides with $\rho_x$ of Lemma 7.2(i). The exclusion $x\ne0$ matters only for $W_0$ below.)

(ii) says that $\omega_{0,I}$ is a probability measure on $I$ whose potential differs from $\log|x-0|$ by a constant on $I$: it is the balayage of $\delta_0$ onto $I$. Uniqueness of balayage is not needed; only the formula is used.

*Proof.*
- (i) The total masses are $\frac1\pi\int_0^\pi d\theta=1$ and $\frac1\pi\int_0^\pi P_{\rho_0}=1$ (termwise integration of the series). Also $P_{\rho_0}>0$.
- (ii) Write $x=c-\ell\cos\varphi$ with $\varphi\in[0,\pi]$. For all real $\theta,\varphi$, $\cos\theta-\cos\varphi=-2\sin\frac{\theta+\varphi}2\sin\frac{\theta-\varphi}2$ and $|1-e^{it}|=2|\sin\frac t2|$. Hence, for $\theta\ne\pm\varphi$,
$$\log|x-d(\theta)|=\log\ell+\log|\cos\theta-\cos\varphi|=\log\ell-\log2+\log|1-e^{i(\theta+\varphi)}|+\log|1-e^{i(\theta-\varphi)}|.$$
  - Both sides are even in $\theta$, and so is $P_{\rho_0}$. So $\frac1\pi\int_0^\pi(\cdot)P_{\rho_0}\,d\theta=\frac1{2\pi}\int_{-\pi}^{\pi}(\cdot)P_{\rho_0}\,d\theta$.
  - Lemma 6.1(i), applied with $\varphi$ and with $-\varphi$, and $|1-\rho_0e^{-i\varphi}|=|1-\rho_0e^{i\varphi}|$, give
$$U_\omega(x)=\log\ell-\log2+2\log|1-\rho_0e^{i\varphi}|=\log H+\log\frac x{D_0(a)},$$
    where the last step is (6.1) at $\theta=\varphi$.
  - The same computation with $\rho_0$ replaced by $0$ ($P_0\equiv1$) gives $U_e(x)=\log\ell-\log2=\log H$.
- (iii) For $x<a$: $|x-d(\theta)|=\ell(\cosh\tau_x-\cos\theta)=\frac{\ell e^{\tau_x}}2|1-\rho_xe^{i\theta}|^2$. Use $\log|1-\rho_xe^{i\theta}|=-\sum_m\rho_x^m\cos(m\theta)/m$ (uniform).
  - Against $d\theta/\pi$ the series integrates to $0$, giving $U_e$.
  - Against $P_{\rho_0}\,d\theta/\pi$ it gives $2\cdot(-\sum_m(\rho_0\rho_x)^m/m)=2\log(1-\rho_0\rho_x)$, giving $U_\omega$. $\square$

#### Proposition 6.3 (the reference measure)
Let $k>0$ and $\eta_{k,a}:=(k+1)e_I-k\,\omega_{0,I}$ (a finite signed measure on $I$).
1. **Density.** In the $\theta$ variable, $d\eta_{k,a}=\frac1\pi\big((k+1)-kP_{\rho_0}(\theta)\big)d\theta$. In the $d$ variable (Wang's (4.4)),
$$d\eta_{k,a}(d)=\Big(k+1-\frac{k\sqrt{2a}}d\Big)\frac{\mathrm dd}{\pi\sqrt{(d-a)(2-d)}}.\tag{6.2}$$
2. **Mass.** $\eta_{k,a}(I)=(k+1)-k=1$.
3. **Positivity.** $\eta_{k,a}\ge0$ if and only if (Wang's (4.5))
$$a\ge2\Big(\frac k{k+1}\Big)^2.\tag{6.3}$$
   - Under (6.3), $\eta_{k,a}$ is a probability measure with density $>0$ on $(a,2]$. If (6.3) is strict, the density is also positive near $a$.
   - In either case every interval $[a,a+\epsilon]$ has positive mass. So its quantile $T_0:=T_{\eta_{k,a}}$ has $a_{T_0}=a$ and values in $[a,2]$. If moreover $a\ge1$ (the only case used from §6(b) on), then $T_0\in\mathcal Q$. For $a<1$ the values of $T_0$ need not lie in $[1,2]$.
4. **Platform identity** (Wang's (4.6)). For every $d\in I$,
$$k\log d+\int_I\log|d-e|\,d\eta_{k,a}(e)=C(k,a):=\log H+k\log D_0(a).\tag{6.4}$$
5. **Distribution function.** $\eta_{k,a}([a,c-\ell\cos\theta])=\frac1\pi\Big(\theta-2k\arctan\frac{\rho_0\sin\theta}{1-\rho_0\cos\theta}\Big)$ for $\theta\in[0,\pi]$.
6. **Reference potential off $I$.** For $x<a$, $x\ne0$,
$$W_0(x):=k\log|x|+\int\log|x-d|\,d\eta_{k,a}(d)=k\log|x|+\log H+\tau_x-2k\log(1-\rho_0\rho_x).$$

*Proof.*
- 1–2 follow from the definitions and Lemma 6.2(i).
- 3. The factor $k+1-k\sqrt{2a}/d$ is strictly increasing in $d$. So the density is $\ge0$ on $(a,2)$ iff its limit at $d=a$ is $\ge0$, i.e. iff $k+1\ge k\sqrt{2/a}$, i.e. iff $\sqrt{a/2}\ge k/(k+1)$, which is (6.3).
  - If (6.3) fails, the density is negative on a neighbourhood of $a$ in $I$, so $\eta_{k,a}\not\ge0$.
  - If (6.3) holds, the factor is $>0$ on $(a,2]$.
  - Equivalently, in the $\theta$ variable positivity means $P_{\rho_0}(0)=\frac{1+\rho_0}{1-\rho_0}\le\frac{k+1}k$, i.e. $\rho_0\le\frac1{2k+1}$.
- 4. By Lemma 6.2(ii),
$$k\log d+(k+1)\log H-k(\log d+\log H-\log D_0)=\log H+k\log D_0.$$
- 5. $\int_0^\theta P_{\rho_0}=\theta+2\sum_m\rho_0^m\frac{\sin m\theta}m=\theta+2\operatorname{Im}(-\operatorname{Log}(1-\rho_0e^{i\theta}))=\theta+2\arctan\frac{\rho_0\sin\theta}{1-\rho_0\cos\theta}$. This uses $1-\rho_0\cos\theta>0$.
- 6. Combine Lemma 6.2(iii) with weights $k+1$ and $-k$. $\square$

*Remark.* $C(k,a)$ carries no sign assumption.

### Part (b). The functions $\Psi_S$, $\mathcal R_S$ and the separation–contact criterion

For $S\in\mathcal Q$ let $\Omega_S=\mathbb C\setminus[a_S,\infty)$.
- For $y\in\Omega_S$ and a.e. $u$, both $1-y/S(u)$ and $S(u)-y$ avoid $(-\infty,0]$.
- On compact $K'\subset\Omega_S$ they stay in a compact subset of $\mathbb C\setminus(-\infty,0]$ uniformly in $u$, because $(y,\sigma)\mapsto1-y/\sigma$ is continuous on $K'\times[a_S,2]$.
- Hence the following parameter integrals are holomorphic on $\Omega_S$ (principal logarithm):
$$\Psi_S(y)=y\exp\Big(\tfrac1k\int_0^1\operatorname{Log}\big(1-\tfrac y{S(u)}\big)du\Big),\qquad\mathcal R_S(y)=\exp\Big(-\tfrac1k\int_0^1\operatorname{Log}(S(u)-y)\,du\Big).$$

Since $\operatorname{Log}(S-y)=\log S+\operatorname{Log}(1-y/S)$ for $S>0$ and $y\in\Omega_S$ (both arguments lie in $(-\pi,\pi)$ and coincide),
$$\Psi_S(y)=\frac{R(S)\,y}{\mathcal R_S(y)}\qquad(y\in\Omega_S).\tag{6.5}$$
For real $y<a_S$, $y\ne0$, all quantities are real, $\mathcal R_S(y)=\exp(-\frac1k\int\log(S-y))>0$, and
$$W_S(y)=k\log\frac{|\Psi_S(y)|}{R(S)}.\tag{6.6}$$
Indeed, $k\log|\Psi_S(y)|-k\log R=k\log|y|+\int\log(1-y/S)+\int\log S=k\log|y|+\int\log(S-y)$. So on $(-\infty,a_S)\setminus\{0\}$: $W_S(y)<0\iff|\Psi_S(y)|<R(S)$.

For atomic $S=T_\nu$, with $\alpha_i=q_i/k$, this gives the source's formulas
$$\Psi(y)=y\prod_i(1-y/d_i)^{\alpha_i},\qquad R=\prod_id_i^{-\alpha_i},\qquad\mathcal R(y)=\prod_i(d_i-y)^{-\alpha_i}.$$

#### Lemma 6.4 (shape of $\Psi_S$ on the real axis)
Let $S\in\mathcal Q$ and $k>0$.
1. $\Psi_S(0)=0$ and $\Psi_S'(0)=1$.
2. On $(-\infty,0)$: $\Psi_S(y)<y<0$ and $\Psi_S'>0$. Thus $\Psi_S$ is an increasing bijection of $(-\infty,0)$ onto itself.
3. On $(0,a_S)$: $\Psi_S>0$, and the function
$$G_S(y)=\frac{\Psi_S'(y)}{\Psi_S(y)}=\frac1y-\frac1k\int_0^1\frac{du}{S(u)-y}$$
   is strictly decreasing with $G_S(0+)=+\infty$.
   - Let $y_c(S)=\sup\{y\in(0,a_S):G_S(y)>0\}\in(0,a_S]$. Then $\Psi_S'>0$ on $(0,y_c)$ and $\Psi_S'<0$ on $(y_c,a_S)$.
   - Let $\Psi^\ast(S):=\sup_{(0,a_S)}\Psi_S=\lim_{y\uparrow y_c}\Psi_S(y)$. This limit is $\Psi_S(y_c)$ if $y_c<a_S$, and $\Psi^\ast(S)\le a_S$.
4. $\Psi_S$ is strictly increasing with $\Psi_S'>0$ on $(-\infty,y_c)$. Its inverse $\chi_S:(-\infty,\Psi^\ast(S))\to(-\infty,y_c)$ is continuous, increasing, and real-analytic.
5. If $S=T_\nu$ is atomic, then $a_S=d_1$ and $\Psi_S(y)\to0$ as $y\uparrow d_1$. So $y_c<d_1$ is the **unique** critical point of $\Psi_S$ in $(0,d_1)$, and $\Psi^\ast(S)=\Psi_S(y_c)$.

*Proof.*
- 1. Immediate.
- 2. For $y<0$, $1-y/S>1$, so the exponential factor is $>1$ and $\Psi_S(y)<y$. The logarithmic derivative is
$$G_S(y)=\frac1y-\frac1k\int\frac{du}{S-y}<0,$$
  obtained by differentiating under the integral, dominated by $1/(a_S-y)$ on compacts. Since $\Psi_S<0$, $\Psi_S'=G_S\Psi_S>0$. Also $\Psi_S(y)\to0$ as $y\uparrow0$.
- 3. Positivity: $1-y/S>0$ a.e. Next, $G_S'(y)=-y^{-2}-\frac1k\int(S-y)^{-2}<0$, and $\int(S-y)^{-1}\le(a_S-y)^{-1}$ stays bounded near $0$. The sign pattern of $\Psi_S'=G_S\Psi_S$ follows.
- 4. Items 1–3 give $\Psi_S'>0$ on $(-\infty,y_c)$. Continuity and strict monotonicity give a continuous increasing inverse onto $(-\infty,y_c)$. Real-analyticity:
  - at each $y_0<y_c$, $\Psi_S$ is holomorphic near $y_0$ with $\Psi_S'(y_0)\ne0$;
  - by the holomorphic inverse function theorem it has a holomorphic local inverse near $\Psi_S(y_0)$;
  - that inverse is a holomorphic $h$ on a disc $\mathbb B$ around $t_0=\Psi_S(y_0)$, with $h(\mathbb B)\subset\mathcal N$, where $\mathcal N$ is a complex neighbourhood of $y_0$ on which $\Psi_S$ is injective;
  - for real $t\in\mathbb B$ close to $t_0$, $\chi_S(t)\in\mathcal N$ by continuity of $\chi_S$, and $\Psi_S(\chi_S(t))=t=\Psi_S(h(t))$. Injectivity on $\mathcal N$ gives $h(t)=\chi_S(t)$, so $\chi_S$ is real-analytic near $t_0$.
- 5. $\Psi_S(y)=y\prod_i(1-y/d_i)^{\alpha_i}\to0$ as $y\uparrow d_1$, because $\alpha_1>0$. A positive function vanishing at both ends of $(0,d_1)$ cannot increase on the whole interval, so $y_c<d_1$. Uniqueness of the critical point follows from strict monotonicity of $G_S$. $\square$

#### Definition 6.5 (separation and contact)
$S\in\mathcal Q$ is
- **strictly separated** if $R(S)<\Psi^\ast(S)$. By (6.6) this is equivalent to $W_S(\varrho)>0$ for some $\varrho\in(0,a_S)$, i.e. to $\sup_{(0,a_S)}W_S>0$;
- **in contact** if $y_c(S)<a_S$ and $R(S)=\Psi_S(y_c)=\Psi^\ast(S)$;
- **admissible** if it is one of the two.

#### Lemma 6.6 (main component of an admissible $S$)
Let $S$ be admissible. Put $x_-=\chi_S(-R(S))$, the unique negative solution of $\Psi_S(y)=-R(S)$. Put $x_+=\chi_S(R(S))$ in the strictly separated case and $x_+=y_c$ in the contact case. Then:
- the main component of $\{W_S<0\}$ is $(x_-,x_+)$, and $W_S(x_\pm)=0$;
- $M_k(S)=x_+-x_-$, with $x_-<0<x_+<a_S$.

In the strictly separated case, additionally:
- $x_+<y_c$, and $x_+<\varrho$ for every $\varrho\in(0,a_S)$ with $\Psi_S(\varrho)>R(S)$;
- the crossings are simple: $W_S'(x_-)=kG_S(x_-)<0<kG_S(x_+)=W_S'(x_+)$.

In particular, Wang's hypothesis (4.8) (simple crossings) is automatic.

*Proof.*
- By (6.6), on $(-\infty,a_S)\setminus\{0\}$ we have $W_S<0\iff|\Psi_S|<R$.
- On $(-\infty,0)$, Lemma 6.4(2) gives $\{W_S<0\}\cap(-\infty,0)=(x_-,0)$ and $W_S(x_-)=0$.
- On $(0,y_c)$, $\Psi_S$ increases from $0$ to $\Psi^\ast$.
  - *Strictly separated* ($R<\Psi^\ast$): there is a unique $x_+\in(0,y_c)$ with $\Psi_S(x_+)=R$, and $W_S<0$ on $(0,x_+)$.
    - If $\Psi_S(\varrho)>R$: for $\varrho\le y_c$, monotonicity gives $x_+<\varrho$; for $\varrho>y_c$, $x_+<y_c<\varrho$.
  - *Contact* ($R=\Psi^\ast=\Psi_S(y_c)$, $y_c<a_S$): $\Psi_S<R$ on $(0,y_c)$, and $W_S(y_c)=0$.
- Together with $W_S(0)=-\infty$, the main component is $(x_-,x_+)$.
- The derivative formula is $W_S'=k\Psi_S'/\Psi_S=kG_S$. Its signs follow from $x_-<0$ and $x_+<y_c$. $\square$

#### Lemma 6.7 (separation–contact criterion for atomic targets)
Let $\nu=\sum_{i=1}^Nq_i\delta_{d_i}$ with $1\le d_1<\dots<d_N\le2$, $q_i>0$, $\sum q_i=1$, and $T=T_\nu$. Then:
- If the main component of $\{W_T<0\}$ does not contain $d_1$, then $R(T)\le\Psi_T(y_c)$, where $y_c\in(0,d_1)$ is the unique critical point. So $T$ is admissible:
  - strictly separated iff $R(T)<\Psi_T(y_c)$;
  - in contact iff $R(T)=\Psi_T(y_c)$. In that case $y_c$ is the common boundary point of the main component and of the component containing $d_1$.
- In both cases the endpoints are $x_\pm=\chi_T(\pm R(T))$. In the contact case $x_+=\lim_{t\uparrow R}\chi_T(t)=y_c$.
- Every normal form (Definition 3.5) satisfies the hypothesis. Indeed, the chain atomize (Lemma 3.2) → reflect (Lemma 3.3) → translate (Lemma 3.4) → shift $x\mapsto x+1$ maps components to components, so the root $0$ and the root $d_1$ lie in different components. Moreover $d_i\in(1+\beta,2]\subseteq[1,2]$, $q_i>0$, $\sum q_i=1$, and $W_T=W$.

*Proof.*
- If $R>\Psi_T(y_c)=\max_{(0,d_1)}\Psi_T$, then $|\Psi_T|<R$ on $(0,d_1)$. So $W_T<0$ there, and $W_T(d_1)=-\infty$. Hence $(0,d_1]$ lies in the main component, which proves the first claim by contraposition.
- In the contact case, $\Psi_T$ decreases from $R$ to $0$ on $(y_c,d_1)$ (Lemma 6.4(3),(5)). So $W_T<0$ on $(y_c,d_1]$, and $y_c$ is a zero of $W_T$ separating two components.
- The rest is Lemma 6.6. $\square$

### Part (c). Inverse series, convexity, and the supporting inequality

#### Lemma 6.8 (Taylor data and the coefficients $F_n$)
Let $S\in\mathcal Q$. For $|y|<a_S$,
$$\mathcal R_S(y)=R(S)\exp\Big(\frac1k\sum_{p\ge1}\frac{m_p(S)}py^p\Big).\tag{6.7}$$
This follows from $-\operatorname{Log}(S-y)=-\log S+\sum_py^pS^{-p}/p$, integrated termwise: dominated, since $|y|/S\le|y|/a_S<1$ a.e.

Define, for $n\ge1$,
$$F_n(S):=\frac1n[y^{n-1}]\,\mathcal R_S(y)^n .$$
1. **Moment form.** With $J_{n-1}=\{(j_1,\dots,j_{n-1})\in\mathbb N_0^{n-1}:\sum_pp\,j_p=n-1\}$,
$$F_n(S)=\frac{R(S)^n}n\sum_{j\in J_{n-1}}\prod_{p=1}^{n-1}\frac1{j_p!}\Big(\frac{n\,m_p(S)}{kp}\Big)^{j_p}.$$
   In particular $F_n(S)>0$.
2. **Atomic form** (Wang's (4.16)). For $S=T_\nu$ atomic,
$$F_n=\frac1n\sum_{r_1+\dots+r_N=n-1}\prod_i\frac{(n\alpha_i)_{r_i}}{r_i!}d_i^{-(n\alpha_i+r_i)},$$
   with rising Pochhammer symbols.
3. **Cauchy bound.** For every $\varrho\in(0,a_S)$,
$$0<F_n(S)\le\frac\varrho n\Big(\frac{R(S)}{\Psi_S(\varrho)}\Big)^n.$$

*Proof.*
- 1. $\mathcal R_S^n=R^n\exp(\sum_pc_py^p)$ with $c_p=\frac{n\,m_p}{kp}>0$. Expanding $\prod_p\exp(c_py^p)$ (all series absolutely convergent for $|y|<a_S$) and collecting $y^{n-1}$ gives the formula.
- 2. $\mathcal R^n=\prod_id_i^{-n\alpha_i}(1-y/d_i)^{-n\alpha_i}$ and $(1-t)^{-b}=\sum_r(b)_rt^r/r!$.
- 3. By Cauchy's formula on $|y|=\varrho$ ($\mathcal R_S$ is holomorphic on the closed disc),
$$F_n=\frac1n\cdot\frac1{2\pi i}\oint_{|y|=\varrho}\mathcal R_S(y)^ny^{-n}dy.$$
  - For $|y|=\varrho$: $|\mathcal R_S(y)|=\exp(-\frac1k\int\log|S-y|)\le\exp(-\frac1k\int\log(S-\varrho))=\mathcal R_S(\varrho)$, because $|S-y|\ge S-\varrho>0$ a.e.
  - Hence $F_n\le\frac1n\,\varrho\,(\mathcal R_S(\varrho)/\varrho)^n$.
  - By (6.5), $\mathcal R_S(\varrho)/\varrho=R/\Psi_S(\varrho)$. $\square$

#### Lemma 6.9 (Lagrange inversion)
Let $\phi$ be holomorphic on a disc $|y|<r_0$ with $\phi(0)\ne0$, and $\psi(y)=y/\phi(y)$. Then $\psi$ has a holomorphic inverse $\Phi$ near $0$ with $\Phi(0)=0$, and $[z^n]\Phi=\frac1n[y^{n-1}]\phi^n$ for $n\ge1$.

*Proof.*
- *Local inverse.* $\psi'(0)=1/\phi(0)\ne0$. Choose a disc $U=\{|y|<\epsilon\}$ on which $\psi$ is injective and $\phi\ne0$. Then $\psi:U\to V=\psi(U)$ is biholomorphic; let $\Phi=\psi^{-1}$. Take $\delta>0$ with $\{|z|\le\delta\}\subset V$ and let $\gamma(t)=\Phi(\delta e^{it})$, a closed $C^1$ curve in $U\setminus\{0\}$.
- *Substitution and integration by parts.* Substituting $z=\psi(y)$,
$$[z^n]\Phi=\frac1{2\pi i}\oint_{|z|=\delta}\frac{\Phi(z)}{z^{n+1}}dz=\frac1{2\pi i}\int_\gamma y\,\psi^{-n-1}\psi'\,dy=\frac1{2\pi i}\int_\gamma\frac{\psi^{-n}}n\,dy,$$
  since $y\psi^{-n-1}\psi'=-\frac1n\big[(y\psi^{-n})'-\psi^{-n}\big]$ and the exact derivative integrates to $0$ over a closed curve.
- *Residue.* $\psi^{-n}=\phi^ny^{-n}$ has a single pole in $U$, at $0$, with residue $[y^{n-1}]\phi^n$.
  - $\operatorname{ind}_\gamma(0)=\frac1{2\pi i}\oint_{|z|=\delta}\Phi'/\Phi\,dz=1$, by the argument principle: $\Phi$ has exactly one zero in $|z|<\delta$, and it is simple.
  - The residue theorem in the disc $U$ gives the claim. $\square$

Apply Lemma 6.9 with $\phi=\mathcal R_S/R(S)$, which by (6.5) gives $\psi=\Psi_S$. The local inverse $\Phi_S$ of $\Psi_S$ at $0$ has
$$\Phi_S(z)=\sum_{n\ge1}a_n(S)z^n,\qquad a_n(S)=\frac1n[y^{n-1}]\Big(\frac{\mathcal R_S}R\Big)^n=F_n(S)\,R(S)^{-n}\ \ (\ge0).$$
For atomic $S$, $\mathcal R_S/R=\prod_i(1-y/d_i)^{-\alpha_i}$, and this is Wang's (4.14).

#### Proposition 6.10 (radius of convergence; the endpoint series)
Let $S\in\mathcal Q$. The series $\Phi_S$ has nonnegative coefficients and radius of convergence $\operatorname{rad}(S)\ge\Psi^\ast(S)$. On $(-\Psi^\ast(S),\Psi^\ast(S))$, $\Phi_S=\chi_S$. Consequently:
1. **Strictly separated $S$.** $x_+=\sum_nF_n(S)$ and $x_-=\sum_n(-1)^nF_n(S)$, so
$$M_k(S)=2\sum_{n\ \mathrm{odd}}F_n(S),$$
   with geometric convergence: $F_n\le\frac\varrho n\varkappa^n$, $\varkappa=R/\Psi_S(\varrho)<1$, for any $\varrho\in(0,a_S)$ with $\Psi_S(\varrho)>R$.
2. **Contact $S$.** The same three identities hold. The nonnegative series $\sum F_n(S)$ converges, to $y_c$.

*Proof.*
- *Radius.* Lemma 6.8(3) gives $a_n=F_nR^{-n}\le\frac\varrho n\Psi_S(\varrho)^{-n}$ for all $\varrho\in(0,a_S)$. So $\limsup a_n^{1/n}\le1/\Psi_S(\varrho)$, and letting $\varrho\uparrow y_c$ gives $\operatorname{rad}(S)\ge\Psi^\ast(S)$.
- *Identity on $J'=(-\Psi^\ast,\Psi^\ast)$.* Both $\Phi_S|_{J'}$ (a convergent power series) and $\chi_S|_{J'}$ (Lemma 6.4(4)) are real-analytic on the interval $J'$.
  - They agree near $0$. For small real $t$, $\Phi_S(t)$ is real (real coefficients), small, and satisfies $\Psi_S(\Phi_S(t))=t$. Since $\Psi_S$ is injective on $(-\infty,y_c)$, $\Phi_S(t)=\chi_S(t)$.
  - By the identity theorem for real-analytic functions on an interval, they agree on $J'$.
- *Strictly separated.* $\pm R\in J'$, so $x_\pm=\chi_S(\pm R)=\Phi_S(\pm R)=\sum a_n(\pm R)^n=\sum(\pm1)^nF_n$, absolutely convergent. Subtracting gives $M_k=\sum(1-(-1)^n)F_n$.
- *Contact.* For $\lambda\in(0,1)$, $\sum F_n\lambda^n=\Phi_S(\lambda R)=\chi_S(\lambda R)$.
  - As $\lambda\uparrow1$, the left side increases to $\sum F_n\in[0,\infty]$ (monotone convergence). The right side increases to $\lim_{t\uparrow\Psi^\ast}\chi_S(t)=y_c$, because $\chi_S$ is an increasing bijection onto $(-\infty,y_c)$. Hence $\sum F_n=y_c<\infty$.
  - Then $\sum(-1)^nF_n\lambda^n\to\sum(-1)^nF_n$ (dominated by $F_n$), while $\chi_S(-\lambda R)\to\chi_S(-R)=x_-$ by continuity at $-R\in(-\infty,\Psi^\ast)$. $\square$

**Remark 6.10a (Pringsheim, not used).** The source proves $\operatorname{rad}(S)\ge\Psi^\ast(S)$ via *Pringsheim's theorem* [Flajolet–Sedgewick, *Analytic Combinatorics*, Thm. IV.6; Titchmarsh, *The Theory of Functions*, §7.21]: if $f(z)=\sum c_nz^n$ with $c_n\ge0$ has radius of convergence $\rho\in(0,\infty)$, then $z=\rho$ is a singular point of $f$. That route is also correct: if $\operatorname{rad}(S)<\Psi^\ast$, then $\chi_S$ is real-analytic at $\operatorname{rad}(S)$, and its holomorphic extension near that point agrees with $\Phi_S$ on the lens where both are defined (identity theorem, agreement on a real segment), which would make the point regular. The Cauchy estimate above replaces this argument and removes the only external dependency of this section.

**Remark 6.10b (contact radius).** In the contact case $\operatorname{rad}(S)=\Psi^\ast(S)=R(S)$ exactly. Indeed $\chi_S'(t)=1/\Psi_S'(\chi_S(t))\to+\infty$ as $t\uparrow\Psi^\ast$, because $\Psi_S'(y_c)=0$; this is impossible if $\Phi_S$ were holomorphic at $R$. So the endpoint series converges only on the boundary of its disc, which is why the target side needs the monotone-convergence argument rather than absolute convergence inside the disc. (Numerically $n^{3/2}F_n$ tends to a constant, a square-root singularity; this observation is heuristic and is not used anywhere.)

#### Lemma 6.11 (convexity of each coefficient along quantile segments)
For $S_0,S_1\in\mathcal Q$ and every $n\ge1$, $t\mapsto F_n(S_t)$ is convex on $[0,1]$, where $S_t=(1-t)S_0+tS_1$.

*Proof.*
- By Lemma 6.8(1), $F_n(S)=\sum_{j\in J_{n-1}}c_j\,R(S)^n\prod_pm_p(S)^{j_p}$ with constants $c_j\ge0$. So it suffices to prove convexity of each $\beta_j(S):=R(S)^n\prod_pm_p(S)^{j_p}$.
- Let $|j|=\sum_pj_p$, and list the exponents with multiplicity as $p_1,\dots,p_{|j|}$ ($p$ repeated $j_p$ times). By Fubini–Tonelli,
$$\beta_j(S)=\int_{(0,1)^{|j|}}\exp\big(\lambda_S(u_1,\dots,u_{|j|})\big)\,d\mathbf u,\qquad\lambda_S(\mathbf u)=-\frac nk\int_0^1\log S(w)\,dw-\sum_{i=1}^{|j|}p_i\log S(u_i).$$
  For $|j|=0$ there is no outer integral.
- Fix $\mathbf u$. Each $t\mapsto S_t(w)$ is affine and $-\log$ is convex on $(0,\infty)$. So $t\mapsto\lambda_{S_t}(\mathbf u)$ is a nonnegative combination (an integral in $w$ plus a finite sum) of convex functions, hence convex.
- $\exp$ is convex and nondecreasing, so $t\mapsto e^{\lambda_{S_t}(\mathbf u)}$ is convex.
- The integrand is measurable and bounded in $[2^{-n/k-\sum_ip_i},1]$. Integrating the pointwise convexity inequality over $\mathbf u$ gives convexity of $t\mapsto\beta_j(S_t)$. $\square$

*Relation to the source.* For atomic $S$ with fixed masses and coordinates $d_i$, each monomial $\prod_id_i^{-\gamma_i}$ ($\gamma_i\ge0$) is $\exp(-\sum\gamma_i\log d_i)$, which is convex; the source's Hessian identity $v^T\nabla^2m\,v/m=(\sum\gamma_iv_i/d_i)^2+\sum\gamma_iv_i^2/d_i^2$ is correct and is the special case of Lemma 6.11 for step functions. Lemma 6.11 works directly on $\mathcal Q$, so the source's passage through common equal-mass partitions is not needed (Appendix B).

#### Definition 6.12 (directional derivative of the width)
Let $T_0\in\mathcal Q$ be strictly separated, $T\in\mathcal Q$, $v=T-T_0$ (so $|v|\le1$), and $T_s=T_0+sv$ ($s\in[0,1]$). Define
$$\dot M_k(T_0;v):=\lim_{s\downarrow0}\frac{M_k(T_s)-M_k(T_0)}s,$$
the one-sided derivative along the linear segment of *quantile functions*. By Lemma 6.13 it exists, and $M_k(T_s)$ is defined for small $s$. (It is not a derivative along the segment of measures $(1-s)\eta+s\nu$; the width is not convex along the latter, and nothing is claimed about it.)

#### Lemma 6.13 (existence and series form of $\dot M_k$)
Under Definition 6.12, there is $s_1\in(0,1]$ such that the following hold.
1. $T_s$ is strictly separated for every $s\in[0,s_1]$.
2. The functions $g_n(s):=F_n(T_s)$ are $C^1$ on $[0,s_1]$, and
$$\sup_{[0,s_1]}|g_n|\le\frac\varrho n\varkappa_\ast^n,\qquad\sup_{[0,s_1]}|g_n'|\le\frac{\varrho\,\varkappa_\ast^n}{k\delta},$$
   for some $\varrho\in(0,a_{T_0})$, $\delta>0$, $\varkappa_\ast<1$.
3. The endpoints $x_\pm(s)$ of the main component of $W_{T_s}$ satisfy $x_+(s)=\sum_ng_n(s)$ and $x_-(s)=\sum_n(-1)^ng_n(s)$. They are $C^1$ on $[0,s_1]$, and $M_k(T_s)=2\sum_{n\,\mathrm{odd}}g_n(s)$.
4. $\dot M_k(T_0;v)$ exists, and
$$\dot M_k(T_0;v)=2\sum_{n\ \mathrm{odd}}g_n'(0)=x_+'(0)-x_-'(0)=-\sigma_+\int_0^1\frac{v(u)\,du}{T_0(u)-x_+}-\sigma_-\int_0^1\frac{v(u)\,du}{T_0(u)-x_-},$$
   with $x_\pm=x_\pm(0)$, $\sigma_+=1/W_{T_0}'(x_+)>0$ and $\sigma_-=-1/W_{T_0}'(x_-)>0$. The series converges absolutely.

For $T_0=T_{\eta_{k,a}}$ the integrals may be written as $\int_Iv(d)\,d\eta_{k,a}(d)/(d-x_\pm)$, with $v(d):=v(u)$ for $d=T_0(u)$. This is well defined because $T_0$ is injective: $F_0\circ T_0=\mathrm{id}$, where $F_0(d)=\eta_{k,a}([a,d])$ is continuous ($\eta_{k,a}$ has no atoms).

*Proof.*
- *Choice of constants.* By strict separation and Lemma 6.4, pick $\varrho\in(0,a_{T_0})$ with $\Psi_{T_0}(\varrho)>R(T_0)$. Let $\delta=(a_{T_0}-\varrho)/2$.
  - Since $T\ge1$ and $T_0\le2$, $v\ge-1$, so $T_s\ge a_{T_0}-s$ a.e. For $s\le\delta$: $a_{T_s}\ge\varrho+\delta$, and $T_s-\varrho\ge\delta$ a.e.
- *Uniform ratio.* Put $\varkappa(s):=R(T_s)/\Psi_{T_s}(\varrho)=\mathcal R_{T_s}(\varrho)/\varrho=\varrho^{-1}\exp(-\frac1k\int\log(T_s-\varrho))$ by (6.5).
  - The integrand lies in $[\log\delta,\log2]$ and is continuous in $s$. By dominated convergence, $\varkappa$ is continuous on $[0,\delta]$.
  - Since $\varkappa(0)<1$, choose $s_1\le\delta$ with $\varkappa(s)\le\varkappa_\ast:=\frac{1+\varkappa(0)}2<1$ on $[0,s_1]$.
  - Then $\Psi_{T_s}(\varrho)>R(T_s)$ with $\varrho<a_{T_s}$, which is (1).
- *(2).* For $|y|=\varrho$ and $s\in[0,s_1]$, $\operatorname{Re}(T_s(u)-y)\ge\delta$ a.e. Hence $s\mapsto\operatorname{Log}(T_s(u)-y)$ is $C^1$ with derivative $v/(T_s-y)$, bounded by $1/\delta$.
  - Differentiation under $\int du$ gives $\partial_s\mathcal R_{T_s}(y)=-\frac1k\mathcal R_{T_s}(y)\int_0^1\frac{v(u)}{T_s(u)-y}du$, jointly continuous in $(s,y)$.
  - Differentiating the Cauchy integral $g_n(s)=\frac1{2\pi in}\oint_{|y|=\varrho}\mathcal R_{T_s}^ny^{-n}dy$ under the integral sign gives
$$g_n'(s)=\frac1{2\pi i}\oint_{|y|=\varrho}\mathcal R_{T_s}(y)^ny^{-n}\Big(-\frac1k\int_0^1\frac{v\,du}{T_s-y}\Big)dy,$$
    continuous in $s$.
  - Both bounds follow as in Lemma 6.8(3), using $|\mathcal R_{T_s}(y)|\le\mathcal R_{T_s}(\varrho)$ on $|y|=\varrho$ and $\mathcal R_{T_s}(\varrho)/\varrho=\varkappa(s)\le\varkappa_\ast$.
- *(3).* Proposition 6.10(1) applied to each $T_s$ gives the identities. By (2), $\sum g_n$ and $\sum g_n'$ converge uniformly on $[0,s_1]$ (Weierstrass M-test), and termwise differentiation gives $x_\pm\in C^1[0,s_1]$ (one-sided at $0$).
- *(4).* $M_k(T_s)=x_+(s)-x_-(s)$ is $C^1$ on $[0,s_1]$, with derivative $\sum(1-(-1)^n)g_n'$. At $s=0$ this is the claimed series, so the limit in Definition 6.12 exists.
  - For the closed form, let $\Omega(x,s)=W_{T_s}(x)=k\log|x|+\int\log(T_s(u)-x)du$ on $\{x\le\varrho,\ x\ne0\}\times[0,s_1]$, where $T_s-x\ge\delta$.
  - $\Omega$ is $C^1$, with $\partial_x\Omega=k/x-\int(T_s-x)^{-1}$ and $\partial_s\Omega=\int v/(T_s-x)$, both jointly continuous by dominated convergence.
  - By Lemma 6.6, $x_+(s)\in(0,\varrho)$ and $x_-(s)<0$, and $\Omega(x_\pm(s),s)\equiv0$. The chain rule at $s=0$ gives $x_\pm'(0)=-\partial_s\Omega/\partial_x\Omega$.
  - Here $\partial_x\Omega(x_\pm,0)=W_{T_0}'(x_\pm)\ne0$, by the simple crossings of Lemma 6.6. $\square$

*Remark (two-sided derivative).* The crossings $s\mapsto x_\pm(s)$ are in fact $C^1$ on $[-s_1,s_1]$: $T_s-x\ge\delta$ still holds for $|s|\le\delta$, and values of $T_s$ above $2$ are harmless for the holomorphic representation. So the implicit differentiation at $s=0$ is two-sided, and $\dot M_k$, called a right derivative throughout, coincides with the two-sided derivative (Lemma 7.4).

#### Theorem 6.14 (convex supporting inequality)
Let $k>0$ and let $T_0\in\mathcal Q$ be strictly separated. Examples:
- the quantile of $\eta_{k,a}$ under (6.3) with $1\le a<2$, whenever $\sup_{(0,a)}W_0>0$ (Proposition 6.3(6) gives $W_0$ in closed form);
- more generally, any strictly separated $T_0\in\mathcal Q$.

Let $T\in\mathcal Q$ be admissible (strictly separated or in contact). In particular, $T$ may be the quantile of any atomic normal-form target (Lemma 6.7). Then, with $v=T-T_0$,
$$M_k(T)\ \ge\ M_k(T_0)+\dot M_k(T_0;v).\tag{6.8}$$
This is Wang's (4.13).

*Proof.*
- *Termwise inequality.* Let $g_n(s)=F_n(T_0+sv)$, $s\in[0,1]$. By Lemma 6.11, $g_n$ is convex on $[0,1]$. For $s\in(0,1]$, $g_n(s)\le(1-s)g_n(0)+sg_n(1)$, i.e. $\frac{g_n(s)-g_n(0)}s\le g_n(1)-g_n(0)$. Letting $s\downarrow0$ (Lemma 6.13(2)) gives
$$g_n(1)\ge g_n(0)+g_n'(0)\qquad(n\ge1).$$
- *Summation.* Multiply by $2$ and sum over odd $n$. The three series converge:
  - $2\sum_{\rm odd}g_n(1)=M_k(T)$ by Proposition 6.10 (either case of admissibility);
  - $2\sum_{\rm odd}g_n(0)=M_k(T_0)$ by Proposition 6.10(1);
  - $2\sum_{\rm odd}g_n'(0)=\dot M_k(T_0;v)$ by Lemma 6.13(4), absolutely.
- A termwise inequality between convergent series passes to the sums. $\square$

*Remarks.*
- No truncation-then-limit argument and no Abel widths are needed. The inequality holds term by term, and all three series are known to converge.
- *Equality case of (6.3).* If $a=2(k/(k+1))^2$, the density of $\eta_{k,a}$ vanishes like $\sqrt{d-a}$ at $a$ (but still $\operatorname{ess\,inf}T_0=a$), $\int d\eta/(d-y)$ stays bounded as $y\uparrow a$, and $y_c(T_0)=a$. This is why "the first positive critical value" of the source must be read as the supremum $\Psi^\ast$; in that case $T_0$ is strictly separated iff $\sup_{(0,a)}W_0>0$ (not "$\max$").
- *What the later sections use.* Proposition 6.3 (density, positivity (6.3), mass, platform identity (6.4) with $C(k,a)=\log H+k\log D_0(a)$, closed-form distribution function, closed form of $W_0$ off $I$); Lemma 6.6 (simple crossings are automatic under strict separation; to certify strict separation of the reference it suffices to exhibit one $\varrho\in(0,a)$ with $W_0(\varrho)>0$); Theorem 6.14 with the explicit derivative formula of Lemma 6.13(4).

---

## 7. The endpoint-corrected adjoint inequality

*Idea source:* Wang §4, "The endpoint-corrected adjoint" (Lemma `lem:adjoint`, eqs. (4.18)–(4.25)). Every step is re-proved. Two parts differ from the source:
- the Poisson–Abel regularisation is replaced by an elementary Fejér / ramp argument (Lemmas 7.7–7.8); Wang's version tacitly uses the classical fact that Abel means of a conjugate series converge to the principal value at points of local smoothness, and ours does not need it;
- the identification of the termwise series derivative with the true derivative of the width is proved by a Cauchy estimate and Rouché's theorem (Lemma 7.5).

### 7.0 Setting, hypotheses, and the link with §6

**Parameters.**
- Fix $k\ge1$ and $1\le a<2$ with $a\ge2\big(\tfrac k{k+1}\big)^2$ (condition (6.3)).
- Put $I=[a,2]$, $c=\frac{a+2}2$, $\ell=\frac{2-a}2$, and $d(\theta)=c-\ell\cos\theta$ for $\theta\in[0,\pi]$; so $d(0)=a$ and $d(\pi)=2$.
- $de_I(d)=\dfrac{\mathrm dd}{\pi\sqrt{(d-a)(2-d)}}$, i.e. $de_I=d\theta/\pi$. Indeed $\sqrt{(d(\theta)-a)(2-d(\theta))}=\ell\sin\theta$ and $\mathrm dd=\ell\sin\theta\,d\theta$.

**Reference.**
- $\alpha(d)=k+1-\dfrac{k\sqrt{2a}}d$ and $d\eta=\alpha\,de_I$; this is $\eta_{k,a}$ of Proposition 6.3. We also write $\alpha(\theta)=\alpha(d(\theta))$.
- $F_0(d)=\eta([a,d])$, and $T_0=F_0^{-1}:(0,1)\to(a,2)$ is the reference quantile.
- $W_0(x)=k\log|x|+\int_I\log|x-e|\,d\eta(e)$.

**Hypothesis (H)** (Wang's (4.8); certified for the calibrated parameters in §9).
- The component of $\{W_0<0\}$ containing $0$ is $(x_-,x_+)$, with $x_-<0<x_+<a$.
- The crossings are simple: $W_0'(x_-)<0<W_0'(x_+)$.

*(H) is equivalent to strict separation of $T_0$* (Definition 6.5). If (H) holds, then $W_0(x_+)=0$, $W_0'(x_+)>0$ and $x_+<a$ give $W_0>0$ just to the right of $x_+$, i.e. $\sup_{(0,a)}W_0>0$. Conversely, Lemma 6.6 gives (H) from strict separation, and the $x_\pm$, $\sigma_\pm$ of §6 and of this section coincide.

**Adjoint data.** For $j\in\{-,+\}$:
- $\sigma_-=-1/W_0'(x_-)>0$ and $\sigma_+=1/W_0'(x_+)>0$;
- $K_j=\sqrt{(a-x_j)(2-x_j)}$ and $\rho_j=\dfrac\ell{c-x_j+K_j}$;
- $D_\xi=\sum_j\dfrac{\sigma_jK_j}{a-x_j}$ and $N(d)=D_\xi-\sum_j\dfrac{\sigma_jK_j}{d-x_j}$;
- $d\xi=\dfrac{N(d)\,\mathrm dd}{\pi\sqrt{(d-a)(2-d)}}$ (Wang's (4.10)), i.e. $d\xi=B(\theta)\,d\theta/\pi$ with $B(\theta)=N(d(\theta))$;
- $\Gamma=\dfrac{\sigma_-}{K_-}+\dfrac{\sigma_+}{K_+}$ and $a_\pi=\alpha(2)$.

**Target.**
- $T$ is the quantile of $\sum_{i=1}^Nq_i\delta_{d_i}$, with $1\le d_1<\dots<d_N\le2$, $q_i>0$ and $\sum q_i=1$.
- $T=d_i$ on $I_i=[u_{i-1},u_i)$, where $u_i=q_1+\dots+q_i$ and $u_0=0$. (Block endpoints are null sets for every measure used below, so the choice of half-open convention is immaterial.)
- Spatial blocks: $\mathcal I_i=[\beta_{i-1},\beta_i]$ with $\beta_i=T_0(u_i)$, $\beta_0=a$ and $\beta_N=2$. Angular block ends: $d(\theta_i)=\beta_i$, so $0=\theta_0<\theta_1<\dots<\theta_N=\pi$.
- Material velocity: $v=T-T_0$ on $(0,1)$. In the spatial variable, $v(d)=d_i-d$ for $d\in\operatorname{int}\mathcal I_i$.
- $F=\alpha v$ and $\widetilde F(\theta)=F(d(\theta))$.
- The segment is $T_s=T_0+sv$, and $\mathcal M(s)=M_k(T_s)$, where $M_k(S)$ is the width of the component containing $0$ of $\{x:k\log|x|+\int_0^1\log|x-S(u)|\,du<0\}$.
- Note $|v|\le1$, since $T,T_0\in[1,2]$.
- *Conventions at the endpoint $2$.* $T_0<2$ on $(0,1)$, so $v(2)$ and $F(2)$ are **defined** as $v(2):=\lim_{u\uparrow1}v(u)=d_N-2$ and $\widetilde F(\pi):=a_\pi(d_N-2)$. The functional of §7.4 is applied to functions with this designated value at $\pi$ (left-continuous there).

**Link with §6.** Assume (H). The target $T$ of an atomized normal form is admissible (Lemma 6.7). So Theorem 6.14 gives
$$M_k(T)\ge M_k(T_0)+\dot M_k(T_0;v),$$
where $\dot M_k(T_0;v)$ is the right derivative $\mathcal M'(0^+)$ of Definition 6.12. Lemma 7.4 below shows independently that $\mathcal M$ is $C^1$ near $0$ and computes $\mathcal M'(0)$ in closed form (7.4); Lemma 7.5 shows that Wang's termwise series derivative is the same number. The formula (7.4) agrees with Lemma 6.13(4).

> **Theorem 7.1 (endpoint-corrected adjoint).** Assume (H). For every atomic target as above:
> - (i) $g$ (Lemma 7.3) is defined at every point of $I$ except $a$, $2$ and the $\beta_i$, and $g\in L^1(\xi)$.
> - (ii) Exact endpoint identity:
> $$\dot M_k(T_0;v)-\int_Ig\,d\xi=-\Gamma\,F(2)=-a_\pi(d_N-2)\Big(\frac{\sigma_-}{K_-}+\frac{\sigma_+}{K_+}\Big).$$
> - (iii) $a_\pi>0$ and $\Gamma>0$. Hence, with Theorem 6.14, $M_k(T)\ge M_k(T_0)+\int_Ig\,d\xi$.

### 7.1 Elementary identities

#### Lemma 7.2
- **(i) Poisson representation.**
  - For $x<a$ there is a unique $\rho_x\in(0,1)$ with $x=c-\frac\ell2(\rho_x+\rho_x^{-1})$, namely $\rho_x=\ell/(c-x+K_x)$ with $K_x=\sqrt{(a-x)(2-x)}$.
  - $K_x=\dfrac{\ell(1-\rho_x^2)}{2\rho_x}$ and $\dfrac{K_x}{d(\theta)-x}=P_{\rho_x}(\theta):=\dfrac{1-\rho_x^2}{1-2\rho_x\cos\theta+\rho_x^2}$.
  - For $0\le\rho<1$: $P_\rho(\theta)=1+2\sum_{n\ge1}\rho^n\cos n\theta$ (uniformly), and $\frac1\pi\int_0^\pi P_\rho\cos n\theta\,d\theta=\rho^n$ for $n\ge0$.
- **(ii) Reference density.**
  - $\sqrt{2a}/d(\theta)=P_{\rho_0}(\theta)$, where $\rho_0:=\rho_{x=0}=\dfrac{\sqrt2-\sqrt a}{\sqrt2+\sqrt a}$ (the $\rho_0$ of §6).
  - Hence $\alpha(d(\theta))=k+1-kP_{\rho_0}(\theta)$, and $\eta$ has total mass $1$.
  - $\alpha$ is increasing. $\alpha(a)\ge0$ exactly under $a\ge2(k/(k+1))^2$, so $\alpha>0$ on $(a,2]$.
  - $a_\pi=\alpha(2)=k+1-k\sqrt{a/2}=1+\dfrac{2k\rho_0}{1+\rho_0}\ge1>0$.
  - $F_0$ is continuous and strictly increasing on $[a,2]$. So $T_0$ is a homeomorphism $(0,1)\to(a,2)$, and the push-forward of Lebesgue measure on $(0,1)$ under $T_0$ is $\eta$.
- **(iii) Finite Hilbert transform.**
  - For bounded measurable $f$ on $[0,\pi]$ and $\theta\in(0,\pi)$, put $\mathcal Hf(\theta):=\lim_{\epsilon\downarrow0}\frac1\pi\int_{[0,\pi]\setminus(\theta-\epsilon,\theta+\epsilon)}\frac{f(\phi)\,d\phi}{\cos\theta-\cos\phi}$ when the limit exists.
  - $\mathcal H1\equiv0$ and $\mathcal H[\cos n\phi](\theta)=-U_{n-1}(\cos\theta)=-\dfrac{\sin n\theta}{\sin\theta}$ for $n\ge1$ ($U_{n-1}$ the Chebyshev polynomial of the second kind).
  - If $f$ is Lipschitz near $\theta$, then $\mathcal Hf(\theta)=\frac1\pi\int_0^\pi\frac{f(\phi)-f(\theta)}{\cos\theta-\cos\phi}\,d\phi$ (absolutely convergent).
  - In that case the same limit is obtained with *symmetric excision in the spatial variable*, i.e. removing $\{|d(\phi)-d(\theta)|\le\epsilon\}$.
- **(iv) Lipschitz bound.** If $f$ is Lipschitz on $[0,\pi]$ with constant $\operatorname{Lip}(f)$, then for all $\theta\in(0,\pi)$
$$|\mathcal Hf(\theta)|\le\frac{\pi\operatorname{Lip}(f)}2\,\lambda_{\mathcal H}(\theta),\qquad\lambda_{\mathcal H}(\theta)=\log\frac{\pi+\theta}\theta+\log\frac{2\pi-\theta}{\pi-\theta}\in L^1(0,\pi).$$
- **(v) Platform derivative.** For $d\in(a,2)$: $\dfrac kd+\mathrm{PV}\!\displaystyle\int_I\frac{d\eta(e)}{d-e}=0$ (PV symmetric in $e$).
- **(vi) Chebyshev integrals.**
  - $\varepsilon_n:=\frac1\pi\int_0^\pi U_{n-1}(\cos\theta)\,d\theta$ equals $1$ for odd $n$ and $0$ for even $n$.
  - $\Sigma_n(\rho):=\frac1\pi\int_0^\pi P_\rho\,U_{n-1}(\cos\theta)\,d\theta$ equals $\dfrac{1+\rho^2-2\rho^{n+1}}{1-\rho^2}$ for odd $n$ and $\dfrac{2\rho(1-\rho^n)}{1-\rho^2}$ for even $n$.

*Proof.*
- **(i)**
  - $\rho+\rho^{-1}=2(c-x)/\ell>2$, because $c-x>\ell\iff x<a$. The smaller root is $\rho_x=\frac{(c-x)-\sqrt{(c-x)^2-\ell^2}}\ell=\frac\ell{c-x+K_x}$, using $(c-x)^2-\ell^2=(a-x)(2-x)$.
  - Then $a-x=\frac\ell2(\rho+\rho^{-1}-2)=\frac\ell{2\rho}(1-\rho)^2$, $2-x=\frac\ell{2\rho}(1+\rho)^2$, and $d(\theta)-x=\frac\ell{2\rho}(1-2\rho\cos\theta+\rho^2)$. Taking the square root of the product of the first two gives $K_x$; dividing gives $P_\rho$.
  - The series is $\operatorname{Re}\frac{1+\rho e^{i\theta}}{1-\rho e^{i\theta}}$ expanded geometrically. Orthogonality gives the integrals.
- **(ii)**
  - Apply (i) at $x=0<a$: $K_0=\sqrt{2a}$ and $\rho_0=\ell/(c+\sqrt{2a})=(c-\sqrt{2a})/\ell$, since $c^2-2a=\ell^2$. Also $c-\sqrt{2a}=\frac12(\sqrt2-\sqrt a)^2$ and $\ell=\frac12(\sqrt2-\sqrt a)(\sqrt2+\sqrt a)$.
  - Mass: $\frac1\pi\int_0^\pi(k+1-kP_{\rho_0})=k+1-k=1$.
  - $\alpha(a)=k+1-k\sqrt{2/a}\ge0\iff a\ge2k^2/(k+1)^2$.
  - $\alpha(2)=k+1-k\sqrt{a/2}$. Also $P_{\rho_0}(\pi)=\frac{1-\rho_0}{1+\rho_0}=\sqrt{a/2}$.
  - The density of $\eta$ is positive on $(a,2)$, which gives the last claims.
- **(iii)** Fix $\theta\in(0,\pi)$ and put $G_\theta(\phi)=\log\left|\dfrac{\sin\frac{\phi-\theta}2}{\sin\frac{\phi+\theta}2}\right|$.
  - Derivative: $G_\theta'(\phi)=\frac12\big[\cot\frac{\phi-\theta}2-\cot\frac{\phi+\theta}2\big]=\dfrac{\sin\theta}{2\sin\frac{\phi-\theta}2\sin\frac{\phi+\theta}2}=\dfrac{\sin\theta}{\cos\theta-\cos\phi}$ for $\phi\ne\theta$.
  - Endpoint values: $G_\theta(0)=\log1=0$ and $G_\theta(\pi)=\log\frac{\cos(\theta/2)}{\cos(\theta/2)}=0$.
  - Hence, for excision $[\theta-\epsilon_1,\theta+\epsilon_2]$,
$$\frac1\pi\int_{[0,\pi]\setminus[\theta-\epsilon_1,\theta+\epsilon_2]}\frac{d\phi}{\cos\theta-\cos\phi}=\frac{G_\theta(\theta-\epsilon_1)-G_\theta(\theta+\epsilon_2)}{\pi\sin\theta}=\frac1{\pi\sin\theta}\Big[\log\frac{\sin(\epsilon_1/2)}{\sin(\epsilon_2/2)}+\log\frac{\sin(\theta+\epsilon_2/2)}{\sin(\theta-\epsilon_1/2)}\Big].$$
    - With $\epsilon_1=\epsilon_2$ this tends to $0$, so $\mathcal H1=0$.
    - With spatial excision, $\cos(\theta-\epsilon_1)-\cos\theta=\epsilon/\ell=\cos\theta-\cos(\theta+\epsilon_2)$. So $\epsilon_{1,2}=\frac\epsilon{\ell\sin\theta}(1+o(1))$, and the limit is again $0$.
  - $n=1$: $\frac{\cos\phi}{\cos\theta-\cos\phi}=-1+\frac{\cos\theta}{\cos\theta-\cos\phi}$, so $\mathcal H[\cos\phi]=-1=-U_0$.
  - Recurrence: $\cos(n+1)\phi+\cos(n-1)\phi=2\cos\theta\cos n\phi-2(\cos\theta-\cos\phi)\cos n\phi$ and $\frac1\pi\int_0^\pi\cos n\phi=0$ for $n\ge1$. These give $\mathcal H_{n+1}=2\cos\theta\,\mathcal H_n-\mathcal H_{n-1}$ with $\mathcal H_0=0$ and $\mathcal H_1=-1$ (where $\mathcal H_n:=\mathcal H[\cos n\phi]$). This is the recurrence of $-U_{n-1}$ (with $U_{-1}=0$, $U_0=1$).
  - Lipschitz case: write $f=(f-f(\theta))+f(\theta)$.
    - The first part is absolutely integrable: $|f(\phi)-f(\theta)|\le\operatorname{Lip}(f)|\phi-\theta|$ near $\theta$, $|\cos\theta-\cos\phi|\ge c_\theta|\phi-\theta|$ near $\theta$, and the denominator is bounded below elsewhere. So every excision scheme converges to the same absolute integral.
    - The constant part is handled by the two excision computations above.
- **(iv)**
  - Put $w=(\theta+\phi)/2\in[0,\pi]$ and use $\sin x\ge2x/\pi$ on $[0,\pi/2]$. Then $\sin w\ge\frac1\pi\hat m$ with $\hat m=\min(\theta+\phi,2\pi-\theta-\phi)$, and $|\sin\frac{\theta-\phi}2|\ge|\theta-\phi|/\pi$.
  - So $|\cos\theta-\cos\phi|\ge\frac2{\pi^2}\hat m|\theta-\phi|$, and
$$\Big|\frac{f(\phi)-f(\theta)}{\cos\theta-\cos\phi}\Big|\le\frac{\pi^2\operatorname{Lip}(f)}2\Big(\frac1{\theta+\phi}+\frac1{2\pi-\theta-\phi}\Big).\tag{7.1}$$
  - Integrate in $\phi$ and use (iii).
- **(v)**
  - $\alpha$ is smooth near $d$. By (iii), transported to the spatial variable, $\mathrm{PV}\int\frac{\alpha(e)\,de_I(e)}{d-e}=-\int\frac{\alpha(e)-\alpha(d)}{e-d}\,de_I(e)$, since the PV of the constant vanishes.
  - $\alpha(e)-\alpha(d)=k\sqrt{2a}\,\frac{e-d}{de}$, and $\int\frac{de_I(e)}e=\frac1{K_0}\cdot\frac1\pi\int_0^\pi P_{\rho_0}=\frac1{\sqrt{2a}}$ by (i) at $x=0$.
  - So the PV equals $-k/d$.
- **(vi)** Use $\frac{\sin n\theta}{\sin\theta}=\sum_{m=0}^{n-1}e^{i(n-1-2m)\theta}$:
  - $U_{2p}=1+2\sum_{l=1}^p\cos2l\theta$ and $U_{2p-1}=2\sum_{l=1}^p\cos(2l-1)\theta$;
  - then apply (i): $1+2\sum_{l\le p}\rho^{2l}=\frac{1+\rho^2-2\rho^{2p+2}}{1-\rho^2}$ and $2\sum_{l\le p}\rho^{2l-1}=\frac{2\rho(1-\rho^{2p})}{1-\rho^2}$. $\square$

### 7.2 (a) The material first variation $g$

For $u\in(0,1)$ and small $|s|$ put
$$\Phi_u(s)=k\log T_s(u)+\int_0^1\log|T_s(u)-T_s(w)|\,dw .$$

#### Lemma 7.3
Let $u\in\operatorname{int}I_i$ and $d=T_0(u)\in\operatorname{int}\mathcal I_i$.
- (a1) $\Phi_u$ is differentiable at $s=0$, and $g(d):=\Phi_u'(0)$ is given by
$$g(d)=\frac{k\,v(d)}d+\int_I\frac{v(d)-v(e)}{d-e}\,d\eta(e)=\frac{k(d_i-d)}d-1+\sum_{j\ne i}(d_i-d_j)\int_{\mathcal I_j}\frac{d\eta(e)}{d-e},\tag{7.2}$$
  an absolutely convergent integral. Its integrand equals $-1$ on $\mathcal I_i$ and is bounded on $\bigcup_{j\ne i}\mathcal I_j$.
- (a2) Principal-value form:
$$g(d)=\mathrm{PV}\!\int_I\frac{F(e)}{e-d}\,de_I(e)=\frac1\ell\,\mathcal H\widetilde F(\theta),\qquad d=d(\theta),\tag{7.3}$$
  with the PV symmetric in $e$ or in $\phi$ (same value).
- (a3) Regularity: $g$ is real-analytic on each $\operatorname{int}\mathcal I_i$ and has at most logarithmic singularities at the $\beta_i$ (explicitly in §7.5). It is undefined at $u=u_i$, a null set. Only local Lipschitz continuity of $v$ near $d$ is used; no global regularity of $v$ is needed.

*Proof.*
- Change variables $e=T_0(w)$ (Lemma 7.2(ii)). For $w\in I_j$ put $X=d-e$ and $Y=d_i-d_j$. Then $T_s(u)-T_s(w)=X+s(v(d)-v(e))$ and $v(d)-v(e)=Y-X$, so $T_s(u)-T_s(w)=(1-s)X+sY$.
- **$j=i$** ($Y=0$):
  - The contribution is $q_i\log(1-s)+\int_{I_i}\log|X|\,dw$. It is finite because $\log|d-\cdot|$ is $\eta$-integrable: in $\theta$ the density is bounded.
  - Its derivative at $0$ is $-q_i$.
- **$j\ne i$**: $X$ and $Y$ have the same sign (the blocks and the atoms are both ordered), $|X|\ge\delta_u:=\operatorname{dist}(d,\bigcup_{j\ne i}\mathcal I_j)>0$, and $|Y-X|\le1$ (only boundedness matters).
  - For $s\in[0,1]$: $|(1-s)X+sY|\ge\min(|X|,|Y|)\ge\min(\delta_u,\gamma)$, where $\gamma=\min_{i\ne j}|d_i-d_j|>0$.
  - For $-\delta_u/2\le s<0$: $|(1-s)X+sY|\ge\delta_u/2$.
  - So $\partial_s\log|(1-s)X+sY|=(Y-X)/((1-s)X+sY)$ is uniformly bounded, and differentiation under the integral is legitimate.
- $k\log(d+sv(d))$ has derivative $kv(d)/d$.
- Summing, and using $\frac{Y-X}X=\frac{v(d)-v(e)}{d-e}$ with value $-1$ on $\mathcal I_i$, gives (7.2).
- For (a2):
  - Truncate the absolutely convergent integral in (7.2) at $|e-d|>\epsilon$ and split it linearly: $\int_{|e-d|>\epsilon}\frac{v(d)-v(e)}{d-e}\,d\eta=v(d)\int_{|e-d|>\epsilon}\frac{d\eta}{d-e}-\int_{|e-d|>\epsilon}\frac{v(e)\,d\eta}{d-e}$.
  - As $\epsilon\to0$, the left side converges, and the first term tends to $-kv(d)/d$ by Lemma 7.2(v). Hence the last PV exists and $g(d)=\mathrm{PV}\int\frac{v(e)}{e-d}\,d\eta(e)=\mathrm{PV}\int\frac{F(e)}{e-d}\,de_I(e)$.
  - In angular variables $e-d=\ell(\cos\theta-\cos\phi)$. $\widetilde F$ is Lipschitz near $\theta$, so Lemma 7.2(iii) shows that spatial and angular symmetric excision give the same limit, namely $\frac1\ell\mathcal H\widetilde F(\theta)$.
- (a3) follows from (7.2) and the closed form in §7.5. $\square$

(7.2) is exactly the "unreduced first variation" used in Wang's block reduction; in quantile variables it is (8.1) below.

### 7.3 (b) First variation of the reference width

#### Lemma 7.4
Let $T:(0,1)\to[1,2]$ be measurable (atomicity is not needed here) and $s_0:=(a-x_+)/3$.
- There is $s_2\in(0,s_0]$ such that for $|s|\le s_2$ the main component of $\{W_{T_s}<0\}$ is $(x_-(s),x_+(s))$, where $x_\pm(\cdot)$ are $C^1$ and $x_\pm(0)=x_\pm$.
- Hence $\mathcal M(s)=x_+(s)-x_-(s)$ is $C^1$ on $[-s_2,s_2]$, and
$$\mathcal M'(0)=-\sum_{j=\pm}\sigma_j\int_I\frac{F(d)}{d-x_j}\,de_I(d)=-\sum_j\frac{\sigma_j}{K_j}\Big(f_0+2\sum_{n\ge1}f_n\rho_j^n\Big),\tag{7.4}$$
  where $f_n=\frac1\pi\int_0^\pi\widetilde F\cos n\theta$.

*Proof.*
- **Setup.** $|v|\le1$, so $T_s(u)\in[a-s_0,2+s_0]$ for $|s|\le s_0$.
  - On $\mathcal U=\big((-\infty,x_++s_0]\setminus\{0\}\big)\times[-s_0,s_0]$ we have $T_s(u)-x\ge s_0$.
  - So $W(x,s)=k\log|x|+\int_0^1\log|x-T_s(u)|\,du$ is $C^1$ there, with $\partial_xW=\frac kx+\int\frac{du}{x-T_s(u)}$ and $\partial_sW=\int\frac{v(u)\,du}{T_s(u)-x}$, both continuous by dominated convergence.
  - Moreover, with $\mathcal V_s(x):=\int\log|x-T_s|$, uniformly on $[x_--1,x_++s_0]$: $|\mathcal V_s(x)-\mathcal V_0(x)|\le|s|/s_0$ and $|\partial_x\mathcal V_s-\partial_x\mathcal V_0|\le|s|/s_0^2$.
- **Choice of $\delta$.** By (H) choose $\delta\in(0,s_0)$ with:
  - $W_0'\ge c_\ast>0$ on $[x_+-\delta,x_++\delta]$;
  - $W_0'\le-c_\ast$ on $[x_--\delta,x_-+\delta]$;
  - $x_-+\delta<0<x_+-\delta$.
- **Negativity inside.** On the compact set $[x_-+\delta,x_+-\delta]$, the upper semicontinuous function $W_0$ (with values in $[-\infty,0)$) attains its maximum $-\mu_\ast<0$.
- **Small $s$.** For $|s|\le s_2$ (small):
  - $W(\cdot,s)<0$ on $[x_-+\delta,x_+-\delta]$;
  - $W(\cdot,s)$ is strictly monotone on the two $\delta$-windows, with opposite signs at their ends;
  - hence each window contains exactly one zero $x_\pm(s)$;
  - therefore $W(\cdot,s)<0$ on $(x_-(s),x_+(s))$, with $W(x_\pm(s),s)=0$, and the main component is $(x_-(s),x_+(s))$.
- **Implicit function theorem.** $x_\pm$ are $C^1$ with $x_\pm'(0)=-\partial_sW(x_\pm,0)/W_0'(x_\pm)$, and $\partial_sW(x_j,0)=\int\frac{v\,du}{T_0-x_j}=\int_I\frac{v(e)\,d\eta(e)}{e-x_j}=\int_I\frac{F\,de_I}{e-x_j}$.
- **Signs.**
  - $x_+'(0)=-\sigma_+\partial_sW(x_+,0)$ and $x_-'(0)=+\sigma_-\partial_sW(x_-,0)$.
  - Subtracting gives the first form of (7.4).
  - The second form follows from $\frac1{d(\theta)-x_j}=\frac{P_{\rho_j}(\theta)}{K_j}$ and Lemma 7.2(i), valid for any $\widetilde F\in L^1$. $\square$

In particular $\dot M_k(T_0;v)=\mathcal M'(0)$ exists (two-sided), and (7.4) holds for the discontinuous atomic velocity: only $v\in L^\infty$ is used.

#### Lemma 7.5 (identification with the termwise series derivative)
Use the notation of §6: $\Psi_S(y)=y\,\psi_S(y)$ with $\psi_S(y)=\exp\big(\frac1k\int_0^1\operatorname{Log}(1-y/S(u))\,du\big)$, $R(S)=\exp\big(-\frac1k\int\log S\big)$, and $a_n(S)=\frac1n[y^{n-1}]\psi_S(y)^{-n}$ (the coefficients of $\Phi_S$, since $\psi_S^{-1}=\mathcal R_S/R(S)$ by (6.5)). Then $s\mapsto\sum_{m\ge0}2a_{2m+1}(T_s)R(T_s)^{2m+1}$ is analytic on a complex disc $|s|<s_3$ and equals $\mathcal M(s)$ for real $s$. In particular its termwise derivative at $0$, which is Wang's $DS(T_0)[v]=\lim_mDS_m(T_0)[v]$, equals $\mathcal M'(0)$.

*This lemma is not needed for the main line of the proof* (Theorem 6.14 is stated with the true derivative); it shows that the derivative used in Wang's text is the same number.

*Proof.*
- **Choice of $\tau$.** For real $0<y<a$: $\frac1kW_0(y)=\log\frac{\Psi_0(y)}{R(T_0)}$, with $\Psi_0=\Psi_{T_0}$. By (H), $W_0>0$ just right of $x_+$, so there is $\tau\in(x_+,a)$ with $m_\tau:=\Psi_0(\tau)>R(T_0)$.
- **Circle minimum.** For $|y|=\tau$ and $e\in(a,2)$: $|1-y/e|\ge1-\tau/e$. Hence $\min_{|y|=\tau}|\Psi_0(y)|=\Psi_0(\tau)=m_\tau$.
- **Complex $s$.** For complex $|s|\le s_3<(a-\tau)/2$, $\operatorname{Re}(1-y/T_s(u))>0$ on $|y|\le\tau$. So $\psi_{T_s}$ is analytic and zero-free in $(y,s)$, and $\Psi_{T_s}\to\Psi_0$ uniformly on $|y|=\tau$. Shrinking $s_3$, fix $\delta>0$ with $R(T_0)+2\delta<m_\tau-2\delta$, $\min_{|y|=\tau}|\Psi_{T_s}|\ge m_\tau-\delta$ and $|R(T_s)|\le R(T_0)+\delta$.
- **Coefficient bound.** Cauchy's formula $a_n(T_s)=\frac1{2\pi in}\oint_{|y|=\tau}\psi_{T_s}^{-n}y^{-n}\,dy$ gives:
  - $a_n(T_s)$ is analytic in $s$;
  - $|a_n(T_s)|\le\frac\tau n(m_\tau-\delta)^{-n}$.
  - So the odd series converges uniformly on $|s|\le s_3$ and is analytic (Weierstrass), and it may be differentiated termwise.
- **Identification for real $s$.** For real $s$ and $|z|<m_\tau-\delta$:
  - Rouché on $|y|=\tau$ shows that $\Psi_{T_s}(y)=z$ has exactly one root $\hat\Phi_s(z)$ in $|y|<\tau$; $\Psi_{T_s}$ has the single zero $y=0$ there.
  - $\hat\Phi_s$ is analytic, and it equals the Lagrange series $\sum a_n(T_s)z^n$ near $0$, hence on the whole disc.
  - The real crossings satisfy $\Psi_{T_s}(x_\pm(s))=\pm R(T_s)$. Indeed $W_{T_s}(y)=k\log(|\Psi_{T_s}(y)|/R(T_s))$ for real $y<\min T_s$, with $\Psi_{T_s}>0$ on $(0,\min T_s)$ and $<0$ on $(-\infty,0)$.
  - Both crossings lie in $|y|<\tau$: $x_+(s)\to x_+<\tau$; $|\Psi_0|$ is increasing on the negative axis with $|\Psi_0(-\tau)|\ge m_\tau>R(T_0)=|\Psi_0(x_-)|$, so $|x_-|<\tau$. This bound, proved at $s=0$, persists for real $|s|<\min(s_2,s_3)$ after shrinking $s_3$, by continuity of $x_\pm(s)$ (Lemma 7.4).
  - Hence $x_\pm(s)=\hat\Phi_s(\pm R(T_s))$, and $\mathcal M(s)=\hat\Phi_s(R)-\hat\Phi_s(-R)=2\sum a_{2m+1}R^{2m+1}$ with $R=R(T_s)$. $\square$

(The same Cauchy/Rouché argument also shows, without Pringsheim's theorem, that the reference inverse series converges absolutely at $\pm R(T_0)$ with room to spare.)

### 7.4 (c) The coefficient computation (cosine polynomials)

For bounded measurable $f$ on $[0,\pi]$ such that $\mathcal Hf$ exists a.e. and $\mathcal Hf\cdot B\in L^1$ (with $f(\pi)$ the designated value, §7.0), define the linear functional
$$\mathfrak L(f):=-\sum_j\frac{\sigma_j}{K_j}\cdot\frac1\pi\int_0^\pi fP_{\rho_j}\,d\theta-\frac1{\pi\ell}\int_0^\pi\mathcal Hf(\theta)B(\theta)\,d\theta+\Gamma f(\pi).$$

#### Lemma 7.6
$\mathfrak L(p)=0$ for every cosine polynomial $p=f_0+2\sum_{n=1}^{n_1}f_n\cos n\theta$. This holds for arbitrary $x_\pm<a$ and real $\sigma_\pm$, provided $D_\xi:=\sum_j\sigma_jP_{\rho_j}(0)$ and $B=D_\xi-\sum_j\sigma_jP_{\rho_j}$. The identity is purely algebraic.

*Proof.*
- Constants:
  - $\frac1{K_j}=\frac{2\rho_j}{\ell(1-\rho_j^2)}$, so $\Gamma=\frac2\ell\sum_j\frac{\sigma_j\rho_j}{1-\rho_j^2}$;
  - $P_\rho(0)=\frac{1+\rho}{1-\rho}=\frac{(1+\rho)^2}{1-\rho^2}$.
- The three terms of $\mathfrak L(p)$:
  - First term, by Lemma 7.2(i): $-\sum_j\frac{\sigma_j}{K_j}(f_0+2\sum_nf_n\rho_j^n)$.
  - Second term, by Lemma 7.2(iii): $\mathcal Hp=-2\sum_nf_nU_{n-1}(\cos\theta)$. With (vi) the second term becomes $+\frac2\ell\sum_nf_n\big(D_\xi\varepsilon_n-\sum_j\sigma_j\Sigma_n(\rho_j)\big)$.
  - Third term: $\Gamma p(\pi)=\Gamma\big(f_0+2\sum_n(-1)^nf_n\big)$.
- Coefficient of $f_0$: $-\Gamma+\Gamma=0$.
- Coefficient of $f_n$, $n$ even: $-\frac4\ell\sum_j\frac{\sigma_j\rho_j^{n+1}}{1-\rho_j^2}-\frac4\ell\sum_j\frac{\sigma_j\rho_j(1-\rho_j^n)}{1-\rho_j^2}+2\Gamma=-2\Gamma+2\Gamma=0$.
- Coefficient of $f_n$, $n$ odd:
$$-\frac4\ell\sum_j\frac{\sigma_j\rho_j^{n+1}}{1-\rho_j^2}+\frac2\ell\sum_j\sigma_j\frac{(1+\rho_j)^2-(1+\rho_j^2-2\rho_j^{n+1})}{1-\rho_j^2}-2\Gamma=\frac2\ell\sum_j\frac{2\sigma_j\rho_j}{1-\rho_j^2}-2\Gamma=0.\qquad\square$$

So for $\widetilde F=p$, $\dot M_k-\int g\,d\xi=-\Gamma p(\pi)=-\Gamma F(2)$ (by (7.3), (7.4) and $d(\pi)=2$). This agrees with Wang's (4.23), including the sign and the factor. The parity bookkeeping (constant: $-\Gamma$; even: $-2\Gamma$; odd: $+2\Gamma$) matches $-\Gamma F(2)$, because $F(2)=f_0+2\sum(-1)^nf_n$.

### 7.5 (d) Passage to atomic targets

#### Lemma 7.7 (Lipschitz $f$)
If $f$ is Lipschitz on $[0,\pi]$, then $\mathcal Hf\cdot B\in L^1$ and $\mathfrak L(f)=0$.

*Proof.*
- **Fejér approximation.**
  - The even $2\pi$-periodic extension of $f$ is Lipschitz with the same constant; across $0$ use $|\phi-\theta|\le\phi+\theta$ for $\phi,\theta\ge0$, and similarly at $\pi$.
  - Its Fejér means $p_m$ are cosine polynomials, with $\operatorname{Lip}(p_m)\le\operatorname{Lip}(f)$ (the kernel is positive with mass one) and $\|p_m-f\|_\infty\to0$ (Fejér).
  - Put $e_m=p_m-f$. Then $\operatorname{Lip}(e_m)\le2\operatorname{Lip}(f)$ and $\|e_m\|_\infty\to0$.
- **Convergence of the three terms.**
  - First term of $\mathfrak L(e_m)$: at most $\Gamma\|e_m\|_\infty\to0$.
  - Third term: $\Gamma|e_m(\pi)|\to0$.
  - Middle term. For each $\theta\in(0,\pi)$, $\mathcal He_m(\theta)=\frac1\pi\int\frac{e_m(\phi)-e_m(\theta)}{\cos\theta-\cos\phi}\,d\phi$ (Lemma 7.2(iii)).
    - The integrand tends to $0$ pointwise: it is at most $2\|e_m\|_\infty/|\cos\theta-\cos\phi|$.
    - It is dominated by (7.1) with $2\operatorname{Lip}(f)$, which is integrable in $\phi$. So $\mathcal He_m(\theta)\to0$.
    - By Lemma 7.2(iv), $|\mathcal He_m\cdot B|\le\pi\operatorname{Lip}(f)\|B\|_\infty\lambda_{\mathcal H}\in L^1$. Dominated convergence gives $\int\mathcal He_m\,B\to0$.
- **Conclusion.** Since $\mathfrak L(p_m)=0$ (Lemma 7.6), $\mathfrak L(f)=0$. $\square$

#### Lemma 7.8 (one jump)
For $0<\omega<\pi$ and $\chi_\omega=\mathbf 1_{[\omega,\pi]}$:
- for $\theta\ne\omega$,
$$\mathcal H\chi_\omega(\theta)=-\frac1{\pi\sin\theta}\log\left|\frac{\sin\frac{\omega-\theta}2}{\sin\frac{\omega+\theta}2}\right|;\tag{7.5}$$
- for $t$ in a compact $[\omega-\epsilon_0,\omega+\epsilon_0]\subset(0,\pi)$, $|\mathcal H\chi_t(\theta)|\le C_1(1+|\log|\theta-t||)$ uniformly;
- $\mathfrak L(\chi_\omega)=0$.

*Proof.*
- **Formula (7.5).** It is $\frac1{\pi\sin\theta}[G_\theta(\pi)-G_\theta(\omega)]$ with $G_\theta(\pi)=0$ (Lemma 7.2(iii)). If $\theta\in(\omega,\pi)$, the symmetric excision adds a vanishing term.
- **Bound.** Write $\lambda_t(\theta)=\log|\sin\frac{t-\theta}2|-\log|\sin\frac{t+\theta}2|$.
  - $\lambda_t(0)=\lambda_t(\pi)=0$.
  - $\lambda_t'$ is bounded on $[0,t/2]$ and on $[(\pi+t)/2,\pi]$ (both cotangent arguments stay in a compact subset of $(0,\pi)$). So $|\lambda_t|\le C\min(\theta,\pi-\theta)$ there, and $|\mathcal H\chi_t|$ is bounded there.
  - In between, $\sin\theta$ is bounded below and $|\lambda_t|\le C+|\log|t-\theta||$.
- **Ramp approximation.** For $0<\epsilon<\epsilon_0$ let $\chi_{\omega,\epsilon}=\frac1{2\epsilon}\int_{\omega-\epsilon}^{\omega+\epsilon}\chi_t\,dt$ (a Lipschitz ramp). Lemma 7.7 gives $\mathfrak L(\chi_{\omega,\epsilon})=0$.
  - As $\epsilon\to0$ the first term converges ($L^1$), and the third is constant: $\chi_{\omega,\epsilon}(\pi)=1=\chi_\omega(\pi)$.
  - Middle term, step 1. For fixed $\theta$, $\mathcal H\chi_{\omega,\epsilon}(\theta)=\frac1\pi\int\frac{\chi_{\omega,\epsilon}(\phi)-\chi_{\omega,\epsilon}(\theta)}{\cos\theta-\cos\phi}\,d\phi=\frac1{2\epsilon}\int\mathcal H\chi_t(\theta)\,dt$. This is Tonelli: $\chi_t(\phi)-\chi_t(\theta)\ne0$ only for $\phi$ on the far side of $t$, where $\int\frac{d\phi}{|\cos\theta-\cos\phi|}\le C(1+|\log|\theta-t||)$, which is integrable in $t$.
  - Middle term, step 2. By the uniform log bound and Fubini, $\int_0^\pi\mathcal H\chi_{\omega,\epsilon}B=\frac1{2\epsilon}\int_{\omega-\epsilon}^{\omega+\epsilon}\Theta(t)\,dt$, with $\Theta(t):=\int_0^\pi\mathcal H\chi_tB$.
  - Middle term, step 3. $\Theta$ is continuous at $\omega$:
    - $\mathcal H\chi_t(\theta)\to\mathcal H\chi_\omega(\theta)$ for $\theta\ne\omega$, by (7.5);
    - the family $\{C_1(1+|\log|\cdot-t||)\}_t$ is uniformly integrable. Indeed, for $t\in[0,\pi]$ and measurable $E\subseteq[0,\pi]$ with $0<m=|E|\le2$: since $|\theta-t|\le\pi$, $|\log|\theta-t||\le\log\pi+(-\log|\theta-t|)_+$. The function $(-\log|\theta-t|)_+$ decreases in $|\theta-t|$, so its integral over $E$ is at most its integral over the interval of length $m$ centred at $t$. Hence
$$\int_E|\log|\theta-t||\,d\theta\le m\log\pi+2\int_0^{m/2}(-\log r)\,dr=m\log\pi+m\Big(1+\log\frac2m\Big)\xrightarrow[m\to0]{}0,$$
      uniformly in $t$;
    - Vitali's theorem applies.
  - Hence $0=\mathfrak L(\chi_{\omega,\epsilon})\to\mathfrak L(\chi_\omega)$. $\square$

#### Proposition 7.9 (atomic targets)
For the atomic target, $g\in L^1(\xi)$, and
$$\dot M_k(T_0;v)-\int_Ig\,d\xi=-\Gamma\,a_\pi(d_N-2).$$

*Proof.*
- **Jump decomposition.** On $(\theta_{i-1},\theta_i)$, $\widetilde F$ is the restriction of the analytic function $\widetilde F_i(\theta)=\alpha(d(\theta))(d_i-d(\theta))$.
  - Put $\Delta_i=\widetilde F_{i+1}(\theta_i)-\widetilde F_i(\theta_i)=\alpha(\beta_i)(d_{i+1}-d_i)\ge0$, for $1\le i\le N-1$.
  - $F_c:=\widetilde F-\sum_i\Delta_i\chi_{\theta_i}$ extends to a continuous function on $[0,\pi]$ that is $C^1$ on each $[\theta_{i-1},\theta_i]$, hence Lipschitz.
- **Transform of $\widetilde F$.** For $\theta\notin\{\theta_i\}$, $\mathcal H\widetilde F(\theta)=\mathcal HF_c(\theta)+\sum_i\Delta_i\mathcal H\chi_{\theta_i}(\theta)$ (linearity of limits).
  - By Lemma 7.3(a2) this equals $\ell\,g(d(\theta))$.
  - By Lemma 7.2(iv) and Lemma 7.8, $|g(d(\theta))|\le C\big(\lambda_{\mathcal H}(\theta)+\sum_i(1+|\log|\theta-\theta_i||)\big)$.
  - $B$ is bounded, so $g\in L^1(\xi)$. Also $\int_Ig\,d\xi=\frac1\pi\int_0^\pi g(d(\theta))B(\theta)\,d\theta$, using $d\xi=B\,d\theta/\pi$.
- **Assembly.** By (7.4), $\dot M_k(T_0;v)=-\sum_j\frac{\sigma_j}{K_j}\frac1\pi\int\widetilde FP_{\rho_j}$.
  - Therefore $\dot M_k-\int g\,d\xi+\Gamma\widetilde F(\pi)=\mathfrak L(F_c)+\sum_i\Delta_i\mathfrak L(\chi_{\theta_i})=0$ (Lemmas 7.7 and 7.8).
  - $\widetilde F(\pi)=F_c(\pi)+\sum\Delta_i$ (since $\chi_{\theta_i}(\pi)=1$), and this is $\widetilde F_N(\pi)=\alpha(2)(d_N-2)=a_\pi v(2)$. $\square$

**Shape of the singularity.** By (7.5), near a block boundary
$$g(d(\theta))=-\frac{\Delta_i}{\pi\ell\sin\theta_i}\log|\theta-\theta_i|+O(1)\to+\infty,$$
an integrable logarithmic spike. So $\int g\,d\xi$ is finite.

### 7.6 (e) Positivity and finiteness of $\xi$

#### Lemma 7.10
- (i) $N(a)=0$ and $N'(d)=\sum_j\frac{\sigma_jK_j}{(d-x_j)^2}>0$ on $I$. So $N>0$ on $(a,2]$, and $\xi$ is a positive measure, positive on every nonempty open subinterval of $I$.
- (ii) In angles: $B(\theta)=\sum_j\sigma_j\big(P_{\rho_j}(0)-P_{\rho_j}(\theta)\big)$.
  - $B(0)=0$ and $B(\theta)=O(\theta^2)$, since $B$ is even and smooth.
  - $B(\pi)=b_\pi:=\sum_j\frac{4\sigma_j\rho_j}{1-\rho_j^2}=2\ell\Gamma>0$.
- (iii) $R_\xi:=\xi(I)=\frac1\pi\int_0^\pi B=D_\xi-\sigma_--\sigma_+=\sum_j\frac{2\sigma_j\rho_j}{1-\rho_j}$. This is finite and positive; it is Wang's calibration constant "$R_0$" (not to be confused with $R(T_0)$ of §6).

*Proof.*
- $d-x_j>0$ on $I$ because $x_j<a$, and $\sigma_j,K_j>0$; $N(a)=0$ is the definition of $D_\xi$.
- (ii) follows from $\frac{K_j}{d(\theta)-x_j}=P_{\rho_j}(\theta)$; $P_\rho$ is decreasing in $\theta$ on $[0,\pi]$.
- (iii) follows from Lemma 7.2(i).
- Also $\Gamma=\frac2\ell\sum_j\frac{\sigma_j\rho_j}{1-\rho_j^2}=\frac{b_\pi}{2\ell}$. $\square$

### 7.7 Proof of Theorem 7.1
- (i) is Lemma 7.3 together with Proposition 7.9.
- (ii) is Proposition 7.9 together with Lemma 7.4.
- (iii) Positivity:
  - $a_\pi\ge1$ (Lemma 7.2(ii));
  - $\Gamma>0$ (since $\sigma_\pm>0$ by (H) and $K_\pm>0$);
  - $v(2)=d_N-2\le0$.
  - Hence $\dot M_k(T_0;v)-\int g\,d\xi=-\Gamma a_\pi(d_N-2)\ge0$, with equality iff $d_N=2$.
  - With Theorem 6.14: $M_k(T)\ge M_k(T_0)+\dot M_k(T_0;v)\ge M_k(T_0)+\int_Ig\,d\xi$. $\square$

*Where the correction comes from.* The Cauchy transform of $\xi$ on $I$ is $\mathrm{PV}\int\frac{d\xi(d)}{d-e}=\sum_j\frac{\sigma_j}{e-x_j}$ (from $\mathcal HP_\rho=-\frac{2\rho}{1-2\rho\cos\theta+\rho^2}$). A *formal* Fubini swap of the two principal-value integrals would therefore give $\int g\,d\xi=\dot M$ with no correction. The swap is illegitimate because both $e_I$ and $\xi$ have inverse-square-root densities at $d=2$ ($B(\pi)\ne0$), and the defect is exactly $-\Gamma F(2)$. This is why the regularisation argument of Lemmas 7.7–7.8 is indispensable.

---

## 8. Block reduction and circle rearrangement

*Idea source:* Wang §4.3 ("The block inequality"), §5 ("A circle rearrangement theorem") and §7, eqs. (7.7)–(7.11); cross-checked against Budala §6.2–6.3. Every step is re-derived. The circle rearrangement step uses Theorem 8.8, proved in §8.4; the circle Riesz rearrangement inequality of the literature is not used (it remains an alternative citation, Appendix C).

### 8.0 Notation and standing hypotheses

**Target.** Normal form (Definition 3.5): $k\ge1$; the atomized target is $\nu=\sum_{i=1}^Nq_i\delta_{d_i}$ with $1<d_1<\dots<d_N\le2$, $q_i>0$ and $\sum q_i=1$. Then $W(x)=k\log|x|+\sum_iq_i\log|x-d_i|$, $M_k=M_k(T)$ is the width of the main component, and $R_i$, $\mathcal J_k=M_k+2\sum_iR_i$ are as in Definition 3.5. The strict inequality $d_1>1$ holds by Lemma 3.6(a): the component of $d_1$ has left end $\lambda_1^-\ge1$ and contains $d_1$ in its interior. The target quantile is $T(u)=d_i$ for $u\in I_i:=[u_{i-1},u_i)$, where $u_i=\sum_{j\le i}q_j$ and $u_0=0$. The blocks $I_i$ are consecutive, and $T$ is nondecreasing.

**Reference.** Fix $1\le a<2$ and put $I=[a,2]$,
$$c=\tfrac{a+2}2,\qquad\ell=\tfrac{2-a}2\ \ (\text{Wang's }r),\qquad H=\tfrac\ell2,\qquad d(\theta)=c-\ell\cos\theta\quad(0\le\theta\le\pi).$$
- **(H1)** $a\ge2\big(\tfrac k{k+1}\big)^2$. Put $\alpha(\theta)=k+1-k\sqrt{2a}/d(\theta)$ and $d\eta=\alpha(\theta)\,d\theta/\pi$. In the variable $d$ this is (6.2) (Wang's (4.4)).
- **(H2)** Hypothesis (H) of §7 for $W_0(x)=k\log|x|+\int\log|x-e|\,d\eta(e)$: the main component is $(x_-,x_+)$, strictly separated, with simple crossings $x_-<0<x_+<a$, $W_0'(x_-)<0<W_0'(x_+)$. Put $\sigma_-=-1/W_0'(x_-)>0$ and $\sigma_+=1/W_0'(x_+)>0$. Let $\rho_\pm\in(0,1)$ be defined by $x_\pm=c-\frac\ell2(\rho_\pm+\rho_\pm^{-1})$, let $P_\rho(\theta)=\frac{1-\rho^2}{1-2\rho\cos\theta+\rho^2}$, and $D_\xi=\sum_\pm\sigma_\pm P_{\rho_\pm}(0)$. Then
$$B(\theta)=D_\xi-\sum_\pm\sigma_\pm P_{\rho_\pm}(\theta),\qquad d\xi=B(\theta)\,d\theta/\pi .$$
- $M_0=M_k(T_0)=x_+-x_-$, $R_\xi=\xi(I)$, and $C=C(k,a)=\log H+k\log D_0(a)$ with $D_0(a)=\frac{a+2+2\sqrt{2a}}4$.
- $L$ is any real constant (in the application $L=L_{\rm hi}$ or $L=D$, §9), and $C_{\rm eff}=C+(L-M_0)/R_\xi$.

**Quantiles.** $F_0(d)=\eta([a,d])$, $T_0=F_0^{-1}$ (the quantile of $\eta$), and $\hat\xi=(F_0)_\#\xi$ on $(0,1)$. A *quantile interval* is an interval $I'\subset(0,1)$ of positive length. For such $I'$ put $q'=|I'|$, $r'=\hat\xi(I')$, and
$$\mathcal E(I')=\int_{I'}\!\int_{I'}\log|T_0(u)-T_0(w)|\,dw\,d\hat\xi(u).$$
Write $r_i=\hat\xi(I_i)$ for the target blocks (so $q_i=|I_i|$).

### 8.1 Structure of the reference

#### Lemma 8.1 (monotone densities; the quantile–angle dictionary)
Assume (H1), (H2). Then:
1. $\alpha$ is strictly increasing on $[0,\pi]$, $\alpha\ge0$, and $\alpha>0$ on $(0,\pi]$. Also $\frac1\pi\int_0^\pi\alpha=1$, and
$$a_\pi:=\alpha(\pi)=k+1-\tfrac k2\sqrt{2a}=1+\frac{2k\rho_0}{1+\rho_0}\ \ge1,\qquad\rho_0:=\frac{c-\sqrt{2a}}\ell\in(0,1).$$
2. $B$ is strictly increasing on $[0,\pi]$, with $B(0)=0$ and $B>0$ on $(0,\pi]$. Moreover
$$b_\pi:=B(\pi)=\sum_\pm\frac{4\sigma_\pm\rho_\pm}{1-\rho_\pm^2},\qquad R_\xi=\frac1\pi\int_0^\pi B=\sum_\pm\frac{2\sigma_\pm\rho_\pm}{1-\rho_\pm},\qquad0<R_\xi<b_\pi .$$
3. $\Phi:=F_0\circ d:[0,\pi]\to[0,1]$ is a strictly increasing homeomorphism, with
$$\Phi(\theta)=\frac1\pi\Big[(k+1)\theta-2k\arctan\Big(\sqrt{2/a}\,\tan\tfrac\theta2\Big)\Big].$$
   Hence $T_0=d\circ\Phi^{-1}$ is continuous and strictly increasing. Every quantile interval $I'$ with endpoints $u'<u''$ (closed, open or half-open) corresponds to the angular interval $J$ with endpoints $\Phi^{-1}(u')<\Phi^{-1}(u'')$, and
$$q'=|I'|=\tfrac1\pi\int_J\alpha,\qquad r'=\hat\xi(I')=\tfrac1\pi\int_JB,\qquad\mathcal E(I')=\frac1{\pi^2}\int_J\!\int_JB(\theta)\alpha(\theta')\log|d(\theta)-d(\theta')|\,d\theta'\,d\theta .$$
4. $\hat\xi$ is atomless. For every quantile interval $I'$ we have $q'>0$ and $r'>0$.
5. Put $Q=\int_J\alpha/a_\pi$ and $R=\int_JB/b_\pi$ (Wang's (5.1); the normalized masses). Then $0<Q\le|J|\le\pi$ and $0<R\le|J|\le\pi$. Moreover $Q\le Q_{\max}:=\pi/a_\pi\le\pi$ and $R\le R_{\max}:=\pi R_\xi/b_\pi<\pi$.

*Proof.*
1. $d(\theta)$ is strictly increasing on $[0,\pi]$ and $k>0$, so $\alpha$ is strictly increasing. Its minimum is $\alpha(0)=k+1-k\sqrt{2/a}$, which is $\ge0$ iff (H1) holds. Hence $\alpha>0$ on $(0,\pi]$.
   - Total mass (Lemma 8.2(c) below): $\frac1\pi\int_0^\pi\frac{\sqrt{2a}}{d(\theta)}d\theta=1$, so $\frac1\pi\int\alpha=(k+1)-k=1$.
   - $\alpha\le a_\pi$ and $\alpha$ has mean $1$, so $a_\pi\ge1$. This also follows from $\sqrt{2a}/2\le1$.
   - The $\rho_0$ form: $c-\sqrt{2a}=(\sqrt2-\sqrt a)^2/2$ and $\ell+c-\sqrt{2a}=2-\sqrt{2a}=\sqrt2(\sqrt2-\sqrt a)$. So $\frac{2k\rho_0}{1+\rho_0}=\frac{2k(c-\sqrt{2a})}{2-\sqrt{2a}}=k\big(1-\sqrt{a/2}\big)$.
   - $\rho_0\in(0,1)$ because $0<c-\sqrt{2a}<\ell$. The second inequality is $a+2-2\sqrt{2a}<2-a$, i.e. $a<\sqrt{2a}$, i.e. $a<2$. (This $\rho_0$ equals $\frac{\sqrt2-\sqrt a}{\sqrt2+\sqrt a}$ of §§6–7.)
2. For $\rho\in(0,1)$, the denominator $1-2\rho\cos\theta+\rho^2$ is strictly increasing on $[0,\pi]$, so $P_\rho$ is strictly decreasing. Since $\sigma_\pm>0$ (H2), $B$ is strictly increasing, and $B(0)=0$ by the definition of $D_\xi$.
   - $b_\pi=\sum\sigma_\pm\big(P_{\rho_\pm}(0)-P_{\rho_\pm}(\pi)\big)$, with $P_\rho(0)-P_\rho(\pi)=\frac{1+\rho}{1-\rho}-\frac{1-\rho}{1+\rho}=\frac{4\rho}{1-\rho^2}$.
   - $\frac1\pi\int_0^\pi P_\rho=1$, since $P_\rho=1+2\sum_n\rho^n\cos n\theta$. Hence $R_\xi=D_\xi-\sum\sigma_\pm=\sum\sigma_\pm\frac{2\rho_\pm}{1-\rho_\pm}$.
   - Termwise, $\frac{2\rho/(1-\rho)}{4\rho/(1-\rho^2)}=\frac{1+\rho}2<1$. So $R_\xi<b_\pi$.
3. Put $\Phi(\theta)=\frac1\pi\int_0^\theta\alpha$. It is strictly increasing because $\alpha>0$ a.e., and $\Phi(\pi)=1$.
   - The closed form follows from $\int_0^\theta\frac{d\phi}{c-\ell\cos\phi}=\frac2{\sqrt{c^2-\ell^2}}\arctan\big(\sqrt{\tfrac{c+\ell}{c-\ell}}\tan\tfrac\theta2\big)$ with $c^2-\ell^2=2a$, $c+\ell=2$ and $c-\ell=a$.
   - $F_0(d(\theta))=\eta([a,d(\theta)])=\Phi(\theta)$. So $T_0(u)=d(\Phi^{-1}(u))$.
   - The change of variables $w=\Phi(\theta')$ gives $dw=\alpha(\theta')d\theta'/\pi$.
   - By definition of the pushforward, $\int\varphi\,d\hat\xi=\int_I\varphi(F_0)\,d\xi=\frac1\pi\int_0^\pi\varphi(\Phi(\theta))B(\theta)\,d\theta$.
   - Combining these gives the three formulas. Consequently, the image of a quantile interval is always an angular interval; a "non-interval image" cannot occur.
4. $\hat\xi$ has the bounded density $B$ in the angle, so it is atomless. $q'>0$ and $r'>0$ because $\alpha,B>0$ on $(0,\pi]$ and $J$ has positive length.
5. $0\le\alpha/a_\pi\le1$ and $0\le B/b_\pi\le1$ by monotonicity, so $Q,R\le|J|\le\pi$.
   - For $J=[0,\pi]$: $Q=\pi\cdot\frac1\pi\int\alpha/a_\pi=\pi/a_\pi$ and $R=\pi R_\xi/b_\pi$.
   - Monotonicity in $J$ gives $Q\le Q_{\max}$ and $R\le R_{\max}$.
   - $R_{\max}<\pi$ by item 2. $\square$

In particular, $Q\le\pi$ and $R\le\pi$ hold for *every* angular interval, because $\alpha/a_\pi$ and $B/b_\pi$ are bounded by $1$; this uses (H1) ($\alpha\ge0$) and $\sigma_\pm>0$ from (H2).

#### Lemma 8.2 (chord identity; platform identity)
- (a) For $\theta,\theta'\in[0,\pi]$,
$$|d(\theta)-d(\theta')|=H\,|e^{i\theta}-e^{i\theta'}|\,|e^{i\theta}-e^{-i\theta'}|,\qquad H=\ell/2 .$$
  Equivalently, $\log|d(\theta)-d(\theta')|=\log H+K(\theta-\theta')+K(\theta+\theta')$ with $K(t)=\log|e^{it}-1|=\log|2\sin(t/2)|$.
- (b) $\int_{-\pi}^{\pi}K(t)\,dt=0$. For $0\le\rho<1$, $\frac1{2\pi}\int_{-\pi}^{\pi}K(\theta-\theta')P_\rho(\theta')\,d\theta'=\log|1-\rho e^{i\theta}|$.
- (c) $\frac{\sqrt{2a}}{d(\theta')}=P_{\rho_0}(\theta')$.
- (d) *(Platform identity, Wang's (4.6).)* For every $d\in I$: $k\log d+\int_I\log|d-e|\,d\eta(e)=C(k,a)$. Equivalently, for every $u\in(0,1)$: $k\log T_0(u)+\int_0^1\log|T_0(u)-T_0(w)|\,dw=C$.

*Proof.*
- (a) $\cos\theta-\cos\theta'=-2\sin\frac{\theta+\theta'}2\sin\frac{\theta-\theta'}2$. Also $|e^{i\theta}-e^{\pm i\theta'}|=2|\sin\frac{\theta\mp\theta'}2|$. Hence $|d(\theta)-d(\theta')|=2\ell|\sin\frac{\theta+\theta'}2||\sin\frac{\theta-\theta'}2|=\frac\ell2\cdot4|\cdots||\cdots|$. So $H=\ell/2$ (Wang's $H=r/2$).
- (b) $K(t)=-\sum_{n\ge1}\frac{\cos nt}n$ in $L^2(-\pi,\pi)$. This is the boundary value of $\operatorname{Re}\log(1-z)=-\operatorname{Re}\sum z^n/n$, and the series of squared coefficients $\sum n^{-2}$ converges.
  - The constant Fourier coefficient is $0$.
  - Convolution with $P_\rho=1+2\sum\rho^n\cos n\theta'$ (bounded, hence acting continuously on $L^2$) multiplies the $n$-th coefficient by $\rho^n$. That gives $-\sum\rho^n\cos(n\theta)/n=\log|1-\rho e^{i\theta}|$.
- (c) $\rho_0$ is the root in $(0,1)$ of $\rho+\rho^{-1}=2c/\ell$. Hence $1-2\rho_0\cos\theta'+\rho_0^2=\frac{2\rho_0}\ell d(\theta')$ and $P_{\rho_0}=\frac{\ell(1-\rho_0^2)}{2\rho_0d}$.
  - Also $(\rho_0^{-1}-\rho_0)^2=(2c/\ell)^2-4=4(c^2-\ell^2)/\ell^2$, so $\frac{\ell(1-\rho_0^2)}{2\rho_0}=\sqrt{c^2-\ell^2}=\sqrt{2a}$.
- (d) Put $d=d(\theta)$. By (a) and evenness of $K$,
$$\int_0^\pi\log|d(\theta)-d(\theta')|\,m(\theta')\frac{d\theta'}\pi=\log H\cdot\frac1\pi\int_0^\pi m+\frac1\pi\int_{-\pi}^{\pi}K(\theta-\theta')m(|\theta'|)\,d\theta'$$
  for even bounded $m$.
  - With $m\equiv1$ (equilibrium $e_I$), (b) gives $\log H$.
  - With $m=P_{\rho_0}$ (balayage $\omega_{0,I}$, by (c)), (b) gives $\log H+2\log|1-\rho_0e^{i\theta}|=\log H+\log\frac{2\rho_0d}\ell$.
  - $\frac{2\rho_0}\ell=\frac1{D_0(a)}$, since $\frac\ell{2\rho_0}=\frac{\ell^2}{2(c-\sqrt{2a})}=\frac{(2-a)^2}{4(\sqrt2-\sqrt a)^2}=\frac{(\sqrt2+\sqrt a)^2}4=D_0(a)$.
  - Hence, with $\eta=(k+1)e_I-k\,\omega_{0,I}$:
$$k\log d+(k+1)\log H-k(\log H+\log d-\log D_0)=\log H+k\log D_0=C .$$
  - The identity holds for every $\theta\in[0,\pi]$. The quantile form follows from Lemma 8.1(3). $\square$

(This proof of the platform identity is self-contained and independent of Proposition 6.3(4), which it reproduces.)

#### Lemma 8.3 (absolute convergence)
- $\int_J\int_J\alpha(\theta')B(\theta)\,|\log|d(\theta)-d(\theta')||\,d\theta'\,d\theta<\infty$ for every $J\subset[0,\pi]$.
- Hence $\mathcal E(I')$ is finite and Fubini/Tonelli apply.
- Also $\int_{I_i}|\log|T_0(u)-T_0(w)||\,dw<\infty$ for every $u\in(0,1)$.

*Proof.* $\alpha,B$ are bounded. By Lemma 8.2(a), $|\log|d(\theta)-d(\theta')||\le|\log H|+|K(\theta-\theta')|+|K(\theta+\theta')|$. Each term is integrable on $[0,\pi]^2$, since $K\in L^1$ of the circle and is $2\pi$-periodic. The last claim is the same bound in one variable (via $w=\Phi(\theta')$). $\square$

### 8.2 The supporting inequality in quantile form, and block reduction

#### Theorem 8.4 (endpoint-corrected supporting inequality, quantile form)
Assume (H1), (H2). Let $T$ be the quantile of an atomized target as in §8.0. For $u\in(0,1)\setminus\{u_0,\dots,u_N\}$, $u\in I_i$, define
$$g(u)=k\,\frac{d_i-T_0(u)}{T_0(u)}+\int_0^1\frac{[T(u)-T(w)]-[T_0(u)-T_0(w)]}{T_0(u)-T_0(w)}\,dw.\tag{8.1}$$
Then $g\in L^1(\hat\xi)$ and
$$M_k(T)\ \ge\ M_k(T_0)+\int_{(0,1)}g\,d\hat\xi\qquad\Big(=M_0+\int_Ig(F_0(d))\,d\xi(d)\Big).\tag{8.2}$$

*Proof.* By Lemma 6.7 (via Lemma 3.2), $T$ is separated or in contact with the component of $d_1$, so §7 applies. With $v=T-T_0$, $d=T_0(u)$ and $e=T_0(w)$,
$$\frac{[T(u)-T(w)]-[T_0(u)-T_0(w)]}{T_0(u)-T_0(w)}=\frac{v(d)-v(e)}{d-e},$$
and $T_0$ pushes Lebesgue measure on $(0,1)$ to $\eta$ (Lemma 7.2(ii)). So (8.1) at $u$ equals (7.2) at $d=T_0(u)$. Theorem 7.1(i),(iii) gives $g\circ F_0\in L^1(\xi)$ and $M_k(T)\ge M_k(T_0)+\int_I g(F_0(d))\,d\xi(d)$; since $\hat\xi=(F_0)_\#\xi$, this is (8.2). $\square$

*Remarks.*
- For $u$ interior to $I_i$ the integrand of (8.1) equals $-1$ for $w\in I_i$, $w\ne u$, because $T(u)=T(w)=d_i$. For $w\notin I_i$ the integrand is bounded, since $|T_0(u)-T_0(w)|\ge\operatorname{dist}(T_0(u),T_0(\partial I_i))>0$. So **(8.1) is an absolutely convergent Lebesgue integral**, and no principal value is needed at non-endpoint $u$.
- Wang's symmetric principal value in the reference coordinate coincides with (8.1) there. The block endpoints are $\hat\xi$-null (Lemma 8.1(4)).
- Near an interior block endpoint $u_i$, $g$ has at worst a logarithmic singularity (§7.5).

#### Lemma 8.5 (pointwise lower bound)
For $u$ in the interior of $I_i$,
$$g(u)\ \ge\ G_i(u):=-q_i\log R_i-C-q_i+\int_{I_i}\log|T_0(u)-T_0(w)|\,dw.\tag{8.3}$$

*Proof.* Fix such $u$. The tangent inequality is: for $x,y>0$, $\frac{y-x}x=\frac yx-1\ge\log\frac yx$, because $t-1\ge\log t$ for $t>0$.
1. *External field.* $T_0(u)\ge a\ge1>0$, $d_i\ge1>0$, and $k>0$. So $k\frac{d_i-T_0(u)}{T_0(u)}\ge k\log d_i-k\log T_0(u)$.
2. *Off-block, $w\in I_j$, $j\ne i$.*
   - Let $w<u$ (so $j<i$). Then $T(u)-T(w)=d_i-d_j>0$, since the $d$'s are distinct and increasing. Also $T_0(u)-T_0(w)>0$, since $T_0$ is strictly increasing.
   - Let $w>u$. Both differences are $<0$.
   - In either case, with $\epsilon=\pm1$ the common sign, $x=\epsilon(T_0(u)-T_0(w))=|T_0(u)-T_0(w)|>0$ and $y=\epsilon(d_i-d_j)=|d_i-d_j|>0$. The integrand in (8.1) equals $\frac{y-x}x\ge\log|d_i-d_j|-\log|T_0(u)-T_0(w)|$.
3. *Within block, $w\in I_i$, $w\ne u$.* The integrand is $\frac{0-(T_0(u)-T_0(w))}{T_0(u)-T_0(w)}=-1$. The within-block contribution is exactly $-q_i$; no inequality is used here.
4. *Integrate* over $w\in(0,1)$. All pieces are absolutely integrable at the fixed interior $u$: item 2 by boundedness, and the log term by Lemma 8.3. This gives
$$g(u)\ge\Big[k\log d_i+\sum_{j\ne i}q_j\log|d_i-d_j|\Big]-\Big[k\log T_0(u)+\int_{(0,1)\setminus I_i}\log|T_0(u)-T_0(w)|\,dw\Big]-q_i .$$
5. *The first bracket* is $-q_i\log R_i$, by the definition of $R_i$.
6. *The second bracket* is $C-\int_{I_i}\log|T_0(u)-T_0(w)|\,dw$, by the platform identity, Lemma 8.2(d), at the point $T_0(u)\in I$. $\square$

#### Proposition 8.6 (block reduction; Wang Prop. 4.4)
Assume (H1), (H2). Suppose every quantile interval $I'\subset(0,1)$ satisfies
$$\mathcal E(I')\ \ge\ q'r'\log\frac{q'r'}2+C_{\rm eff}\,r',\qquad q'=|I'|,\ r'=\hat\xi(I').\tag{8.4}$$
Then $\mathcal J_k\ge L$. If (8.4) is strict for every quantile interval, then $\mathcal J_k>L$.

*Proof.*
1. $\hat\xi\ge0$ (as $B\ge0$), $g\in L^1(\hat\xi)$ (Theorem 8.4) and $G_i\in L^1(\hat\xi|_{I_i})$ (Lemma 8.3). The finitely many endpoints $u_j$ are $\hat\xi$-null. So integrating (8.3) against $\hat\xi$ over each $I_i$ and summing is legitimate:
$$\int g\,d\hat\xi\ \ge\ \sum_i\Big[r_i\big(-q_i\log R_i-C-q_i\big)+\mathcal E(I_i)\Big].$$
2. By Theorem 8.4, $M_k=M_k(T)\ge M_0+\int g\,d\hat\xi$. Adding $2\sum R_i$:
$$\mathcal J_k\ \ge\ M_0+\sum_i\Xi_i(R_i),\qquad\Xi_i(y):=r_i(-q_i\log y-C-q_i)+\mathcal E(I_i)+2y\quad(y>0).$$
3. *Minimisation.* $r_i>0$ and $q_i>0$ (Lemma 8.1(4)). $\Xi_i$ is strictly convex on $(0,\infty)$, with $\Xi_i'(y)=2-q_ir_i/y$ and unique critical point $y^\ast=q_ir_i/2$. Hence for the actual (fixed) $R_i>0$,
$$\Xi_i(R_i)\ge\Xi_i(y^\ast)=-q_ir_i\log\frac{q_ir_i}2-Cr_i-q_ir_i+\mathcal E(I_i)+q_ir_i=\mathcal E(I_i)-q_ir_i\log\frac{q_ir_i}2-Cr_i .$$
   This is an inequality for the given $R_i$; no optimisation over targets is involved.
4. By (8.4) applied to $I'=I_i$, $\Xi_i(R_i)\ge(C_{\rm eff}-C)r_i$. Summing, with $\sum_ir_i=\hat\xi((0,1))=\xi(I)=R_\xi$ (endpoints null):
$$\mathcal J_k\ge M_0+(C_{\rm eff}-C)R_\xi=M_0+(L-M_0)=L .$$
   Strictness passes through step 4. $\square$

*Remark.* The sign of $C$ plays no role. Only $\hat\xi\ge0$, $q_i,r_i>0$ and the exact within-block value $-1$ are used. The $-q_i$ within-block term and the $+q_ir_i$ from the minimum cancel exactly.

### 8.3 Symmetric decreasing functions on the circle

Let $\mathbb T=\mathbb R/2\pi\mathbb Z$ carry Lebesgue measure; functions on $\mathbb T$ are identified with $2\pi$-periodic functions on $\mathbb R$.

**Definition.** A function $F$ on $\mathbb T$ is **symmetric decreasing** if it is even and nonincreasing in $|\theta|$ on $[0,\pi]$.

#### Lemma 8.7 (two elementary rearrangement facts on $\mathbb T$)
- (a) *(Convolution of symmetric decreasing functions.)* If $\Psi_a,\Psi_b\ge0$ on $\mathbb T$ are symmetric decreasing and $\Psi_a\ast\Psi_b$ is finite, then $\Psi_a\ast\Psi_b$ is symmetric decreasing (pointwise, at every point).
- (b) *(Bathtub.)* Let $\Psi$ be symmetric decreasing and integrable, and let $\varphi:\mathbb T\to[0,1]$ with $\int_{\mathbb T}\varphi=2Q$, $0<Q\le\pi$. Then $\int\varphi\Psi\le\int_{-Q}^{Q}\Psi$.

*Proof.*
- (a) By the layer-cake formula and Tonelli, $\Psi_a\ast\Psi_b=\int_0^\infty\!\!\int_0^\infty\mathbf 1_{\{\Psi_a>s\}}\ast\mathbf 1_{\{\Psi_b>t\}}\,ds\,dt$, pointwise. Each level set is, up to null sets (which do not affect convolutions), a centred arc $[-t_1,t_1]$ (respectively $[-t_2,t_2]$). So it suffices to treat $\psi(x)=|[-t_1,t_1]\cap(x+[-t_2,t_2])|$ with $0\le t_1,t_2\le\pi$.
  - $\psi$ is even and Lipschitz. For $x\in(0,\pi)$, $\psi'(x)=\mathbf 1_{[-t_1,t_1]}(x+t_2)-\mathbf 1_{[-t_1,t_1]}(x-t_2)$ a.e. (arcs on $\mathbb T$).
  - The circular distances satisfy $\operatorname{dist}(x+t_2,0)=\min(x+t_2,2\pi-x-t_2)\ge|x-t_2|=\operatorname{dist}(x-t_2,0)$. This uses $x\le\pi$ and $t_2\le\pi$.
  - Hence $\psi'\le0$ a.e. on $(0,\pi)$, and $\psi$ is nonincreasing in $|x|$.
- (b) Put $\tau=\Psi(Q)$; any value between the one-sided limits works. On $|\theta|<Q$: $1-\varphi\ge0$ and $\Psi-\tau\ge0$. On $|\theta|>Q$: $-\varphi\le0$ and $\Psi-\tau\le0$. So $\int(\mathbf 1_{[-Q,Q]}-\varphi)(\Psi-\tau)\ge0$. Since $\int(\mathbf 1_{[-Q,Q]}-\varphi)=0$, this is the claim.
  - $Q\le\pi$ is needed for $[-Q,Q]$ to be an arc of length $2Q$. In the application it is guaranteed by Lemma 8.1(5). $\square$

*Remark (an alternative proof of (a) by reflection).* This proof needs no layer cake and no sign condition, and it is the one formalised in Lean (Appendix D). Let $F,G$ be bounded, measurable, even, $2\pi$-periodic, and nonincreasing on $[0,\pi]$, and put $\Psi(x)=\int_{-\pi}^{\pi}F(x-u)G(u)\,du$.
- $\Psi$ is periodic, and it is even by $u\mapsto-u$.
- Let $0\le x\le y\le\pi$ and $m=(x+y)/2$. The integrand is $2\pi$-periodic in $u$, so we may integrate over $[m-\pi,m+\pi]$. Split at $m$ and substitute $u=2m-v$ on the right half; evenness gives $F(y-(2m-v))=F(x-v)$ and $F(x-(2m-v))=F(y-v)$. Hence
$$\Psi(x)-\Psi(y)=\int_{m-\pi}^{m}\big(G(v)-G(2m-v)\big)\big(F(x-v)-F(y-v)\big)\,dv .$$
- For $v\in[m-\pi,m]$ both factors are $\ge0$. The reason is that $v$ is circularly at least as close to $0$ as $2m-v$ is, and $x-v$ is at least as close to $0$ as $y-v$ is. Concretely, $|v|\le\min(2m-v,2\pi-2m+v)$ and $|x-v|\le\min(y-v,2\pi-y+v)$, with $x-v\in[-\pi,\pi]$ and $y-v,2m-v\in[0,2\pi]$. So $\Psi(x)\ge\Psi(y)$. $\square$

This is the continuous form of the two-point inequality (Lemma 8.11).

### 8.4 The circle rearrangement inequality (Theorem 8.8)

**What is needed.** The circle block inequality (Theorem 8.19) needs exactly one rearrangement fact: for $\varphi_1,\varphi_2:\mathbb T\to[0,1]$ with $\int\varphi_1=2Q$, $\int\varphi_2=2R$, $0<Q,R\le\pi$, and the kernel $\mathcal L(t)=-\log|\sin(t/2)|$,
$$\iint\varphi_1(\theta)\varphi_2(\theta')\mathcal L(\theta-\theta')\le\int_{-Q}^{Q}\!\int_{-R}^{R}\mathcal L(\theta-\theta').$$
In the literature this is obtained as "Riesz rearrangement inequality on the circle, then bathtub, then bathtub" (Appendix C). Its bounded-kernel form is statement (R) below, which subsumes all three steps; rearrangements of general functions are not needed, and monotone convergence is applied once, to (R) itself (Theorem 8.19, step 3). The following self-contained proof (`proof.md` Stage 12b) replaced the earlier citation; its review status is recorded in `math-red.md` (Math RED Review 10: pass with minor fixes M-130–M-138).

#### Theorem 8.8 (circle rearrangement inequality with centred-arc extremals)
Let $\bar\kappa\ge0$ and let $\kappa:\mathbb T\to[0,\bar\kappa]$ be symmetric decreasing. Let $\varphi_1,\varphi_2:\mathbb T\to[0,1]$ be measurable, with $\int_{\mathbb T}\varphi_1=2Q$ and $\int_{\mathbb T}\varphi_2=2R$. (Automatically $0\le Q,R\le\pi$.) Then
$$I_\kappa(\varphi_1,\varphi_2):=\int_{\mathbb T}\!\int_{\mathbb T}\varphi_1(\theta)\,\kappa(\theta-\theta')\,\varphi_2(\theta')\,d\theta\,d\theta'\ \le\ V_\kappa(Q,R):=\int_{-Q}^{Q}\!\int_{-R}^{R}\kappa(\theta-\theta')\,d\theta'\,d\theta.\tag{R}$$

*Remarks.*
- $\kappa$ is Borel, because it is monotone in $|\theta|$ on $[0,\pi]$.
- Nonnegativity of $\kappa$ is inessential: if $\kappa$ is bounded and symmetric decreasing, apply (R) to $\kappa+c\ge0$; both sides change by $4QRc$.
- For $Q=0$, $\varphi_1=0$ a.e. and both sides vanish; the same holds for $R=0$. So assume $Q,R>0$ where convenient.

**Proof architecture.**
- A discrete cyclic Riesz inequality on $\mathbb Z_n$, by two-point rearrangements (Lemmas 8.9–8.12, Theorem 8.13).
- An exact transfer to step functions on $n$ equal cells (Lemma 8.14).
- A symmetric step function within $L^1$-distance $\delta_n=2\pi/n$ of the discrete extremal (Lemma 8.15); for it, the bathtub steps of Lemma 8.7 give $V_\kappa(Q,R)$ exactly (Lemma 8.16).
- Cell averages $\mathbb E_n\varphi\to\varphi$ in $L^1$ with the same masses, and $n\to\infty$ (Lemma 8.17).

Masses need not be multiples of $2\pi/n$: cell averages preserve the masses exactly, and the comparison with arcs of the exact masses $2Q,2R$ is done in the continuum, by the bathtub principle.

#### Discrete notation
- $n\ge1$; $\mathbb Z_n=\mathbb Z/n\mathbb Z$, and $|z|_n=\min(z\bmod n,\;n-z\bmod n)\in\{0,\dots,\lfloor n/2\rfloor\}$.
- A **symmetric decreasing kernel** on $\mathbb Z_n$ is $\gamma:\mathbb Z_n\to\mathbb R$ of the form $\gamma_z=\bar\gamma(|z|_n)$ with $\bar\gamma$ nonincreasing on $\{0,\dots,\lfloor n/2\rfloor\}$. No sign condition is imposed.
- For $\mathbf a,\mathbf b\in\mathbb R^{\mathbb Z_n}$ put $S_\gamma(\mathbf a,\mathbf b)=\sum_{i,j\in\mathbb Z_n}a_i\,b_j\,\gamma_{i-j}$.
- **Canonical positions.** $p(1)=0$, $p(2k)=k$, $p(2k+1)=-k$ (mod $n$), for $1\le j\le n$. This lists $\mathbb Z_n$ once each, in order of nondecreasing $|\cdot|_n$: $|p(j)|_n=\lfloor j/2\rfloor$. For even $n$, the last position is $p(n)=n/2$.
- **Canonical arrangement.** If $v_1\ge v_2\ge\dots\ge v_n$ are the entries of $\mathbf a$ in nonincreasing order (with multiplicity), then $\mathbf a^\#$ is defined by $a^\#_{p(j)}=v_j$.

#### Lemma 8.9 (reflections of the discrete circle)
Let $m\in\mathbb Z$. On $\mathbb T_n=\mathbb R/n\mathbb Z$ let $\|x\|=\min_{k\in\mathbb Z}|x-kn|$, and let $\iota(x)=m-x$. Put
$$U_+=\{\tfrac m2+s:0<s<n/2\},\qquad U_-=\{\tfrac m2-s:0<s<n/2\}.$$
1. $\mathbb T_n=U_+\sqcup U_-\sqcup\{\frac m2,\frac m2+\frac n2\}$. The map $\iota$ fixes $\frac m2$ and $\frac m2+\frac n2$, swaps $U_+$ and $U_-$, and satisfies $\|\iota x-\iota y\|=\|x-y\|$.
2. If $x,y\in U_+$, or $x,y\in U_-$, then $\|x-y\|<\|x-\iota y\|$.
3. The fixed points of $\iota$ in $\mathbb Z_n$ are exactly $\mathbb Z_n\cap\{\frac m2,\frac m2+\frac n2\}$.

*Proof.*
1. Each $x\in\mathbb T_n$ is uniquely $\frac m2+s$ with $s\in(-n/2,n/2]$. Then $\iota(\frac m2+s)=\frac m2-s$. Also $\|(m-x)-(m-y)\|=\|y-x\|=\|x-y\|$.
2. Let $x=\frac m2+s$ and $y=\frac m2+t$ with $s,t\in(0,n/2)$.
   - $x-y=s-t\in(-n/2,n/2)$, so $\|x-y\|=|s-t|$.
   - $x-\iota y=s+t\in(0,n)$, so $\|x-\iota y\|=\min(s+t,\,n-s-t)$.
   - $|s-t|<s+t$ because $\min(s,t)>0$.
   - $|s-t|<n-s-t$ is equivalent to $2\max(s,t)<n$, which holds.
   - For $x,y\in U_-$: $\iota x,\iota y\in U_+$. By item 1, $\|x-y\|=\|\iota x-\iota y\|<\|\iota x-y\|=\|x-\iota y\|$.
3. $\iota x=x$ iff $2x\equiv m\pmod n$ iff $x=\frac m2+s$ with $2s\equiv0\pmod n$ and $s\in(-n/2,n/2]$, i.e. $s\in\{0,n/2\}$. $\square$

**Half-sets.** For $m\in\mathbb Z_n$ write $\iota_m(z)=m-z$ and $\operatorname{Fix}_m$ for its fixed-point set.
- If $m\not\equiv0$: then $0\notin\{\frac m2,\frac m2+\frac n2\}$, since otherwise $2\cdot0\equiv m$. So $0$ lies in exactly one of $U_\pm$; call it $U$, and put $\Omega_m=\mathbb Z_n\cap U$. Equivalently, $\Omega_m=\{z\in\mathbb Z_n:|z|_n<|z-m|_n\}$; this description does not depend on the representative of $m$. (By Corollary 8.10 below, $z\in\Omega_m$ gives $|z|_n<|z-m|_n$; $z\in\iota_m(\Omega_m)$ gives the reverse strict inequality, and $z\in\operatorname{Fix}_m$ gives equality.)
- If $m\equiv0$: put $\Omega_0=\mathbb Z_n\cap U_+=\{z:0<z<n/2\}$.
- By Lemma 8.9, $\mathbb Z_n=\Omega_m\sqcup\iota_m(\Omega_m)\sqcup\operatorname{Fix}_m$.

#### Corollary 8.10
If $m\not\equiv0$ and $z\in\Omega_m$, then $|z|_n<|\iota_mz|_n$.

*Proof.* $z,0\in U$, so Lemma 8.9(2) gives $|z|_n=\|z-0\|<\|z-\iota_m0\|=\|z-m\|=|\iota_mz|_n$. $\square$

**Polarization.** For $\mathbf a\in\mathbb R^{\mathbb Z_n}$ define $\operatorname{Pol}_m\mathbf a$ by:
- $(\operatorname{Pol}_m\mathbf a)_z=\max(a_z,a_{\iota_mz})$ for $z\in\Omega_m$;
- $(\operatorname{Pol}_m\mathbf a)_z=\min(a_z,a_{\iota_mz})$ for $z\in\iota_m(\Omega_m)$;
- $(\operatorname{Pol}_m\mathbf a)_z=a_z$ for $z\in\operatorname{Fix}_m$.

$\operatorname{Pol}_m\mathbf a$ is a permutation of $\mathbf a$: swap $a_z$ and $a_{\iota_mz}$ whenever $z\in\Omega_m$ and $a_z<a_{\iota_mz}$.

#### Lemma 8.11 (two-point inequality)
For every $m$, all $\mathbf a,\mathbf b\in\mathbb R^{\mathbb Z_n}$ and every symmetric decreasing kernel $\gamma$:
$$S_\gamma(\operatorname{Pol}_m\mathbf a,\operatorname{Pol}_m\mathbf b)\ge S_\gamma(\mathbf a,\mathbf b).$$

*Proof.* Write $\iota=\iota_m$, $\Omega=\Omega_m$, $F=\operatorname{Fix}_m$. Since $\iota$ is an isometry of $|\cdot|_n$ (Lemma 8.9(1)), $\gamma_{\iota i-\iota j}=\gamma_{i-j}$ and $\gamma_{\iota i-j}=\gamma_{i-\iota j}$. Split the sum over $(i,j)$ as follows.
- **$i,j\in F$.** These terms do not change.
- **$i\in F$, $j\in\{y,\iota y\}$ with $y\in\Omega$.** Here $\gamma_{i-\iota y}=\gamma_{\iota i-\iota y}=\gamma_{i-y}$. So the terms equal $a_i\gamma_{i-y}(b_y+b_{\iota y})$. Polarization changes neither $a_i$ nor $b_y+b_{\iota y}$.
- **$i\in\{x,\iota x\}$ with $x\in\Omega$, $j\in F$.** Symmetric to the previous case.
- **$i\in\{x,\iota x\}$, $j\in\{y,\iota y\}$ with $x,y\in\Omega$.** Every ordered pair of non-fixed points occurs in exactly one such group. With $\gamma'=\gamma_{x-y}$ and $\gamma''=\gamma_{x-\iota y}$, the group equals
$$\gamma'(a_xb_y+a_{\iota x}b_{\iota y})+\gamma''(a_xb_{\iota y}+a_{\iota x}b_y)=(\gamma'-\gamma'')(a_xb_y+a_{\iota x}b_{\iota y})+\gamma''(a_x+a_{\iota x})(b_y+b_{\iota y}).$$
  - The last term does not change.
  - By Lemma 8.9(2), $|x-y|_n<|x-\iota y|_n$, so $\gamma'\ge\gamma''$.
  - For reals $u\ge u'$ and $w\ge w'$: $uw+u'w'-(uw'+u'w)=(u-u')(w-w')\ge0$. Hence $a_xb_y+a_{\iota x}b_{\iota y}\le\max\cdot\max+\min\cdot\min$, and the right side is the value after polarization. $\square$

#### Lemma 8.12 (states fixed by all polarizations with $m\ne0$)
Suppose $\operatorname{Pol}_m\mathbf a=\mathbf a$ for every $m\not\equiv0$. Then $a_x\ge a_y$ whenever $|x|_n<|y|_n$.

*Proof.* Put $m=x+y$.
- $m\not\equiv0$, since otherwise $y=-x$ and $|y|_n=|x|_n$.
- $\iota_mx=y\ne x$, so $x\notin\operatorname{Fix}_m$.
- If $x\in\iota_m(\Omega_m)$, then $y\in\Omega_m$, and Corollary 8.10 gives $|y|_n<|\iota_my|_n=|x|_n$, a contradiction.
- So $x\in\Omega_m$, and $a_x=(\operatorname{Pol}_m\mathbf a)_x=\max(a_x,a_y)\ge a_y$. $\square$

#### Theorem 8.13 (discrete cyclic Riesz inequality)
For all $\mathbf a,\mathbf b\in\mathbb R^{\mathbb Z_n}$ and every symmetric decreasing kernel $\gamma$ on $\mathbb Z_n$:
$$S_\gamma(\mathbf a,\mathbf b)\le S_\gamma(\mathbf a^\#,\mathbf b^\#).$$

*Proof.*
- *Potential.* Put $\operatorname{Pot}(\mathbf a)=-\sum_z|z|_n\,a_z$. For $m\not\equiv0$, polarization moves the larger of $a_z,a_{\iota_mz}$ to $z\in\Omega_m$, and $|z|_n<|\iota_mz|_n$ (Corollary 8.10). Hence
$$\operatorname{Pot}(\operatorname{Pol}_m\mathbf a)-\operatorname{Pot}(\mathbf a)=\sum_{z\in\Omega_m}\big(|\iota_mz|_n-|z|_n\big)\big((\operatorname{Pol}_m\mathbf a)_z-a_z\big)\ \ge0,$$
  with equality iff $\operatorname{Pol}_m\mathbf a=\mathbf a$.
- *Algorithm.* While some $m\not\equiv0$ has $(\operatorname{Pol}_m\mathbf a,\operatorname{Pol}_m\mathbf b)\ne(\mathbf a,\mathbf b)$, replace $(\mathbf a,\mathbf b)$ by $(\operatorname{Pol}_m\mathbf a,\operatorname{Pol}_m\mathbf b)$.
  - Each replacement strictly increases $\operatorname{Pot}(\mathbf a)+\operatorname{Pot}(\mathbf b)$.
  - $(\mathbf a,\mathbf b)$ stays in the finite set of pairs of permutations of the original vectors.
  - So no pair repeats, and the algorithm stops after finitely many steps.
  - By Lemma 8.11, $S_\gamma$ never decreases.
- *Terminal state.* At termination, Lemma 8.12 applies to both $\mathbf a$ and $\mathbf b$: they are *radially nonincreasing*, i.e. the minimum over the level $\{|z|_n=k\}$ is $\ge$ the maximum over the level $\{|z|_n=k'\}$ for $k<k'$.
- *Final step.* Apply $\operatorname{Pol}_0$ once, again not decreasing $S_\gamma$ (Lemma 8.11).
  - $\operatorname{Pol}_0$ permutes entries only within the pairs $\{z,-z\}$ with $0<z<n/2$. So it preserves radial monotonicity.
  - After it, $a_z\ge a_{-z}$ for $0<z<n/2$.
  - Hence $a_{p(1)}\ge a_{p(2)}\ge\dots\ge a_{p(n)}$, i.e. $a_0\ge a_1\ge a_{-1}\ge a_2\ge a_{-2}\ge\cdots$.
  - A permutation of the original $\mathbf a$ that is nonincreasing along $p$ is $\mathbf a^\#$. The same holds for $\mathbf b$. $\square$

*Remarks.*
- (i) The **same** orientation $p$ must be used for $\mathbf a$ and $\mathbf b$. With $\mathbf b$ mirrored ($z\mapsto-z$) the value can be strictly smaller. The final $\operatorname{Pol}_0$ step is what fixes a common orientation.
- (ii) $S_\gamma$ is linear in $\gamma$. The symmetric decreasing kernels form the cone generated by the rays $\mathbf 1_{\{|z|_n\le r\}}$ ($0\le r\le\lfloor n/2\rfloor$) and the constants $\pm1$, on which $S_\gamma(\mathbf a,\mathbf b)=(\sum a)(\sum b)$ is invariant. (This is what makes the exhaustive 0/1 test T5 of Appendix A.5 complete for those vectors.)

#### Cells
Fix $n\ge2$ and the mesh $\delta_n=2\pi/n\le\pi$. The cells are $\Delta_i=[i\delta_n-\delta_n/2,\,i\delta_n+\delta_n/2)$ (mod $2\pi$), $i\in\mathbb Z_n$. They partition $\mathbb T$. For $\mathbf a\in[0,1]^{\mathbb Z_n}$ write $\mathrm{st}(\mathbf a)=\sum_ia_i\mathbf 1_{\Delta_i}$. The bilinear form $I_\kappa(\psi_1,\psi_2)=\iint\psi_1(\theta)\kappa(\theta-\theta')\psi_2(\theta')$ satisfies $|I_\kappa(\psi_1,\psi_2)|\le\bar\kappa\|\psi_1\|_1\|\psi_2\|_1$.

#### Lemma 8.14 (cell kernel)
Let $\kappa$ be as in Theorem 8.8. Put $\gamma^{(n)}_z=\int_{\Delta_z}\int_{\Delta_0}\kappa(\theta-\theta')\,d\theta'\,d\theta$. Then:
- $\int_{\Delta_i}\int_{\Delta_j}\kappa(\theta-\theta')\,d\theta'\,d\theta=\gamma^{(n)}_{i-j}$, so $I_\kappa(\mathrm{st}(\mathbf a),\mathrm{st}(\mathbf b))=S_{\gamma^{(n)}}(\mathbf a,\mathbf b)$;
- $\gamma^{(n)}$ is a symmetric decreasing kernel on $\mathbb Z_n$.

*Proof.*
- Translating $\theta\mapsto\theta+i\delta_n$ and $\theta'\mapsto\theta'+j\delta_n$ changes $\theta-\theta'$ by $(i-j)\delta_n$. So the double integral depends only on $i-j$ mod $n$.
- Substitute $t=\theta-\theta'$ over $[-\delta_n/2,\delta_n/2]^2$. Then
$$\gamma^{(n)}_z=\int_{-\delta_n}^{\delta_n}\kappa(z\delta_n+t)(\delta_n-|t|)\,dt=(\kappa\ast\tau)(z\delta_n),$$
  where $\tau$ is the $2\pi$-periodic function equal to $(\delta_n-|t|)_+$ on $[-\pi,\pi]$. This uses $\delta_n\le\pi$ and the evenness of $\tau$.
- $\tau\ge0$ is even and nonincreasing in $|t|$ on $[0,\pi]$, and so is $\kappa$. By Lemma 8.7(a), $\Psi=\kappa\ast\tau$ is even and nonincreasing in $|x|$ on $[0,\pi]$, pointwise (its layer-cake proof is pointwise in $x$).
- $z\delta_n$ has circular distance $|z|_n\delta_n\in[0,\pi]$ from $0$. So $\gamma^{(n)}_z=\Psi(|z|_n\delta_n)$, which is nonincreasing in $|z|_n$. $\square$

#### Lemma 8.15 (canonical arrangement vs. symmetric step function)
Let $\mathbf a\in[0,1]^{\mathbb Z_n}$ with sorted entries $v_1\ge\dots\ge v_n$. Put $\varphi^\#=\mathrm{st}(\mathbf a^\#)$. Let $\varphi^\star$ be the even function with $\varphi^\star(\theta)=v_j$ for $|\theta|\in[(j-1)\delta_n/2,\,j\delta_n/2)$, $1\le j\le n$, and $\varphi^\star(\pi)=v_n$. Then:
- $\varphi^\star$ is symmetric decreasing, with values in $[0,1]$;
- $\int\varphi^\star=\delta_n\sum_ia_i=\int\mathrm{st}(\mathbf a)$;
- $\|\varphi^\#-\varphi^\star\|_1\le\delta_n\,(v_2-v_n)\le\delta_n$.

*Proof.* The first two items are immediate: each $v_j$ occupies measure $2\cdot\delta_n/2$. For the third, compare cell by cell; the descriptions below hold up to null sets.
- **$\Delta_0$.** It equals $\{|\theta|<\delta_n/2\}$, and both functions are $v_1$ there.
- **$\Delta_k$ and $\Delta_{-k}$, $1\le k<n/2$.** These lie in $\{k\delta_n-\delta_n/2\le|\theta|\le k\delta_n+\delta_n/2\}\subset[0,\pi]$.
  - $\varphi^\#=v_{2k}$ on $\Delta_k$ and $\varphi^\#=v_{2k+1}$ on $\Delta_{-k}$.
  - $\varphi^\star=v_{2k}$ for $|\theta|\in[k\delta_n-\delta_n/2,k\delta_n)$ and $\varphi^\star=v_{2k+1}$ for $|\theta|\in[k\delta_n,k\delta_n+\delta_n/2)$.
  - So they differ only on $\Delta_k\cap\{\theta\ge k\delta_n\}$ and $\Delta_{-k}\cap\{|\theta|<k\delta_n\}$. Each has length $\delta_n/2$, and the difference there is $v_{2k}-v_{2k+1}$.
- **$\Delta_{n/2}$ ($n$ even).** It equals $\{|\theta|\ge\pi-\delta_n/2\}$, and both functions are $v_n$ there.

Summing, $\|\varphi^\#-\varphi^\star\|_1=\delta_n\sum_{1\le k<n/2}(v_{2k}-v_{2k+1})\le\delta_n\sum_{j=2}^{n-1}(v_j-v_{j+1})=\delta_n(v_2-v_n)$. $\square$

#### Lemma 8.16 (bathtub bound for symmetric decreasing densities)
Let $\varphi_1,\varphi_2:\mathbb T\to[0,1]$ be symmetric decreasing, with $\int\varphi_1=2Q$ and $\int\varphi_2=2R$. Then $I_\kappa(\varphi_1,\varphi_2)\le V_\kappa(Q,R)$.

*Proof.* Assume $Q,R>0$, else the claim is trivial.
1. $\Psi_1=\kappa\ast\varphi_2$ is bounded and symmetric decreasing (Lemma 8.7(a)). Since $0\le\varphi_1\le1$ and $Q\le\pi$, Lemma 8.7(b) gives
$$I_\kappa(\varphi_1,\varphi_2)=\int\varphi_1\,\Psi_1\le\int\mathbf 1_{[-Q,Q]}\Psi_1 .$$
2. By Fubini and the evenness of $\kappa$, $\int\mathbf 1_{[-Q,Q]}\Psi_1=\int\varphi_2\,\Psi_2$ with $\Psi_2=\kappa\ast\mathbf 1_{[-Q,Q]}$. Here $\mathbf 1_{[-Q,Q]}$ is symmetric decreasing because $Q\le\pi$, so $\Psi_2$ is symmetric decreasing (Lemma 8.7(a)).
3. Lemma 8.7(b) with $R\le\pi$ gives $\int\varphi_2\,\Psi_2\le\int_{-R}^{R}\Psi_2=V_\kappa(Q,R)$. $\square$

(Only step 1 uses the symmetry of $\varphi_2$; the symmetry of $\varphi_1$ is not needed.)

#### Lemma 8.17 (cell averages)
For $\psi\in L^1(\mathbb T)$ put $\mathbb E_n\psi=\sum_i\big(\frac1{\delta_n}\int_{\Delta_i}\psi\big)\mathbf 1_{\Delta_i}$. Then:
- $\|\mathbb E_n\psi\|_1\le\|\psi\|_1$ and $\int\mathbb E_n\psi=\int\psi$;
- if $0\le\psi\le1$, then $0\le\mathbb E_n\psi\le1$;
- $\|\mathbb E_n\psi-\psi\|_1\to0$ as $n\to\infty$.

*Proof.* The first two items are immediate. For the third:
- For continuous $\chi$ with modulus of continuity $\omega_\chi$: every cell has diameter $\delta_n$, so $|\mathbb E_n\chi-\chi|\le\omega_\chi(\delta_n)$ pointwise.
- Given $\varepsilon>0$, choose continuous $\chi$ with $\|\psi-\chi\|_1<\varepsilon$ (density of $C(\mathbb T)$ in $L^1(\mathbb T)$).
- Then $\|\mathbb E_n\psi-\psi\|_1\le\|\mathbb E_n(\psi-\chi)\|_1+\|\mathbb E_n\chi-\chi\|_1+\|\chi-\psi\|_1\le2\varepsilon+2\pi\,\omega_\chi(2\pi/n)$. $\square$

#### Proof of Theorem 8.8
Fix $n\ge2$ and put $\varphi_{1,n}=\mathbb E_n\varphi_1=\mathrm{st}(\mathbf a)$ and $\varphi_{2,n}=\mathbb E_n\varphi_2=\mathrm{st}(\mathbf b)$.
- By Lemma 8.17, $\mathbf a,\mathbf b\in[0,1]^{\mathbb Z_n}$, $\int\varphi_{1,n}=2Q$ and $\int\varphi_{2,n}=2R$.
- By Lemma 8.14 and Theorem 8.13 (with $\gamma=\gamma^{(n)}$),
$$I_\kappa(\varphi_{1,n},\varphi_{2,n})=S_{\gamma^{(n)}}(\mathbf a,\mathbf b)\le S_{\gamma^{(n)}}(\mathbf a^\#,\mathbf b^\#)=I_\kappa(\varphi_1^\#,\varphi_2^\#),$$
  where $\varphi_1^\#=\mathrm{st}(\mathbf a^\#)$ and $\varphi_2^\#=\mathrm{st}(\mathbf b^\#)$.
- Let $\varphi_1^\star,\varphi_2^\star$ be the symmetric step functions of Lemma 8.15. They have values in $[0,1]$, are symmetric decreasing, and have masses exactly $2Q,2R$. By bilinearity, Lemma 8.15 and Lemma 8.16,
$$I_\kappa(\varphi_1^\#,\varphi_2^\#)\le I_\kappa(\varphi_1^\star,\varphi_2^\star)+\bar\kappa\big(\|\varphi_1^\#-\varphi_1^\star\|_1\|\varphi_2^\#\|_1+\|\varphi_1^\star\|_1\|\varphi_2^\#-\varphi_2^\star\|_1\big)\le V_\kappa(Q,R)+2\bar\kappa\,\delta_n(Q+R).$$
- Finally,
$$|I_\kappa(\varphi_1,\varphi_2)-I_\kappa(\varphi_{1,n},\varphi_{2,n})|\le\bar\kappa\big(\|\varphi_1-\varphi_{1,n}\|_1\cdot2R+2Q\cdot\|\varphi_2-\varphi_{2,n}\|_1\big)\to0$$
  by Lemma 8.17.
- Letting $n\to\infty$ in $I_\kappa(\varphi_1,\varphi_2)\le I_\kappa(\varphi_{1,n},\varphi_{2,n})+o(1)\le V_\kappa(Q,R)+2\bar\kappa\,\delta_n(Q+R)+o(1)$ gives (R). $\square$

*Remarks.*
- (a) No general theory of rearrangements is needed: $\varphi^\star$ is written down explicitly for step functions.
- (b) Wrap-around, arcs longer than $\pi$, kernels whose superlevel arcs have any length in $[0,2\pi]$, and masses that are not multiples of $\delta_n$ are all covered. The discrete theorem is on the cycle itself; masses are preserved exactly by $\mathbb E_n$; the arc comparison happens in the continuum with the exact $Q,R\le\pi$.
- (c) The only places where $Q,R\le\pi$ matter are Lemma 8.16 (via Lemma 8.7(b)) and the symmetric decreasing property of $\mathbf 1_{[-Q,Q]}$. Both are automatic from $0\le\varphi_1,\varphi_2\le1$.
- (d) `proof.md` remarks that the same method also yields the general symmetric-kernel Riesz inequality $I_\kappa(\varphi_1,\varphi_2)\le I_\kappa(\varphi_1^\ast,\varphi_2^\ast)$ (symmetric decreasing rearrangements) for bounded $\varphi_1,\varphi_2\ge0$, using the $L^1$-contractivity of rearrangement. That statement is **not** proved here, is not used anywhere, and must not be cited (M-137).

### 8.5 Arc energy and the circle block inequality

#### Lemma 8.18 (arc energy and $h$)
For $0<Q,R\le\pi$ put $\mathcal A(Q,R)=\frac1{4QR}\int_{-Q}^{Q}\int_{-R}^{R}K(\theta-\theta')\,d\theta'\,d\theta$, $x_n(X)=\frac{\sin nX}{nX}$, and $h(X)=\mathcal A(X,X)-\log(X/\pi)$. Then:
- (a) $\mathcal A(Q,R)=-\sum_{n\ge1}\frac{\sin(nQ)\sin(nR)}{n^3QR}$, absolutely convergent.
- (b) $2\mathcal A(Q,R)-\mathcal A(Q,Q)-\mathcal A(R,R)=\sum_{n\ge1}\frac{(x_n(Q)-x_n(R))^2}n\ge0$.
- (c) $\mathcal A(Q,Q)=2\int_0^1(1-x)\log(2\sin Qx)\,dx$, and $h(Q)=\log(2\pi)-\frac32+2\int_0^1(1-x)\log\frac{\sin Qx}{Qx}\,dx$.
- (d) $h$ is strictly decreasing on $(0,\pi]$, $h(\pi)=0$, and $h(0^+)=\log(2\pi)-\frac32\approx0.33788$. Hence $h\ge0$ on $(0,\pi]$.
- (e) For $n_0\ge1$: $-\frac1{2n_0^2Q^2}\le\mathcal A(Q,Q)+\sum_{n=1}^{n_0}\frac{\sin^2nQ}{n^3Q^2}\le0$. This is Wang's (7.11) with $n_0=80$.

*Proof.*
- (a) For $0<\lambda<1$, $K_\lambda(t)=\log|1-\lambda e^{it}|=-\sum_n\lambda^n\cos(nt)/n$, absolutely and uniformly convergent.
  - $\int_{-Q}^{Q}\int_{-R}^{R}\cos n(\theta-\theta')=\frac{4\sin nQ\sin nR}{n^2}$, since the sine–sine part vanishes by oddness. Termwise integration gives $\frac1{4QR}\iint K_\lambda=-\sum_n\lambda^n\frac{\sin nQ\sin nR}{n^3QR}$.
  - As $\lambda\uparrow1$, the right side converges (dominated by $\sum n^{-3}$).
  - On the left, $K_\lambda\to K$ pointwise off $t\in2\pi\mathbb Z$. Domination: $\log|1-\lambda e^{it}|\le\log2$. Also $|1-\lambda e^{it}|^2=(\lambda-\cos t)^2+\sin^2t$, which is $\ge\sin^2t$, and $\ge1$ when $\cos t\le0$. So $|K_\lambda(t)|\le\log2+|\log|\sin t||$, which is integrable.
- (b) Termwise, $\frac{\sin nQ\sin nR}{n^3QR}=\frac{x_n(Q)x_n(R)}n$. So the left side is $\sum_n\frac1n\big(x_n(Q)^2+x_n(R)^2-2x_n(Q)x_n(R)\big)$.
- (c) The difference $t=\theta-\theta'$ of two independent uniform points of $[-Q,Q]$ has density $\frac{2Q-|t|}{4Q^2}$ on $[-2Q,2Q]$. $K$ is even, and $K(t)=\log(2\sin(t/2))$ for $0<t<2\pi$. Substituting $t=2Qx$ gives the first formula.
  - For the second, use $\int_0^1(1-x)\,dx=\frac12$ and $\int_0^1(1-x)\log x\,dx=-\frac34$ in $\log(2\sin Qx)=\log2+\log Q+\log x+\log\frac{\sin Qx}{Qx}$.
- (d) $p(t)=\sin t-t\cos t$ has $p(0)=0$ and $p'(t)=t\sin t>0$ on $(0,\pi)$. So $\operatorname{sinc}$ is strictly decreasing and positive on $(0,\pi)$.
  - For fixed $x\in(0,1)$, $Q\mapsto\log\operatorname{sinc}(Qx)$ is strictly decreasing on $(0,\pi]$. Also $(1-x)\log\operatorname{sinc}(Qx)$ is integrable, including at $Q=\pi$, $x\to1$, where it is $\sim(1-x)\log(1-x)$. Hence $h$ is strictly decreasing.
  - $\mathcal A(\pi,\pi)=0$ by (a), so $h(\pi)=0-\log1=0$.
- (e) The tail $\sum_{n>n_0}\frac{\sin^2nQ}{n^3Q^2}\in\big[0,\frac1{Q^2}\sum_{n>n_0}n^{-3}\big]$, and $\sum_{n>n_0}n^{-3}<\int_{n_0}^\infty x^{-3}dx=\frac1{2n_0^2}$. $\square$

#### Theorem 8.19 (circle block inequality; Wang Thm. 5.1)
Assume (H1), (H2). Let $I'\subset(0,1)$ be a quantile interval with angular image $J$, masses $q'=|I'|$, $r'=\hat\xi(I')$, and normalized masses $Q,R$ (Lemma 8.1). Then
$$\frac{\mathcal E(I')}{q'r'}-\log\frac{q'r'}2-\frac{C_{\rm eff}}{q'}\ \ge\ \log\frac{2H}{a_\pi b_\pi}+h(Q)+h(R)+\sum_{n\ge1}\frac{(x_n(Q)-x_n(R))^2}n-\frac{\pi C_{\rm eff}}{a_\pi Q}.\tag{8.5}$$
Consequently, if the right side of (8.5) is $\ge0$ (respectively $>0$) for all $(Q,R)\in(0,Q_{\max}]\times(0,R_{\max}]$, then (8.4) holds (respectively strictly) for every quantile interval $I'$.

*Proof.*
1. *Physical to normalized masses.* By Lemma 8.1, $q'=a_\pi Q/\pi$ and $r'=b_\pi R/\pi$.
2. *Unfolding.* On $[-\pi,\pi]$, extended $2\pi$-periodically, put $\varphi_1(\theta)=\mathbf 1_J(|\theta|)\alpha(|\theta|)/a_\pi$ and $\varphi_2(\theta)=\mathbf 1_J(|\theta|)B(|\theta|)/b_\pi$. These are measurable with $0\le\varphi_1,\varphi_2\le1$ (Lemma 8.1(1),(2): $0\le\alpha\le a_\pi$ and $0\le B\le b_\pi$). Also $\int_{\mathbb T}\varphi_1=2Q$ and $\int_{\mathbb T}\varphi_2=2R$.
   - Split each variable into its positive and negative halves. For $t_1,t_2\in J$ the four sign pairs give $K(t_1-t_2)$ twice and $K(t_1+t_2)$ twice, by evenness of $K$. With Lemma 8.2(a) and Lemma 8.3 (Fubini), and the symmetry of $\log|d(\theta)-d(\theta')|$ in $(\theta,\theta')$,
$$\iint_{\mathbb T^2}\varphi_1(\theta)\varphi_2(\theta')K(\theta-\theta')=\frac2{a_\pi b_\pi}\int_J\!\int_JB(\theta)\alpha(\theta')\log\frac{|d(\theta)-d(\theta')|}H\,d\theta'\,d\theta.\tag{8.6}$$
   - With Lemma 8.1(3), this gives
$$\frac{\mathcal E(I')}{q'r'}=\log H+\frac1{2QR}\iint_{\mathbb T^2}\varphi_1\varphi_2\,K.\tag{8.7}$$
   - This is Wang's (5.3), in the equivalent form: (8.6) divided by $2QR$. The factors: $\pi^2\mathcal E=\iint B\alpha\log|\cdot|$, $q'r'\pi^2=a_\pi b_\pi QR$, and $\iint B\alpha\log H=\pi^2q'r'\log H$.
3. *Rearrangement.* Put $\mathcal L=\log2-K=-\log|\sin(t/2)|$ on $[-\pi,\pi]$, periodically extended. It is $\ge0$, even, nonincreasing in $|t|$ on $(0,\pi]$, and integrable. For $N\in\mathbb N$ (a truncation level, not the number of atoms), $\mathcal L_N=\min(\mathcal L,N)$ (with $\mathcal L_N(0)=N$) takes values in $[0,N]$ and is symmetric decreasing.
   - Apply Theorem 8.8 with $\kappa=\mathcal L_N=\min(\mathcal L,N)$, $\bar\kappa=N$, and the $\varphi_1,\varphi_2$ of step 2 (values in $[0,1]$, masses $2Q,2R$): $\iint\varphi_1(\theta)\varphi_2(\theta')\mathcal L_N(\theta-\theta')\le\int_{-Q}^{Q}\int_{-R}^{R}\mathcal L_N(\theta-\theta')$.
   - Then let $N\to\infty$: both integrands are $\ge0$ and increase to the corresponding $\mathcal L$-integrands off the null diagonal $\theta=\theta'$. Monotone convergence gives $\iint\varphi_1\varphi_2\,\mathcal L\le\int_{-Q}^{Q}\int_{-R}^{R}\mathcal L(\theta-\theta')<\infty$.
   - Since $\iint\varphi_1\varphi_2\cdot\log2=4QR\log2$ depends only on the masses, $\iint\varphi_1\varphi_2K\ge\int_{-Q}^{Q}\int_{-R}^{R}K=4QR\,\mathcal A(Q,R)$.
4. By (8.7), $\frac{\mathcal E(I')}{q'r'}\ge\log H+2\mathcal A(Q,R)$.
5. By Lemma 8.18(b) and the definition of $h$, $2\mathcal A(Q,R)=\log\frac Q\pi+h(Q)+\log\frac R\pi+h(R)+\Sigma(Q,R)$, where $\Sigma(Q,R)=\sum_n(x_n(Q)-x_n(R))^2/n$.
6. With $\log\frac{q'r'}2=\log\frac{a_\pi b_\pi QR}{2\pi^2}$, the $\log\frac{QR}{\pi^2}$ terms cancel and leave $\log H-\log\frac{a_\pi b_\pi}2=\log\frac{2H}{a_\pi b_\pi}$.
7. Finally $\frac{C_{\rm eff}}{q'}=\frac{\pi C_{\rm eff}}{a_\pi Q}$. This proves (8.5).
8. *Consequence.* The left side of (8.5) is $\frac1{q'r'}\big[\mathcal E-q'r'\log\frac{q'r'}2-C_{\rm eff}r'\big]$ with $q'r'>0$. The pair $(Q,R)$ of any quantile interval lies in $(0,Q_{\max}]\times(0,R_{\max}]$ (Lemma 8.1(5)). $\square$

*Remarks.*
- (i) $h$ appears only at $Q,R\in(0,\pi]$, where $h\ge0$ (Lemma 8.18(d)). The fact $h\ge0$ is not itself used in (8.5); it is used only in the terminal-range certificate (§9).
- (ii) The coupling between $Q$ and $R$ (both come from the same $J$) is discarded. The rectangle is a superset, which is conservative.
- (iii) Wang's text applies the circle Riesz (Baernstein) inequality "first to $\min(\mathcal L,N)$ and then by monotone convergence". Step 3 has the same structure, with Theorem 8.8 in place of the cited theorem.
- (iv) The monotonicity of $\alpha$ and $B$ is used exactly once, to get $0\le\varphi_1,\varphi_2\le1$. Without the cap $\varphi_1\le1$, $\varphi_1$ could exceed $1$ and Theorem 8.8 would not apply.

#### Corollary 8.20 (scalar reduction for $C_{\rm eff}\le0$; Wang (7.9)–(7.11))
Assume (H1), (H2) and $C_{\rm eff}\le0$. Put
$$\Upsilon=\log\frac{2H}{a_\pi b_\pi}+h(Q_{\max})+h(R_{\max}),\qquad\varpi=-\frac{\pi C_{\rm eff}}{a_\pi}\ge0 .$$
Then for all $(Q,R)\in(0,Q_{\max}]\times(0,R_{\max}]$ the right side of (8.5) is
$$\ge\ \mathcal S(Q,R):=\Upsilon+\frac\varpi Q+(\operatorname{sinc}Q-\operatorname{sinc}R)^2,$$
and
$$\inf_{\text{rectangle}}\mathcal S\ \ge\ \min\Big\{\ \Upsilon+\frac\varpi{\min(Q_{\max},R_{\max})}\ ,\ \min_{1\le m\le m_1}\Big[\Upsilon+\frac\varpi{Q^{(m)}}+\big(\operatorname{sinc}R_{\max}-\operatorname{sinc}Q^{(m-1)}\big)^2\Big]\Big\},$$
where $R_{\max}=Q^{(0)}<Q^{(1)}<\dots<Q^{(m_1)}=Q_{\max}$ is any partition. The second term is present only if $R_{\max}<Q_{\max}$.

*Proof.*
1. $h$ is decreasing on $(0,\pi]$ and $Q\le Q_{\max}\le\pi$, $R\le R_{\max}\le\pi$ (Lemma 8.1(5)). So $h(Q)+h(R)\ge h(Q_{\max})+h(R_{\max})$.
2. All terms of $\Sigma$ are $\ge0$. Keep only $n=1$, where $x_1=\operatorname{sinc}$. Also $-\pi C_{\rm eff}/(a_\pi Q)=\varpi/Q$. This proves the first claim.
3. *Case $Q\le\min(Q_{\max},R_{\max})$.* $\mathcal S\ge\Upsilon+\varpi/Q\ge\Upsilon+\varpi/\min(Q_{\max},R_{\max})$, since $\varpi\ge0$.
4. *Case $Q\in[Q^{(m-1)},Q^{(m)}]\subset[R_{\max},Q_{\max}]$.*
   - $R\le R_{\max}\le Q^{(m-1)}\le Q\le\pi$. Since $\operatorname{sinc}$ is decreasing on $(0,\pi]$: $\operatorname{sinc}R\ge\operatorname{sinc}R_{\max}\ge\operatorname{sinc}Q^{(m-1)}\ge\operatorname{sinc}Q$.
   - Hence $(\operatorname{sinc}R-\operatorname{sinc}Q)^2\ge(\operatorname{sinc}R_{\max}-\operatorname{sinc}Q^{(m-1)})^2$ and $\varpi/Q\ge\varpi/Q^{(m)}$. $\square$

*Remarks.*
- The partition bound needs only evaluations of $\operatorname{sinc}$ at partition points and converges to $\min_{[R_{\max},Q_{\max}]}\mathcal S(\cdot,R_{\max})$ as the mesh tends to $0$, whether or not $Q\mapsto\mathcal S(Q,R_{\max})$ is monotone. It is **not** monotone in general (Appendix B, item 12), so "evaluate at $Q_{\max}$" must not be used without a derivative certificate; the certificates of §9 use the partition bound.
- For $h(Q_{\max})$ and $h(R_{\max})$, Lemma 8.18(e) gives rigorous two-sided bounds from a finite sum. A checker must use the *lower* bound $h(X)\ge-\sum_{n\le n_0}\frac{\sin^2nX}{n^3X^2}-\frac1{2n_0^2X^2}-\log\frac X\pi$ with outward rounding.

---

## 9. The parameter cover and the certificates

This section chooses, for every $k>29/20$, a reference $\eta_{k,a}$ and a target constant $L\ge D$, and certifies the hypotheses (H1), (H2), $C_{\rm eff}\le0$ and the strict positivity of the scalar lower bound of Corollary 8.20.

### Lemma 9.1 (exterior formulas for the reference $\eta_{k,a}$ in the variable $v$)
Let $1\le a<2$ and $k\ge1$ with $\eta_{k,a}\ge0$. In the shifted normalized coordinates of Definition 3.5, put:
- $s=\sqrt{a/2}$, $\rho_0=\frac{\sqrt2-\sqrt a}{\sqrt2+\sqrt a}$, $D_0=\frac{(\sqrt2+\sqrt a)^2}4$, $H=\frac{2-a}4$, $c=\frac{a+2}2$, $A=\frac k{k+1}$ (this is the main mass fraction of Lemma 3.4, since $k=A/(1-A)$);
- $C=\log H+k\log D_0$ (the platform constant, Proposition 6.3(4)).

For $x<a$ write $x=c-H(u+u^{-1})$ with $u>1$ (Joukowski variable; $u=1/\rho_x$ in the notation of Lemma 7.2, and $x=0\leftrightarrow u=1/\rho_0$), and put $v=\rho_0u$. Then:
- (i) $H=\rho_0D_0$, and $x=c-D_0v-H\rho_0/v$.
- (ii) For $x<a$, $x\ne0$ (i.e. $v>\rho_0$, $v\ne1$): $W_0(x)=k\log|x|+\int\log|x-d|\,d\eta_{k,a}(d)=-(k+1)\,\mathfrak E(v)$, where
$$\mathfrak E(v)=A\log\frac{v-\rho_0^2}{|1-v|}-\log v-\log D_0 .$$
  At $x=0$ we have $W_0(0)=-\infty$. Also $\mathfrak E(v)\to-C/(k+1)$ as $v\downarrow\rho_0$ (i.e. $x\uparrow a$).
- (iii) For the same $x$: $W_0'(x)=\dfrac{(k+1)\mathfrak E'(v)}{D_0(1-\rho_0^2/v^2)}$, with $\mathfrak E'(v)=A\big(\frac1{v-\rho_0^2}+\frac1{1-v}\big)-\frac1v$.
- (iv) **Assume in addition** $A<s$ and that $\mathfrak E(v_0)<0$ for some $v_0\in(\rho_0,1)$ (equivalently, $W_0(x_0)>0$ for some $x_0\in(0,a)$). Then:
  - $\mathfrak E$ has a unique root $v_+$ in $(v_0,1)$. It lies on the increasing branch, and $\mathfrak E'(v_+)>0$.
  - $\mathfrak E$ has a unique root $v_-$ in $(1,\infty)$, and $\mathfrak E'(v_-)<0$.
  - The component of $\{W_0<0\}$ containing $0$ is $(x_-,x_+)$ with $x_\pm=x(v_\pm)$. In particular $x_-<0<x_+<a$, and both crossings are simple ($W_0'(x_\pm)\ne0$).
  - Moreover $\rho_\pm=1/u_\pm=\rho_0/v_\pm$ and $K_\pm=H(u_\pm-u_\pm^{-1})$.
  - The extra hypothesis holds automatically when $A<s$ and $C\ge0$ (in particular for the terminal family, where $C=0$). For the rows R1, R2 it is certified per slab (Certificate 9.2).

*Remark (the extra hypothesis in (iv) is needed).* Positivity $\eta_{k,a}\ge0$, even with $A<s$, does not imply it. Take $k=2$, $a=1$. Then $A=2/3<s=1/\sqrt2$ and (6.3) holds strictly. Since $\eta_{2,1}$ is a probability measure on $[1,2]$, for $0<x<1$ we get $W_0(x)\le2\log x+\log(2-x)=\log\big(x^2(2-x)\big)<0$. Also $C=\log\frac14+2\log\frac{3+2\sqrt2}4=\log\frac{17+12\sqrt2}{64}<0$. So $W_0<0$ on all of $(0,a]$: there is no crossing in $(0,a)$, and the conclusion of (iv) fails.

*Proof.*
- (i) $2-a=(\sqrt2-\sqrt a)(\sqrt2+\sqrt a)$.
- (ii) Proposition 6.3(6) (with $e^{\tau_x}=u$, $\rho_x=1/u$) gives $W_0(x)=k\log|x|+\log(Hu)-2k\log(1-\rho_0/u)$. The same computation as Lemma 5.1(iii), with the atom at $0$ in place of $-1$, gives $|x|=H\frac{(u-\rho_0)|1-\rho_0u|}{\rho_0u}$.
  - Substituting, $W_0=C+(k+1)\log u-k\log\frac{u-\rho_0}{|1-\rho_0u|}$.
  - Put $u=v/\rho_0$ and use $\frac C{k+1}=(1-A)\log\rho_0+\log D_0$ (from (i)).
- (iii) is the chain rule with $dx/dv=-D_0(1-\rho_0^2/v^2)$.
- The limit in (ii): as $v\downarrow\rho_0$, $\frac{v-\rho_0^2}{1-v}\to\rho_0$, so $\mathfrak E\to(A-1)\log\rho_0-\log D_0=-C/(k+1)$ by the identity above.
- (iv) This is the shape analysis of Lemma 5.2(iv) with $q\to\rho_0$, for either sign of $C$. Note that $\eta_{k,a}\ge0$ is equivalent to $A\le s$, and that $s=\frac{1-\rho_0}{1+\rho_0}$.
  - The map $v\mapsto x(v)$ is strictly decreasing on $(\rho_0,\infty)$ ($dx/dv<0$), with $x(\rho_0)=a$ and $x(1)=0$. By (ii), $W_0<0\iff\mathfrak E>0$ for $v\ne1$.
  - *On $(\rho_0,1)$.* Here $v(v-\rho_0^2)(1-v)>0$ and $\mathfrak E'\,v(v-\rho_0^2)(1-v)=P(v):=v^2-(1+\rho_0^2-A(1-\rho_0^2))v+\rho_0^2$.
    - $P(\rho_0)=\rho_0(1-\rho_0)\big[A(1+\rho_0)-(1-\rho_0)\big]<0$, because $A<s$. Also $P(1)=A(1-\rho_0^2)>0$.
    - So $P$ has exactly one root $v^\ast$ in $(\rho_0,1)$. Hence $\mathfrak E$ is strictly decreasing on $(\rho_0,v^\ast]$ and strictly increasing on $[v^\ast,1)$, with $\mathfrak E\to+\infty$ as $v\uparrow1$.
    - We have $\mathfrak E(v^\ast)\le\mathfrak E(v_0)<0$. So $\mathfrak E$ has exactly one root $v_+$ in $(v^\ast,1)$, and $\mathfrak E'(v_+)>0$.
    - Also $\mathfrak E<0$ on $[\min(v_0,v^\ast),v_+)$. So $v_+$ is the only root in $(v_0,1)$, and $\mathfrak E>0$ on $(v_+,1)$ while $\mathfrak E<0$ just below $v_+$.
  - *On $(1,\infty)$.* Here $\mathfrak E'=A\big(\frac1{v-\rho_0^2}-\frac1{v-1}\big)-\frac1v<0$. Also $\mathfrak E\to+\infty$ as $v\downarrow1$ and $\mathfrak E\to-\infty$ as $v\to\infty$. So there is a single root $v_-$, $\mathfrak E'(v_-)<0$, and $\mathfrak E>0$ exactly on $(1,v_-)$.
  - *In the variable $x$.* $W_0<0$ on $(x_-,0)\cup(0,x_+)$, and $W_0(0)=-\infty$. Also $W_0(x_\pm)=0$, and $W_0>0$ just outside $[x_-,x_+]$ on both sides. So the component containing $0$ is $(x_-,x_+)$. Simplicity follows from (iii), since $\mathfrak E'(v_\pm)\ne0$.
  - *The case $C\ge0$.* Then $\mathfrak E(\rho_0^+)=-C/(k+1)\le0$ and $\mathfrak E$ is strictly decreasing just to the right of $\rho_0$. So $\mathfrak E(v_0)<0$ for $v_0$ slightly above $\rho_0$. $\square$

The quantities entering Corollary 8.20 are then:
- $\sigma_+=1/W_0'(x_+)$ and $\sigma_-=-1/W_0'(x_-)$;
- $a_\pi=1+\frac{2k\rho_0}{1+\rho_0}$, $b_\pi=\sum_\pm\frac{4\sigma_\pm\rho_\pm}{1-\rho_\pm^2}$, $R_\xi=\xi(I)=\sum_\pm\frac{2\sigma_\pm\rho_\pm}{1-\rho_\pm}$ (Lemmas 7.10 and 8.1);
- $Q_{\max}=\pi/a_\pi$, $R_{\max}=\pi R_\xi/b_\pi$, $M_0=x_+-x_-$, and $C_{\rm eff}=C+(L-M_0)/R_\xi$.

**The terminal family.** For $q\in(0,q_s)$ take $\rho_0=q$, i.e. $a=2s^2$ with $s=\frac{1-q}{1+q}$, and $k$ with $A=k/(k+1)=A(q)$ (Definition 5.3). Then $H=\frac{2q}{(1+q)^2}$ and $D_0=\frac2{(1+q)^2}=H/q$, and:
- *$C=0$ exactly.* By (i), $\frac C{k+1}=(1-A)\log q+\log\frac Hq=\log H-A\log q=0$, since $A=\log H/\log q$.
- *$\eta_{k,a}$ is the normalized residual of $\mu_{A(q)}$.* The arcsine measure $\omega$ and the balayage $\omega_{-1}$ of Lemma 5.1, shifted by $+1$, are $e_I$ and $\omega_{0,I}$ (their densities agree, since $2s=\sqrt{2a}$ and $a^\circ+1=a$), so $\mu_{A(q)}=A\delta_{-1}+(1-A)\,\eta_{k,a}(\cdot+1)$ with $k=A/(1-A)$.
- *$M_0=\Lambda(q)\ge D$.* In the shifted variable $W_0=V_{\mu_{A(q)}}(\cdot-1)/(1-A)$, and $E_{\mu_{A(q)}}$ is a single interval (Lemma 5.2(v) with $C(A)=0$), so the main width of $W_0$ is $|E_{\mu_{A(q)}}|=\Lambda(q)\ge D$.

### Certificate 9.2 (the cover)
Let $L_{\rm hi}=1.8344304757628$. By Certificate 5.5, $L_{\rm hi}>\Lambda(\hat q)\ge D$.

| range of $k$ | reference | target $L$ | checker (`cert2/`) | certified |
|---|---|---|---|---|
| $[36/25,21/10]$ ($a\in[1.781,1.946]$) | R1: $a=1153/500-k/4$ | $L_{\rm hi}$ | `cover_mv.py chunk R1 i 7 96`, $i=0..6$ | 7/7 CHUNK PASS, 96 slabs each, 0 splits |
| $[21/10,21/5]$ ($a=1.8$) | R2: $a=9/5$ | $L_{\rm hi}$ | `cover_mv.py chunk R2 i 7 96`, $i=0..6$ | 7/7 CHUNK PASS, 96 slabs each, 0 splits |
| $[k(21/500),\infty)$ | terminal family, $q\in(0,21/500]$, $C=0$ | $D$ | `terminal_check.py 32` | PASS, 36 $\varsigma$-slabs, certified margin $\ge0.03381$ |

- **Overlaps and coverage.** $36/25<29/20$. The side checks certify $k(21/500)\in[4.18951734,4.18951735]<21/5$ and $\mathfrak f(21/500)>0$; since $\mathfrak f$ is decreasing, $q<q_s$ and $A(q)<s(q)$ on the whole terminal range. Here $k(q)=A(q)/(1-A(q))=\tau/d_q-1$ with $\tau=\log(1/q)$ and $d_q=\log\frac2{(1+q)^2}$. The map $q\mapsto k(q)$ is continuous on $(0,21/500]$ with $k(q)\to\infty$ as $q\to0$; by the intermediate value theorem the terminal range covers every $k\ge k(21/500)$. (It is in fact strictly decreasing, $k'(q)=-\mathfrak f(q)/(q(1+q)d_q^2)$ — Wang's formula, re-derived — but only continuity and the limit are needed.)
- **Domains of §§6–8.** Every row has $k\ge1$ and $1\le a<2$: R1 has $a\in[1.781,1.946]$, R2 has $a=1.8$, and the terminal family has $a=2((1-q)/(1+q))^2\in[1.69,2)$.
- **Checked per slab (affine rows R1, R2).**
  - $A<s$ (so $\eta_{k,a}\ge0$ strictly, (H1)).
  - Certified root boxes for $v_\pm$ with $\mathfrak E'$ sign-definite: simple crossings, the correct branches, $\sigma_\pm>0$, and $x_-<0<x_+<a$ — hypothesis (H2). The left end $p$ of the box for $v_+$ satisfies $\rho_0<p<1$ and $\mathfrak E(p)<0$, with $\mathfrak E$ evaluated using interval parameters for the whole slab. So the extra hypothesis of Lemma 9.1(iv) (with $v_0=p$) holds for every $k$ in the slab.
  - $Q_{\max}\le\pi$ and $R_{\max}<Q_{\max}$.
  - $C_{\rm eff}<0$.
  - The scalar inequality of Corollary 8.20, strictly: its $Q\le R_{\max}$ part uses $\Upsilon+\varpi/R_{\max}$; its $Q\in[R_{\max},Q_{\max}]$ part uses the partition bound on $\Upsilon+\varpi/Q+(\operatorname{sinc}Q-\operatorname{sinc}R_{\max})^2$, which does not assume monotonicity in $Q$. The $h$-values use the rigorous lower bound of Lemma 8.18(e).
  - Enclosures are mean-value slabs: every quantity $X(k)$ is enclosed on a $k$-slab $\mathcal K$ as $X(k_m)+X'(\mathcal K)(\mathcal K-k_m)$, with $X'(\mathcal K)$ from interval forward-mode automatic differentiation (`iad.py`) and $v_\pm'(k)=-\mathfrak E_k/\mathfrak E_v$ enclosed on a certified root box for the whole slab (implicit function theorem, $\mathfrak E_v\ne0$ there). The edge $a(k)=\alpha_a+\beta_ak$ (R1: $\alpha_a=1153/500$, $\beta_a=-1/4$; R2: $\alpha_a=9/5$, $\beta_a=0$) is taken from one exact source for both its interval value and its AD derivative.
- **Checked per slab (terminal row).**
  - *Checked in the code:* the root boxes with $\mathfrak E'$ sign-definite (simple crossings, correct branches), $x_-<0<x_+<a$, $\sigma_\pm\ge0$, and $\log\frac{2H}{a_\pi b_\pi}+h(Q_{\max})+h(R_{\max})>0$.
  - *Analytic, not checked per slab:* $A<s$ (from $\mathfrak f$ decreasing and $\mathfrak f(21/500)>0$); $\sigma_\pm>0$ strictly (from $\mathfrak E'\ne0$); $Q_{\max}\le\pi$ ($a_\pi\ge1$); $R_{\max}<\pi$ (Lemma 8.1(5)); and $C_{\rm eff}\le0$ ($C=0$ and $M_0=\Lambda(q)\ge D$, so $C_{\rm eff}=(D-\Lambda(q))/R_\xi\le0$). $R_{\max}<Q_{\max}$ is not needed there. This suffices because $\varpi\ge0$ and $h$ is decreasing and $\ge0$ on $(0,\pi]$, so $\mathcal S(Q,R)\ge\Upsilon>0$.
  - *Parametrisation.* The terminal parametrisation $\varsigma=1/\log(1/q)\in[0,\varsigma_2]$, $\varsigma_2=1/\log(500/21)\le0.315449$, keeps every quantity finite as $q\to0$: $1/(k+1)=d_q\varsigma$; $kq=\tau e^{-\tau}/d_q-q$ with $\tau=1/\varsigma$ and $\tau e^{-\tau}$ decreasing for $\tau\ge1$; and the factor $1/\varsigma$ in $2H/(a_\pi b_\pi)$ is bounded below by $1/\varsigma_{\rm hi}$ on each slab.
- **Printed margins.** The "min margin" printed per chunk is the smallest certified lower bound over the leaves; it is not a tight minimum. Re-run of 2026-09-29 with outward-rounded printing (lower bounds rounded down): R1 chunks $\ge0.00093,0.03644,0.01587,0.00011,0.05468,0.01787,0.00032$; R2 chunks $\ge0.03238,0.17853,0.17487,0.17494,0.18434,0.20996,0.25044$; terminal $\ge0.03381$. (The earlier printout rounded to nearest and showed some of these values $10^{-5}$ too high, e.g. $0.00033$ for R1 chunk 6.) The floating-point minima are about $0.075$ (R1) and $0.28$ (R2). Every certified bound checked by the reviewer was below the corresponding float minimum.
- **Tight spots** (Review 9): at $k=4.2$ the scalar inequality would fail for $L$ above about $1.83608$; the admissible $a$-window at $k=1.44$ is narrow; the terminal scalar bound vanishes near $q\approx0.04526$, which is why the terminal range stops at $21/500=0.042$ (a mutation to $23/500$ is rejected, Appendix A). The terminal root boxes use relative width $10^{-4}$, which costs about $10^{-3}$ of margin (conservative). The $\varsigma=0$ slab never uses the $h$-path that would divide by an interval containing $0$ (that path fails safe).

Hence, for every $k\ge36/25$, the chosen reference satisfies (H1), (H2) and $C_{\rm eff}\le0$, and the right side of (8.5) is **strictly positive** on the whole rectangle $(0,Q_{\max}]\times(0,R_{\max}]$, with $L=L_{\rm hi}$ (rows R1, R2) or $L=D$ (terminal row).

### Certificate 9.3 (lower enclosure of $D$)
`cert2/lambda_lower.py` certifies $\Lambda(q)\ge D_{\rm lo}:=1.8344304757$ for all $q\in(0,q_s)$, in three parts. It works in the variable $v=qu$ of Lemma 9.1 with $\rho_0=q$, $D_0=2/(1+q)^2$, $H=qD_0$, $A=A(q)$, where $\Lambda=x_+-x_-=D_0(v_--v_+)+Hq(1/v_--1/v_+)$.
- **(T) tail**, $q\in(0,0.01]$: $\varsigma$-slabs as in the terminal certificate, direct interval evaluation. PASS, 17 slabs, minimum lower bound $\ge1.836662421698957$.
- **(M) middle**, $q\in[0.01,0.1]$: mean-value enclosures in $q$, $\Lambda(\mathcal K)\subseteq\Lambda(q_m)+\Lambda'(\mathcal K)(\mathcal K-q_m)$ with $v'(q)=-\mathfrak E_q/\mathfrak E_v$ on a certified root box. PASS, 189 slabs, minimum lower bound $\ge1.834430475707190$.
- **(S) soft edge**, $q\in[0.1,0.1237)\supset[0.1,q_s)$: one-sided root bounds. If $\mathfrak E(u_2)>0$ with $\mathfrak E'(u_2)>0$ at a point $u_2\in(q,1)$, then $v_+<u_2$; if $\mathfrak E(u_3)>0$ at a point $u_3>1$, then $v_->u_3$ ($\mathfrak E$ is decreasing on $(1,\infty)$). Since $v\mapsto D_0v+Hq/v$ is increasing for $v>q$ ($D_0-Hq/v^2>0$ there), $\Lambda>D_0(u_3-u_2)+Hq(1/u_3-1/u_2)$. (The test points $u_2=v_+(q_1)(1+\varepsilon)$, $u_3=v_-(q_1)(1-\varepsilon)$ are chosen from a floating-point scan; the choice does not affect rigour.) PASS, 855 slabs, minimum lower bound $\ge1.845234800237011$. Only $q<q_s$ is claimed; the last slab ends at $0.1237>q_s$.

Commands (in `cert2/`): `python lambda_lower.py` (parts T and M) and `python lambda_lower.py soft` (part S). Together with Certificate 5.5:
$$1.8344304757\le D\le1.8344304757628 .$$
The main theorem does not depend on this certificate; it fixes the digits of $D$.

**Independent re-certification (`cert3/dlower3.py`).** Written without reading `cert2/`, using its own fixed-point arithmetic (A.1) and a different method:
- on the tail $\varsigma\in[0,0.2172]$ and the soft edge $q\in[1/20,0.12364]$, zeroth-order one-sided bounds. Points $v_h\in(q,1)$ and $w_l>1$ with $\mathfrak E>0$ on the whole slab give $v_+<v_h$, $v_->w_l$ (the first uses $C=0$: then $\mathfrak E(q^+)=0$ and $\mathfrak E<0$ on all of $(q,v_+)$ by the shape analysis in the proof of Lemma 9.1(iv); for $C<0$ this step would fail) and $\Lambda\ge D_0(w_l-v_h)(1-q^2/(w_lv_h))$;
- on the middle $q\in[1/100,1/20]$, a second-order Taylor bound, with $\Lambda''$ enclosed on certified slab root boxes through the implicit derivatives of the branches.

PASS: $16+15+79$ slabs, minimum lower bound $1.8344304757531$. The mutation $L=1.83443047577$ is rejected (a certified point value $\Lambda(0.02571533203125)\le1.8344304757640471$, printed rounded up). The same script certifies the sharper bound $\Lambda\ge1.8344304757626$ on $(0,q_s)$, so, with the lower end from this single implementation,
$$1.8344304757626\le D\le1.8344304757628 .$$

### 9.4 The two certificate implementations

**`cert2/`** (written with the proof; Python 3.10 standard library only). Arithmetic: `ia.py` (exact dyadic rationals, outward rounding at $2^{-220}$) and `iad.py` (interval forward AD). Final runs recorded in `loop-log.md`, Iterations 7–10:

| command (in `cert2/`) | certifies | result |
|---|---|---|
| `python sup_check.py` | Lemmas 2.4 (A1), (A2) and 2.6 (B) | PASS (9 s) |
| `python smallk_check.py` | Proposition 4.1 constants | PASS; $\bar\varepsilon\in[0.0336420750,\ldots]$, margin $0.01929$ |
| `python onecut_check.py` | Certificate 5.5 | PASS (6 s) |
| `python cover_mv.py chunk R1 i 7 96`, $i=0..6$ | Certificate 9.2, row R1 | 7/7 CHUNK PASS (logs `cert2/logs2/R1-*.out`) |
| `python cover_mv.py chunk R2 i 7 96`, $i=0..6$ | Certificate 9.2, row R2 | 7/7 CHUNK PASS (logs `cert2/logs2/R2-*.out`) |
| `python terminal_check.py 32` | Certificate 9.2, terminal row and side checks | PASS, 36 slabs, margin $\ge0.03381$ |
| `python lambda_lower.py`; `python lambda_lower.py soft` | Certificate 9.3 | PASS |

**`cert3/`** (independent). Written from `proof.md` only, without reading or importing `cert2/`: its own binary fixed-point interval arithmetic at $2^{-112}$ (`ivl.py`), its own series for $\log$, $\exp$, $\sin$ and $\pi$, and its own enclosure strategy (natural interval extensions after algebraic rewriting, e.g. $w_\pm=1/(v_\pm|\mathfrak E'(v_\pm)|)$, adaptive $k$-slabs, dyadic partition cells for Corollary 8.20). It re-certifies all of Certificate 9.2 (R1, R2 and the terminal family including $q\to0$) and the side conditions. Command: `powershell -File cert3/run_all.ps1 -Tag replay` → **CERT3 OVERALL: PASS** (16 s wall, 16 processes). Certified minimum margins:

| chunk | range | min certified margin |
|---|---|---|
| R1_a, R1_b, R1_c | $k\in[1.44,1.65],[1.65,1.87],[1.87,2.1]$ | $\ge0.1628231$, $\ge0.1815698$, $\ge0.0672150$ |
| R2_a, R2_b, R2_c | $k\in[2.1,2.8],[2.8,3.5],[3.5,4.2]$ | $\ge0.2746482$, $\ge0.2860839$, $\ge0.2837334$ |
| TERM_a, TERM_b | $\varsigma\in[0,0.217147]$ ($q\le0.01$), $[0.217147,0.315449]$ ($0.01\le q\le21/500$) | $\ge0.8530115$, $\ge0.0686173$ |

The side checks (`side3.py`) certify $L_{\rm hi}\ge\Lambda(\hat q)$ with $\Lambda(\hat q)$ enclosed to about $10^{-25}$, $k(21/500)<21/5$, $\mathfrak f(21/500)>0$, $\mathfrak f(\hat q)>0$, and the overlap bookkeeping. The self-test passes 21000 containment tests; a floating-point cross-check by quadrature from the definitions is consistent; the mutations $L=1.87$ (on the R1 edge slab) and $q_2=23/500$ are rejected.

Details of every script and the reproduction commands are in Appendix A.

---

## 10. Assembly

### Theorem 10.1 (lower bound)
Every $f\in\mathcal P$ satisfies $|S_f|>D$.

*Proof.*
- Atomize (Lemma 3.2; $S_f$ can only shrink, and the atomized polynomial lies in $\mathcal P$), reflect if necessary (Lemma 3.3) and normalize (Lemma 3.4); reflection and translation do not change $|S|$. So it suffices to prove $|S_f|>D$ for an atomized polynomial in the normal position of Lemma 3.4.
- If $A=1$, then $|S_f|\ge|S_{\tilde f}|=2>L_{\rm hi}>D$, where $\tilde f$ is the atomized, normalized polynomial (Lemmas 3.2, 3.4(iv)).
- Otherwise $k=A/(1-A)\ge1$ and $|S_f|\ge\mathcal J_k$ (Lemma 3.6).
- If $1\le k\le29/20$, then $\mathcal J_k>2>D$ (Proposition 4.1).
- If $k>29/20$, choose the reference and the target constant $L$ from Certificate 9.2. Its hypotheses hold, so:
  - Theorem 6.14 and Theorem 7.1 give $M_k(T)\ge M_k(T_0)+\int g\,d\xi$ (in quantile form, Theorem 8.4);
  - Proposition 8.6 with Theorem 8.19 and Corollary 8.20 gives $\mathcal J_k>L$: every certified scalar margin is strictly positive, so the right side of (8.5) is $>0$, hence (8.4) is strict for every quantile interval (each block has $q_ir_i>0$);
  - here $L=L_{\rm hi}>D$ (rows R1, R2) or $L=D$ (terminal row). $\square$

### Theorem 10.2 (main theorem; Theorem 1.1)
$$\inf_{f\in\mathcal P}|S_f|=D=\inf_{0<q<q_s}\Lambda(q),\qquad1.8344304757\le D\le1.8344304757628,\qquad\sup_{f\in\mathcal P}|S_f|=2\sqrt2 .$$
The infimum is not attained. The supremum is attained, exactly by the polynomials $(x^2-1)^m$, $m\ge1$.

*Proof.*
- The lower bound $|S_f|>D$ is Theorem 10.1; sharpness $\inf\le D$ is Theorem 5.4. Hence $\inf=D$, and it is not attained, since the inequality of Theorem 10.1 is strict for every $f$.
- The supremum statement is Theorem 2.7.
- The enclosure of $D$ is Certificate 5.5 (upper) and Certificate 9.3 (lower); it is needed only for the digits. $\square$

**Where strictness comes from.** (i) $A=1$: $|S_f|\ge|S_{\tilde f}|=2>D$. (ii) $1\le k\le29/20$: $\mathcal J_k>2$. (iii) $k>29/20$: strictly positive certified margins and $q_ir_i>0$ make (8.4) strict, so $\mathcal J_k>L\ge D$. In every case $|S_f|>D$.

### Corollary 10.3 (the fixed-degree minima converge to $D$)
Let $m_n=\min\{|S_f|:f\in\mathcal P,\ \deg f=n\}$. Then $m_n>D$ for every $n$, and $\lim_{n\to\infty}m_n=D$.

*Proof.*
- $m_n>D$: the minimum exists (Lemma 1.3), and Theorem 10.1 gives $|S_f|>D$ for every $f$.
- $\limsup m_n\le D$:
  - In Theorem 5.4, fix $q\in(0,q_s)$ and $A\in(A(q),s)$. The quantile discretisation $\nu_N$ is defined for **every** $N$, and $f_N$ has degree exactly $N$. Steps A and B give $|S_{f_N}|\to|E_{\mu_A}|$ as $N\to\infty$ along all $N$.
  - Hence $\limsup_Nm_N\le\limsup_N|S_{f_N}|=|E_{\mu_A}|$.
  - Letting $A\downarrow A(q)$ gives $\le\Lambda(q)$, and taking $\inf_q$ gives $\le D$. $\square$

*Remark.* Phase I of `proof.md` (not reproduced here; see `result.md`) gives $m_1=m_2=m_3=2$ and, for $4\le n\le7$, $m_n=|S_{(x+1)(x-1)^{n-1}}|$ with
$$m_4=1.98430533444434272\ldots,\quad m_5=1.90320953444532725\ldots,\quad m_6=1.87625976224284495\ldots,\quad m_7=1.87166878099881439\ldots,$$
all $>D\approx1.83443$. So $m_4>m_5>m_6>m_7$. The corner value $L^\ast_8=|S_{(x+1)(x-1)^7}|\in[1.87622535561403415397,1.87622535561403415683]$ exceeds $m_7$, so $n\mapsto$ (corner value) is not monotone. Monotonicity of $m_n$ itself is not claimed.

---

## Appendix A. Interval-arithmetic certificates

All scripts are Python 3.10 standard-library programs. Certified bounds are computed in exact rational or fixed-point integer arithmetic with outward rounding. Floating point is used only to *choose* evaluation points, root guesses and slab splits, never for a certified bound. Paths are relative to the problem folder.

**What carries the proof.** The proof of Theorem 1.1 has two parts: the analytic reduction of every $f\in\mathcal P$ to the scalar inequalities (the analytic parts of §§2–10, including Lemma 9.1, the analytic bullets of Certificate 9.2 and the assembly in §10), and the interval checks of this appendix, which verify those inequalities on the whole parameter range with rigorous truncation errors. Random tests, floating-point comparisons (A.5), reviewer replays (A.4) and mutation tests help detect implementation errors. They are not part of the proof.

**Printed decimals (revised 2026-09-29, after an external review).** Every PASS/FAIL decision compares the internal rational or fixed-point bounds directly; no decision re-reads a printed decimal. Earlier versions of some output routines (`cert2/ia.py: fmt`, `cert3/side3.py: dec`, `cert3/cover3.py: fmt`, `cert3/dlower3.py: frstr` for upper bounds, and float-formatted margins in `cover_mv.py`, `cover_check.py`, `terminal_check.py`, `lambda_lower.py`, `sup_check.py`) rounded to nearest or truncated. So a printed "interval" could miss the true value, e.g. `Lambda(qhat) in [1.834430475762706569, 1.834430475762706569]`, while the true value is $1.83443047576270658775\ldots$. All these routines now print lower bounds rounded down and upper bounds rounded up. Every decimal interval quoted in this paper was re-checked against the new outputs, and all scripts were re-run on 2026-09-29 with unchanged PASS results (A.2, A.3). Values marked $\approx$ are approximations only.

### A.1 Arithmetic libraries
- **`cert2/ia.py`.** Intervals are pairs of `Fraction`s with dyadic denominators $2^{220}$ after outward rounding. Provides `iv, add, sub, mul, div, neg, sqr, powi, sqrt, log, exp, atanh, pi_iv, sin, cos`. Elementary functions are evaluated at rational points by convergent series with explicit remainder bounds and extended to intervals by monotonicity; $\pi$ comes from Machin's formula. Sanity-tested against the `math` module ($\ln2$, $\pi$, $e$, $\sin1$, $\cos3$, $\operatorname{atanh}0.9$, $\log1000$, $e^{-5}$). Audited in Math RED Reviews 4 and 9 (outward rounding, remainder bounds, log range reduction, square root, Machin $\pi$ and trigonometric extrema).
- **`cert2/iad.py`.** Forward-mode automatic differentiation over `ia` intervals: a value carries an enclosure of $f(\mathcal K)$ and of $f'(\mathcal K)$ over a parameter interval $\mathcal K$, used for mean-value enclosures $f(\mathcal K)\subseteq f(k_m)+f'(\mathcal K)(\mathcal K-k_m)$. Audited in Review 9 (a soundness test found 0 of 164 sample points outside the enclosures; `cert2/replay13/mv_sound.out`).
- **`cert3/ivl.py`** (independent). Binary fixed-point integers at scale $2^{-112}$: exact $\pm$; products and quotients rounded outward at every corner; `math.isqrt` for square roots; $\operatorname{atanh}$, $\log$ (range reduction by $1+j/32$), $\exp$ (halving and squaring), $\sin$ (reduction by $\pi$, alternating remainder) and Machin $\pi$, each with an explicit remainder bound. Self-test `cert3/selftest3.py`: 21000 containment tests, and $\pi$, $\ln2$ checked against 40-digit literals.

### A.2 The `cert2/` scripts

| script | certifies | used in |
|---|---|---|
| `sup_check.py` | (A1) $e_1\in[0.368612727375,0.368612727376]$, $T\le0.19047$, $e_1-T>0.178$; (A2) $\Delta>0$ on $[1/10,0.3358]$ by 95 interval boxes (min lower bound $1.77\cdot10^{-5}$) and $U<0.3358<p^{-1}$; (B) $W(2)\in[0.0091936718243,0.0091936718244]$, $W(3/4)\in[0.0053231607854,0.0053231607855]$ from the closed forms | Lemmas 2.4, 2.6 |
| `smallk_check.py` | $\bar\varepsilon\in[0.033642075,0.033642076]\subset(0,1/25)$ and $\log3-\bar k\log2-6\bar\varepsilon/e\ge0.01929>0$ | Proposition 4.1 |
| `onecut_check.py` | $\mathfrak f$ changes sign on $[0.1236,0.1237]$; at $\hat q=257155\cdot10^{-7}$, brackets of $u_\pm$ by strict sign changes of $F_A$ at rational points; $\Lambda(\hat q)\in[1.834430475762706,1.834430475762707]$; asserts $\operatorname{hi}\Lambda(\hat q)<L_{\rm hi}$ | Definition 5.3, Certificate 5.5 |
| `cover_check.py` | the affine cover with plain interval slabs (all formulas of Lemma 9.1 and Corollary 8.20 in its docstring). Too slow for the final run (about 9 h estimated); superseded by `cover_mv.py`, which imports its shared routines (`LHI`, `PI`, `root_box`, `Ev`, `h_lower`, `sinc`, `ref_quantities`, `float_roots`, `fmid`) | Certificate 9.2 (library) |
| `cover_mv.py` | per $k$-slab of rows R1, R2: $A<s$; certified root boxes for $v_\pm$ with $\mathfrak E'$ sign-definite; $\sigma_\pm>0$; $x_-<0<x_+<a$; $Q_{\max}\le\pi$, $R_{\max}<Q_{\max}$; $C_{\rm eff}<0$; the partition bound of Corollary 8.20 $>0$; mean-value enclosures via `iad.py`; edge $a(k)=\alpha_a+\beta_ak$ from one exact source | Certificate 9.2, rows R1, R2 |
| `terminal_check.py` | per $\varsigma$-slab of $\varsigma\in[0,\varsigma_2]$ ($q\in(0,21/500]$): root boxes with $\mathfrak E'$ sign-definite, $x_-<0<x_+<a$, $\sigma_\pm\ge0$, $\log\frac{2H}{a_\pi b_\pi}+h(Q_{\max})+h(R_{\max})>0$; side checks $k(21/500)\in[4.18951734,4.18951735]<21/5$ and $\mathfrak f(21/500)>0$ | Certificate 9.2, terminal row |
| `lambda_lower.py` | $\Lambda(q)\ge1.8344304757$ on $(0,q_s)$: tail (17 slabs), middle (189 mean-value slabs), soft edge (855 slabs, argument `soft`) | Certificate 9.3 |
| `cover_run.py` | a multiprocessing driver for `cover_mv.py`; not usable in the sandbox (multiprocessing blocked), replaced by 14 separate chunk processes | — |

**Reproduction** (run in the folder `cert2/`):
```
python sup_check.py                       # PASS (9 s)
python smallk_check.py                    # PASS
python onecut_check.py                    # PASS (6 s)
python cover_mv.py chunk R1 i 7 96        # for i = 0..6: CHUNK PASS each
python cover_mv.py chunk R2 i 7 96        # for i = 0..6: CHUNK PASS each
python terminal_check.py 32               # PASS: 36 slabs, min margin >= 0.03381
python lambda_lower.py                    # tail PASS (17 slabs, min >= 1.836662421698957); middle PASS (189 slabs, min >= 1.834430475707190)
python lambda_lower.py soft               # soft edge PASS (855 slabs, min >= 1.845234800237011)
```
Recorded outputs (re-run of 2026-09-29 with outward-rounded printing; all PASS): `cert2/logs3/R1-*.out`, `R2-*.out`, `lambda_TM.out`, `lambda_soft.out`, `term.log`, `onecut.log`, `sup.log`, `smallk.log`, `dlower3_all.log`. The per-chunk lines read, e.g., `R1[3/7]: k in [603/350, 318/175] PASS, 96 slabs (0 splits), min margin >= 0.00011`. The earlier logs (`cert2/logs2/`, `cert2/term.log`, `cert2/lambda_lower2.log`, `cert2/lambda_soft2.log`) were printed by the old formatters; their decimals are not rigorous (e.g. `term.log` shows the refuted interval for $k(21/500)$), although their PASS verdicts stand. The earlier affine run (`cert2/logs/`) predates the last code change (M-104) and is superseded.

### A.3 The independent `cert3/` scripts

| script | role |
|---|---|
| `ivl.py` | fixed-point interval arithmetic (A.1) |
| `cover3.py` | families R1, R2, TERM of Certificate 9.2 with its own enclosure strategy: natural interval extensions on boxes $(k,a,v_+,v_-)$ after algebraic rewriting ($s=\sqrt{a/2}$, $\rho_0=2/(1+s)-1$, $D_0=(1+s)^2/2$, $a_\pi=1+k(1-s)$; $w_\pm=1/(v_\pm\lvert\mathfrak E'(v_\pm)\rvert)$; $b_\pi=4D_0\rho_0(w_++w_-)/(k+1)$; $2H/(a_\pi b_\pi)=(k+1)/(2a_\pi(w_++w_-))$; $R_\xi/b_\pi$ as a convex combination of $(1+\rho_\pm)/2$; $M_0=D_0(v_--v_+)(1-\rho_0^2/(v_-v_+))$); certified root brackets with $\mathfrak E'$ sign-definite; $h$ and $\operatorname{sinc}$ tables on the dyadic grid $j\,2^{-10}$ used through monotonicity; the partition bound on dyadic cells ($2^{-6}$, refined to $2^{-10}$) |
| `side3.py` | (S1) $L_{\rm hi}\ge\Lambda(\hat q)$; (S2) $k(21/500)<21/5$; (S3) $\mathfrak f(21/500)>0$ and $\mathfrak f(\hat q)>0$; (S4) overlap bookkeeping |
| `selftest3.py` | containment self-test of `ivl.py` (not a certificate) |
| `float_crosscheck.py` | floating-point cross-check from the definitions (quadrature of $W_0$, crossings by bisection, $B$ by quadrature) against the `cover3` enclosures on thin slabs (not a certificate) |
| `dlower3.py` | lower enclosure of $D$ (Certificate 9.3), independently: one-sided tail / soft-edge bounds and a second-order Taylor bound in the middle; also the upper bound at $\hat q$ and a mutation test (`python dlower3.py all`, 2.8 s) |
| `sup3.py` | the witness inequalities of §2 (Lemmas 2.4, 2.6) and their side facts, independently of `sup_check.py`: $\Delta>0$ on $(0,U]$ (monotonicity of $\Delta/u^2$ plus bisection, 10 boxes); $W(2)$, $W(3/4)>0$ from the closed forms (float quadrature cross-check $\le2\cdot10^{-15}$); four mutations rejected (`python sup3.py`, 1.5 s) |
| `mutation3.py` | must FAIL: $L=1.87$ on the R1 edge slab $[2099/1000,21/10]$; terminal range extended to $q_2=23/500$ |
| `collect3.py` | collects the logs, requires every main chunk to PASS, checks that the chunks cover $[36/25,21/10]$, $[21/10,21/5]$ and $[0,\varsigma_2]$ without gaps, and that the side checks, self-test and cross-check passed and both mutations were rejected |
| `run_all.ps1` | launches the 16 jobs (self-test, side, three coarse runs, cross-check, eight main chunks R1_a–c, R2_a–c, TERM_a–b, two mutations) as separate processes and runs `collect3.py` |

**Reproduction:** `powershell -File cert3/run_all.ps1 -Tag replay` → `CERT3 OVERALL: PASS` (16 s wall). Logs: `cert3/logs/replay_*.out`; final re-run with the revised printing on 2026-09-29: `-Tag final40`, `CERT3 OVERALL: PASS`, logs `cert3/logs/final40_*`. Main-chunk margins are in §9.4; the coarse runs give R1 $\ge0.0551170$, R2 $\ge0.2548383$, TERM $\ge0.0124332$ (re-run 2026-09-29, `-Tag fmt40`, printed rounded down). In the mutation runs, the floating-point truth confirms that the rejected statements are genuinely false (at $k=2.1$, $L=1.87$ the grid minimum of $\mathcal S$ is $-0.0199$; the terminal scalar bound is $0.0694$, $0.0269$, $0.0056$, $-0.0158$ at $q=0.042,0.044,0.045,0.046$).

### A.4 Reviewer replays (independent numerics written by the Math RED reviewers)
- `cert2/replay6/` (Review 4, §2): 60-digit decimal arithmetic, three quadrature methods, not using the closed forms: $W(3/4)=0.00532316078544433831\ldots$, $W(2)=0.00919367182438675784\ldots$ inside the certified intervals; $W$ constant on $[2,B_\ast]$ to $2.4\cdot10^{-59}$; $\Delta\ge0.00354$ on $[0.1,U]$ by a Lipschitz grid.
- `cert2/replay79/` (Review 6, §§3–5): potentials by quadrature to $1.4\cdot10^{-12}$; $\Lambda$ by direct bisection in $x$ to $2\cdot10^{-15}$; scanned minimum $\Lambda\approx1.834430475762665$ at $q\approx0.025715542$ (interior); 200 random polynomials satisfy Lemmas 3.2–3.4 and 1198 configurations satisfy Proposition 4.1 with no violation (extremal $\sum R_i=2^{-\bar k}\approx0.366$).
- `cert2/replay10/` (Review 7, §6): the supporting inequality holds for 1050 random, 1050 shuffled and 96 near-contact targets; derivative vs. finite differences to $10^{-8}$; series vs. root-found widths to $10^{-10}$; 84000 convexity second differences, none negative.
- `cert2/replay11/` (Review 5, §7): the endpoint identity in 28 cases, to $5.1\cdot10^{-9}$ (finite-difference limited) and to about $10^{-13}$ against the implicit formula; zero correction when $d_N=2$.
- `cert2/replay12/` (Review 8, §8): (8.5) in 84 cases with minimum slack $+9.2\cdot10^{-5}$ (short-arc slack $\approx0.058\,\epsilon^2$, so the constants are sharp); bathtub steps tight; rearrangement gap $\ge2.2\cdot10^{-3}$; Lemma 8.5 slack $\ge5.9\cdot10^{-8}$; $Q\mapsto\mathcal S(Q,R_{\max})$ not decreasing on the $a=9/5$ row.
- `cert2/replay13/` (Review 9, §9): code audit; mean-value soundness (0 of 164 points outside); mutations (raising $L_{\rm hi}$ above the thresholds, shifting $a(k)$, raising $q_2$ to $23/500$) all FAIL as predicted; replays of `terminal_check.py` (0.03381), `onecut_check.py` and all 14 affine chunks PASS; every certified bound checked lies below the float minimum.
- `cert2/replay12b/` (Review 10, §8.4): exact integer / `Fraction` arithmetic, written without reading the draft scripts: the reflection geometry for all $n\le60$; brute-force maximum over all arrangements equals $S(\mathbf a^\#,\mathbf b^\#)$ in 1444 instances (mirrored orientation strictly worse in 1025); the polarization algorithm terminates at $(\mathbf a^\#,\mathbf b^\#)$ in 1500 runs; (R) in 1500 random continuum instances plus 300 instances of the §8 shape.

### A.5 Floating-point sanity checks (not part of the proof)
These were run while drafting (scripts in `cert2/drafts_checks/`); they are floating-point checks, not certificates, and the proof does not rely on them.
- **§6** (`s10/`): density identity $\sqrt{2a}/d=P_{\rho_0}(\theta)$ to $10^{-12}$; potentials and platform identity at 5 points for 5 pairs $(k,a)$ (max error $1.4\cdot10^{-5}$, midpoint quadrature of a log singularity); closed form of $W_0$ vs. quadrature to $3.5\cdot10^{-14}$; sample values of $\sup_{(0,a)}W_0$: $(3,1.5)$: $+0.0327$; $(3,1.4)$: $-0.058$ (not separated); $(5,1.4)$: $+0.720$; $(8,1.7)$: $+2.51$; series endpoints vs. bisection for 12 random targets; contact targets reproduce $y_c$ to $3\cdot10^{-5}$ with $n^{3/2}F_n\approx0.057$; 45600 convexity second differences positive; the supporting inequality for 100 random targets on 4 references with no violation (the reported minimum slack $9.8\cdot10^{-4}$ is sample-dependent; the reviewer found $4.1\cdot10^{-5}$ over 1050 targets).
- **§7** (`stage11_check.py`, 185/185 checks): Hilbert transforms of $\cos n\phi$; $\Sigma_n(\rho)$; the identity $\dot M-\int g\,d\xi=-\Gamma F(2)$ for smooth $F$ and for arbitrary $x_\pm,\sigma_\pm$ ($\le7\cdot10^{-15}$); step functions via (7.5); 25 atomic targets with the unreduced $g$ of (7.2) ($\le8\cdot10^{-15}$) and finite differences of the true crossings ($\le9\cdot10^{-9}$). Example at $(k,a)=(4.7,1.8045)$: $x_-=-0.80815$, $x_+=1.02631$, $\sigma_-=0.16173$, $\sigma_+=0.29017$, $\Gamma=0.39305$, $a_\pi=1.23562$, $\xi(I)=0.04035$.
- **§8** (`stage12_check.py`, 76 checks, 0 failed): chord and platform identities, formulas for $a_\pi,b_\pi,R_\xi$, (8.7) for 5 quantile intervals ($\le1.3\cdot10^{-12}$), $\mathcal A(Q,R)$ and $h$, (8.5) slacks $+0.098,+1.53,+0.059,+1.38,+2.42$, Lemma 8.5 and Proposition 8.6 slacks, a 240-cell discrete rearrangement check, and partition bounds $0.277,0.333,0.324,0.206,0.213,0.069$ for sample references. `phi_profile.py`: $Q\mapsto\mathcal S(Q,R_{\max})$ has positive derivative at $Q_{\max}$ for $a=9/5$, $k\in\{2.5,3,3.5,4,4.2\}$, and is decreasing on the grid for row-R1 samples.
- **§8.4** (`e12_discrete.py`, `e12_continuum.py`): exhaustive checks of the reflection geometry ($n\le40$); two-point inequality (3000 instances); algorithm termination at $(\mathbf a^\#,\mathbf b^\#)$ (800 instances); T5 — exhaustive over 0/1 vectors and ray kernels for $n\le15$ (run `python e12_discrete.py 15`), with a mutation control (a non-monotone "ring" kernel gives 5068 violations at $n=8$); brute force over permutations ($n\le6$); cell kernel (3400 instances), Lemma 8.15 (22000), (R) for random step functions with non-lattice masses (8500), adversarial shapes (1008), and the truncated log kernel. No violation was found.

### A.6 Pins
SHA-256 values of the files as of 2026-09-29, after the output-format revision (Appendix A, "Printed decimals"); they are recorded in `loop-log.md` Iteration 40 and match the files present. Files marked * changed in that revision (printing only); their earlier pins are in `loop-log.md` Iterations 9, 10, 12.

| file | SHA-256 |
|---|---|
| `cert2/ia.py`* | `9690d88d7a7ce6f1996d927c89a5798d4bfedd741277a3d77914804f43011cb7` |
| `cert2/iad.py` | `811318de2bf2a74fca719b6bc0d403660c0d23c7ea793a7e7b421a7834c12c0d` |
| `cert2/sup_check.py`* | `928bb3c37c01344dd28154c55b37b5bfc28191772579ea5b37165486af0c7d00` |
| `cert2/smallk_check.py` | `01fb3ca03095bb3c0424b095e9cca7ed0c44076dec4e691d1eb1d2868536815b` |
| `cert2/onecut_check.py` | `4a121d39db16339ac5072aa99dc42033e6c5c256563beeaf82dc294c40e40873` |
| `cert2/cover_check.py`* | `bd8e3fa14689932d008860b136e21ed786b3d962dc4f2c21972513aee6021f7e` |
| `cert2/cover_mv.py`* | `06770d2f3e01a0235cfcd3a933b78ce99d82bbff7bf10a8ac6d1176cd2737efb` |
| `cert2/terminal_check.py`* | `56576510a3fe00c97dc3a0f8d3b526330af5a85e9621fd2dee9226784d2d0a2f` |
| `cert2/lambda_lower.py`* | `0a92986448bb1632f57c2f05f82efb1011a7bdfcfb1e51313470bd7f2376d30b` |
| `cert3/ivl.py` | `0b7c1fff89c4667ef70af7cfaab937fe4b8c76078592770bc2af7cec1ce5873f` |
| `cert3/cover3.py`* | `fb5bf769d9bd0e19b364d72a9141cfd5c69940a6ea326e3f0c3598e396f10627` |
| `cert3/side3.py`* | `44ad576e1afda8488c6c0df1114fcb53f2d934d41484eb56e952e4fdcf8ae944` |
| `cert3/dlower3.py`* | `591ee4f03f18db0e1d6ebb4a5ff2ff948dd012586249bd74973ceeed99110b31` |
| `cert3/sup3.py`* | `be31888289aaf582dd4022e2925d4226650fe8b6fa305bd3617b373a0c293a06` |

---

## Appendix B. Implemented proof-method differences and attribution

The original draft compared incomplete prose descriptions and used the word “repairs”. That framing is superseded: Wang’s pinned final Lean source has passed a complete build and final axiom audit. The main mathematical result is prior work. The following explains the different paths implemented here, without claiming to fix a gap in his final theorem.

1. **Rearrangement (§8).** On every nonzero finite cycle, two-point polarization preserves/increases the kernel energy while reducing a finite ordering potential. Minimizing that potential over admissible permutations gives canonical rearrangements (`Riesz.discrete_riesz`). Periodic cell averages approximate arbitrary measurable [0,1] densities in L1; explicit convolution errors and Lebesgue differentiation pass the finite bound to centered arcs (`Circ.circle_rearrangement`). This interface permits a bounded real symmetric decreasing periodic kernel. The singular logarithmic kernel is handled separately by truncation and convergence (`CircLog`). Wang’s checked target uses terminal-shell compression specialized to platform/adjoint densities.

2. **Scalar positivity (§8–9).** For P>=0 and 0<R<=Rm<=q1<=Q<=q2<=pi, monotonicity of sinc bounds the scalar expression below by B+P/q2+(sinc(Rm)-sinc(q1))². Positive margins on every interval of a monotone finite partition and the small-Q margin imply positivity over the whole domain (`Arc.scalar_pos`). The physical-reference transfer is `Stage12.scalarPositive_partition`. All margins are required hypotheses and are instantiated by the compiled certificates. This replaces the whole affine scalar derivative-sign certificate used by Wang, rather than assuming that derivative is always negative.

3. **Adjoint (§7).** The completed Lean uses Bernstein approximation for a cosine-coordinate Lipschitz remainder. Adjacent divided differences bound the approximating polynomial derivatives, preserving a common Lipschitz constant. The already established polynomial identity then passes to the limit (`Stage11.L_XLip`). A jump is approximated by a clipped ramp; integrable bounds justify the limit, and linearity sums finitely many arbitrary real jump coefficients (`finite_jump_adjoint_eq`). Separate principal-value and material-first-variation modules identify the transform with the physical derivative. The Fejér narrative retained in §7 is an informal alternative, not a literal description of the final Lean route. Wang uses Abel regularization and boundary limits.

4. **Supporting inequality (§6).** The Lean statements `Stage10.convex_supporting_sep/contact` work directly with measurable positive bounded quantile functions, with the full separation/contact hypotheses. Their width and derivative identifications are subsequently connected to actual components. Wang’s route uses finite-coordinate convexity and refinement toward platform references. These are different interfaces for the same #1038 conclusion.

The exact elaborated statement types, source correspondence, scope of prior-library searches, and bounded code-overlap findings are provided with the submission in `EXACT_STATEMENTS.md`, `CONTRIBUTIONS.md`, and `informal_audit.md` §§35–36. No worldwide first-formalization claim is made. In particular, Wang’s final Lean already avoids Pringsheim; removing that theorem is not a distinguishing contribution.

---

## Appendix C. Dependencies

**No external research-level theorem is used.** The proof uses only the following textbook facts, the results proved in this paper, and the certified computations of Appendix A.

- **Real analysis.** Dominated and monotone convergence; Fubini–Tonelli; Jensen's inequality and weighted AM–GM; Minkowski's integral inequality; Chebyshev's inequality; the fundamental theorem of calculus for absolutely continuous functions; $L^1$-continuity of translations; density of $C(\mathbb T)$ in $L^1(\mathbb T)$; the layer-cake formula; Vitali's convergence theorem (uniform integrability); the Weierstrass M-test and termwise differentiation; the real implicit function theorem; the mean value and intermediate value theorems; attainment of the maximum of an upper semicontinuous function on a compact set.
- **Fourier analysis.** Parseval's identity in $L^2$; the Fourier series $\log|2\sin(\tau/2)|=-\sum_n\cos(n\tau)/n$; the Poisson kernel series; orthogonality; Fejér's theorem (uniform convergence of Fejér means of continuous periodic functions, which preserve Lipschitz constants); the Chebyshev polynomial recurrence.
- **Complex analysis.** Holomorphy of parameter integrals; the holomorphic inverse function theorem; Cauchy's integral formula and estimates; the residue theorem and the argument principle; Rouché's theorem; Weierstrass's theorem on uniform limits of analytic functions; the identity theorem for real-analytic functions.
- **Classical integrals.** $\int_0^{2\pi}\log|1-e^{i\tau}|\,d\tau=0$ (equivalently $\int_0^\pi\log\sin=-\pi\log2$); $\frac1{2\pi}\int_0^{2\pi}\log|w-e^{i\theta}|\,d\theta=\log|w|$ for $|w|>1$; the elementary antiderivatives of Lemma 2.6 and Lemma 8.1(3).
- **Finite combinatorics** (§8.4): reflections of $\mathbb Z_n$ and a strictly increasing potential on a finite set.
- **Computer assistance.** The interval certificates of Appendix A; their correctness rests on the construction of the interval libraries and of the checkers (exact Python integer and `Fraction` arithmetic), audited by the reviewers and implemented twice independently for §9.
- **Quoted, not reproved:** the Phase I fixed-degree values $m_1,\dots,m_7$ in the remark after Corollary 10.3 (proved in `proof.md` Phase I with exact certificates); they are not used in the main theorem.

**Not used, but alternatively citable.**
- **E12.1 (Riesz rearrangement inequality on the circle).** For nonnegative measurable $f,g,\mathcal K$ on $\mathbb T$, $\iint f(\theta)\mathcal K(\theta-\phi)g(\phi)\le\iint f^{\ast}(\theta)\mathcal K^{\ast}(\theta-\phi)g^{\ast}(\phi)$, where $F^{\ast}$ is the symmetric decreasing rearrangement. In the symmetric-kernel case ($\mathcal K=\mathcal K^{\ast}$ bounded, $f,g$ with values in $[0,1]$), followed by two bathtub steps, it would give Theorem 8.8. References: R. Friedberg and J. M. Luttinger, *Rearrangement inequality for periodic functions*, Arch. Rational Mech. Anal. **61** (1976) 35–44; A. Baernstein II and B. A. Taylor, *Spherical rearrangements, subharmonic functions, and $\ast$-functions in $n$-space*, Duke Math. J. **43** (1976) 245–268 (the circle is the case $n=1$); A. Baernstein II, *Convolution and rearrangement on the circle*, Complex Variables Theory Appl. **12** (1989) 33–37, with a *Correction*, Complex Variables **26** (1995) 381–382; also A. Baernstein II, *Symmetrization in Analysis* (with D. Drasin and R. Laugesen), Cambridge Univ. Press, 2019. The statement was transcribed from a secondary source (arXiv:2411.15308, Theorem 3.1); the exact hypotheses in the primary texts were not checked. Since Theorem 8.8 is proved here (Math RED Review 10), this citation is not needed.
- **Pringsheim's theorem** (Remark 6.10a): not needed; replaced by a Cauchy bound.

No unproved assertion from those notes is used as an assumption in the final formal theorem. Mathematical ideas and priority are nevertheless attributed to their sources, including Wang and Tao.

---

## Appendix D. Completed Lean status and precise scope

The final package uses Lean 4.34.1 and Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`. Its complete import closure contains 315 proof modules including the root. The extracted source package was rebuilt on 2026-10-01 from an empty project build directory, reusing pinned dependency caches. Eighteen final/reference/bridge declarations passed the axiom audit. On 2026-10-03 those declarations and the eight reusable candidates were checked again using the existing compiled project: 26 checks passed, with only `propext`, `Classical.choice`, `Quot.sound`. That latter run is a cached-project declaration/axiom check, not another clean build.

| Conclusion | Formal entrypoint |
|---|---|
| Reference-form exact infimum | `Erdos1038.erdos_1038.parts.i` |
| Supremum | `Erdos1038.erdos_1038.parts.ii` |
| Infimum < 1.835 and classical lower bound | `erdos_1038.variants.inf_upperBound`, `erdos_1038.varaints.inf_lowerBound` |
| Nonattainment | `Erdos1038.erdos_1038.inf_nonattainment` |
| Numeric enclosure | `Erdos1038.erdos_1038.D_enclosure`: 1.8344304757 <= D < 1.8344304757628 |
| Complete physical reference and parameter coverage | `EP1038.ReferenceCert.COV` |
| Universal strict lower bound | `EP1038.ReferenceCert.universal_strict_lower` |
| Exact infimum and nonattainment | `EP1038.ReferenceCert.exact_infimum_and_nonattainment` |

`Submission.lean` preserves the reference’s polynomial domain and ENNReal measure type; the formal model bridges prove correspondence with the local class. The reference’s unknown answer is filled by `ENNReal.ofReal EP1038.Stage9.Dval`, not by a rounded decimal. Finite certificates are included as Lean sources and checked by kernel reduction. An unchanged, uncompiled Formal Conjectures reference retains its original placeholders outside the build root.

This establishes the listed formal statements, not every stronger auxiliary statement appearing anywhere in this long informal exposition (for example all fixed-degree results). No human mathematical review has been declared by Hyunjin Lee. Novelty, official target admission and competition acceptance are separate from kernel checking. The team’s server attempt with Lean 4.33.1 and its memory limit is a different environment from this complete pinned 4.34.1 build.

See `PROOF_GUIDE.md`, `STATEMENT_CORRESPONDENCE.md`, the package verification record, and the current contribution audit. The former partial-status table has been replaced rather than presented as the current result.

---

## Numbering correspondence with `proof.md`

### Statements

| this paper | `proof.md` |
|---|---|
| Theorem 1.1 | Theorem 14.2 (statement) |
| Lemma 1.2 (+ Remark) | Lemma 1.1 (Phase I) (+ Remark [M-06]) |
| Lemma 1.3 | Lemma 1.3 (Phase I) |
| Lemmas 2.1–2.6, Theorem 2.7 | Lemmas 6.1–6.6, Theorem 6.7 |
| Lemmas 3.1, 3.2, 3.3, 3.4 | Lemmas 7.1, 7.2, 7.3, 7.4 |
| Definition 3.5 | Stage 7, "Normal form" |
| Lemmas 3.6, 3.7 | Lemmas 7.5, 7.6 |
| Corollary 3.8 | Corollary 7.7 |
| Proposition 4.1 | Proposition 8.1 |
| Corollary 4.2 | Corollary 8.2 |
| Lemmas 5.1, 5.2, Definition 5.3, Theorem 5.4 (Steps A, B) | Lemmas 9.1, 9.2, Definition 9.3, Theorem 9.4 (Lemmas A, B) |
| Certificate 5.5 | Stage 9, "Numerical record" |
| §6.0; Lemma 6.1; "The interval $I$" | Stage 10: §10.0; Lemma 10.1; "Setting" |
| Lemma 6.2, Proposition 6.3 | Lemma 10.2, Proposition 10.3 |
| Lemma 6.4, Definition 6.5, Lemmas 6.6, 6.7 | Lemma 10.4, Definition 10.5, Lemmas 10.6, 10.7 |
| Lemmas 6.8, 6.9, Proposition 6.10, Remarks 6.10a, 6.10b | Lemmas 10.8, 10.9, Proposition 10.10, Remarks 10.10a, 10.10b |
| Lemma 6.11, Definition 6.12, Lemma 6.13, Theorem 6.14 | Lemma 10.11, Definition 10.12, Lemma 10.13, Theorem 10.14 |
| Remarks after Theorem 6.14 | Stage 10 §8 ("What later stages may use") and response M-42 |
| §7.0 ("Link with §6") | Stage 11 §11.0 ("Assumption S10" and [M-60]–[M-63]) |
| Theorem 7.1, Lemmas 7.2–7.8, Proposition 7.9, Lemma 7.10 | Theorem 11.1, Lemmas 11.2–11.8, Proposition 11.9, Lemma 11.10 |
| §7.7 (proof of Theorem 7.1) | §11.7 |
| §8.0 | Stage 12 §0 |
| Lemmas 8.1, 8.2, 8.3 | Lemmas 12.1, 12.2, 12.3 |
| Theorem 8.4 | black box BB11 (Stage 12 §2), closed by M-82 |
| Lemma 8.5, Proposition 8.6 | Lemma 12.4, Proposition 12.5 |
| Definition in §8.3, Lemma 8.7 | Definition [M-132], Lemma 12.6 |
| Theorem 8.8 | Theorem 12.6R (Stage 12b) |
| Lemma 8.9, Corollary 8.10, Lemmas 8.11, 8.12 | Stage 12b Lemma 1.1, Cor. 1.2, Lemmas 1.3, 1.4 (= 12.R1, 12.R2, 12.R3, 12.R4) |
| Theorem 8.13 | Stage 12b Theorem D (= 12.RD) |
| Lemmas 8.14, 8.15, 8.16, 8.17 | Stage 12b Lemmas 2.1, 2.2, 2.3, 3.1 (= 12.R5, 12.R6, 12.R7, 12.R8) |
| Lemma 8.18, Theorem 8.19, Corollary 8.20 | Lemma 12.7, Theorem 12.8 (step 3 as rewritten in Review 10), Corollary 12.9 |
| Lemma 9.1, Certificate 9.2 | Lemma 13.1, Certificate 13.2 |
| Certificate 9.3 | the note under Theorem 14.2 (`lambda_lower.py`; loop-log Iteration 10) |
| §9.4 | loop-log Iterations 9 and 12; result2.md |
| Theorems 10.1, 10.2, Corollary 10.3 | Theorems 14.1, 14.2, Corollary 14.3 |
| Appendix A.5 | Stage 10 §9, Stage 11 §11.9, Stage 12 §7, Stage 12b §5 |
| Appendix B | Stage 10 §7 ("Audit of the source"), Stage 11 §11.8, Stage 12 §6 and the comparison after Corollary 12.9, result2.md |
| Appendix C | Stage 10 "External dependencies", Stage 11 §11.8(8c), the E12.1 block of Stage 12, result2.md |

Dropped as bookkeeping (not part of the proof): Stage 12b §4 (the edit list; its edits are implemented in Theorem 8.19 and its remarks) and Stage 12b §6 (points for review; closed by Review 10).

### Equations

| this paper | (6.1) | (6.2) | (6.3) | (6.4) | (6.5) | (6.6) | (6.7) | (6.8) |
|---|---|---|---|---|---|---|---|---|
| `proof.md` | (K) | (4.4) | (4.5) | (4.6) | (10.1) | (10.2) | (10.3) | (4.13) |

| this paper | (7.1)–(7.5) | (8.1)–(8.7) | (R) |
|---|---|---|---|
| `proof.md` | (11.1)–(11.5) | (12.1)–(12.7) | (R) |

### Where the Math RED fixes are integrated

| finding | location here |
|---|---|
| M-20, M-21, M-22 | Lemma 2.5 (parametrisation; the case $z<-1$), Lemma 2.6 (definition of $\lambda$, Tonelli, absolute continuity), Lemma 2.4 (A2) wording |
| M-23 | Definition 5.3, second bullet |
| M-24, M-25 | Lemma 3.4(i) (cases $c<0$, $c\ge0$) and (iii) ($[c,b_0)\subseteq\mathcal C_0$; $b_0$ not a root; the case $\beta=0$) |
| M-26 | Proposition 4.1 ($b<d_1\le d_i$; reference to Lemma 3.6(a)) |
| M-27, M-28, M-29 | Lemma 5.2(ii); Theorem 5.4 (grid points $\tau_j$, partition of unity, $L^1\Rightarrow$ in measure, two successive limits; why $A>A(q)$ is essential) |
| M-30 | code docstring (`smallk_check.py`); Appendix A.2 describes what the script actually checks |
| M-31, M-43, M-81 | notation table §1.5 |
| M-40, M-60 | §7.0, "(H) is equivalent to strict separation" |
| M-41 | Remark (two-sided derivative) after Lemma 6.13 |
| M-42 | Definition 6.5, Theorem 6.14 (first example), Remark on the equality case of (6.3) |
| M-44 | Remark 6.10b |
| M-45 | Definition 3.5 (last paragraph), Lemma 6.7 (last bullet) |
| M-46 | Lemma 6.2(iii) (note on $x\ne0$); after Lemma 6.13 (injectivity of $T_0$) |
| M-47 | Appendix A.5 |
| M-61, M-62, M-63 | Lemma 7.5 proof (persistence of $\lvert x_-\rvert<\tau$); §7.0 (conventions at $2$); §7.4 (domain of $\mathfrak L$) |
| M-64, M-65 | Lemma 7.3 proof ("only boundedness matters"); §7.0 "Link with §6" |
| M-80 | Appendix C (E12.1, now only an alternative citation) |
| M-82 | Theorem 8.4 and its proof |
| M-83 | §8.0 ("quantile interval" = positive length) |
| M-84 | Corollary 8.20, proof step 4 |
| M-85 | §9 (terminal family, $C=0$ exactly) and Certificate 9.2 ($C_{\rm eff}\le0$, (H2) per slab, partition bound) |
| M-86 | Appendix A.5 (`cert2/drafts_checks/`) |
| M-87 | Lemma 8.3, third bullet |
| M-100 | Certificate 5.5 |
| M-101, M-103, M-104, M-105, M-106, M-108, M-109, M-110, M-111 | Certificate 9.2 (terminal row checked vs. analytic items; domains; one exact source for $a(k)$; printed margins; tight spots; the table; coverage by continuity and limit) |
| M-102 | Lemma 9.1(iv) |
| M-107 | Theorem 10.2 |
| M-130, M-131 | §8.4 numbering (8.9–8.17) and symbols ($\kappa$, $\bar\kappa$, $\delta_n$, $\gamma^{(n)}$) |
| M-132 | Definition at the start of §8.3 |
| M-133 | Theorem 8.19, step 3 and Remark (iv) |
| M-134 | "Half-sets" paragraph before Corollary 8.10 |
| M-135 | Lemma 8.15 proof ("up to null sets") |
| M-136 | remark after Lemma 8.16 |
| M-137 | Remark (d) after the proof of Theorem 8.8 |
| M-138 | Appendix A.5 (T5 run) |
