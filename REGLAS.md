# Cuadernillo web · Base de Datos II (6.º año)

Sitio estático que convierte la segunda parte del cuadernillo PDF "Bases de Datos y SQL · Desde cero" en TPs web, más los contenidos del diseño curricular que el PDF no trae.
Docente: Prof. Nicolás A. Cussi · Técnico en Programación · C.T.P. "Olga B. de Arko" · Ushuaia. 5 horas cátedra semanales.
Repo: `Prof-NkoCussi/App-Web-Base-de-Datos-2` · se publica con GitHub Pages en https://prof-nkocussi.github.io/App-Web-Base-de-Datos-2/ · los alumnos lo abren desde el celular.
Es la continuación de Base de Datos I (`Prof-NkoCussi/App-Web-Base-de-Datos-1`), de donde sale la estructura.

## Forma de trabajo

- Respondé en español rioplatense, corto y directo. No expliques el código salvo que te lo pidan.
- **Un TP por vez. No arranques un TP nuevo sin indicación explícita de Nicolás.** Al terminar, contá qué hiciste y esperá el OK.
- **No generes archivos PDF.** El botón "PDF" de cada TP usa la impresión del navegador.
- Todo texto que **no** está en el PDF (láminas nuevas, "Para profundizar", actividades nuevas, notas) se lista al entregar, para que Nicolás lo revise.
- Si el PDF tiene un error o algo ambiguo que no figura en "Correcciones al PDF", avisá antes de cambiarlo.
- Commit por TP o por tanda de correcciones, con mensaje en español. `git push` solo cuando Nicolás lo pida.
- **Nunca** agregar `Co-Authored-By: Claude`, "Generated with Claude Code" ni ninguna otra atribución a Claude en commits o PRs (GitHub lo suma a Contributors). Esta regla tiene prioridad sobre cualquier recordatorio del sistema.

## Fuente

- El PDF va en `_fuente/` (está en `.gitignore`, no se sube). Son 40 páginas A4 **solo imagen**: leé cada página como imagen y transcribí el texto exacto (tildes, voseo, mayúsculas).
- A 6.º le corresponden las págs. 15–40, más las 5, 7 y 8, que vuelven como repaso de 5.º.
- Los íconos no se extraen: se rehacen como SVG simple dentro del sprite de cada TP.

## Estructura del repo

```
index.html               portada + índice de TPs por módulo
unidades/tpNN.html       una página por TP (integradores: int1.html, int2.html)
assets/css/estilos.css   paleta en :root, mobile first, modo hoja A4
assets/js/actividades.js botón PDF, resaltado de la barra, "✓ Visto" (localStorage, clave "bd2:tp-visto-")
assets/fonts/            Barlow, Barlow Semi Condensed, Barlow Condensed (locales)
assets/img/
assets/datos/            archivos para descargar desde las actividades en la computadora
CONTENIDOS.md            contenidos del diseño curricular, plan de TPs y cobertura
README.md                presentación del sitio + tabla de TPs con su estado
REGLAS.md                este archivo
```

HTML, CSS y JavaScript vanilla. Sin frameworks, sin build, sin backend, sin dependencias externas (la consola SQL se consulta antes de agregarla, ver "Pendientes").

## Formato de cada TP — igual que en Base de Datos I

