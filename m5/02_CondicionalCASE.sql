use veterinaria;

select *,
case 
	when precio < 1000 then 'barato'
    when precio between 1000 and 2500  then 'equilibrado'
    else 'Caro'
end as Categoria
from servicios;