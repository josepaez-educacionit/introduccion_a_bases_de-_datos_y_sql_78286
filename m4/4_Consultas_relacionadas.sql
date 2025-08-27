use laboratorio;

-- Consultas básicas para visualizar los datos cargados
select * from Marcas;
select * from Productos; 

-- Producto Cartesiano
-- Es una combinación de todas las filas de una tabla con todas las filas de otra tabla.
-- Se utiliza para obtener todas las combinaciones posibles de filas entre dos tablas.
select 	* 
from Productos, Marcas 
order by idProducto, idmarca; 

-- Cross Join
SELECT *
FROM Productos
CROSS JOIN Marcas;

-- Composición Interna (JOIN implícito)
-- Permite obtener los datos de las tablas relacionadas usando la cláusula WHERE para unirlas por la clave foránea.
select 	* 
from Productos, Marcas 
where Productos.Marca = Marcas.idmarca
order by idProducto, idmarca; 

-- Composición Interna usando alias
-- Utiliza alias para simplificar la consulta y mejorar la legibilidad.

select 	* 
from Productos as P, Marcas as M
where P.Marca = M.idmarca
order by P.idProducto, M.idmarca; 

