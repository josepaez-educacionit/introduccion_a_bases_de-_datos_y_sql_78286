-- CREATE DATABASE Laboratorio;
use Laboratorio;

show databases;

-- Creamos la tabla nacimientos_varones_2020 para almacenar información de los nacimientos de varones en el año 2020
CREATE TABLE nacimientos_varones_2020 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    provincia VARCHAR(50),
    localidad VARCHAR(50),
    peso_nacimiento DECIMAL(4,2),
    documento_padre CHAR(8),
    documento_madre CHAR(8),
    establecimiento_salud VARCHAR(100)
);

-- Creamos la tabla nacimientos_mujeres_2020 para almacenar información de los nacimientos de mujeres en el año 2020
CREATE TABLE nacimientos_mujeres_2020 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    provincia VARCHAR(50),
    localidad VARCHAR(50),
    peso_nacimiento DECIMAL(4,2),
    documento_padre CHAR(8),
    documento_madre CHAR(8),
    establecimiento_salud VARCHAR(100)
);

-- Insertamos registros de ejemplo en la tabla nacimientos_varones_2020
INSERT INTO nacimientos_varones_2020 
(nombre, apellido, fecha_nacimiento, provincia, localidad, peso_nacimiento, documento_padre, documento_madre, establecimiento_salud)
VALUES
('Mateo', 'González', '2020-01-15', 'Buenos Aires', 'La Matanza', 3.45, '29123123', '31245678', 'Hospital Italiano'),
('Benjamín', 'Rodríguez', '2020-02-20', 'Córdoba', 'Villa Carlos Paz', 3.10, '30111222', '31456789', 'Sanatorio Allende'),
('Santino', 'López', '2020-03-05', 'Santa Fe', 'Rosario', 3.20, '28889999', '32233444', 'Hospital de Niños Zona Norte'),
('Thiago', 'Martínez', '2020-04-10', 'Mendoza', 'Godoy Cruz', 3.00, '30000111', '33000111', 'Hospital Central'),
('Dylan', 'Gómez', '2020-05-03', 'Salta', 'Salta Capital', 3.50, '30111233', '32345678', 'Clínica del Valle'),
('Lautaro', 'Díaz', '2020-06-08', 'Tucumán', 'San Miguel de Tucumán', 2.95, '29456789', '31567890', 'Hospital Avellaneda'),
('Lucas', 'Fernández', '2020-07-21', 'Neuquén', 'Neuquén Capital', 3.25, '28000011', '31777888', 'Policlínico Neuquén'),
('Joaquín', 'Pérez', '2020-08-13', 'Chubut', 'Comodoro Rivadavia', 3.40, '29654321', '31654321', 'Hospital Regional'),
('Ian', 'Morales', '2020-09-11', 'San Juan', 'Rivadavia', 3.18, '28334455', '31998877', 'Clínica Santa Rosa'),
('Emiliano', 'Sosa', '2020-10-02', 'Corrientes', 'Corrientes Capital', 3.05, '30112233', '31234567', 'Hospital Pediátrico Juan Pablo II'),
('Bruno', 'Ramos', '2020-11-14', 'Formosa', 'Formosa Capital', 3.60, '29557766', '32445678', 'Hospital de Alta Complejidad'),
('Gael', 'Romero', '2020-12-25', 'Entre Ríos', 'Paraná', 2.90, '29788877', '31678901', 'Hospital San Martín'),
('Franco', 'Molina', '2020-04-28', 'La Pampa', 'Santa Rosa', 3.15, '30121212', '32121212', 'Hospital Lucio Molas'),
('Tomás', 'Ruiz', '2020-06-15', 'Jujuy', 'San Salvador de Jujuy', 3.33, '28987654', '31112233', 'Hospital Pablo Soria'),
('Simón', 'Navarro', '2020-08-09', 'Misiones', 'Posadas', 3.42, '29991111', '31881111', 'Hospital Dr. Ramón Madariaga'),
('Martín', 'Ortega', '2020-03-17', 'Río Negro', 'General Roca', 3.38, '30223444', '32245678', 'Hospital López Lima'),
('Valentino', 'Castro', '2020-05-25', 'San Luis', 'Villa Mercedes', 3.12, '29789999', '31992211', 'Hospital Juan Domingo Perón'),
('Alejo', 'Silva', '2020-09-01', 'Catamarca', 'San Fernando del Valle', 2.98, '29001234', '31009988', 'Hospital San Juan Bautista'),
('Felipe', 'Herrera', '2020-10-19', 'La Rioja', 'Chilecito', 3.27, '29123456', '31345678', 'Hospital Eleazar Herrera Motta'),
('Ignacio', 'Medina', '2020-12-05', 'Chaco', 'Resistencia', 3.14, '29887766', '31765432', 'Hospital Perrando');

