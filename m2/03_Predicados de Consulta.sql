-- Predicados de Consulta
use comercioit;


select * from articulos;

-- Clausula Where

-- Operadores de comparacion
select * from articulos where Id = 3;
select * from articulos where Id > 3;
select * from articulos where Id < 3;
select * from articulos where Id >= 3;
select * from articulos where Id <= 3;
select * from articulos where Id <> 3;

-- Operadores Logicos

-- AND
-- Es un operador lógico que se utiliza para combinar dos o más condiciones en una consulta SQL. 
-- Devuelve verdadero solo si todas las condiciones son verdaderas.

-- tabla de verdad
-- a 		b 		resultado
-- true		true	true
-- true		false	false
-- false	true	false
-- false	false	false

-- Select * from Usuarios where Usuario=<valorA> and Contraseña = <valorB>

select * from productos;
select * from productos where precio >= 100 and stock = 1;

-- OR
-- Es un operador lógico que se utiliza para combinar dos o más condiciones en una consulta SQL. 
-- Devuelve verdadero si al menos una de las condiciones es verdadera.

-- tabla de verdad
-- a 		b 		resultado
-- true		true	true
-- true		false	true
-- false	true	true
-- false	false	false

select * from productos;
select * from productos where (Stock < 2) or (Stock > 5) order by Stock;

-- NOT
-- Es un operador lógico que se utiliza para invertir el valor de una condición en una consulta SQL. 
-- Devuelve verdadero si la condición es falsa y viceversa.

-- tabla de verdad
-- x 		resultado
-- true		false
-- false	true

select * from productos where NOT (idProducto = 4);

-- BETWEEN
-- Es un operador lógico que se utiliza para filtrar resultados dentro de un rango específico en una consulta SQL. 
-- Devuelve verdadero si el valor se encuentra dentro del rango, incluyendo los límites.

select * from articulos where precio between 2000 and 9000;

-- NOT BETWEEN
select * from articulos where precio not between 2000 and 9000;

-- IN 
-- Es un operador lógico que se utiliza para filtrar resultados que coinciden con un conjunto específico de valores en una consulta SQL. 
-- Devuelve verdadero si el valor se encuentra en la lista de valores especificada.

select * from articulos where Id in (3, 5, 10);

-- NOT IN 
select * from articulos where Id not in (3, 5, 10);

-- LIKE
-- Es un operador lógico que se utiliza para filtrar resultados que coinciden con un patrón específico en una consulta SQL. 
-- Devuelve verdadero si el valor se encuentra en el patrón especificado.

select * from articulos where Nombre like 'A%';
select * from articulos where Nombre like '%A';
select * from articulos where Nombre like '%A%';
select * from articulos where Nombre like '%1%';

-- NOT LIKE
select * from articulos where Nombre not like '%A%';

--  IS NULL
-- Es un operador lógico que se utiliza para filtrar resultados que tienen un valor nulo en una consulta SQL. 
-- Devuelve verdadero si el valor es nulo.

SELECT * FROM productos where Precio is null;

--  IS NOT NULL
SELECT * FROM productos where Precio is not null;

