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
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int NOT NULL,
  `especie_id` int NOT NULL,
  `raza_id` int NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('macho','hembra','desconocido') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'desconocido',
  `peso` decimal(5,2) DEFAULT NULL COMMENT 'Peso en kilogramos',
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:47:08