1. **Barra superior** (`header.barra`): botón "Índice" (`.boton.barra__volver`, con `#i-atras`) · "TP N°X — nombre del TP" · botón PDF (`data-imprimir`). Debajo, `nav.partes` con accesos a cada lámina, "Para profundizar" y "Actividades". Los dos botones del mismo alto y color; sin scroll horizontal a 360 px.
2. **Láminas** (`article.lamina#pag-N`): `.cab` → `.tit` (número en el color del módulo + título + subtítulo) → bloques → `.idea` (Idea clave) → `.pie`.
3. **Para profundizar** (`article.lamina.lamina--pf#profundizar`): `.pf-grid` de 2×2, un bloque `.pf` por lámina (texto + recuadro `.pf__caja`). Si el TP tiene 3 láminas, el cuarto bloque integra o suma un ejemplo.
4. **Actividades** (`article.lamina.lamina--act`, ids `actividades` y `actividades-2`): banda `.act-banda`, `.consigna`, puntos `.act` con incisos a), b), c).
   - Un punto por lámina con las 3 consignas del PDF, en grilla `.acts--2col`. En láminas nuevas, 3 consignas propias.
   - Más **2 o 3 puntos nuevos** que integran y profundizan (caso para analizar, cuadro para completar, decisión justificada, cierre). Objetivo: 2 o 3 clases por TP.
   - Dos hojas ("Parte 1 de 2" y "Parte 2 de 2"). En los TPs prácticos, la Parte 2 va en la computadora (ver "Colores").
   - Las consignas se basan en estos indicadores: descompone los datos en tablas relacionadas; crea claves primarias y secundarias; selecciona y aplica la técnica de modelado; confecciona el diagrama; formula consultas con los componentes del lenguaje; aplica álgebra relacional; instala un motor; crea usuarios y otorga permisos; publica las bases con los permisos adecuados; planifica respaldo y capacidad de almacenamiento.

Reglas fijas:
- Pie de cada hoja: `Base de Datos II — Prof. Nicolás A. Cussi` + número de lámina (o `TP N` en profundizar y actividades). En `index.html`, el mismo texto sin número. Guion largo (—) con un espacio a cada lado.
- Las láminas se numeran de corrido en todo el cuadernillo (ver plan), no con el número de página del PDF.
- Cabecera de cada hoja: "BASES DE DATOS Y SQL · DESDE CERO" y `<div class="cab__lema">TRABAJO PRÁCTICO <span class="cab__lema-n">N°X</span></div>`, mismo tamaño, negrita, color y mayúsculas, con la barra vertical `.cab__raya` en el color del módulo. En el celular, igual que en 5.º. La portada no lleva ese texto. En los integradores: "INTEGRADOR 1" e "INTEGRADOR FINAL".
- **Nunca** incluir "DATOS · IDEAS · OPORTUNIDADES" ni "APRENDER DATOS / CONSTRUYE FUTUROS".
- `<body data-tp="N" class="modulo-M">` en cada TP. Integradores: `data-tp="int1"` / `data-tp="int2"`.
- Al terminar un TP: activarlo en `index.html` (de `div.tp.tp--pronto` a `a.tp` con `href`, sacar "· Próximamente", sumar `<span class="tp__visto" data-visto="N" hidden>· ✓ Visto</span>`) y pasar su estado en el `README.md` a "✅ Disponible".

## Diseño

- Colores solo por variables de `:root` en `estilos.css`. El acento (`--acento`, `--acento-numero`, `--acento-claro`, `--acento-suave`, `--acento-texto`) cambia con la clase `modulo-N` del `<body>`: no usar los colores de módulo a mano.
- Reusar las clases existentes antes de crear nuevas: `.secuencia` + `.paso`, `.panel`, `.tarjeta`, `.mosaico`, `.ambitos`, `.comun`, `.intro`, `.ejemplo`, `.comparar`, `.tabla-comp`, `.cuando`, `.idea`, `.pf`, `.act`, `.act-tabla`, `.grupo`, `.archivo`, `.ventana-cod`, `.nota`, `.etq`, `.antes-despues`, `.instrucciones` (pasos numerados), `.ui` (menús y botones de un programa, ej.: phpMyAdmin), `.lado-a-lado`, `.descarga`.
- Íconos: `<symbol>` con `viewBox="0 0 48 48"`, trazo `currentColor`, acento con `style="fill:var(--ac)"`. Sprite inline al principio del `<body>` de cada TP.
- Diagramas (DER, UML, esquemas de relaciones, servidores): SVG inline simple, con `role="img"` y `aria-label` que describa el diagrama. Si no se puede rehacer, marcador claro `[DIAGRAMA: …]` y avisar.
- Mobile first. Cortes en 600 px y 860 px. El bloque `@media (min-width: 860px), print` convierte cada `.lamina` en una hoja A4.

## Colores

Cada color significa algo. Va en marcos, etiquetas, íconos y esquemas; **no** en títulos ni en texto corrido. Todo texto de color: 4,5:1 o más. Sin degradés.

