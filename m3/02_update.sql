use GestionComercial;


SELECT * FROM Clientes;

update Clientes set correo_electronico = 'lucia.castro@hotmail.com' where Id = 100;

update Clientes 
set nombre = 'Carolina Andrea Morales',
	correo_electronico = 'carolina.morales@gmail.com' 
where Id = 14;

update Clientes_Copia
set nombre = 'Carolina Andrea Morales',
	correo_electronico = 'carolina.morales@gmail.com' 
;

select * from Clientes_Copia;


-- Se desactiva el modo seguro de SQL para permitir actualizaciones masivas
SET sql_safe_updates = 0;

-- Se vuelve a activar el modo seguro de SQL
SET sql_safe_updates = 1;
