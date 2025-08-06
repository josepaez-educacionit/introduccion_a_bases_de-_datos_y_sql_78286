/*
  Script de creación y manipulación de la base de datos ComercioIT
  Descripción: Este script crea la base de datos ComercioIT, sus tablas principales y realiza inserciones y consultas básicas.
*/

-- Crear la base de datos principal
create database ComercioIT;

-- Seleccionar la base de datos para trabajar
use ComercioIT;

/*
  Si necesitas eliminar la base de datos para reiniciar el entorno, descomenta la siguiente línea:
  drop database ComercioIT;
*/

-- Ejemplos de comentarios en SQL:
-- Esto es un comentario de una línea usando '--'.
# Esto es otra forma de comentario de una línea usando '#'.
/*
  Esto es
  un comentario multilinea
*/

-- Crear la tabla Productos para almacenar información de los productos disponibles
CREATE TABLE Productos(
    idProducto INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Identificador único del producto
    Nombre VARCHAR(50) NOT NULL, -- Nombre del producto
    Precio DOUBLE, -- Precio del producto
    Marca VARCHAR(30) NOT NULL, -- Marca del producto
    Categoria VARCHAR(30) NOT NULL, -- Categoría a la que pertenece el producto
    Stock INT NOT NULL, -- Cantidad disponible en inventario
    Disponible BOOLEAN DEFAULT FALSE -- Indica si el producto está disponible para la venta
);

-- Mostrar todas las bases de datos existentes
show databases;
-- Mostrar todas las tablas creadas en la base de datos actual
show tables;

-- Si necesitas eliminar la tabla Productos, puedes usar alguna de las siguientes opciones:
-- drop TABLE Productos;
-- drop table if exists Productos;

-- Crear la tabla Articulos para registrar productos específicos y sus precios
CREATE TABLE Articulos (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del artículo
    Nombre VARCHAR(100) NOT NULL, -- Nombre descriptivo del artículo
    Precio DECIMAL(10, 2) NOT NULL -- Precio del artículo con dos decimales
);

-- Insertar registros de ejemplo en la tabla Articulos
INSERT INTO Articulos (Nombre, Precio) VALUES
('Yerba Mate 1kg', 2999.00), 
('Dulce de Leche 400g', 1790.00), 
('Alfajor de Chocolate', 1349.00), 
('Vino Malbec Reserva 750ml', 9690.00), 
('Fernet 750ml', 12500.00), 
('Galletitas Criollitas 170g', 750.00), 
('Asado de Tira (kg)', 12310.00), 
('Tapas para Empanadas 12 Unidades', 1565.00), 
('Queso Cremoso (kg)', 8450.00), 
('Facturas Docena', 10270.00); 

-- Consultas para verificar los registros insertados en la tabla Articulos
SELECT * FROM Articulos; -- Muestra todos los campos de todos los artículos
SELECT Nombre FROM Articulos; -- Muestra solo los nombres de los artículos
SELECT Nombre, Precio FROM Articulos; -- Muestra nombre y precio de cada artículo

-- Consulta que muestra todos los campos y el precio con un aumento del 25%
SELECT *, Precio * 1.25 as 'Precio con Aumento' FROM Articulos;

-- Crear la tabla Clientes para almacenar información de los clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(50) NOT NULL, 
    Apellido VARCHAR(50) NOT NULL, 
    Email VARCHAR(100), 
    Telefono VARCHAR(20), 
    Ciudad VARCHAR(50), 
    Provincia VARCHAR(50), 
    CodigoPostal VARCHAR(10) 
);

-- Consultas para visualizar y ordenar los registros de la tabla Clientes
select * from Clientes; -- Muestra todos los clientes
select * from Clientes order by Id desc; -- Muestra los clientes ordenados por ID descendente
select Apellido, Nombre from Clientes order by Apellido, Nombre; -- Muestra apellido y nombre ordenados alfabéticamente
select Id, Apellido, Nombre, Provincia from Clientes order by Provincia, Apellido, Nombre; -- Muestra clientes ordenados por provincia y luego por apellido y nombre