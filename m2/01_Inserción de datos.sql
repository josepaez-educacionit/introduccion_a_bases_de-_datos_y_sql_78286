-- Mostrar las Bases de Datos del servidor
show databases;

use comercioit;

-- Mostrar las tablas de la base de datos activa
show tables;

select * from productos;

desc productos;
describe productos;


# Manera Completa
-- Insertamos un registo sin asiganar el precio, por lo queda en Null el precio
INSERT INTO Productos (Nombre, Marca, Categoria, Stock, Disponible) VALUES
('Laptop HP 17', 'HP', 'Portátiles', 2, true);

INSERT INTO Productos ( Marca, Nombre, Categoria, Precio, Stock, Disponible) VALUES
					('Teclado', 'Laptop R9', 'Portátiles', 1200, 1, true);

INSERT INTO Productos (Nombre, Marca, Categoria, Stock) VALUES
					  ('Laptop Apple', 'Apple', 'Portátiles', 10);


# Manera SQL
INSERT INTO Productos 
SET Nombre = 'Antivirus', Marca = 'AVG', Categoria = 'Utilidades', Stock = 10, Disponible = true;

# Manera Simplificada
INSERT INTO Productos 
VALUES ( null, 'Mouse', 20, 'LG', 'Dispositivos', 0, false );


# Consulta de Datos Anexados

CREATE TABLE ClientesVIP (
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(50) NOT NULL, 
    Apellido VARCHAR(50) NOT NULL, 
    Email VARCHAR(100), 
    Telefono VARCHAR(20), 
    Ciudad VARCHAR(50), 
    Provincia VARCHAR(50), 
    CodigoPostal VARCHAR(10) 
);


show tables;

truncate table ClientesVIP;

insert into ClientesVIP (ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal)
select 					 ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal
from clientes;

insert into ClientesVIP (ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal)
select 					 ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal
from clientes where id = 23;

insert into ClientesVIP (ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal)
select 					 ID, Nombre, Apellido, Email, Telefono, Ciudad, Provincia, CodigoPostal
from clientes where id = 19;

desc Clientes;
select * from Clientes order by codigopostal;
select * from ClientesVIP;



/* 
PROMPT: 
Crear una sentencia INSERT que agregue 5 empleados.
Base de datos: MySQL.
Tabla: empleados.
Columnas especificadas:
	id → INT, AUTO_INCREMENT, PRIMARY KEY
	nombre → VARCHAR(50)
	apellido → VARCHAR(50)
	email → VARCHAR(100), UNIQUE, NOT NULL
	fecha_nacimiento → DATE
	posicion → VARCHAR(50)
	sueldo → DECIMAL(10,2)

Restricciones clave:
	id se genera automáticamente, por lo que no se incluirá en el INSERT.
	email debe ser único y no nulo.

Los datos deben respetar tipos y formatos (DATE en formato 'YYYY-MM-DD', DECIMAL(10,2) con dos decimales).
*/

-- =========================================
-- 1. Creación de la tabla empleados
-- =========================================
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    posicion VARCHAR(50),
    sueldo DECIMAL(10,2)
);

-- =========================================
-- 2. Inserción de 5 registros
-- =========================================
INSERT INTO empleados (nombre, apellido, email, fecha_nacimiento, posicion, sueldo)
VALUES
('Martín', 'González', 'martin.gonzalez@example.com', '1985-04-12', 'Analista de Sistemas', 185000.50),
('Laura', 'Pérez', 'laura.perez@example.com', '1990-07-23', 'Desarrolladora Backend', 210500.75),
('Diego', 'Fernández', 'diego.fernandez@example.com', '1988-11-05', 'Administrador de Redes', 198000.00),
('Sofía', 'Martínez', 'sofia.martinez@example.com', '1993-02-17', 'Diseñadora UX/UI', 175300.25),
('Carlos', 'Ramírez', 'carlos.ramirez@example.com', '1982-09-29', 'Gerente de Proyectos', 255800.90);

SELECT * FROM empleados;



/*
Prompt: 
	Genera una sentencia SQL para insertar 5 artículos en la tabla Articulos en MySQL. La tabla tiene las siguientes columnas: 
		nombre (VARCHAR(100)), categoria (VARCHAR(50)), precio (DECIMAL(10,2)), stock (INT), y disponible (BOOLEAN). 
        Los valores deben ser realistas y variados para cada artículo."
*/

-- =========================================
-- 1. Creación de la tabla Articulos
-- =========================================
CREATE TABLE OtrosArticulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT,
    disponible BOOLEAN
);

-- =========================================
-- 2. Inserción de 5 artículos
-- =========================================
INSERT INTO OtrosArticulos (nombre, categoria, precio, stock, disponible)
VALUES
('Notebook Lenovo IdeaPad 3', 'Tecnología', 459999.99, 15, TRUE),
('Silla Ergonómica Oficina', 'Muebles', 85000.50, 8, TRUE),
('Smartphone Samsung Galaxy A34', 'Tecnología', 299999.90, 25, TRUE),
('Cafetera Express Philips', 'Electrodomésticos', 120000.75, 5, FALSE),
('Zapatillas Adidas Runfalcon', 'Calzado', 55000.00, 30, TRUE);