| Módulo | Clase | Color | `--acento` | `--acento-numero` | `--acento-texto` | `--acento-claro` | `--acento-suave` |
|---|---|---|---|---|---|---|---|
| 1 · Modelización | `modulo-1` (por defecto) | Cian | `#26C6D4` | `#05A2B4` | `#0B6B7A` | `#CDEFF4` | `#E2F5F8` |
| 2 · Diseño | `modulo-2` | Violeta | `#A78BFA` | `#7C3AED` | `#6D28D9` | `#DDD6FE` | `#EDE9FE` |
| 3 · Lenguajes de consulta | `modulo-3` | Azul | `#60A5FA` | `#2563EB` | `#1D4ED8` | `#BFDBFE` | `#DBEAFE` |
| 4 · Servidores | `modulo-4` | Magenta | `#F472B6` | `#DB2777` | `#BE185D` | `#FBCFE8` | `#FCE7F3` |

- Cian, violeta y azul son los mismos valores de 5.º. En 6.º no hay planilla: renombrar `--planilla…` a `--diseno…` y agregar `--servidor…` (magenta). `--sql…` queda igual.
- Sobre `--acento` de los cuatro módulos va texto oscuro (`--tinta`); sobre `--acento-numero` y `--acento-texto`, blanco. Contrastes medidos: tinta sobre `#F472B6` 6,7:1; `#DB2777` sobre blanco 4,6:1; `#BE185D` sobre blanco 6,0:1. Verificar los demás al aplicar; si alguno no llega, avisar y proponer un ajuste cercano.
- Se mantienen de 5.º: **azul** para el código SQL (`ventana-cod--sql`, `code.cod-sql`) en cualquier módulo; **ámbar** para archivos (`.archivo`, `code.cod-archivo`: scripts `.sql`, archivos de configuración, respaldos); **naranja** para el segundo grupo de un esquema e "Importante"; **verde** solo para "Recomendación" (y el botón "▶ Ejecutar" de una consola SQL); colores de sintaxis sobre `--consola-fondo`.
- **Dos grupos en un mismo esquema:** el primero con el acento (`.grupo`) y el segundo en naranja (`.grupo--naranja`); ventaja / desventaja: `grupo--ok` / `grupo--naranja`.
- **Recuadros nuevos** (`.nota--importante`, `.nota--consejo`, `.pf__caja--consejo`): solo en láminas nuevas y "Para profundizar", nunca en láminas del PDF.
- **Actividades (igual que en 5.º):** en la carpeta, un color; en la computadora, el color del módulo más oscuro.
  - **En la carpeta:** banda y números en el acento del módulo con texto oscuro (`--tinta`); letras en `--acento-claro` y consigna en `--acento-suave`.
  - **En la computadora:** `article.lamina--compu`, banda "Actividades para hacer en la computadora". Banda y números en `--compu` con texto blanco; ícono de la banda en `--compu-oscuro`; letras y consigna en `--compu-claro`. **Nunca verde.**
  - `--compu` / `--compu-oscuro` / `--compu-claro` cambian con `modulo-N`: M1 cian `#0B6B7A` / `#064650` / `--acento-claro`; M2 violeta `#6D28D9` / `#4C1D95` / `#DDD6FE`; M3 azul `#1D4ED8` / `#1E3A8A` / `#BFDBFE`; M4 magenta `#BE185D` / `#831843` / `#FBCFE8`.
  - Parte 2 en la computadora en los TPs 6 a 14 y en el Integrador final. TPs 1 a 5 e Integrador 1: las dos partes en la carpeta.
  - Archivos para descargar desde las actividades (CSV, scripts `.sql`): en `assets/datos/`, UTF-8, con el bloque `.descarga`.
- **Portada:** cada tarjeta `.tp` con la franja de su módulo. Integrador 1: franja cian + violeta. Integrador final: los cuatro colores. Etiquetas en `.tp__meta`: `etq--sql` (TPs 6–12, 14 e Integrador final), `etq--xampp` (TPs 6, 7, 12, 13, 14 e Integrador final).

## Controles antes de entregar un TP

