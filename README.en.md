# Relational Geometry of the Cosmos

Preprint + formal Lean 4 verification of a speculative theoretical-physics framework, with explicit auditing of its own epistemic status.

**Author:** Armando Isai Mercado Esquivel
**License:** CC-BY-4.0 · **Language:** English (translated) · **Type:** Preprint

*[Leer en español](README.md)*

---

## 1. What this is

This repository contains a document (`geometria_relacional_del_cosmos.pdf`, in Spanish) that proposes a **discrete relational geometry** framework: a model where space is not made of points with position and mass, but of **nodes defined solely by their relations to one another**.

What sets this document apart from ordinary physics speculation is its **method**, not just its content: every claim in the text is tagged with its epistemic status, and those tags are taken seriously enough to be **formalized and logically verified** (see [§4](#4-the-lean-4-verification-step-by-step)).

## 2. The four epistemic tags

Every claim in the document carries one of these four marks:

| Tag | Meaning |
|---|---|
| `[MAT]` | Mathematics or physics **already proven** — established result, not original |
| `[AX]` | An **postulate** original to the framework, not derived from anything prior |
| `[CONJ]` | A **serious conjecture**, unresolved (original or from the literature) |
| `[⇒B]` | **Contradicts established physics** — the contradiction is flagged instead of hidden |

The `[⇒B]` tag is the interesting one: instead of discarding an idea that clashes with known physics, or ignoring the clash and moving on, the document **explicitly flags the contradiction** and contains it via paraconsistent logic (§3) so it doesn't poison the rest of the reasoning.

## 3. Why this doesn't collapse everything: the Belnap-Dunn bilattice

In classical logic, a contradiction implies *anything* (the principle of explosion / *ex falso quodlibet*): if you accept `A` and `¬A`, you can "prove" literally any proposition `C`. That would make tagging anything `[⇒B]` pointless — a single contradiction would trivialize the entire document.

The document avoids this by using **FDE (First-Degree Entailment)**, the consequence relation of the **four-valued Belnap-Dunn bilattice** (Belnap 1977), with four truth values instead of two:

- `T` — true
- `F` — false
- `N` — neither (no evidence)
- `B` — both (contradictory, but *contained*)

In FDE, a sentence with value `B` does **not** trigger logical explosion: from `A` and `¬A` (both valued `B`) an arbitrary conclusion `C` does **not** follow. This is exactly what is formally verified in Lean 4.

## 4. The Lean 4 verification, step by step

File: [`codigo_lean/fde_no_explosion.lean`](codigo_lean/fde_no_explosion.lean)

1. **Defines the type `V4`** with the four values `T`, `F`, `N`, `B` (section 1 of the file).
2. **Defines negation `neg`** and proves it is involutive (`neg (neg x) = x` for all four values) — section 2.
3. **Defines meet (`meet_t`) and join (`join_t`)** according to the truth order `≤_t`, where `F ≤_t {N, B} ≤_t T` and `N`, `B` are incomparable to each other — section 3.
4. **Proves `non_classical`**: that `N` and `B` are both distinct from `T` and `F`, i.e. the system genuinely has 4 distinguishable values and doesn't collapse to classical 2-valued logic — section 4.
5. **Defines `designated`**: which values count as "at least true" for the consequence relation (`T` and `B` are designated; `F` and `N` are not) — section 5.
6. **Main theorem `fde_no_explosion`**: builds an explicit countermodel where `A` takes value `B` (so `A` and `¬A` are both designated — the contradiction is "live") but there exists a conclusion `C` with value `F` (not designated). In other words: **`A, ¬A ⊭_FDE C`** for arbitrary `C` — section 6, the result that justifies every use of `[⇒B]` in the document.

### How to compile it yourself

The file was manually reviewed line by line (no `sorry`, no extra axioms), but it was **not compiled** in an actual Lean 4 environment before being uploaded (a limitation of the generation environment). Verifying it before citing it as a formally checked proof is recommended:

```bash
elan default leanprover/lean4:stable
lean codigo_lean/fde_no_explosion.lean
```

If something fails, the most likely fragile spot is the `simp [neg]` line inside the proof of `fde_no_explosion`; it can be replaced with `show designated B; trivial`.

## 5. Document contents (section map)

1. **Relational geometry** and its real-world analogues: causal sets (Sorkin), spin networks (loop quantum gravity), the ER=EPR conjecture, and the historical precedent of Ruđer Bošković (1758).
2. **The Belnap-Dunn bilattice** as a formal paraconsistent logic (see §3 above).
3–4. **Dimensional foliation and the Kaluza-Klein mechanism**: why "lossless energy restitution" contradicts energy-momentum conservation — naming the actual physical reservoir involved (the radion).
5. Why **mind-matter transduction via retrocausality** has no home in any serious physics program.
6. **Functional computationalism** as a consistent replacement.
7. The categorical distinction between **topological modularity** (Newman-Girvan) and **functional modularity** (Fodor), critically applied to structural comparisons between the brain connectome and the cosmic web of filaments (Vazza & Feletti, 2020).
8. **Integrated Information Theory** (IIT, Tononi) and its panpsychist implication, including the real scientific controversy (the 2023 open letter from 124 researchers).

## 6. Repository structure

```
.
├── geometria_relacional_del_cosmos.pdf   # the full preprint (Spanish)
├── codigo_lean/
│   └── fde_no_explosion.lean             # formal verification (§4)
├── README.md                             # Spanish documentation
└── README.en.md                          # this file
```

## 7. How to cite

```
Mercado Esquivel, Armando Isai. "Geometría Relacional del Cosmos: Un recorrido
honesto entre la especulación y la física establecida." (Preprint).
```

## 8. Note on process

The document was written with AI assistance (Claude, Anthropic) under the author's direction, review, and curation. All scientific literature references cited were verified against primary sources before inclusion.

## 9. License

[CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/) — you may share and adapt the content, with attribution to the author.
