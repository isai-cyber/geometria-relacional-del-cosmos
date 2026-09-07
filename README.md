# Geometría Relacional del Cosmos

Preprint + verificación formal en Lean 4 de un marco especulativo de física teórica, con auditoría explícita de su propio estatus epistémico.

**Autor:** Armando Isai Mercado Esquivel
**Licencia:** CC-BY-4.0 · **Idioma:** Español · **Tipo:** Preprint

---

## 1. Qué es esto

Este repositorio contiene un documento (`geometria_relacional_del_cosmos.pdf`) que propone un marco de **geometría relacional discreta**: un modelo donde el espacio no está hecho de puntos con posición y masa, sino de **nodos definidos únicamente por sus relaciones entre sí**.

Lo que distingue a este documento de una especulación física común es su **método**, no solo su contenido: cada afirmación del texto está etiquetada según su estatus epistémico, y esas etiquetas se toman en serio hasta el punto de **formalizarlas y verificarlas lógicamente** (ver [§4](#4-la-verificación-en-lean-4-paso-a-paso)).

## 2. Las cuatro etiquetas epistémicas

Cada afirmación del documento lleva una de estas cuatro marcas:

| Etiqueta | Significado |
|---|---|
| `[MAT]` | Matemática o física **ya demostrada** — resultado establecido, no propio |
| `[AX]` | **Postulado** propio del marco, no derivado de nada anterior |
| `[CONJ]` | **Conjetura seria** pero no resuelta (propia o de la literatura) |
| `[⇒B]` | **Contradice física establecida** — se marca la contradicción en vez de ocultarla |

La etiqueta `[⇒B]` es la interesante: en lugar de descartar una idea que choca con física conocida, o de ignorar el choque y seguir como si nada, el documento **marca la contradicción explícitamente** y la contiene mediante lógica paraconsistente (§3) para que no arruine el resto del razonamiento.

## 3. Por qué esto es posible sin que todo colapse: el bilátice de Belnap-Dunn

En lógica clásica, una contradicción implica *cualquier cosa* (principio de explosión / *ex falso quodlibet*): si aceptas `A` y `¬A`, puedes "demostrar" literalmente cualquier proposición `C`. Eso haría inútil marcar algo como `[⇒B]` — bastaría una sola contradicción para volver trivial todo el documento.

El documento evita esto usando **FDE (First-Degree Entailment)**, la lógica de consecuencia del **bilátice tetravalente de Belnap-Dunn** (Belnap 1977), con cuatro valores de verdad en vez de dos:

- `T` — verdadero
- `F` — falso
- `N` — ninguno (sin evidencia)
- `B` — ambos (contradictorio, pero *contenido*)

En FDE, una sentencia con valor `B` **no** dispara explosión lógica: de `A` y `¬A` (ambos con valor `B`) **no** se sigue una conclusión `C` arbitraria. Esto es lo que se verifica formalmente en Lean 4.

## 4. La verificación en Lean 4, paso a paso

Archivo: [`codigo_lean/fde_no_explosion.lean`](codigo_lean/fde_no_explosion.lean)

1. **Se define el tipo `V4`** con los cuatro valores `T`, `F`, `N`, `B` (sección 1 del archivo).
2. **Se define la negación `neg`** y se prueba que es involutiva (`neg (neg x) = x` para los cuatro valores) — sección 2.
3. **Se definen conjunción (`meet_t`) y disyunción (`join_t`)** según el orden de verdad `≤_t`, donde `F ≤_t {N, B} ≤_t T` y `N`, `B` son incomparables entre sí — sección 3.
4. **Se prueba `non_classical`**: que `N` y `B` son ambos distintos de `T` y de `F`, es decir, que el sistema realmente tiene 4 valores distinguibles y no colapsa a lógica clásica de 2 valores — sección 4.
5. **Se define `designated`**: qué valores cuentan como "al menos verdadero" para la relación de consecuencia (`T` y `B` son designados; `F` y `N` no) — sección 5.
6. **Teorema principal `fde_no_explosion`**: se construye un contramodelo explícito donde `A` toma valor `B` (por lo tanto `A` y `¬A` son ambos designados — la contradicción está "activa") pero existe una conclusión `C` con valor `F` (no designada). Es decir: **`A, ¬A ⊭_FDE C`** para `C` arbitraria — sección 6, el resultado que justifica todo el uso de `[⇒B]` en el documento.

### Cómo compilarlo tú mismo

El archivo fue revisado manualmente línea por línea (sin `sorry` ni axiomas extra), pero **no fue compilado** en un entorno con Lean 4 antes de subirse (limitación del entorno donde se generó). Se recomienda verificarlo antes de citarlo como prueba formal:

```bash
elan default leanprover/lean4:stable
lean codigo_lean/fde_no_explosion.lean
```

Si algo falla, el punto más frágil probable es la línea `simp [neg]` dentro de la prueba de `fde_no_explosion`; puede reemplazarse por `show designated B; trivial`.

## 5. Contenido del documento (mapa de secciones)

1. **Geometría relacional** y sus análogos reales: conjuntos causales (Sorkin), redes de espín (gravedad cuántica de bucles), la conjetura ER=EPR, y el antecedente histórico de Ruđer Bošković (1758).
2. **El bilátice de Belnap-Dunn** como lógica paraconsistente formal (ver §3 arriba).
3–4. **Foliación dimensional y mecanismo de Kaluza-Klein**: por qué una "restitución de energía sin pérdida" contradice la conservación de energía-momento — nombrando el reservorio físico real involucrado (el radión).
5. Por qué la **transducción mente-materia vía retrocausalidad** no tiene refugio en ningún programa físico serio.
6. El **computacionalismo funcional** como alternativa consistente.
7. La distinción categorial entre la **modularidad topológica** (Newman-Girvan) y la **modularidad funcional** (Fodor), aplicada críticamente a comparaciones entre el conectoma cerebral y la red cósmica de filamentos (Vazza & Feletti, 2020).
8. La **Teoría de la Información Integrada** (IIT, Tononi) y su implicación panpsiquista, incluyendo la controversia científica real (carta de 124 investigadores, 2023).

## 6. Estructura del repositorio

```
.
├── geometria_relacional_del_cosmos.pdf   # el preprint completo
├── codigo_lean/
│   └── fde_no_explosion.lean             # verificación formal (§4)
└── README.md                             # este archivo
```

## 7. Cómo citar

```
Mercado Esquivel, Armando Isai. "Geometría Relacional del Cosmos: Un recorrido
honesto entre la especulación y la física establecida." (Preprint).
```

## 8. Nota sobre el proceso

El documento fue redactado con asistencia de IA (Claude, Anthropic) bajo dirección, revisión y curaduría del autor. Todas las referencias a literatura científica citadas fueron verificadas contra fuentes primarias antes de su inclusión.

## 9. Licencia

[CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/) — puedes compartir y adaptar el contenido, dando crédito al autor.
