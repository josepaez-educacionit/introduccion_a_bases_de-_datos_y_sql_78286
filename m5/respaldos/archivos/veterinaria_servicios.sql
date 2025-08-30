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
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_servicio_id` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-29 21:47:08
