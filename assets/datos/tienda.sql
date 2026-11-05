-- ==========================================================
-- Base de datos "tienda": clientes, productos, ventas y detalle
-- Base de Datos II · TP N°8 · Prof. Nicolás A. Cussi
-- Son las tablas del Integrador 1 (lámina 18), con sus claves.
-- clientes suma la columna edad (lámina 28). Se usa en los TPs 8 a 11.
--
-- Para cargarla: en phpMyAdmin, pestaña Importar, elegí este
-- archivo y hacé clic en Importar. Si ya tenés la base tienda
-- del TP7, sus cuatro tablas se borran y se crean de nuevo.
-- Si la importás otra vez, vuelven a quedar como al principio.
-- ==========================================================

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS tienda
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE tienda;

DROP TABLE IF EXISTS detalle_venta;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

-- Entidades
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  email VARCHAR(120) UNIQUE,
  ciudad VARCHAR(60),
  edad INT
);

CREATE TABLE productos (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0
);

CREATE TABLE ventas (
  id_venta INT PRIMARY KEY,
  id_cliente INT NOT NULL,
  fecha DATE NOT NULL,
  total DECIMAL(10,2),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Qué productos lleva cada venta (relación N:M entre ventas y productos)
CREATE TABLE detalle_venta (
  id_venta INT,
  id_producto INT,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2),
  PRIMARY KEY (id_venta, id_producto),
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Datos (Martín no tiene email: queda en NULL)
INSERT INTO clientes (id_cliente, nombre, email, ciudad, edad) VALUES
  (1, 'Ana', 'ana@mail.com', 'Ushuaia', 28),
  (2, 'Carlos', 'carlos@mail.com', 'Tolhuin', 35),
  (3, 'Laura', 'laura@mail.com', 'Río Grande', 22),
  (4, 'Pedro', 'pedro@mail.com', 'Ushuaia', 40),
  (5, 'Sofía', 'sofia@mail.com', 'Río Grande', 31),
  (6, 'Martín', NULL, 'Ushuaia', 19),
  (7, 'Valentina', 'valentina@mail.com', 'Buenos Aires', 45),
  (8, 'Julián', 'julian@mail.com', 'Río Gallegos', 26);

INSERT INTO productos (id_producto, nombre, precio, stock) VALUES
  (101, 'Teclado', 40000, 10),
  (102, 'Mouse', 25000, 25),
  (103, 'Monitor', 180000, 5),
  (104, 'Auriculares', 15000, 12),
  (105, 'Notebook', 850000, 3),
  (106, 'Pendrive', 8000, 30),
  (107, 'Mouse pad', 4500, 40),
  (108, 'Cable HDMI', 6000, 20);

-- Primero las ventas; después, su detalle
INSERT INTO ventas (id_venta, id_cliente, fecha, total) VALUES
  (1, 1, '2026-03-02', 65000),
  (2, 2, '2026-03-05', 192000),
  (3, 1, '2026-03-10', 24000),
  (4, 5, '2026-03-16', 44500);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, subtotal) VALUES
  (1, 101, 1, 40000),
  (1, 102, 1, 25000),
  (2, 103, 1, 180000),
  (2, 108, 2, 12000),
  (3, 106, 3, 24000),
  (4, 104, 1, 15000),
  (4, 107, 1, 4500),
  (4, 102, 1, 25000);
