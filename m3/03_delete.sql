use GestionComercial;

SELECT * FROM Clientes_Copia;

delete from Clientes_Copia where id = 10;

delete from Clientes_Copia where id in ( 11, 12);

delete from Clientes_Copia where id = 100;

-- Eliminamos todos los registros de la tabla 
delete from Clientes_Copia;

-- Insertamos todos los registros de la tabla Cliente_Copia desde Clientes
insert into Clientes_Copia
select * from Clientes;

-- Eliminamos todos los registros de la tabla 
truncate table Clientes_Copia;

SELECT * FROM Clientes_Copia;
desc Clientes_Copia;

alter table Clientes_Copia
modify ID INT AUTO_INCREMENT PRIMARY KEY;

insert into Clientes_Copia (nombre, correo_electronico, telefono) values
('Juan Perez', 'jperez@yahoo.com', '+543543123456');

delete from Clientes_Copia;

truncate table Clientes_Copia;
