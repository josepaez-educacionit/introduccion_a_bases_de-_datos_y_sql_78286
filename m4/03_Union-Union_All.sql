use laboratorio;

show tables;

-- Consultas básicas para visualizar los datos cargados
select * from nacimientos_mujeres_2020;
select * from nacimientos_varones_2020;

-- UNION
-- La cláusula UNION se utiliza para combinar los resultados de dos o más consultas SELECT.
-- Las consultas deben tener el mismo número de columnas y los tipos de datos deben ser compatibles.
-- La cláusula UNION elimina los duplicados por defecto.

-- Combina los registros de ambas tablas en un solo conjunto de resultados, eliminando duplicados.
select * from nacimientos_mujeres_2020
union
select * from nacimientos_varones_2020;

-- Combina los registros de ambas tablas, mostrando solo las columnas especificadas.
select nombre, apellido, provincia, fecha_nacimiento from nacimientos_mujeres_2020
union
select nombre, apellido, provincia, fecha_nacimiento from nacimientos_varones_2020;

-- Combina los IDs de ambas tablas en un solo conjunto de resultados.
select Id from nacimientos_mujeres_2020
union
select Id from nacimientos_varones_2020;

-- Combina los registros de ambas tablas que cumplen con las condiciones especificadas.
select * from nacimientos_varones_2020 where provincia = 'Tucumán'
union
select * from nacimientos_mujeres_2020 where provincia = 'Buenos Aires';

-- Combina las provincias de ambas tablas, eliminando duplicados.
select provincia from nacimientos_mujeres_2020
union
select provincia from nacimientos_varones_2020;


-- Operador UNION ALL se utiliza para combinar los resultados de dos o más consultas SELECT, incluyendo duplicados.
select provincia from nacimientos_mujeres_2020
union all
select provincia from nacimientos_varones_2020
order by provincia
;