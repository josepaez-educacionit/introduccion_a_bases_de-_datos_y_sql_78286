use veterinaria;

INSERT INTO `clientes` (`documento_identidad`, `tipo_documento`, `nombre`, `apellido`, `telefono`, `email`, `calle`, `numero_direccion`, `ciudad`, `codigo_postal`) VALUES 
('987654321', 'dni', 'Juan', 'Valdez', '11-5234-9876', 'juan.valdez@yahoo.com.ar', 'San Martín', 854, 'Buenos Aires', '1000');

INSERT INTO `especies` (`nombre`, `descripcion`) VALUES 
('Rara', 'Especie no conocida - Mascota fuera de lo común');

-- ¿Qué es un JOIN?
-- Un JOIN es una operación que permite combinar filas de dos o más tablas en base a una condición de relación.
-- Se utiliza para obtener datos relacionados de diferentes tablas en una sola consulta.
-- Tipos principales de JOIN: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN.

# INNER JOIN | JOIN
/* 
El INNER JOIN devuelve únicamente las filas que tienen coincidencias en ambas tablas. 
Es el tipo de JOIN más restrictivo.

	SELECT columnas
	FROM tabla1
	INNER JOIN tabla2 ON tabla1.campo = tabla2.campo;
    
Cuándo Usar INNER JOIN:
	Cuando necesitas información completa de ambas tablas
	Para reportes donde solo importan registros con relación válida
	En consultas de integridad donde ambas entidades deben existir    
*/

-- Obtener todas las mascotas con información de sus propietarios
/*
Resultado:
	✅ Incluye: Solo mascotas que tienen un cliente asignado
	❌ Excluye: Mascotas sin cliente (huérfanas del sistema)
	❌ Excluye: Clientes sin mascotas
*/

SELECT 
    m.nombre AS mascota,
    m.genero,
    m.peso,
    c.nombre AS propietario_nombre,
    c.apellido AS propietario_apellido,
    c.telefono
FROM mascotas m
INNER JOIN clientes c ON m.cliente_id = c.id;

#  LEFT JOIN (LEFT OUTER JOIN)
/*
El LEFT JOIN devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. 
Si no hay coincidencia, las columnas de la tabla derecha aparecen como NULL.

SELECT columnas
FROM tabla1
LEFT JOIN tabla2 ON tabla1.campo = tabla2.campo;

Cuándo Usar LEFT JOIN
	Para listados completos de la entidad principal
	Análisis de completitud (clientes sin mascotas, servicios sin uso)
*/

-- Obtener todos los clientes, tengan o no mascotas registradas
/*
Resultado:
	✅ Incluye: Todos los clientes (tabla izquierda)
	✅ Incluye: Sus mascotas si las tienen
	🔄 NULL: Para clientes sin mascotas, las columnas de mascota aparecen como NULL
*/
SELECT 
    c.nombre AS cliente,
    c.apellido,
    c.telefono,
    m.nombre AS mascota
FROM clientes c
LEFT JOIN mascotas m ON c.id = m.cliente_id
ORDER BY c.apellido, c.nombre;

# RIGHT JOIN (RIGHT OUTER JOIN)
/*
El RIGHT JOIN devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda. 
Es menos común que LEFT JOIN.

SELECT columnas
FROM tabla1
RIGHT JOIN tabla2 ON tabla1.campo = tabla2.campo;

Cuándo Usar RIGHT JOIN:
	Menos frecuente en la práctica
	Cuando la lógica de consulta favorece la tabla derecha
	Generalmente se prefiere reescribir como LEFT JOIN intercambiando las tablas
*/

-- Obtener todas las especies, tengan o no razas definidas
/*
Resultado
	✅ Incluye: Todas las especies (tabla derecha)
	✅ Incluye: Sus razas si las tienen
	🔄 NULL: Para especies sin razas, las columnas de raza aparecen como NULL
*/
SELECT 
    e.nombre AS especie,
    e.descripcion,
    r.nombre AS raza
FROM razas r
RIGHT JOIN especies e ON r.especie_id = e.id
ORDER BY e.nombre, r.nombre;

# CROSS JOIN
/*
El CROSS JOIN produce el producto cartesiano entre dos tablas: cada fila de la primera tabla se combina con cada fila de la segunda tabla.

SELECT columnas
FROM tabla1
CROSS JOIN tabla2;

Cuándo Usar CROSS JOIN
	- Matrices de análisis (combinaciones veterinario-servicio)
    - Análisis combinatorio en general
*/

-- Generar una matriz de todos los veterinarios con todos los servicios
/*
Resultado
	✅ Incluye: Todas las combinaciones posibles
	⚠️ Cuidado: Puede generar un número muy grande de filas
*/
select 
    concat(v.apellido, ', ', v.nombre) as veterinario,
    v.especialidad,
	s.nombre AS servicio,
    s.precio
from veterinarios v
cross join servicios s
order by  veterinario;

# Consulta con Múltiples JOINs

-- Información completa de turnos con todos los datos relacionados
select 	
        concat(v.apellido, ', ', v.nombre) as Veterinario, v.matricula,
		t.fecha, t.hora, 
		et.nombre as EstadoTurno,
		concat(c.apellido, ', ', c.nombre) as Cliente, c.telefono,
        m.nombre as Mascota,
        s.nombre as Servicio,
        t.costo_total,
        t.observaciones
from turnos t
	inner join estados_turno et on t.estado_turno_id = et.id
    inner join veterinarios v on t.veterinario_id = v.id
    inner join clientes c on t.cliente_id = c.id
    inner join mascotas m on t.mascota_id = m.id
    inner join servicios s on t.servicio_id = s.id
order by   Veterinario, t.fecha, t.hora  
;



