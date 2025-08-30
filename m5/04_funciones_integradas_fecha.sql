Use veterinaria;

-- Funciones integradas de fecha
-- Las funciones de fecha permiten manipular y extraer información de valores de fecha y hora en SQL.
select * from turnos;

-- Year()
-- Extrae el año de una fecha.
-- Devuelve el año de la fecha en formato YYYY.

select *, year(fecha) as año from turnos;

-- Month()
-- Extrae el mes de una fecha.
-- Devuelve el mes de la fecha en formato MM (1-12).

select *, month(fecha) as mes from turnos;

-- Day()
-- Extrae el día de una fecha.
select *, day(fecha) as dia from turnos;

-- Hour()
-- Extrae la hora de una fecha.
-- Devuelve la hora de la fecha en formato HH (0-23).
select *, Hour(fecha_modificacion) as hora from turnos;

-- CurDate()
-- Devuelve la fecha actual del sistema en formato YYYY-MM-DD.
select curdate() as FechaActual;

select * from turnos where id = 15;
update turnos set fecha = curdate() where id = 15;
select * from turnos where id = 15;

-- CurTime()  
-- Devuelve la hora actual del sistema en formato HH:MM:SS.
select curtime() as HoraActual;

select * from turnos where id = 15;
update turnos set hora = curtime() where id = 15;
select * from turnos where id = 15;

-- DateDiff
-- Calcula la diferencia entre dos fechas en días.
-- Devuelve el número de días entre las dos fechas especificadas.
select datediff('2025-08-28', '2000-01-01') as DiasTranscurridos;
select datediff(curdate(), '2025-01-01') as DiasTranscurridos;

-- TimeStampDiff()
-- Calcula la diferencia entre dos fechas en unidades específicas (años, meses, días, etc.).
-- Devuelve la diferencia entre las dos fechas en la unidad especificada.
select TimeStampDiff(year, '2000-01-01', curdate()) as Años;
select TimeStampDiff(month, '2000-01-01', curdate()) as Meses;
select TimeStampDiff(day, '2000-01-01', curdate()) as Dias;

-- DayName()
-- Devuelve el nombre del día de la semana para una fecha específica.
-- Por ejemplo, 'Monday', 'Tuesday', etc.
select dayname('2025-06-17') as NombreDiaSemana;
select dayname(curdate()) as NombreDiaSemana;

SELECT 
  CURDATE() AS Fecha,
  CASE WEEKDAY(CURDATE())
    WHEN 0 THEN 'lunes'
    WHEN 1 THEN 'martes'
    WHEN 2 THEN 'miércoles'
    WHEN 3 THEN 'jueves'
    WHEN 4 THEN 'viernes'
    WHEN 5 THEN 'sábado'
    WHEN 6 THEN 'domingo'
  END AS NombreDia;

-- MonthName()
-- Devuelve el nombre del mes para una fecha específica.
-- Por ejemplo, 'January', 'February', etc.
select monthname('2025-08-29') as NombreMes;

SELECT 
  CURDATE() AS Fecha,
  CASE MONTH(CURDATE())
    WHEN 1 THEN 'enero'
    WHEN 2 THEN 'febrero'
    WHEN 3 THEN 'marzo'
    WHEN 4 THEN 'abril'
    WHEN 5 THEN 'mayo'
    WHEN 6 THEN 'junio'
    WHEN 7 THEN 'julio'
    WHEN 8 THEN 'agosto'
    WHEN 9 THEN 'septiembre'
    WHEN 10 THEN 'octubre'
    WHEN 11 THEN 'noviembre'
    WHEN 12 THEN 'diciembre'
  END AS NombreMes;


