CREATE DATABASE  IF NOT EXISTS `tigo` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tigo`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tigo
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `instalacion`
--

DROP TABLE IF EXISTS `instalacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalacion` (
  `idinstalacion` int NOT NULL AUTO_INCREMENT,
  `fechainstalacion` date NOT NULL,
  `geolocalizacion` varchar(90) DEFAULT NULL,
  `imagencasa` varchar(45) DEFAULT NULL,
  `user_create` varchar(15) DEFAULT NULL,
  `fecha_create` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `observacion_instalacion` varchar(45) DEFAULT NULL,
  `contratoinstalacion` int NOT NULL,
  PRIMARY KEY (`idinstalacion`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalacion`
--

LOCK TABLES `instalacion` WRITE;
/*!40000 ALTER TABLE `instalacion` DISABLE KEYS */;
INSERT INTO `instalacion` VALUES (8,'2024-06-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','fotocasa','mdurand','2024-07-03','instalado','me dieron gaseosa y buen trato',0),(9,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','fotocasa','mdurand','2024-07-03','instalado','no me dieron pan',0),(10,'2024-07-02','https://maps.app.goo.gl/pSTrqK6aCtsmf1VV8',NULL,'mdurand','2024-07-02','Instalado',NULL,0),(11,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6',NULL,'mdurand','2024-07-03','Instalado',NULL,0),(12,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6',NULL,'mdurand','2024-07-03','Instalado','me miro feo',0),(13,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6',NULL,'mdurand','2024-07-03','Instalado','fue amable',0),(14,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6',NULL,'mdurand','2024-07-03','Instalado','todo bien',0),(15,'2024-07-05','https://maps.app.goo.gl/kL5mg4YUayYZ1Afw9',NULL,'mdurand','2024-07-05','Instalado','no quiso firmar contrato.',1121),(19,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9',NULL,'mdurand','2024-07-06','Instalado','prueba3 1121',1121),(20,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9',NULL,'mdurand','2024-07-06','Instalado','prueba4 1122',1122),(21,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9',NULL,'mdurand','2024-07-06','Instalado','prueba con numcontrato 1185',1185),(25,'2024-07-07','https://maps.app.goo.gl/zGQKgvGcEVijzVg89',NULL,'mdurand','2024-07-07','Instalado','xdd',1121),(26,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','fotocasa','mdurand','2024-07-03','instalado','no me dieron pan',100),(27,'2024-07-08','https://maps.app.goo.gl/DMwHHvu7WzWXkNjH7',NULL,'mdurand','2024-07-08','Instalado','hambre',1122),(28,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','fotocasa','mdurand','2024-07-03','instalado','no me dieron pan',100),(29,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','test 1122',1122),(30,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','test 1122',1122),(31,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','1122 test 11072024',1122),(32,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 11072024 1122',1122),(33,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 11072024 21:01',1122),(34,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 2 11072024',1122),(35,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','hola 1',1122),(36,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba ',1122),(37,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba4',1122),(38,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba5',1122),(39,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 6',1122),(40,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 6',1122),(41,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 7',1122),(42,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 8',1122),(43,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 9',1122),(44,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 10',1122),(45,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 11',1122),(46,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 13',1122),(47,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 15',1122),(48,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 16',1122),(49,'2024-07-11','map',NULL,'mdurand','2024-07-11','Instalado','prueba 17',1122),(50,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 18',1122),(51,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 19',1122),(52,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 20',1122),(53,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 21',1122),(54,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 23',1122),(55,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 23',1122),(56,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 24',1122),(57,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 25',1122),(58,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 26',1122),(59,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 27',1122),(60,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 28',1122),(61,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 29',1122),(62,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 30',1122),(63,'2024-07-11','maps',NULL,'mdurand','2024-07-11','Instalado','prueba 31',1122),(64,'2024-07-11','https://maps.app.goo.gl/KE687k43a6gzPpX59',NULL,'mdurand','2024-07-11','Instalado','ninguna',1122),(65,'2024-07-11','https://maps.app.goo.gl/KE687k43a6gzPpX59',NULL,'mdurand','2024-07-11','Instalado','27287503   1185',1185),(66,'2024-07-11','jajaja',NULL,'mdurand','2024-07-11','Instalado','jajaja',1282),(67,'2024-07-11','Maps',NULL,'mdurand','2024-07-11','Instalado','Me dió agua al menos',1297),(68,'2024-07-11','Maps',NULL,'mdurand','2024-07-11','Instalado','Me dió agua al menos',1337),(69,'2024-07-15','Maps',NULL,'mdurand','2024-07-15','Instalado','Me invitó ceviche',1410),(70,'2024-08-01',NULL,NULL,'mdurand','2024-08-01','Instalado','no registre su localizacion',146),(71,'2024-08-01','https://maps.app.goo.gl/fhhcFiZoGQ6oa6369',NULL,'mdurand','2024-08-01','Instalado','me trataron bien',1000),(72,'2024-08-09','https://maps.app.goo.gl/PSsv9yh7EZGZJ8ca8',NULL,'lguillen','2024-08-09','Instalado','buen trato',1119),(73,'2024-08-09','https://maps.app.goo.gl/PSsv9yh7EZGZJ8ca8',NULL,'lguillen','2024-08-09','Instalado','le gusta comprar',1123);
/*!40000 ALTER TABLE `instalacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09  5:16:34
