CREATE DATABASE  IF NOT EXISTS `tigo` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tigo`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tigo
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `user_create` varchar(15) DEFAULT NULL,
  `fecha_create` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `observacion_instalacion` varchar(45) DEFAULT NULL,
  `imagen_idimagen` int DEFAULT '1',
  PRIMARY KEY (`idinstalacion`),
  KEY `instalacion_ibfk_1` (`imagen_idimagen`),
  CONSTRAINT `instalacion_ibfk_1` FOREIGN KEY (`imagen_idimagen`) REFERENCES `imagen` (`idimagen`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalacion`
--

LOCK TABLES `instalacion` WRITE;
/*!40000 ALTER TABLE `instalacion` DISABLE KEYS */;
INSERT INTO `instalacion` VALUES (8,'2024-06-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','mdurand','2024-07-03','instalado','me dieron gaseosa y buen trato',1),(9,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','mdurand','2024-07-03','instalado','no me dieron pan',1),(10,'2024-07-02','https://maps.app.goo.gl/pSTrqK6aCtsmf1VV8','mdurand','2024-07-02','Instalado',NULL,1),(11,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6','mdurand','2024-07-03','Instalado',NULL,1),(12,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6','mdurand','2024-07-03','Instalado','me miro feo',1),(13,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6','mdurand','2024-07-03','Instalado','fue amable',1),(14,'2024-07-03','https://maps.app.goo.gl/Yz6SCqzk6N8m2MRg6','mdurand','2024-07-03','Instalado','todo bien',1),(15,'2024-07-05','https://maps.app.goo.gl/kL5mg4YUayYZ1Afw9','mdurand','2024-07-05','Instalado','no quiso firmar contrato.',1),(19,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9','mdurand','2024-07-06','Instalado','prueba3 1121',1),(20,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9','mdurand','2024-07-06','Instalado','prueba4 1122',1),(21,'2024-07-06','https://maps.app.goo.gl/vQKf4Gd5cXr93mpU9','mdurand','2024-07-06','Instalado','prueba con numcontrato 1185',1),(25,'2024-07-07','https://maps.app.goo.gl/zGQKgvGcEVijzVg89','mdurand','2024-07-07','Instalado','xdd',1),(26,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','mdurand','2024-07-03','instalado','no me dieron pan',1),(27,'2024-07-08','https://maps.app.goo.gl/DMwHHvu7WzWXkNjH7','mdurand','2024-07-08','Instalado','hambre',1),(28,'2024-05-01','https://maps.app.goo.gl/jA2QAKwxwk2QUKsHA','mdurand','2024-07-03','instalado','no me dieron pan',1),(29,'2024-07-11','maps','mdurand','2024-07-11','Instalado','test 1122',1),(30,'2024-07-11','maps','mdurand','2024-07-11','Instalado','test 1122',1),(31,'2024-07-11','maps','mdurand','2024-07-11','Instalado','1122 test 11072024',1),(32,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 11072024 1122',1),(33,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 11072024 21:01',1),(34,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 2 11072024',1),(35,'2024-07-11','maps','mdurand','2024-07-11','Instalado','hola 1',1),(36,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba ',1),(37,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba4',1),(38,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba5',1),(39,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 6',1),(40,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 6',1),(41,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 7',1),(42,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 8',1),(43,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 9',1),(44,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 10',1),(45,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 11',1),(46,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 13',1),(47,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 15',1),(48,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 16',1),(49,'2024-07-11','map','mdurand','2024-07-11','Instalado','prueba 17',1),(50,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 18',1),(51,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 19',1),(52,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 20',1),(53,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 21',1),(54,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 23',1),(55,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 23',1),(56,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 24',1),(57,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 25',1),(58,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 26',1),(59,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 27',1),(60,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 28',1),(61,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 29',1),(62,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 30',1),(63,'2024-07-11','maps','mdurand','2024-07-11','Instalado','prueba 31',1),(64,'2024-07-11','https://maps.app.goo.gl/KE687k43a6gzPpX59','mdurand','2024-07-11','Instalado','ninguna',1),(65,'2024-07-11','https://maps.app.goo.gl/KE687k43a6gzPpX59','mdurand','2024-07-11','Instalado','27287503   1185',1),(66,'2024-07-11','jajaja','mdurand','2024-07-11','Instalado','jajaja',1),(67,'2024-07-11','Maps','mdurand','2024-07-11','Instalado','Me dió agua al menos',1),(68,'2024-07-11','Maps','mdurand','2024-07-11','Instalado','Me dió agua al menos',1),(69,'2024-07-15','Maps','mdurand','2024-07-15','Instalado','Me invitó ceviche',1),(70,'2024-08-01',NULL,'mdurand','2024-08-01','Instalado','no registre su localizacion',1),(71,'2024-08-01','https://maps.app.goo.gl/fhhcFiZoGQ6oa6369','mdurand','2024-08-01','Instalado','me trataron bien',1),(72,'2024-08-09','https://maps.app.goo.gl/PSsv9yh7EZGZJ8ca8','lguillen','2024-08-09','Instalado','buen trato',1),(73,'2024-08-09','https://maps.app.goo.gl/PSsv9yh7EZGZJ8ca8','lguillen','2024-08-09','Instalado','le gusta comprar',1),(74,'2024-08-09','https://maps.app.goo.gl/HBXx1ZfM2zviHWGT7','mdurand','2024-08-09','Instalado','Mal trato',1),(75,'2024-08-09','https://maps.app.goo.gl/HBXx1ZfM2zviHWGT7','lguillen','2024-08-09','Instalado','Amable',1),(76,'2024-08-09','https://maps.app.goo.gl/HBXx1ZfM2zviHWGT7','lguillen','2024-08-09','Instalado','Amable',1),(77,'2024-08-09','https://maps.app.goo.gl/HBXx1ZfM2zviHWGT7','lguillen','2024-08-09','Instalado','Amable',1),(78,'2024-08-19','https://maps.app.goo.gl/g5DEou8T2zRuAPXs7','mdurand','2024-08-19','Instalado','ninguna',2),(79,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','cuenta chistes',4),(80,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','no quiere fotos',4),(81,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','no quiere fotos',1),(82,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','no quiere fotos',1),(83,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','no quiere fotos',5),(84,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','no quiere fotos',1),(85,'2024-08-19','https://maps.app.goo.gl/xCvawPvkHSGypiS36','mdurand','2024-08-19','Instalado','si acepto foto',6);
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

-- Dump completed on 2024-08-19 16:04:42
