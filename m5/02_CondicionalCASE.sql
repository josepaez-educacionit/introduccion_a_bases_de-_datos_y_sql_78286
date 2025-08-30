use veterinaria;

-- Condicional CASE
-- El condicional CASE permite realizar comparaciones y 
-- devolver valores específicos basados en condiciones.

select *,
case 
	when precio < 1000 then 'barato'
    when precio between 1000 and 2500  then 'equilibrado'
    else 'Caro'
end as Categoria
from servicios;

-- Descuento en servicios según precio
SELECT 
    nombre,
    precio,
    CASE
        WHEN precio >= 1000 THEN '20% de descuento'
        WHEN precio BETWEEN 500 AND 999 THEN '10% de descuento'
        ELSE 'Sin descuento'
    END AS politica_descuento
FROM servicios
order by Precio;