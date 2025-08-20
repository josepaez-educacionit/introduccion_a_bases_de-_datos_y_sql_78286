use gestioncomercial;

-- Mostramos todos los registros de la tabla productos
select * from productos;

# count()
-- La función COUNT() se utiliza para contar la cantidad de registros en una tabla o el número de valores en una columna.

select count(*) from productos;

--  Ejemplo: Contar todos los registros en la tabla 
select count(*) as Cantidad from productos;

select * from Categorias where id = 3;
select count(*) as Cantidad from productos where categoria_id = 3;

select count(*) as Cantidad from productos where Precio >= 20000.00;

# sum()
-- La función SUM() se utiliza para sumar los valores de una columna numérica en una tabla.

select sum(precio) from productos;

select sum(precio) from productos where categoria_id = 3;


# min()
-- La función MIN() se utiliza para obtener el valor más bajo de una columna en una tabla.
select min(precio) from productos;

# max()
-- La función MAX() se utiliza para obtener el valor más alto de una columna en una tabla.
select max(precio) from productos;