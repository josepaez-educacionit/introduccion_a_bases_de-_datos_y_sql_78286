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
  `documento_identidad` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` enum('dni','pasaporte','cedula','otros') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dni',
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numero_direccion` smallint unsigned DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '',
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:47:08
