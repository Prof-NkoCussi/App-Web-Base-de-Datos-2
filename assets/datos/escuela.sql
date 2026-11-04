-- ==========================================================
-- Base de datos "escuela": alumnos, cursos e inscripciones
-- Base de Datos II · TP N°6 · Prof. Nicolás A. Cussi
-- Son las tablas del TP2 (lámina 6), con sus claves.
--
-- Para cargarla: en phpMyAdmin, pestaña Importar, elegí este
-- archivo y hacé clic en Importar. Si la importás de nuevo,
-- las tres tablas vuelven a quedar como al principio.
-- ==========================================================

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS escuela
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE escuela;

DROP TABLE IF EXISTS inscripciones;
DROP TABLE IF EXISTS alumnos;
DROP TABLE IF EXISTS cursos;

-- Entidades
CREATE TABLE alumnos (
  id_alumno INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE
);

CREATE TABLE cursos (
  id_curso INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  creditos INT NOT NULL
);

-- Tabla intermedia de la relación N:M (un alumno no se inscribe
-- dos veces en el mismo curso: id_alumno + id_curso es clave candidata)
CREATE TABLE inscripciones (
  id_inscripcion INT PRIMARY KEY,
  id_alumno INT NOT NULL,
  id_curso INT NOT NULL,
  UNIQUE (id_alumno, id_curso),
  FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Datos
INSERT INTO alumnos (id_alumno, nombre, email) VALUES
  (1, 'Ana', 'ana@mail.com'),
  (2, 'Luis', 'luis@mail.com'),
  (3, 'Marta', 'marta@mail.com');

INSERT INTO cursos (id_curso, nombre, creditos) VALUES
  (101, 'Matemática', 4),
  (102, 'Historia', 3),
  (103, 'Inglés', 2);

INSERT INTO inscripciones (id_inscripcion, id_alumno, id_curso) VALUES
  (1, 1, 101),
  (2, 2, 102),
  (3, 1, 102);
