/-
  fde_no_explosion.lean

  Autor del marco teórico: Armando Isai Mercado Esquivel
  Extraído de: "Geometría Relacional del Cosmos" (Sección 2)

  Propósito
  ---------
  Este archivo formaliza el bilátice tetravalente de Belnap-Dunn (FOUR),
  V4 = {T, F, N, B}, y demuestra que la relación de consecuencia FDE
  (First-Degree Entailment) NO valida la explosión lógica (ex falso
  quodlibet): de una contradicción (una sentencia con valor B) no se
  puede derivar cualquier sentencia arbitraria.

  Esto es lo que permite que un marco teórico contenga postulados que
  contradicen física establecida (marcados como B — "contradicción,
  contenida sin explotar") sin que el sistema completo se vuelva
  lógicamente trivial.

  Referencias
  -----------
  - Belnap, N. (1977). "A Useful Four-Valued Logic". En Modern Uses of
    Multiple-Valued Logic, Dunn & Epstein (eds).
  - Ginsberg, M. (1988). "Multivalued logics: A uniform approach to
    reasoning in artificial intelligence". Computational Intelligence.
  - Fitting, M. (1989). "Bilattices and the semantics of logic
    programming". Journal of Logic Programming.
-/

-- ============================================================
-- 1. El tipo de los cuatro valores de verdad
-- ============================================================

inductive V4 : Type
  | T  -- Verdadero
  | F  -- Falso
  | N  -- Ninguno (ni verdadero ni falso; sin evidencia)
  | B  -- Ambos (verdadero y falso a la vez; contradictorio)
deriving DecidableEq, Repr

namespace V4

-- ============================================================
-- 2. Negación: la única involución que invierte el orden de
--    verdad (≤_t) y preserva el orden de información (≤_k)
-- ============================================================

def neg : V4 → V4
  | T => F
  | F => T
  | N => N
  | B => B

theorem neg_involutive : ∀ x : V4, neg (neg x) = x := by
  intro x
  cases x <;> rfl

-- ============================================================
-- 3. Conjunción y disyunción según el orden de verdad ≤_t
--    (F ≤_t N,B ≤_t T, con N y B incomparables entre sí)
-- ============================================================

def meet_t : V4 → V4 → V4  -- ∧
  | T, x => x
  | x, T => x
  | F, _ => F
  | _, F => F
  | N, B => F
  | B, N => F
  | N, N => N
  | B, B => B

def join_t : V4 → V4 → V4  -- ∨
  | F, x => x
  | x, F => x
  | T, _ => T
  | _, T => T
  | N, B => T
  | B, N => T
  | N, N => N
  | B, B => B

theorem meet_t_comm : ∀ x y : V4, meet_t x y = meet_t y x := by
  intro x y
  cases x <;> cases y <;> rfl

-- ============================================================
-- 4. Consistencia no trivial: el sistema realmente tiene 4
--    valores distinguibles, no colapsa a lógica clásica de 2
-- ============================================================

theorem non_classical :
    neg N = N ∧ neg B = B ∧ N ≠ T ∧ N ≠ F ∧ B ≠ T ∧ B ≠ F := by
  refine ⟨rfl, rfl, ?_, ?_, ?_, ?_⟩ <;> decide

-- ============================================================
-- 5. Valores designados: lo que cuenta como "al menos
--    verdadero" en la semántica de consecuencia FDE
-- ============================================================

def designated : V4 → Prop
  | T => True
  | B => True
  | F => False
  | N => False

instance : DecidablePred designated := by
  intro x
  cases x <;> simp [designated] <;> infer_instance

-- ============================================================
-- 6. TEOREMA PRINCIPAL: la explosión lógica (ex falso quodlibet)
--    NO es válida en FDE.
--
--    Countermodelo explícito: existe una valuación donde A y ¬A
--    son ambos designados (A toma valor B, que es "al menos
--    verdadero" según §5), pero una conclusión C independiente
--    NO es designada (C toma valor F).
--
--    Consecuencia: A, ¬A ⊭_FDE C para C arbitraria.
--    Esto es lo que permite que el marco teórico contenga
--    axiomas con valor B sin que el sistema completo colapse.
-- ============================================================

theorem fde_no_explosion :
    ∃ (vA vC : V4), designated vA ∧ designated (neg vA) ∧ ¬ designated vC := by
  use B, F
  refine ⟨trivial, ?_, ?_⟩
  · show designated (neg B)
    simp [neg]        -- neg B = B, y B es designado
  · simp [designated]  -- F no es designado

end V4

-- ============================================================
-- Nota de verificación: este archivo fue revisado manualmente
-- línea por línea (no contiene `sorry` ni axiomas adicionales),
-- pero NO fue compilado en un entorno con Lean 4 instalado antes
-- de este depósito (restricción del entorno de generación). El
-- razonamiento es lo suficientemente simple (tipo finito de 4
-- elementos, tácticas `rfl`/`decide`/`simp` estándar) como para
-- que la compilación sea muy probablemente exitosa tal cual —
-- pero "muy probablemente" no es "verificado", y esa distinción
-- importa. Se recomienda compilar localmente antes de citar este
-- archivo como prueba verificada en cualquier contexto formal:
--
--   elan default leanprover/lean4:stable
--   lean fde_no_explosion.lean
--
-- Si algo no compila, el punto más frágil probable es la línea
-- `simp [neg]` en la prueba de fde_no_explosion — si falla, basta
-- reemplazarla por `show designated B; trivial` como alternativa
-- explícita.
-- ============================================================
