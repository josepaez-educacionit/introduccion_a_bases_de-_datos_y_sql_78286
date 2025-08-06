create database ComercioIT;
use ComercioIT;

/*

drop database ComercioIT;
*/

-- Esto es un comentario de una linea
# Esto es otra forma de comentario de una linea
/*
	Esto es
	un comentario multilinea
*/

-- Crea la tabla Productos
CREATE TABLE Productos(
	idProducto INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Precio DOUBLE,
	Marca VARCHAR(30) NOT NULL,
	Categoria VARCHAR(30) NOT NULL,
	Stock INT NOT NULL,
	Disponible BOOLEAN DEFAULT FALSE
);

show databases;
show tables;

-- drop TABLE Productos;
-- drop table if exists Productos;

-- Crear la tabla Articulos
CREATE TABLE Articulos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL
);

-- Insertar registros en la tabla Articulos
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

-- Verificar los registros insertados
SELECT * FROM Articulos;
SELECT Nombre FROM Articulos;
SELECT Nombre, Precio FROM Articulos;

SELECT *, Precio * 1.25 as 'Precio con Aumento' FROM Articulos;

-- Crear la tabla Clientes
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

select * from Clientes;
select * from Clientes order by Id desc;
select Apellido, Nombre from Clientes order by Apellido, Nombre;
select Id, Apellido, Nombre, Provincia from Clientes order by Provincia, Apellido, Nombre;

