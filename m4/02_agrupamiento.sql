use gestioncomercial;

show tables;

-- Consultas básicas para visualizar los datos cargados
select * from ProductosAux;

# Cláusula GROUP BY
-- La cláusula GROUP BY se utiliza para agrupar los resultados de una consulta en base a una o varias columnas.

-- Agrupar los productos por categoria
select 	Categoria, 
		sum(stock) as CantStock,
		count(*) as Cantidad
from ProductosAux 
group by Categoria;

-- Agrupar los productos por marca
select Marca, sum(stock) as CantStock from ProductosAux 
group by Marca;


--  Obtener múltiples estadísticas por categoría
select 
    Categoria, 
    count(*) as Cantidad, 					-- Cantidad de productos por categoría
    sum(Stock) as TotStock, 				-- Suma total del stock por categoría
    sum(Precio * Stock) as StockValorizado 	-- Valor total del stock por categoría
from ProductosAux 
group by Categoria;

# Group by + Having
-- La cláusula HAVING se utiliza para filtrar los resultados de una consulta después de aplicar la cláusula GROUP BY.

--  Filtrar categorías con un stock total mayor a 120, excluyendo la categoría "Smartphone"
select	Categoria, sum(Stock) as TotStock 
from 	ProductosAux 
where	Categoria <> 'Smartphone'
group by Categoria having sum(Stock) > 120;

/*
Prompt 1:
	Hacer una query para una base de datos en MySQL donde muestre la cantidad de clientes que hay por país.
 */   
 
SELECT pais, COUNT(*) AS cantidad_clientes
FROM clientes
GROUP BY pais
ORDER BY cantidad_clientes DESC;

/*
Prompt 2:
	Hacer una query para una base de datos en MySQL que muestre la fecha del primer cliente y la fecha del último cliente (el más reciente).    
*/
SELECT
    MIN(fecha_registro) AS fecha_del_primer_cliente,
    MAX(fecha_registro) AS fecha_del_ultimo_cliente
FROM clientes;