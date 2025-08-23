use laboratorio;

-- ¿Qué es un JOIN?
-- Un JOIN es una operación que permite combinar filas de dos o más tablas en base a una condición de relación.
-- Se utiliza para obtener datos relacionados de diferentes tablas en una sola consulta.
-- Tipos principales de JOIN: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN.

-- Ejemplo 1: JOIN implícito (composición interna)
-- Selecciona todos los productos y su marca asociada, solo para los productos cuya marca tiene idMarca = 1.
select * 
from Productos, Marcas
where Productos.Marca = Marcas.idMarca
	and Productos.Marca = 1;

-- Ejemplo 2: JOIN explícito (sintaxis moderna)
-- Hace lo mismo que el ejemplo anterior, pero usando la sintaxis JOIN.
select *
from Productos
	join Marcas on Productos.Marca = Marcas.idMarca
where Productos.Marca = 1;