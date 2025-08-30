Use veterinaria;

-- Subconsultas
-- Una subconsulta es una consulta SQL anidada dentro de otra consulta.
-- Se utiliza para realizar operaciones más complejas, como filtrar resultados basados en criterios de otra consulta.

-- Subconsulta de Cliente que tienen turnos
select * from clientes 
where id in ( select cliente_id from turnos );

-- Subconsulta de Cliente que no tienen turnos
select * from clientes 
where id not in ( select cliente_id from turnos );


-- SubConsulta escalar
select * from servicios 
where precio > ( select avg(precio) from servicios )
order by precio;
