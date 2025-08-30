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
  `observaciones` text COLLATE utf8mb4_unicode_ci,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:47:08