-- Insertamos registros de ejemplo en la tabla nacimientos_mujeres_2020
INSERT INTO nacimientos_mujeres_2020 
(nombre, apellido, fecha_nacimiento, provincia, localidad, peso_nacimiento, documento_padre, documento_madre, establecimiento_salud)
VALUES
('Emma', 'González', '2020-01-11', 'Buenos Aires', 'Quilmes', 3.25, '30112233', '32456789', 'Hospital El Cruce'),
('Martina', 'Rodríguez', '2020-02-28', 'Córdoba', 'Córdoba Capital', 3.10, '29556677', '31223344', 'Hospital Misericordia'),
('Isabella', 'López', '2020-03-14', 'Santa Fe', 'Santa Fe Capital', 3.22, '29334455', '31001234', 'Hospital Iturraspe'),
('Catalina', 'Martínez', '2020-04-07', 'Mendoza', 'San Rafael', 3.35, '29112233', '31256789', 'Hospital Schestakow'),
('Mía', 'Gómez', '2020-05-29', 'San Luis', 'San Luis Capital', 3.00, '29882233', '31567890', 'Clínica San Juan'),
('Sofía', 'Díaz', '2020-06-02', 'Tucumán', 'Yerba Buena', 3.12, '28992233', '31334455', 'Hospital de Niños Jesús'),
('Valentina', 'Fernández', '2020-07-18', 'Neuquén', 'Cutral Có', 3.08, '29665544', '31234455', 'Hospital Complejidad VI'),
('Julieta', 'Pérez', '2020-08-22', 'Chubut', 'Puerto Madryn', 3.30, '29789900', '31123344', 'Hospital Andrés Ísola'),
('Olivia', 'Morales', '2020-09-09', 'San Juan', 'San Juan Capital', 3.28, '29877666', '31990011', 'Hospital Rawson'),
('Renata', 'Sosa', '2020-10-31', 'Corrientes', 'Goya', 3.14, '30008877', '31881122', 'Hospital Regional Goya'),
('Lucía', 'Ramos', '2020-11-23', 'Formosa', 'Clorinda', 3.02, '29557788', '31778899', 'Hospital de la Madre y el Niño'),
('Camila', 'Romero', '2020-12-13', 'Entre Ríos', 'Concordia', 3.41, '29001122', '31556789', 'Hospital Masvernat'),
('Abigail', 'Molina', '2020-03-04', 'La Pampa', 'General Pico', 3.35, '29998877', '31234567', 'Hospital Gobernador Centeno'),
('Elena', 'Ruiz', '2020-04-16', 'Jujuy', 'Palpalá', 3.00, '29881234', '31002234', 'Hospital Wenceslao Gallardo'),
('Antonia', 'Navarro', '2020-05-10', 'Misiones', 'Oberá', 3.15, '29334455', '32001234', 'Hospital Samic'),
('Victoria', 'Ortega', '2020-06-23', 'Río Negro', 'Bariloche', 3.17, '29443322', '31221144', 'Hospital Zonal Ramón Carrillo'),
('Josefina', 'Castro', '2020-07-30', 'San Luis', 'Justo Daract', 3.09, '29000123', '31778900', 'Hospital Regional Justo Daract'),
('Bianca', 'Silva', '2020-08-15', 'Catamarca', 'Valle Viejo', 2.95, '29112345', '31987654', 'Hospital Zonal Valle Viejo'),
('Malena', 'Herrera', '2020-10-08', 'La Rioja', 'Capital', 3.22, '29660011', '31780011', 'Hospital Vera Barros'),
('Amanda', 'Medina', '2020-11-27', 'Chaco', 'Presidencia Roque Sáenz Peña', 3.10, '29445566', '31554433', 'Hospital 4 de Junio');


