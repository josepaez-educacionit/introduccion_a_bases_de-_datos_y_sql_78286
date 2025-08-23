use gestioncomercial;

-- Las funciones de agregado permiten realizar cálculos sobre un conjunto de valores y devolver un único valor.

-- Mostramos todos los registros de la tabla productos
select * from productos;
select * from articulos;

# count()
-- La función COUNT() se utiliza para contar la cantidad de registros en una tabla o el número de valores en una columna.

select count(*) from productos;
select count(*) from articulos;
select count(*) from articulos where stock < 100;

--  Ejemplo: Contar todos los registros en la tabla 
select count(*) as Cantidad from productos;
select * from Categorias where id = 3;

select count(*) as Cantidad from productos where categoria_id = 3;
select count(*) as Cantidad from productos where Precio >= 20000.00;

# sum()
-- La función SUM() se utiliza para sumar los valores de una columna numérica en una tabla.

select sum(precio) from productos;
select sum(precio) from productos where categoria_id = 3;

--  Obtener el total de precio de artículos
select sum(precio) as Total from articulos;

--  Obtener el total de stock de artículos
select sum(stock) as Total from articulos;

--  Obtener el valor total del stock valorizado de artículos
select sum( precio * stock ) as TotalValorizado from articulos;
select round( sum( precio * stock ), 2) as TotalValorizado from articulos;

select round( sum( precio * stock ), 2) as TotalValorizado from articulos
where ArticuloId in (16, 27) -- 16: Queso Cremoso Ilolay | 27: Crema La Serenísima
;

# min()
-- La función MIN() se utiliza para obtener el valor más bajo de una columna en una tabla.
select min(precio) from productos;
select min(stock) as MinStock from articulos;
select * from articulos where stock = 17;

# max()
-- La función MAX() se utiliza para obtener el valor más alto de una columna en una tabla.
select max(precio) from productos;
select max(stock) as MaxStock from articulos;
select * from articulos where stock = 500;

# avg()
-- La función AVG() se utiliza para obtener el promedio de los valores de una columna en una tabla.

--  Obtener el precio promedio de los artículos
select avg(precio) as Promedio from articulos;

--  Mostrar los artículos cuyo precio es mayor al promedio
select * from articulos
where precio > ( select avg(precio) as Promedio from articulos )
order by precio
;

-- Obtener múltiples estadísticas de la columna Stock
select
	count(*) as Cantidad,
    sum(stock) as CantStock,
    min(stock) as MinStock,
    max(stock) as MaxStock,
    avg(stock) as PromStock
from Articulos;    
    
    