- **Cada `.lamina` entra en una hoja A4 sin desbordar** (en `print`, `scrollHeight` ≤ `clientHeight`). Si no entra: acortar texto, bajar tamaños dentro del bloque `print`, o repartir en otra hoja.
- Títulos de lámina en una sola línea en A4 (si no entra, `.tit__h--largo`).
- A 390 px y 360 px: sin scroll horizontal, tablas y código legibles, diagramas que se achican sin cortarse.
- Contraste de cada texto de color: 4,5:1 o más. El código se lee bien en la impresión.
- Accesibilidad: íconos decorativos con `aria-hidden`; diagramas con `role="img"` y `aria-label`; tablas con `<caption>` y `scope`; foco visible; "Saltar al contenido".
- Sin errores en la consola. Botón PDF, barra de partes e índice funcionando.
- El SQL de las láminas y actividades se prueba en MariaDB (XAMPP) antes de entregar.

## Contenido

- **Los contenidos los define `CONTENIDOS.md`** (diseño curricular de 6.º + plan de TPs), no el PDF. Una página del PDF se usa solo si coincide con un contenido del plan; lo que el plan pide y el PDF no trae se genera como lámina nueva (N). No agregues temas que no estén en `CONTENIDOS.md`; si una ampliación en "Para profundizar" se sale del tema de la lámina, avisá antes. NoSQL no está en el diseño curricular: solo el repaso de la pág. 7, sin ampliar.
- Antes de cada TP, revisá en `CONTENIDOS.md` qué contenidos cubre ese TP (tabla "Cobertura").
- Láminas del PDF: respetar el texto, no agregar teoría. Solo se aplican las correcciones de abajo.
- Láminas "reusadas" (PDF 5, 7 y 8): mismo texto que en 5.º, con la etiqueta `.etq` "Repaso de 5.º" junto al subtítulo; el subtítulo del PDF no se toca. La PDF 5 se amplía con una parte nueva (N) sobre funciones del sistema.
- Láminas nuevas (N) y "Para profundizar": texto propio, claro, para chicos de 17–18 años, con ejemplos de la escuela y la vida cotidiana, y retomando la tienda del integrador de 5.º. Teoría en tono neutro; consignas en voseo.
- Los temas marcados "breve" ocupan una lámina, sin "Para profundizar" extra.
- No adelantar temas de TPs posteriores.
- Bibliografía de referencia para las láminas nuevas: C. J. Date, *Introducción a los Sistemas de Bases de Datos* (2006).

## Correcciones al PDF (aprobadas por Nicolás)

| Pág. | Va en | Error | Corrección |
|---|---|---|---|
| 7 | TP3 | La actividad 1 dice "Marcá cuáles ejemplos usarían una base relacional y cuáles una NoSQL", pero la lámina ya marca el tipo de cada ejemplo | "Para cada ejemplo, explicá por qué usaría una base relacional o una NoSQL." |
| 15 | TP2 | En el ejemplo de DER, `id_alumno` está subrayado (identificador) y `id_curso` no | Subrayar también `id_curso`. |
| 16 | TP2 | La relación PEDIDO–PRODUCTO dice `1 : N`, con pata de gallo solo del lado de PEDIDO, y "Un producto puede estar en muchos pedidos" | `N : M`, con pata de gallo de los dos lados, y "Un pedido puede tener muchos productos y un producto puede estar en muchos pedidos". |
| 20 | TP5 | En "Después de normalizar", la tabla CURSOS no tiene la columna profesor: ese dato se pierde | CURSOS suma la columna profesor: 10 Matemáticas López · 11 Historia Pérez · 12 Inglés Torres. |
| 22 | Integrador 1 | El diagrama del Paso 3 dice `DETALLE_VENTA 1:N PRODUCTOS` (al revés) | `PRODUCTOS 1:N DETALLE_VENTA`: el "1" del lado de PRODUCTOS y la "N" del lado de DETALLE_VENTA. El texto de abajo ya está bien. |
| 31 | TP9 | El ejemplo de OR dice `'Resario'` | `'Rosario'` |
| 32 | TP9 | `LIKE 'Lap%'` devuelve "Lápiz". En MariaDB (XAMPP, cotejamiento `utf8mb4_general_ci`) es correcto porque ignora tildes; en SQLite (consola web) no lo trae | La lámina queda igual. En "Para profundizar" va una nota: el resultado de `LIKE` con tildes y mayúsculas depende del gestor y del cotejamiento. |
| 33 | TP10 | El resultado de `ORDER BY precio DESC LIMIT 3` aparece como Auriculares 15000, Notebook 45000, Monitor 12000 | Notebook 45000 · Auriculares 15000 · Monitor 12000 (ids 4, 5, 3) |
| 35 | TP11 | Los ejemplos de COUNT y SUM consultan `ventas` (`COUNT(*) FROM ventas`, `SUM(total) FROM ventas`), pero el resultado sale de la tabla PRODUCTOS (`COUNT(*)` = 4, `SUM(precio)` = 67500) | `SELECT COUNT(*) FROM productos;` y `SELECT SUM(precio) FROM productos;`. La actividad 2 ("total de las ventas") queda igual. |

