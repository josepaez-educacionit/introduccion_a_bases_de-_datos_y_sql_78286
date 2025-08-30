Use veterinaria;

-- FUNCIONES INTEGRADAS DE TEXTO
/* 
Son funciones que permiten manipular cadenas de texto de diversas formas, 
facilitando tareas como la concatenación, búsqueda, reemplazo y modificación de texto.
*/

-- Concat
-- La función CONCAT se utiliza para concatenar dos o más cadenas de texto.

select concat('Hola', ' ', 'Mundo') as Saludo;

select 	concat(nombre, ' ', apellido) as NombreCompleto,
		concat('Estimado/a ', nombre, ' ', apellido, ' Nos dirigimos a Ud. para...') as Mensaje
from Clientes;

-- Concat_WS
-- La función CONCAT_WS concatena cadenas de texto con un separador especificado.
select concat_ws(' ', 'Hola', 'Mundo') as Saludo;

select 	id, tipo_documento, documento_identidad,
		concat_ws(' ', nombre, apellido) as NombreCompleto
from clientes;

select concat_ws(', ', id, documento_identidad, tipo_documento, nombre, apellido, telefono, email, calle, numero_direccion, ciudad, codigo_postal, activo, fecha_creacion, fecha_modificacion) as datos
from clientes;

-- Upper
-- La función UPPER convierte una cadena de texto a mayúsculas.
-- Se utiliza comúnmente para normalizar datos o para comparaciones insensibles a mayúsculas.
select upper('hola mundo') as Saludo;

select concat_ws(', ', upper(apellido), nombre ) as NombreCompleto
from clientes;

-- Lower
-- La función LOWER convierte una cadena de texto a minúsculas.
select lower('HOLA MUNDO') as Saludo;

select lower(apellido) as apellido, lower(nombre) as nombre
from clientes;

-- Left
-- La función LEFT devuelve los primeros N caracteres de una cadena de texto.
-- Se utiliza para extraer una parte específica de una cadena.
select left('Hola Mundo', 4) as Saludo;

select id, nombre, apellido, telefono, left(telefono, 2) as prefijo
from clientes;

-- Right
-- La función RIGHT devuelve los últimos N caracteres de una cadena de texto.
-- Se utiliza para extraer una parte específica del final de una cadena.
select right('Hola Mundo', 5) as Saludo;

select id, nombre, apellido, telefono, right(telefono, 4) as numero_final
from clientes;

-- Substring
-- La función SUBSTRING extrae una subcadena de una cadena de texto, comenzando en una posición específica y con una longitud determinada.

select substring('Hola Mundo', 1, 4) as Saludo;

select id, nombre, apellido, telefono, substring(telefono, 4, 4) as numero_area
from clientes;

-- Left, Substring, Right, 
select 	id, nombre, apellido, telefono, 
		left(telefono, 2) 			as prefijo,
		substring(telefono, 4, 4)	as numero_area,
		right(telefono, 4)			as numero_final
from clientes;

-- Char_Lenght
-- La función CHAR_LENGTH devuelve la longitud de una cadena de texto en caracteres.
select char_length('Hola Mundo') as Longitud;

select Id, nombre, descripcion, char_length(descripcion) as longitud
from servicios;

-- Locate
-- La función LOCATE busca una subcadena dentro de una cadena de texto y devuelve la posición de la primera aparición.
-- Si la subcadena no se encuentra, devuelve 0.
select locate('Mundo', 'Hola Mundo') as Posicion;

select 	Id, nombre, descripcion, 
		locate( 'perro', descripcion) as Posicion
from servicios;

-- Ltrim | RTrim | Trim
-- Las funciones LTRIM, RTRIM y TRIM se utilizan para eliminar espacios en blanco al inicio, al final o en ambos extremos de una cadena de texto.
select Ltrim('   Hola Mundo   ') as SinEspaciosIzquierda,
	   RTrim('   Hola Mundo   ') as SinEspaciosDerecha,
	    Trim('   Hola Mundo   ') as SinEspacios;

-- Replace
-- La función REPLACE reemplaza todas las ocurrencias de una subcadena dentro de una cadena de texto por otra subcadena.
select replace('Hola Mundo', 'Mundo', 'SQL') as Saludo;

select id, nombre, apellido, replace(calle, 'San', 'Gral. San'), numero_direccion
from	Clientes;