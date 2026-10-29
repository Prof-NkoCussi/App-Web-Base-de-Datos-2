# Contenidos · Base de Datos II (6.º año)

Fuente de los contenidos del cuadernillo. Manda sobre el PDF: ver la regla en `REGLAS.md`, sección "Contenido".

## Diseño curricular

### Módulo Diseño de bases de datos

Diseño de bases de datos, dependencia funcional, formas normales, descomposición de un esquema, claves primarias y secundarias.

### Módulo Modelización de datos

Modelización de datos, modelos conceptuales (E/R, UML), modelo orientado a objetos, modelo relacional, modelos semiestructurados (XML). Concepto y evolución de los sistemas de bases de datos, sus componentes, funciones de un sistema de base de datos.

### Módulo Lenguajes de consulta

Lenguajes de consulta (SQL, QBE), definición de datos, álgebra relacional, formulación de consultas, lenguaje de actualización, restricciones, integridad, SQL embebido en un lenguaje imperativo; scripts. Introducción a un lenguaje de consulta de objetos. Sintaxis de los lenguajes estructurados de consultas. Consultas de creación, acceso y modificación de tablas. Consultas de selección de datos. Consultas combinadas. Consultas de reemplazo y eliminación de datos.

### Módulo Bases de datos distribuidas

Procedimientos almacenados. Servidores de bases de datos, instalación, configuración y operación. Procesamiento de transacciones, fallas y recuperación, control de concurrencia. Bases de datos distribuidas, problemas que surgen con su explotación. Problemas de escalabilidad, eficiencia y efectividad. Privacidad, integridad, seguridad y preservación de la información.

## Plan de TPs

El orden es Modelización → Diseño → Lenguajes de consulta → Servidores.

(N) = contenido nuevo, que no está en el PDF.

“Reusada” = página que ya vieron en 5.º y vuelve como repaso.

### Módulo 1 · Modelización de datos

**TP1 · De 5.º a 6.º (láminas 1–3)**
- Evolución de los sistemas de bases de datos (N)
- PDF 5 reusada, ampliada con las funciones del sistema (N)
- PDF 8 reusada (modelo relacional)

**TP2 · Modelo Entidad-Relación (láminas 4–6)**
- PDF 15: introducción al DER
- PDF 16: cómo interpretar un DER
- Del DER a las tablas (N)

**TP3 · UML y otros modelos (láminas 7–10)**
- UML, diagrama de clases (N)
- Modelo orientado a objetos (N)
- XML, modelo semiestructurado (N)
- PDF 7 reusada (relacionales y NoSQL)

### Módulo 2 · Diseño de bases de datos

**TP4 · Claves y restricciones (láminas 11–13)**
- PDF 17: NOT NULL, UNIQUE, DEFAULT, CHECK
- PDF 18: integridad referencial
- Claves candidatas, alternativas y foráneas (N)

**TP5 · Normalización (láminas 14–17)**
- PDF 19: redundancia
- PDF 20: normalización
- Dependencia funcional y descomposición de un esquema (N)
- PDF 21: 1FN, 2FN, 3FN

**Integrador 1 · La tienda, de nuevo (lámina 18)**
- PDF 22: modelarla con DER, pasarla a tablas y normalizarla

### Módulo 3 · Lenguajes de consulta

**TP6 · Del álgebra relacional a SQL (láminas 19–22)**
- Álgebra relacional, breve (N)
- PDF 23: qué es SQL
- Puesta en marcha de XAMPP (N)
- PDF 24: familias de comandos

**TP7 · Definir y cargar tablas (láminas 23–25)**
- PDF 25: CREATE
- ALTER y DROP (N)
- PDF 26: INSERT

**TP8 · Consultar (láminas 26–28)**
- PDF 27: SELECT
- PDF 28: columnas y alias
- PDF 29: WHERE

**TP9 · Filtrar (láminas 29–31)**
- PDF 30: operadores de comparación
- PDF 31: AND, OR, NOT
- PDF 32: LIKE, IN, BETWEEN