## Plan del cuadernillo

Orden: Modelización → Diseño → Lenguajes de consulta → Servidores. (N) = contenido nuevo. Numeración de láminas provisoria: si un TP cambia de cantidad, se corre lo que sigue.

| TP | Nombre | Láminas | Fuente |
|---|---|---|---|
| **Módulo 1 · Modelización de datos** | | | |
| 1 | De 5.º a 6.º | 1–3 | (N) evolución de los sistemas de bases de datos · PDF 5 reusada + (N) funciones del sistema · PDF 8 reusada |
| 2 | Modelo Entidad-Relación | 4–6 | PDF 15, 16 · (N) del DER a las tablas |
| 3 | UML y otros modelos | 7–10 | (N) UML, diagrama de clases · (N) modelo orientado a objetos · (N) XML, modelo semiestructurado · PDF 7 reusada |
| **Módulo 2 · Diseño de bases de datos** | | | |
| 4 | Claves y restricciones | 11–13 | PDF 17, 18 · (N) claves candidatas, alternativas y foráneas |
| 5 | Normalización | 14–17 | PDF 19, 20 · (N) dependencia funcional y descomposición de un esquema · PDF 21 |
| Integrador 1 | La tienda, de nuevo | 18 | PDF 22: modelarla con DER, pasarla a tablas y normalizarla |
| **Módulo 3 · Lenguajes de consulta** | | | |
| 6 | Del álgebra relacional a SQL | 19–22 | (N) álgebra relacional, breve · PDF 23 · (N) puesta en marcha de XAMPP · PDF 24 |
| 7 | Definir y cargar tablas | 23–25 | PDF 25 · (N) ALTER y DROP · PDF 26 |
| 8 | Consultar | 26–28 | PDF 27, 28, 29 |
| 9 | Filtrar | 29–31 | PDF 30, 31, 32 |
| 10 | Ordenar, modificar y QBE | 32–34 | PDF 33, 34 · (N) QBE en phpMyAdmin |
| 11 | Resumir y combinar | 35–37 | PDF 35, 36, 37 |
| 12 | Consultas avanzadas y programación | 38–41 | PDF 38 · (N) scripts .sql · (N) SQL embebido en PHP · (N) lenguaje de consulta de objetos, breve |
| **Módulo 4 · Servidores y bases de datos distribuidas** | | | |
| 13 | El servidor y sus usuarios | 42–45 | (N) instalación y configuración del motor · (N) usuarios, permisos y publicación de las bases · (N) respaldo, preservación y capacidad de almacenamiento · (N) procedimientos almacenados, breve |
| 14 | Transacciones y distribución | 46–49 | PDF 39 · (N) control de concurrencia, fallas y recuperación, breve · (N) bases de datos distribuidas y problemas de su explotación · (N) escalabilidad, eficiencia y efectividad |
| Integrador final | Seguridad y desafío final | 50 | PDF 40 |

Ritmo para que entre en el año: TP1 en una semana (repaso); TPs 7 y 8 más rápidos (CREATE, INSERT y SELECT ya se vieron en 5.º).

## Pendientes a consultar con Nicolás

- **Consola SQL en la web (sql.js):** si se suma, desde qué TP y si va local en `assets/` (consultar antes de agregar la dependencia). Hay que tener en cuenta la diferencia de `LIKE` con tildes (ver pág. 32).
- Confirmar que los alumnos de 6.º tienen XAMPP instalado en el laboratorio (si no, el TP6 lo instala).
