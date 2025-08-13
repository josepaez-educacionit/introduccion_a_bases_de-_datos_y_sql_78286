-- Modificación de estructuras
use comercioit;

desc productos;

#ALTER TABLE + ADD COLUMN
alter table productos add column Observaciones varchar(50) null;
desc productos;

#ALTER TABLE + ADD COLUMN + FIRST
alter table productos add column Primera varchar(50) null first;
desc productos;

#ALTER TABLE + ADD COLUMN + AFTER
alter table productos add column Siguiente varchar(50) null after nombre;
desc productos;

#ALTER TABLE + CHANGE
alter table productos change Observaciones Comentarios varchar(40) null ;
desc productos;

#ALTER TABLE + MODIFY
alter table productos modify Comentarios text null ;
describe productos;

#ALTER TABLE + DROP COLUMN
alter table productos drop column Comentarios;
alter table productos drop column Primera, drop column Siguiente;
describe productos;

# RENOMBRAR TABLAS
show tables;
alter table productos rename producto;

rename table producto to productos;

show tables;

-- AGREGAR / ELIMINAR RESTRICCIONES
describe productos;
alter table Productos modify IdProducto Int not null;
alter table Productos drop PRIMARY KEY;
alter table Productos modify IdProducto Int not null PRIMARY key AUTO_INCREMENT;

