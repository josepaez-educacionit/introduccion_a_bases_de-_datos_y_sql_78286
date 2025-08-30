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
-- Table structure for table `veterinarios`
--

DROP TABLE IF EXISTS `veterinarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matricula` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numero_direccion` smallint unsigned DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `especialidad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- Dump completed on 2025-08-29 21:47:08
