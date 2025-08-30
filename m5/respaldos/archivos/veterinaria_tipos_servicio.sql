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
-- Table structure for table `tipos_servicio`
--

DROP TABLE IF EXISTS `tipos_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_servicio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:47:08
