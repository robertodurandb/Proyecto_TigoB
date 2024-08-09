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
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idpago` int NOT NULL AUTO_INCREMENT,
  `num_contrato` int NOT NULL,
  `montopago` double NOT NULL,
  `fechapago` date NOT NULL,
  `mespago` int NOT NULL,
  `anio` int NOT NULL,
  `mediopago` varchar(30) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_detallecontrato` (`num_contrato`),
  KEY `fk_idmeses` (`mespago`),
  CONSTRAINT `fk_detallecontrato` FOREIGN KEY (`num_contrato`) REFERENCES `detallecontrato` (`num_contrato`),
  CONSTRAINT `fk_idmeses` FOREIGN KEY (`mespago`) REFERENCES `meses` (`idmeses`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (8,1185,55,'2024-03-01',3,2024,'Yape','pendiente 10 soles'),(9,1185,60,'2023-12-10',12,2023,'Transferencia',NULL),(10,1185,60,'2023-11-05',11,2023,'Yape',''),(11,1282,100,'2024-01-09',1,2024,'Yape','pendiente 20 soles'),(12,1282,20,'2024-01-09',1,2024,'efectivo',''),(13,1282,100,'2023-12-10',12,2023,'Yape',''),(14,1282,120,'2023-11-05',11,2023,'Transferencia bcp',''),(15,1185,50,'2024-01-09',1,2024,'yape',''),(16,2234,80,'2024-01-09',1,2024,'Yape','pendiente 10'),(17,2234,10,'2024-01-09',1,2024,'yape',''),(18,2234,90,'2023-12-05',12,2023,'yape',''),(19,2234,90,'2023-10-10',10,2023,'yape',''),(20,2234,90,'2023-11-06',11,2023,'yape',''),(22,1337,100,'2024-03-07',3,2024,'Yape',NULL),(23,1337,100,'2024-02-07',2,2024,'yape',NULL),(24,1337,110,'2024-01-07',1,2024,'yape',NULL),(25,1297,80,'2024-03-07',3,2024,'yape',NULL),(26,1297,70,'2023-12-10',12,2023,'yape',NULL),(27,1297,80,'2024-03-07',3,2024,'yape',NULL),(28,1337,80,'2023-12-10',12,2023,'yape',NULL),(29,1297,80,'2024-02-18',2,2024,'yape',NULL),(30,1337,80,'2023-11-10',11,2023,'yape',NULL),(31,1337,80,'2023-10-10',10,2023,'yape',NULL),(32,1337,80,'2023-09-10',9,2023,'yape',NULL),(33,1337,80,'2023-08-10',8,2023,'yape',NULL),(34,1337,80,'2023-07-18',7,2023,'yape',NULL),(35,1297,80,'2023-11-18',11,2023,'yape',NULL),(36,1297,80,'2023-08-10',8,2023,'yape',''),(37,1297,80,'2024-09-18',9,2023,'yapeo',''),(38,1297,80,'2023-07-18',7,2023,'yape',''),(39,1185,50,'2024-02-09',2,2024,'plin',NULL),(40,1185,70,'2024-04-11',4,2024,'efectivo',NULL),(41,1122,50,'2024-05-15',5,2024,'yape',NULL),(42,1122,100,'2024-06-01',6,2024,'plin',NULL),(43,1122,80,'2024-04-01',4,2024,'yape',''),(44,1410,70,'2024-07-15',7,2024,'Yape',NULL);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09  5:16:35
