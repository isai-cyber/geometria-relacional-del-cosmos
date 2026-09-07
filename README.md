# Paquete de depósito — Zenodo

Este paquete está listo para subirse a **https://zenodo.org/deposit/new**. Zenodo no lee automáticamente los metadatos de un ZIP subido manualmente (eso solo ocurre si conectas un repositorio de GitHub a Zenodo) — así que copia los campos de abajo directamente en el formulario web. El archivo `.zenodo.json` incluido ya sirve para eso si en el futuro conectas este mismo contenido a un repositorio de GitHub.

## Pasos para subir

1. Entra a zenodo.org, inicia sesión (o crea cuenta con tu correo).
2. Click en **New upload**.
3. Arrastra `geometria_relacional_del_cosmos.pdf` (el `.zenodo.json` y este README no hace falta subirlos como archivos del depósito — son solo referencia para ti, aunque no hay problema en incluirlos también).
4. Completa el formulario con los campos exactos de abajo (cópialos y pégalos).
5. En **Communities**, puedes dejarlo vacío o buscar una comunidad afín (ej. "Philosophy of Science", si existe activa).
6. Click **Publish**. Obtendrás un DOI permanente (formato `10.5281/zenodo.XXXXXXX`) en segundos, con fecha y autoría registradas de forma inmutable.

## Campos para copiar al formulario

**Título:**
```
Geometría Relacional del Cosmos: Un recorrido honesto entre la especulación y la física establecida
```

**Autor(es):**
```
Mercado Esquivel, Armando Isai
```
*(Zenodo pide formato "Apellido(s), Nombre(s)". Si tienes ORCID, agrégalo aquí — te dará crédito de autoría vinculado permanentemente a tu perfil académico.)*

**Tipo de subida:** Publication → Preprint

**Fecha de publicación:** la fecha en que subas (por defecto)

**Descripción:** (copia el contenido del campo `description` en `.zenodo.json` — está en HTML simple, Zenodo lo interpreta bien)

**Licencia recomendada:** Creative Commons Attribution 4.0 (CC-BY-4.0) — permite que otros citen y reutilicen tu trabajo dándote crédito, que es lo estándar para preprints académicos.

**Idioma:** Spanish

**Palabras clave (una por línea en el formulario):**
```
gravedad cuántica
conjuntos causales
redes de espín
lógica paraconsistente
bilátice de Belnap-Dunn
Lean 4
teoría de la información integrada
panpsiquismo
modularidad de redes
filosofía de la ciencia
epistemología formal
Kaluza-Klein
```

**Nota de transparencia (recomendado incluir en el campo de notas/comentarios de Zenodo):**
```
Documento generado con asistencia de IA (Claude, Anthropic) bajo dirección,
revisión y curaduría del autor. Todas las referencias a literatura científica
citadas fueron verificadas contra fuentes primarias antes de su inclusión.
```
Incluir esto no resta valor a tu autoría intelectual del marco y la dirección
del trabajo — la transparencia sobre el uso de IA es cada vez más estándar y
esperada en depósitos académicos, y su ausencia es más riesgosa para tu
credibilidad futura que su presencia.

---

## Sobre los otros dos pasos que mencionaste

**PhilSci-Archive** (philsci-archive.pitt.edu): a diferencia de Zenodo, tiene moderación humana antes de publicar — revisan que el tema encaje en filosofía de la ciencia. Este documento encaja razonablemente bien por su tratamiento explícito de estatus epistémico (MAT/AX/CONJ) como método, aunque el contenido de física especulativa (foliación, transducción mente-materia) podría generar preguntas del moderador sobre el propósito del documento — vale la pena tener a mano una respuesta corta de una frase sobre el objetivo metodológico (auditoría epistémica formal de marcos especulativos) al enviarlo, ya que ese es el argumento más defendible del conjunto.

**Extraer el Lean a GitHub:** el archivo `codigo_lean/fde_no_explosion.lean` en este mismo paquete ya está extraído y listo — contiene la prueba completa de que el sistema no colapsa por explosión lógica pese a contener contradicciones (Sección 2 del documento). **Nota de honestidad:** no pude compilarlo en este entorno (el instalador de Lean 4 requiere un dominio de red no accesible aquí), así que está revisado manualmente pero no verificado por el compilador — el archivo incluye instrucciones y una alternativa de respaldo por si la línea más frágil no compila tal cual. Verifícalo localmente antes de citarlo como "prueba verificada" en cualquier contexto formal. Puedes crear un repositorio nuevo en GitHub, subir ese archivo junto con un `README.md` propio, y opcionalmente conectar ese repositorio a Zenodo después (Zenodo tiene integración nativa con GitHub vía webhooks) para que cada release del repo genere automáticamente un DOI versionado — ahí es donde el archivo `.zenodo.json` de este paquete se vuelve funcional de verdad, no solo referencia.
