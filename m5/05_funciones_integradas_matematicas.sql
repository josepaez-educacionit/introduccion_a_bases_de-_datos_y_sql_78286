use veterinaria;

-- Funciones integradas de matemáticas
-- Son funciones que permiten realizar operaciones matemáticas comunes, como redondeo, cálculo de potencias y restos de división.

-- Round()
-- La función ROUND redondea un número al entero más cercano o a un número específico de decimales.

select 	id, nombre, precio, 
		round( precio * 1.27, 2 )	as PrecioAumentado, 
        round( Precio / 3, 2 )		as PrecioConDecimales
from servicios;

-- Ceil()
-- La función CEIL redondea un número hacia arriba al entero más cercano.
select 	id, nombre, precio, 
		precio / 3			as PrecioEjemplo, 
		ceil( precio / 3 )	as PrecioRedondeado
from servicios;

-- Floor()
-- La función FLOOR redondea un número hacia abajo al entero más cercano.
select 	id, nombre, precio, 
		precio / 3			as PrecioEjemplo, 
		floor( precio / 3 )	as PrecioRedondeado
from servicios;

-- Mod()
-- La función MOD devuelve el resto de la división de dos números.
select mod(11, 4) as Resto;

-- Pow()
-- La función POW eleva un número a la potencia especificada.
select pow(2, 8);