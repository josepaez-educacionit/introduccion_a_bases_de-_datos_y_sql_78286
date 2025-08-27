-- ===============================================
-- Base de Datos Veterinaria - MySQL Optimizada
-- Versión con mejores prácticas aplicadas
-- ===============================================

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS `veterinaria` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `veterinaria`;

-- Deshabilitar verificación de claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar tablas existentes (orden inverso de dependencias)
DROP TABLE IF EXISTS `turnos`;
DROP TABLE IF EXISTS `mascotas`;
DROP TABLE IF EXISTS `servicios`;
DROP TABLE IF EXISTS `razas`;
DROP TABLE IF EXISTS `clientes`;
DROP TABLE IF EXISTS `veterinarios`;
DROP TABLE IF EXISTS `especies`;
DROP TABLE IF EXISTS `estados_turno`;
DROP TABLE IF EXISTS `tipos_servicio`;

-- ===============================================
-- Tabla: especies
-- ===============================================
CREATE TABLE `especies` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `descripcion` TEXT NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_especies_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: estados_turno
-- ===============================================
CREATE TABLE `estados_turno` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` ENUM('programado', 'confirmado', 'en_curso', 'finalizado', 'cancelado', 'reprogramado') NOT NULL,
    `descripcion` VARCHAR(100) NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_estados_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: tipos_servicio
-- ===============================================
CREATE TABLE `tipos_servicio` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `descripcion` TEXT NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_tipos_servicio_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: razas
-- ===============================================
CREATE TABLE `razas` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `especie_id` INT NOT NULL,
    `descripcion` TEXT NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_razas_nombre_especie` (`nombre`, `especie_id`),
    INDEX `idx_razas_especie` (`especie_id`),
    CONSTRAINT `fk_razas_especies` FOREIGN KEY (`especie_id`) 
        REFERENCES `especies` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: clientes
-- ===============================================
CREATE TABLE `clientes` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `documento_identidad` VARCHAR(20) NOT NULL,
    `tipo_documento` ENUM('dni', 'pasaporte', 'cedula', 'otros') NOT NULL DEFAULT 'dni',
    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(20) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `calle` VARCHAR(100) NULL DEFAULT '',
    `numero_direccion` SMALLINT UNSIGNED NULL,
    `ciudad` VARCHAR(50) NULL DEFAULT '',
    `codigo_postal` VARCHAR(10) NULL DEFAULT '',
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_clientes_documento` (`documento_identidad`),
    UNIQUE KEY `uk_clientes_email` (`email`),
    INDEX `idx_clientes_nombre_apellido` (`nombre`, `apellido`),
    INDEX `idx_clientes_telefono` (`telefono`),
    CONSTRAINT `chk_clientes_email` CHECK (`email` LIKE '%@%.%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: veterinarios
-- ===============================================
CREATE TABLE `veterinarios` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `matricula` VARCHAR(20) NULL,
    `telefono` VARCHAR(20) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `calle` VARCHAR(100) NULL DEFAULT '',
    `numero_direccion` SMALLINT UNSIGNED NULL,
    `ciudad` VARCHAR(50) NULL DEFAULT '',
    `codigo_postal` VARCHAR(10) NULL DEFAULT '',
    `especialidad` VARCHAR(100) NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_veterinarios_matricula` (`matricula`),
    UNIQUE KEY `uk_veterinarios_email` (`email`),
    INDEX `idx_veterinarios_nombre_apellido` (`nombre`, `apellido`),
    INDEX `idx_veterinarios_especialidad` (`especialidad`),
    CONSTRAINT `chk_veterinarios_email` CHECK (`email` LIKE '%@%.%')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: mascotas