**TP10 · Ordenar, modificar y QBE (láminas 32–34)**
- PDF 33: ORDER BY, LIMIT
- PDF 34: UPDATE, DELETE
- QBE en phpMyAdmin (N)

**TP11 · Resumir y combinar (láminas 35–37)**
- PDF 35: COUNT, SUM, AVG, MIN, MAX
- PDF 36: GROUP BY, HAVING
- PDF 37: INNER JOIN, LEFT JOIN

**TP12 · Consultas avanzadas y programación (láminas 38–41)**
- PDF 38: subconsultas y CTE
- Scripts .sql (N)
- SQL embebido en PHP (N)
- Lenguaje de consulta de objetos, breve (N)

### Módulo 4 · Servidores y bases de datos distribuidas

**TP13 · El servidor y sus usuarios (láminas 42–45)**
- Instalación y configuración del motor (N)
- Usuarios, permisos y publicación de las bases (N)
- Respaldo y capacidad de almacenamiento (N)
- Procedimientos almacenados, breve (N)

**TP14 · Transacciones y distribución (láminas 46–49)**
- PDF 39: transacciones, COMMIT, ROLLBACK
- Control de concurrencia, fallas y recuperación, breve (N)
- Bases de datos distribuidas (N)
- Escalabilidad y eficiencia (N)

**Integrador final · Seguridad y desafío final (lámina 50)**
- PDF 40

Total: 14 TPs y 2 integradores, con 50 láminas.

Ritmo para que entre en el año: el TP1 se da en una semana porque es repaso. Los TPs 7 y 8 van más rápido porque CREATE, INSERT y SELECT ya los vieron en 5.º.

## Cobertura: contenido del diseño curricular → TP

| Contenido | TP |
|---|---|
| Concepto y evolución de los sistemas de bases de datos, componentes, funciones | TP1 |
| Modelo relacional | TP1 (repaso) · TP2 (del DER a las tablas) |
| Modelización de datos, modelos conceptuales: E/R | TP2 |
| UML, modelo orientado a objetos, modelos semiestructurados (XML) | TP3 |
| Claves primarias y secundarias | TP4 (las secundarias: foráneas, candidatas y alternativas) |
| Restricciones, integridad | TP4 (y en SQL: TP7, al crear tablas) |
| Diseño de bases de datos, dependencia funcional, formas normales, descomposición de un esquema | TP5 · Integrador 1 |
| Álgebra relacional | TP6 |
| Lenguajes de consulta (SQL), sintaxis de los lenguajes estructurados de consultas | TP6 a TP12 |
| Definición de datos; consultas de creación, acceso y modificación de tablas | TP7 |
| Formulación de consultas; consultas de selección de datos | TP8 · TP9 |
| Lenguaje de actualización; consultas de reemplazo y eliminación de datos | TP7 (INSERT) · TP10 (UPDATE, DELETE) |
| QBE | TP10 |
| Consultas combinadas | TP11 (JOIN) · TP12 (subconsultas) |
| SQL embebido en un lenguaje imperativo; scripts | TP12 |
| Introducción a un lenguaje de consulta de objetos | TP12 |
| Servidores de bases de datos: instalación, configuración y operación | TP13 |
| Procedimientos almacenados | TP13 |
| Preservación de la información | TP13 (respaldo) · ajuste 1 |
| Procesamiento de transacciones, fallas y recuperación, control de concurrencia | TP14 |
| Bases de datos distribuidas y problemas que surgen con su explotación | TP14 · ajuste 2 |
| Problemas de escalabilidad, eficiencia y efectividad | TP14 · ajuste 3 |
| Privacidad, integridad, seguridad | Integrador final (PDF 40) |

NoSQL no figura en el diseño curricular: entra solo como repaso de 5.º (PDF 7, TP3), sin ampliar.

## Ajustes al plan para que cubra todo el diseño curricular

1. **TP13:** la lámina de respaldo se llama "Respaldo, preservación y capacidad de almacenamiento".
2. **TP14:** la lámina de bases distribuidas incluye "problemas que surgen con su explotación".
3. **TP14:** la lámina de escalabilidad pasa a "Escalabilidad, eficiencia y efectividad".
