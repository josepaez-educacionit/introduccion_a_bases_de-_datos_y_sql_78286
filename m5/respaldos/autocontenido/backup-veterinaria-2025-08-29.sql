-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento_identidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` enum('dni','pasaporte','cedula','otros') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dni',
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numero_direccion` smallint unsigned DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `codigo_postal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_clientes_documento` (`documento_identidad`),
  UNIQUE KEY `uk_clientes_email` (`email`),
  KEY `idx_clientes_nombre_apellido` (`nombre`,`apellido`),
  KEY `idx_clientes_telefono` (`telefono`),
  CONSTRAINT `chk_clientes_email` CHECK ((`email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'12345678','dni','Juan','Pérez','11-5234-6789','juan.perez@email.com','San Martín',1523,'Buenos Aires','1004',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'23456789','dni','Laura','Fernández','11-5234-6790','laura.fernandez@email.com','Belgrano',2890,'Buenos Aires','1092',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'34567890','dni','Miguel','Torres','11-5234-6791','miguel.torres@email.com','Libertad',567,'Buenos Aires','1012',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'45678901','dni','Carmen','Ruiz','11-5234-6792','carmen.ruiz@email.com','Tucumán',890,'Buenos Aires','1049',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'56789012','dni','Diego','Morales','11-5234-6793','diego.morales@email.com','Florida',1234,'Buenos Aires','1005',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'67890123','dni','Sofía','Jiménez','11-5234-6794','sofia.jimenez@email.com','Viamonte',2345,'Buenos Aires','1053',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'78901234','dni','Andrés','Castro','11-5234-6795','andres.castro@email.com','Maipú',3456,'Buenos Aires','1006',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'89012345','dni','Valentina','Herrera','11-5234-6796','valentina.herrera@email.com','Córdoba',4567,'Buenos Aires','1054',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(9,'90123456','dni','Fernando','Vargas','11-5234-6797','fernando.vargas@email.com','Lavalle',5678,'Buenos Aires','1007',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(10,'01234567','dni','Isabella','Mendoza','11-5234-6798','isabella.mendoza@email.com','Paraguay',6789,'Buenos Aires','1057',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(11,'987654321','dni','Juan','Valdez','11-5234-9876','juan.valdez@yahoo.com.ar','San Martín',854,'Buenos Aires','1000',1,'2025-08-26 23:52:27','2025-08-26 23:52:27');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_especies_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,'Perro','Canis familiaris - Mascota doméstica más común',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'Gato','Felis catus - Felino doméstico',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'Conejo','Oryctolagus cuniculus - Lagomorfo doméstico',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'Hamster','Cricetinae - Roedor pequeño doméstico',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'Ave','Diversas especies de aves domésticas',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'Reptil','Reptiles domésticos como iguanas y tortugas',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'Pez','Peces ornamentales de acuario',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'Rara','Especie no conocida - Mascota fuera de lo común',1,'2025-08-27 00:04:32','2025-08-27 00:04:32');
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_turno`
--

DROP TABLE IF EXISTS `estados_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_turno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('programado','confirmado','en_curso','finalizado','cancelado','reprogramado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_estados_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_turno`
--

LOCK TABLES `estados_turno` WRITE;
/*!40000 ALTER TABLE `estados_turno` DISABLE KEYS */;
INSERT INTO `estados_turno` VALUES (1,'programado','Turno agendado pendiente de confirmación',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'confirmado','Turno confirmado por el cliente',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'en_curso','Atención veterinaria en progreso',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'finalizado','Consulta completada exitosamente',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'cancelado','Turno cancelado por cliente o veterinaria',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'reprogramado','Turno reagendado para nueva fecha',1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `estados_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int NOT NULL,
  `especie_id` int NOT NULL,
  `raza_id` int NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('macho','hembra','desconocido') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'desconocido',
  `peso` decimal(5,2) DEFAULT NULL COMMENT 'Peso en kilogramos',
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_mascotas_cliente` (`cliente_id`),
  KEY `idx_mascotas_especie` (`especie_id`),
  KEY `idx_mascotas_raza` (`raza_id`),
  KEY `idx_mascotas_nombre` (`nombre`),
  CONSTRAINT `fk_mascotas_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mascotas_especies` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mascotas_razas` FOREIGN KEY (`raza_id`) REFERENCES `razas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_mascotas_peso` CHECK (((`peso` is null) or (`peso` > 0)))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Max',1,1,1,'2022-03-15','macho',28.50,'Dorado','Perro muy activo, le gusta jugar en el parque',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'Luna',1,2,7,'2021-07-22','hembra',4.20,'Gris con blanco','Gata tranquila, prefiere estar en interiores',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'Rocky',2,1,3,'2023-01-10','macho',12.80,'Atigrado','Bulldog joven, necesita control de peso',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'Bella',3,1,2,'2020-09-05','hembra',25.30,'Crema','Golden muy dócil, excelente con niños',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'Coco',3,5,21,'2022-11-18','macho',0.08,'Amarillo','Canario cantante, muy activo por las mañanas',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'Mimi',4,2,13,'2021-05-30','hembra',3.80,'Blanco','Gata Angora, requiere cepillado frecuente',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'Thor',5,1,4,'2021-12-08','macho',32.50,'Negro con marrón','Pastor Alemán bien entrenado, guardián',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'Nala',6,2,11,'2022-04-12','hembra',6.80,'Anaranjado','Maine Coon muy sociable y juguetona',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(9,'Oreo',6,4,17,'2023-02-28','macho',0.12,'Blanco y negro','Hamster muy curioso y activo',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(10,'Toby',7,1,8,'2020-06-14','macho',15.20,'Tricolor','Beagle cazador, necesita mucho ejercicio',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(11,'Princesa',8,1,5,'2023-05-20','hembra',2.80,'Café','Chihuahua pequeña, algo tímida con extraños',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(12,'Bunny',8,3,19,'2022-12-03','hembra',1.50,'Marrón','Coneja Mini Rex muy dócil',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(13,'Simba',9,2,12,'2021-08-17','macho',5.50,'Dorado','Gato Siamés vocal, le gusta la atención',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(14,'Zeus',10,1,7,'2020-03-22','macho',38.20,'Negro','Rottweiler adulto, bien socializado',1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `razas`
--

DROP TABLE IF EXISTS `razas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `razas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `especie_id` int NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_razas_nombre_especie` (`nombre`,`especie_id`),
  KEY `idx_razas_especie` (`especie_id`),
  CONSTRAINT `fk_razas_especies` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `razas`
--

LOCK TABLES `razas` WRITE;
/*!40000 ALTER TABLE `razas` DISABLE KEYS */;
INSERT INTO `razas` VALUES (1,'Labrador Retriever',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'Golden Retriever',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'Bulldog Francés',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'Pastor Alemán',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'Chihuahua',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'Poodle',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'Rottweiler',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'Beagle',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(9,'Border Collie',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(10,'Mestizo',1,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(11,'Persa',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(12,'Siamés',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(13,'Maine Coon',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(14,'Angora',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(15,'Bengalí',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(16,'Ragdoll',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(17,'British Shorthair',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(18,'Mestizo',2,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(19,'Holland Lop',3,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(20,'Mini Rex',3,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(21,'Angora',3,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(22,'Enano Holandés',3,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(23,'Cabeza de León',3,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(24,'Dorado',4,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(25,'Ruso',4,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(26,'Roborovski',4,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(27,'Chino',4,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(28,'Canario',5,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(29,'Periquito',5,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(30,'Ninfa',5,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(31,'Agapornis',5,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(32,'Jilguero',5,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(33,'Iguana Verde',6,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(34,'Gecko Leopardo',6,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(35,'Tortuga Rusa',6,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(36,'Pogona',6,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(37,'Goldfish',7,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(38,'Betta',7,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(39,'Guppy',7,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(40,'Tetra Neón',7,NULL,1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `razas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_servicio_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `duracion` tinyint unsigned DEFAULT NULL COMMENT 'Duración en minutos',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_servicios_tipo` (`tipo_servicio_id`),
  KEY `idx_servicios_nombre` (`nombre`),
  KEY `idx_servicios_precio` (`precio`),
  CONSTRAINT `fk_servicios_tipos_servicio` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipos_servicio` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_servicios_duracion` CHECK (((`duracion` is null) or (`duracion` > 0))),
  CONSTRAINT `chk_servicios_precio` CHECK ((`precio` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,1,'Consulta General','Revisión médica general y diagnóstico básico',2500.00,30,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,1,'Consulta Especializada','Consulta con veterinario especialista',4000.00,45,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,1,'Consulta de Urgencia','Atención médica urgente fuera del horario normal',3500.00,30,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,1,'Primera Consulta','Consulta inicial para nuevos pacientes con historial completo',3000.00,60,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,2,'Vacuna Séxtuple','Vacuna contra 6 enfermedades principales en perros',2800.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,2,'Vacuna Triple Felina','Vacuna contra 3 enfermedades principales en gatos',2600.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,2,'Vacuna Antirrábica','Vacuna contra la rabia obligatoria',1800.00,10,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,2,'Refuerzo de Vacunas','Aplicación de refuerzos anuales',2200.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(9,3,'Castración Macho','Castración quirúrgica para machos',8000.00,60,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(10,3,'Castración Hembra','Esterilización quirúrgica para hembras',12000.00,90,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(11,3,'Extracción Dental','Remoción quirúrgica de piezas dentales',5000.00,45,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(12,3,'Cirugía Menor','Procedimientos quirúrgicos menores',6500.00,60,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(13,4,'Atención de Emergencia','Atención médica de urgencia las 24 horas',5000.00,45,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(14,4,'Hospitalización','Internación y cuidados intensivos por día',8000.00,255,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(15,5,'Baño Completo','Baño, secado y cepillado básico',2000.00,60,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(16,5,'Corte de Pelo','Corte y arreglo estético del pelaje',2500.00,45,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(17,5,'Corte de Uñas','Corte y limado de uñas',800.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(18,5,'Limpieza de Oídos','Limpieza profunda del canal auditivo',1200.00,20,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(19,6,'Desparasitación Interna','Tratamiento contra parásitos intestinales',1500.00,10,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(20,6,'Desparasitación Externa','Tratamiento contra pulgas y garrapatas',1800.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(21,6,'Plan Antiparasitario','Tratamiento integral interno y externo',2800.00,20,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(22,7,'Análisis de Sangre','Hemograma completo y bioquímica básica',3500.00,30,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(23,7,'Análisis de Orina','Examen completo de orina',2000.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(24,7,'Análisis Coprológico','Examen parasitológico de heces',1800.00,15,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(25,8,'Radiografía Simple','Estudio radiológico de una zona',3000.00,20,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(26,8,'Radiografía de Tórax','Estudio radiológico del tórax completo',3500.00,25,1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(27,8,'Radiografía de Abdomen','Estudio radiológico abdominal completo',3500.00,25,1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_servicio`
--

DROP TABLE IF EXISTS `tipos_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_servicio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tipos_servicio_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_servicio`
--

LOCK TABLES `tipos_servicio` WRITE;
/*!40000 ALTER TABLE `tipos_servicio` DISABLE KEYS */;
INSERT INTO `tipos_servicio` VALUES (1,'Consulta','Consultas médicas generales y especializadas',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'Vacunación','Aplicación de vacunas preventivas',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'Cirugía','Intervenciones quirúrgicas veterinarias',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'Emergencia','Atención médica de urgencia',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'Estética','Servicios de peluquería y cuidado estético',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'Desparasitación','Tratamientos antiparasitarios',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'Laboratorio','Análisis clínicos y estudios de laboratorio',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'Radiografía','Estudios radiológicos y diagnóstico por imagen',1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `tipos_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado_turno_id` int NOT NULL,
  `veterinario_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `mascota_id` int DEFAULT NULL,
  `servicio_id` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `costo_total` decimal(10,2) DEFAULT '0.00',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_turnos_fecha_hora_veterinario` (`fecha`,`hora`,`veterinario_id`),
  KEY `idx_turnos_fecha` (`fecha`),
  KEY `idx_turnos_veterinario_fecha` (`veterinario_id`,`fecha`),
  KEY `idx_turnos_cliente` (`cliente_id`),
  KEY `idx_turnos_mascota` (`mascota_id`),
  KEY `idx_turnos_estado` (`estado_turno_id`),
  KEY `fk_turnos_servicios` (`servicio_id`),
  CONSTRAINT `fk_turnos_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_turnos_estados_turno` FOREIGN KEY (`estado_turno_id`) REFERENCES `estados_turno` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_turnos_mascotas` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_turnos_servicios` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_turnos_veterinarios` FOREIGN KEY (`veterinario_id`) REFERENCES `veterinarios` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_turnos_costo` CHECK (((`costo_total` is null) or (`costo_total` >= 0)))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'2025-08-27','09:00:00',2,1,1,1,1,'Control rutinario para Max',2500.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'2025-08-27','09:30:00',2,1,2,3,4,'Primera consulta para Rocky',3000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'2025-08-27','10:00:00',1,2,3,4,13,'Castración programada para Bella',12000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'2025-08-27','11:00:00',2,3,4,6,16,'Problema de piel en Mimi',2500.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'2025-08-27','14:00:00',1,1,5,7,8,'Refuerzo de vacunas para Thor',2200.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'2025-08-28','08:30:00',1,4,6,8,1,'Control cardíaco para Nala',2500.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(7,'2025-08-28','09:15:00',2,6,6,9,22,'Consulta especializada para Oreo',4000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(8,'2025-08-28','10:00:00',1,1,7,10,18,'Baño completo para Toby',2000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(9,'2025-08-28','10:30:00',2,5,8,11,1,'Consulta oftalmológica para Princesa',2500.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(10,'2025-08-28','11:15:00',1,1,9,13,7,'Vacuna antirrábica para Simba',1800.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(11,'2025-08-25','09:00:00',4,1,1,2,19,'Corte de uñas completado',800.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(12,'2025-08-25','14:30:00',4,2,10,14,11,'Castración exitosa',8000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(13,'2025-08-26','10:15:00',4,3,3,5,20,'Limpieza de oídos completada',1200.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(14,'2025-08-26','20:00:00',4,1,2,3,15,'Emergencia por intoxicación - Recuperado',5000.00,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(15,'2025-08-29','21:18:07',5,2,8,12,1,'Cliente canceló por viaje',0.00,'2025-08-26 23:06:01','2025-08-30 00:18:07');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numero_direccion` smallint unsigned DEFAULT NULL,
  `ciudad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `codigo_postal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `especialidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_veterinarios_email` (`email`),
  UNIQUE KEY `uk_veterinarios_matricula` (`matricula`),
  KEY `idx_veterinarios_nombre_apellido` (`nombre`,`apellido`),
  KEY `idx_veterinarios_especialidad` (`especialidad`),
  CONSTRAINT `chk_veterinarios_email` CHECK ((`email` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarios`
--

LOCK TABLES `veterinarios` WRITE;
/*!40000 ALTER TABLE `veterinarios` DISABLE KEYS */;
INSERT INTO `veterinarios` VALUES (1,'María','González','MV-001','11-4567-8901','maria.gonzalez@veterinaria.com','Av. Corrientes',1234,'Buenos Aires','1043','Medicina General',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(2,'Carlos','Rodríguez','MV-002','11-4567-8902','carlos.rodriguez@veterinaria.com','Av. Santa Fe',2567,'Buenos Aires','1425','Cirugía',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(3,'Ana','Martínez','MV-003','11-4567-8903','ana.martinez@veterinaria.com','Av. Cabildo',3890,'Buenos Aires','1428','Dermatología',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(4,'Luis','López','MV-004','11-4567-8904','luis.lopez@veterinaria.com','Av. Rivadavia',5678,'Buenos Aires','1406','Cardiología',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(5,'Patricia','García','MV-005','11-4567-8905','patricia.garcia@veterinaria.com','Av. Las Heras',1890,'Buenos Aires','1018','Oftalmología',1,'2025-08-26 23:06:01','2025-08-26 23:06:01'),(6,'Roberto','Silva','MV-006','11-4567-8906','roberto.silva@veterinaria.com','Av. Pueyrredón',2345,'Buenos Aires','1119','Medicina Exótica',1,'2025-08-26 23:06:01','2025-08-26 23:06:01');
/*!40000 ALTER TABLE `veterinarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:56:15