-- ===============================================
CREATE TABLE `mascotas` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `cliente_id` INT NOT NULL,
    `especie_id` INT NOT NULL,
    `raza_id` INT NOT NULL,
    `fecha_nacimiento` DATE NULL,
    `genero` ENUM('macho', 'hembra', 'desconocido') NOT NULL DEFAULT 'desconocido',
    `peso` DECIMAL(5,2) NULL COMMENT 'Peso en kilogramos',
    `color` VARCHAR(50) NULL DEFAULT '',
    `observaciones` TEXT NULL,
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_mascotas_cliente` (`cliente_id`),
    INDEX `idx_mascotas_especie` (`especie_id`),
    INDEX `idx_mascotas_raza` (`raza_id`),
    INDEX `idx_mascotas_nombre` (`nombre`),
    CONSTRAINT `fk_mascotas_clientes` FOREIGN KEY (`cliente_id`) 
        REFERENCES `clientes` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_mascotas_especies` FOREIGN KEY (`especie_id`) 
        REFERENCES `especies` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_mascotas_razas` FOREIGN KEY (`raza_id`) 
        REFERENCES `razas` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `chk_mascotas_peso` CHECK (`peso` IS NULL OR `peso` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: servicios
-- ===============================================
CREATE TABLE `servicios` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tipo_servicio_id` INT NOT NULL,
    `nombre` VARCHAR(100) NOT NULL,
    `descripcion` TEXT NULL,
    `precio` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    `duracion` TINYINT UNSIGNED NULL COMMENT 'Duración en minutos',
    `activo` BOOLEAN NOT NULL DEFAULT TRUE,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_servicios_tipo` (`tipo_servicio_id`),
    INDEX `idx_servicios_nombre` (`nombre`),
    INDEX `idx_servicios_precio` (`precio`),
    CONSTRAINT `fk_servicios_tipos_servicio` FOREIGN KEY (`tipo_servicio_id`) 
        REFERENCES `tipos_servicio` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `chk_servicios_precio` CHECK (`precio` >= 0),
    CONSTRAINT `chk_servicios_duracion` CHECK (`duracion` IS NULL OR `duracion` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===============================================
-- Tabla: turnos
-- ===============================================
CREATE TABLE `turnos` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `fecha` DATE NOT NULL,
    `hora` TIME NOT NULL,
    `estado_turno_id` INT NOT NULL,
    `veterinario_id` INT NOT NULL,
    `cliente_id` INT NULL,
    `mascota_id` INT NULL,
    `servicio_id` INT NULL,
    `observaciones` TEXT NULL,
    `costo_total` DECIMAL(10,2) NULL DEFAULT 0.00,
    `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `fecha_modificacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_turnos_fecha_hora_veterinario` (`fecha`, `hora`, `veterinario_id`),
    INDEX `idx_turnos_fecha` (`fecha`),
    INDEX `idx_turnos_veterinario_fecha` (`veterinario_id`, `fecha`),
    INDEX `idx_turnos_cliente` (`cliente_id`),
    INDEX `idx_turnos_mascota` (`mascota_id`),
    INDEX `idx_turnos_estado` (`estado_turno_id`),
    CONSTRAINT `fk_turnos_estados_turno` FOREIGN KEY (`estado_turno_id`) 
        REFERENCES `estados_turno` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_turnos_veterinarios` FOREIGN KEY (`veterinario_id`) 
        REFERENCES `veterinarios` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_turnos_clientes` FOREIGN KEY (`cliente_id`) 
        REFERENCES `clientes` (`id`) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_turnos_mascotas` FOREIGN KEY (`mascota_id`) 
        REFERENCES `mascotas` (`id`) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_turnos_servicios` FOREIGN KEY (`servicio_id`) 
        REFERENCES `servicios` (`id`) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `chk_turnos_costo` CHECK (`costo_total` IS NULL OR `costo_total` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Rehabilitar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- ===============================================
-- DATOS INICIALES DE EJEMPLO COMPLETOS
-- ===============================================

-- Insertar especies básicas
INSERT INTO `especies` (`nombre`, `descripcion`) VALUES 
('Perro', 'Canis familiaris - Mascota doméstica más común'),
('Gato', 'Felis catus - Felino doméstico'),
('Conejo', 'Oryctolagus cuniculus - Lagomorfo doméstico'),
('Hamster', 'Cricetinae - Roedor pequeño doméstico'),
('Ave', 'Diversas especies de aves domésticas'),
('Reptil', 'Reptiles domésticos como iguanas y tortugas'),
('Pez', 'Peces ornamentales de acuario');

-- Insertar estados de turno
INSERT INTO `estados_turno` (`nombre`, `descripcion`) VALUES 
('programado', 'Turno agendado pendiente de confirmación'),
('confirmado', 'Turno confirmado por el cliente'),
('en_curso', 'Atención veterinaria en progreso'),
('finalizado', 'Consulta completada exitosamente'),
('cancelado', 'Turno cancelado por cliente o veterinaria'),
('reprogramado', 'Turno reagendado para nueva fecha');

-- Insertar tipos de servicio
INSERT INTO `tipos_servicio` (`nombre`, `descripcion`) VALUES 
('Consulta', 'Consultas médicas generales y especializadas'),
('Vacunación', 'Aplicación de vacunas preventivas'),
('Cirugía', 'Intervenciones quirúrgicas veterinarias'),
('Emergencia', 'Atención médica de urgencia'),
('Estética', 'Servicios de peluquería y cuidado estético'),
('Desparasitación', 'Tratamientos antiparasitarios'),
('Laboratorio', 'Análisis clínicos y estudios de laboratorio'),
('Radiografía', 'Estudios radiológicos y diagnóstico por imagen');

-- Insertar razas por especie
INSERT INTO `razas` (`nombre`, `especie_id`) VALUES 
-- Razas de perros (especie_id = 1)
('Labrador Retriever', 1),
('Golden Retriever', 1),
('Bulldog Francés', 1),
('Pastor Alemán', 1),
('Chihuahua', 1),
('Poodle', 1),
('Rottweiler', 1),
('Beagle', 1),
('Border Collie', 1),
('Mestizo', 1),
-- Razas de gatos (especie_id = 2)
('Persa', 2),
('Siamés', 2),
('Maine Coon', 2),
('Angora', 2),
('Bengalí', 2),
('Ragdoll', 2),
('British Shorthair', 2),
('Mestizo', 2),
-- Razas de conejos (especie_id = 3)
('Holland Lop', 3),
('Mini Rex', 3),
('Angora', 3),
('Enano Holandés', 3),
('Cabeza de León', 3),
-- Tipos de hamsters (especie_id = 4)
('Dorado', 4),
('Ruso', 4),
('Roborovski', 4),
('Chino', 4),
-- Tipos de aves (especie_id = 5)
('Canario', 5),
('Periquito', 5),
('Ninfa', 5),
('Agapornis', 5),
('Jilguero', 5),
-- Tipos de reptiles (especie_id = 6)
('Iguana Verde', 6),
('Gecko Leopardo', 6),
('Tortuga Rusa', 6),
('Pogona', 6),
-- Tipos de peces (especie_id = 7)
('Goldfish', 7),
('Betta', 7),
('Guppy', 7),
('Tetra Neón', 7);

-- Insertar veterinarios
INSERT INTO `veterinarios` (`nombre`, `apellido`, `matricula`, `telefono`, `email`, `calle`, `numero_direccion`, `ciudad`, `codigo_postal`, `especialidad`) VALUES 
('María', 'González', 'MV-001', '11-4567-8901', 'maria.gonzalez@veterinaria.com', 'Av. Corrientes', 1234, 'Buenos Aires', '1043', 'Medicina General'),
('Carlos', 'Rodríguez', 'MV-002', '11-4567-8902', 'carlos.rodriguez@veterinaria.com', 'Av. Santa Fe', 2567, 'Buenos Aires', '1425', 'Cirugía'),
('Ana', 'Martínez', 'MV-003', '11-4567-8903', 'ana.martinez@veterinaria.com', 'Av. Cabildo', 3890, 'Buenos Aires', '1428', 'Dermatología'),
('Luis', 'López', 'MV-004', '11-4567-8904', 'luis.lopez@veterinaria.com', 'Av. Rivadavia', 5678, 'Buenos Aires', '1406', 'Cardiología'),
('Patricia', 'García', 'MV-005', '11-4567-8905', 'patricia.garcia@veterinaria.com', 'Av. Las Heras', 1890, 'Buenos Aires', '1018', 'Oftalmología'),
('Roberto', 'Silva', 'MV-006', '11-4567-8906', 'roberto.silva@veterinaria.com', 'Av. Pueyrredón', 2345, 'Buenos Aires', '1119', 'Medicina Exótica');

-- Insertar clientes
INSERT INTO `clientes` (`documento_identidad`, `tipo_documento`, `nombre`, `apellido`, `telefono`, `email`, `calle`, `numero_direccion`, `ciudad`, `codigo_postal`) VALUES 
('12345678', 'dni', 'Juan', 'Pérez', '11-5234-6789', 'juan.perez@email.com', 'San Martín', 1523, 'Buenos Aires', '1004'),
('23456789', 'dni', 'Laura', 'Fernández', '11-5234-6790', 'laura.fernandez@email.com', 'Belgrano', 2890, 'Buenos Aires', '1092'),
('34567890', 'dni', 'Miguel', 'Torres', '11-5234-6791', 'miguel.torres@email.com', 'Libertad', 567, 'Buenos Aires', '1012'),
('45678901', 'dni', 'Carmen', 'Ruiz', '11-5234-6792', 'carmen.ruiz@email.com', 'Tucumán', 890, 'Buenos Aires', '1049'),
('56789012', 'dni', 'Diego', 'Morales', '11-5234-6793', 'diego.morales@email.com', 'Florida', 1234, 'Buenos Aires', '1005'),
('67890123', 'dni', 'Sofía', 'Jiménez', '11-5234-6794', 'sofia.jimenez@email.com', 'Viamonte', 2345, 'Buenos Aires', '1053'),
('78901234', 'dni', 'Andrés', 'Castro', '11-5234-6795', 'andres.castro@email.com', 'Maipú', 3456, 'Buenos Aires', '1006'),
('89012345', 'dni', 'Valentina', 'Herrera', '11-5234-6796', 'valentina.herrera@email.com', 'Córdoba', 4567, 'Buenos Aires', '1054'),
('90123456', 'dni', 'Fernando', 'Vargas', '11-5234-6797', 'fernando.vargas@email.com', 'Lavalle', 5678, 'Buenos Aires', '1007'),
('01234567', 'dni', 'Isabella', 'Mendoza', '11-5234-6798', 'isabella.mendoza@email.com', 'Paraguay', 6789, 'Buenos Aires', '1057');

-- Insertar servicios
INSERT INTO `servicios` (`tipo_servicio_id`, `nombre`, `descripcion`, `precio`, `duracion`) VALUES 
-- Consultas (tipo_servicio_id = 1)
(1, 'Consulta General', 'Revisión médica general y diagnóstico básico', 2500.00, 30),
(1, 'Consulta Especializada', 'Consulta con veterinario especialista', 4000.00, 45),
(1, 'Consulta de Urgencia', 'Atención médica urgente fuera del horario normal', 3500.00, 30),
(1, 'Primera Consulta', 'Consulta inicial para nuevos pacientes con historial completo', 3000.00, 60),
-- Vacunaciones (tipo_servicio_id = 2)
(2, 'Vacuna Séxtuple', 'Vacuna contra 6 enfermedades principales en perros', 2800.00, 15),
(2, 'Vacuna Triple Felina', 'Vacuna contra 3 enfermedades principales en gatos', 2600.00, 15),
(2, 'Vacuna Antirrábica', 'Vacuna contra la rabia obligatoria', 1800.00, 10),
(2, 'Refuerzo de Vacunas', 'Aplicación de refuerzos anuales', 2200.00, 15),
-- Cirugías (tipo_servicio_id = 3)
(3, 'Castración Macho', 'Castración quirúrgica para machos', 8000.00, 60),
(3, 'Castración Hembra', 'Esterilización quirúrgica para hembras', 12000.00, 90),
(3, 'Extracción Dental', 'Remoción quirúrgica de piezas dentales', 5000.00, 45),
(3, 'Cirugía Menor', 'Procedimientos quirúrgicos menores', 6500.00, 60),
-- Emergencias (tipo_servicio_id = 4)
(4, 'Atención de Emergencia', 'Atención médica de urgencia las 24 horas', 5000.00, 45),
(4, 'Hospitalización', 'Internación y cuidados intensivos por día', 8000.00, 255),
-- Estética (tipo_servicio_id = 5)
(5, 'Baño Completo', 'Baño, secado y cepillado básico', 2000.00, 60),
(5, 'Corte de Pelo', 'Corte y arreglo estético del pelaje', 2500.00, 45),
(5, 'Corte de Uñas', 'Corte y limado de uñas', 800.00, 15),
(5, 'Limpieza de Oídos', 'Limpieza profunda del canal auditivo', 1200.00, 20),
-- Desparasitación (tipo_servicio_id = 6)
(6, 'Desparasitación Interna', 'Tratamiento contra parásitos intestinales', 1500.00, 10),
(6, 'Desparasitación Externa', 'Tratamiento contra pulgas y garrapatas', 1800.00, 15),
(6, 'Plan Antiparasitario', 'Tratamiento integral interno y externo', 2800.00, 20),
-- Laboratorio (tipo_servicio_id = 7)
(7, 'Análisis de Sangre', 'Hemograma completo y bioquímica básica', 3500.00, 30),
(7, 'Análisis de Orina', 'Examen completo de orina', 2000.00, 15),
(7, 'Análisis Coprológico', 'Examen parasitológico de heces', 1800.00, 15),
-- Radiografía (tipo_servicio_id = 8)
(8, 'Radiografía Simple', 'Estudio radiológico de una zona', 3000.00, 20),
(8, 'Radiografía de Tórax', 'Estudio radiológico del tórax completo', 3500.00, 25),
(8, 'Radiografía de Abdomen', 'Estudio radiológico abdominal completo', 3500.00, 25);

-- Insertar mascotas
INSERT INTO `mascotas` (`nombre`, `cliente_id`, `especie_id`, `raza_id`, `fecha_nacimiento`, `genero`, `peso`, `color`, `observaciones`) VALUES 
-- Mascotas del cliente 1 (Juan Pérez)
('Max', 1, 1, 1, '2022-03-15', 'macho', 28.50, 'Dorado', 'Perro muy activo, le gusta jugar en el parque'),
('Luna', 1, 2, 7, '2021-07-22', 'hembra', 4.20, 'Gris con blanco', 'Gata tranquila, prefiere estar en interiores'),
-- Mascotas del cliente 2 (Laura Fernández)
('Rocky', 2, 1, 3, '2023-01-10', 'macho', 12.80, 'Atigrado', 'Bulldog joven, necesita control de peso'),
-- Mascotas del cliente 3 (Miguel Torres)
('Bella', 3, 1, 2, '2020-09-05', 'hembra', 25.30, 'Crema', 'Golden muy dócil, excelente con niños'),
('Coco', 3, 5, 21, '2022-11-18', 'macho', 0.08, 'Amarillo', 'Canario cantante, muy activo por las mañanas'),
-- Mascotas del cliente 4 (Carmen Ruiz)
('Mimi', 4, 2, 13, '2021-05-30', 'hembra', 3.80, 'Blanco', 'Gata Angora, requiere cepillado frecuente'),
-- Mascotas del cliente 5 (Diego Morales)
('Thor', 5, 1, 4, '2021-12-08', 'macho', 32.50, 'Negro con marrón', 'Pastor Alemán bien entrenado, guardián'),
-- Mascotas del cliente 6 (Sofía Jiménez)
('Nala', 6, 2, 11, '2022-04-12', 'hembra', 6.80, 'Anaranjado', 'Maine Coon muy sociable y juguetona'),
('Oreo', 6, 4, 17, '2023-02-28', 'macho', 0.12, 'Blanco y negro', 'Hamster muy curioso y activo'),
-- Mascotas del cliente 7 (Andrés Castro)
('Toby', 7, 1, 8, '2020-06-14', 'macho', 15.20, 'Tricolor', 'Beagle cazador, necesita mucho ejercicio'),
-- Mascotas del cliente 8 (Valentina Herrera)
('Princesa', 8, 1, 5, '2023-05-20', 'hembra', 2.80, 'Café', 'Chihuahua pequeña, algo tímida con extraños'),
('Bunny', 8, 3, 19, '2022-12-03', 'hembra', 1.50, 'Marrón', 'Coneja Mini Rex muy dócil'),
-- Mascotas del cliente 9 (Fernando Vargas)
('Simba', 9, 2, 12, '2021-08-17', 'macho', 5.50, 'Dorado', 'Gato Siamés vocal, le gusta la atención'),
-- Mascotas del cliente 10 (Isabella Mendoza)
('Zeus', 10, 1, 7, '2020-03-22', 'macho', 38.20, 'Negro', 'Rottweiler adulto, bien socializado');

-- Insertar turnos de ejemplo
INSERT INTO `turnos` (`fecha`, `hora`, `estado_turno_id`, `veterinario_id`, `cliente_id`, `mascota_id`, `servicio_id`, `observaciones`, `costo_total`) VALUES 
-- Turnos programados para esta semana
('2025-08-27', '09:00:00', 2, 1, 1, 1, 1, 'Control rutinario para Max', 2500.00),
('2025-08-27', '09:30:00', 2, 1, 2, 3, 4, 'Primera consulta para Rocky', 3000.00),
('2025-08-27', '10:00:00', 1, 2, 3, 4, 13, 'Castración programada para Bella', 12000.00),
('2025-08-27', '11:00:00', 2, 3, 4, 6, 16, 'Problema de piel en Mimi', 2500.00),
('2025-08-27', '14:00:00', 1, 1, 5, 7, 8, 'Refuerzo de vacunas para Thor', 2200.00),
-- Turnos para el día siguiente
('2025-08-28', '08:30:00', 1, 4, 6, 8, 1, 'Control cardíaco para Nala', 2500.00),
('2025-08-28', '09:15:00', 2, 6, 6, 9, 22, 'Consulta especializada para Oreo', 4000.00),
('2025-08-28', '10:00:00', 1, 1, 7, 10, 18, 'Baño completo para Toby', 2000.00),
('2025-08-28', '10:30:00', 2, 5, 8, 11, 1, 'Consulta oftalmológica para Princesa', 2500.00),
('2025-08-28', '11:15:00', 1, 1, 9, 13, 7, 'Vacuna antirrábica para Simba', 1800.00),
-- Algunos turnos finalizados (días anteriores)
('2025-08-25', '09:00:00', 4, 1, 1, 2, 19, 'Corte de uñas completado', 800.00),
('2025-08-25', '14:30:00', 4, 2, 10, 14, 11, 'Castración exitosa', 8000.00),
('2025-08-26', '10:15:00', 4, 3, 3, 5, 20, 'Limpieza de oídos completada', 1200.00),
-- Turnos de emergencia
('2025-08-26', '20:00:00', 4, 1, 2, 3, 15, 'Emergencia por intoxicación - Recuperado', 5000.00),
-- Turnos cancelados
('2025-08-27', '15:00:00', 5, 2, 8, 12, 1, 'Cliente canceló por viaje', 0.00);

