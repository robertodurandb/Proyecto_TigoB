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
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `idcaja` varchar(8) NOT NULL,
  `nombrecaja` varchar(30) NOT NULL,
  `localizacion` varchar(50) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idcaja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES ('c0101','Terminal 01 Spliter 01','https://goo.gl/maps/uum7eQZuw9qYgGW69','Activo'),('c0102','Terminal 01 Spliter 02','https://goo.gl/maps/N2P5Ntb9NTPz1QA4A','Activo'),('c0103','Terminal 01 Spliter 03','https://goo.gl/maps/PbdmH2qD4HbN9ttWA','Activo'),('c0104','Terminal 01 Spliter 04','https://goo.gl/maps/ExXGjYUPLWzqSstr5','Activo'),('c0105','Terminal 01 Spliter 05','https://goo.gl/maps/Z9iKYjCSoY2JdpVu9','Inactivo'),('c0106','Terminal 01 Spliter 06','collique','Activo'),('c0107','Terminal 01 Spliter 07','Lince','Activo'),('c0108','Terminal 01 Spliter 08','Lince2','Activo');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dnicliente` varchar(12) NOT NULL,
  `nombrecli` varchar(45) NOT NULL,
  `apellidocli` varchar(45) NOT NULL,
  `direccioncli` varchar(65) DEFAULT NULL,
  `distritocli` varchar(45) DEFAULT NULL,
  `provinciacli` varchar(45) DEFAULT NULL,
  `nacionalidadcli` varchar(45) DEFAULT NULL,
  `telefonocli` int DEFAULT NULL,
  `telefonocli2` int DEFAULT NULL,
  `ubicacion_cli` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dnicliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('07926404','Jessica Brenda','Durand Baca','Pasaje Fundadores 111 San Gabriel','San Juan de Lurigancho','Lima','Peruana',935356466,2833769,'https://maps.app.goo.gl/od8nmWMfeWJtRKgX9'),('08954987','Roberto Emilio','Durand Motta','pasaje fundadores 111','Comas','Lima','Peruana',958795354,NULL,NULL),('10748852','Villy','Rodriguez Guillen','Jr. Cesar Vallejo 222','Comas','Lima','Peruana',99365611,NULL,NULL),('12345678','Diana Killari','Durand Guillen','Av. Ignacio Merino 1512','Lince','LIMA','Peruana',956875652,NULL,NULL),('45646940','Roberto Mitchell','Durand Baca','Pasaje Caracas 104','Jesus Maria','Lima','Peruana',991353720,12345678,NULL),('46665297','Linda Ketty','Guillen Machaca','Ignacio Merino 1512','Lince','Lima','Peruana',995584683,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecontrato`
--

DROP TABLE IF EXISTS `detallecontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallecontrato` (
  `iddetallecontrato` int NOT NULL AUTO_INCREMENT,
  `planes_idplanes` int NOT NULL,
  `cliente_dnicliente` varchar(12) NOT NULL,
  `caja_idcaja` varchar(8) NOT NULL,
  `num_contrato` int NOT NULL,
  `fecha_contrato` date NOT NULL,
  `instalacion` varchar(10) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`iddetallecontrato`),
  KEY `fk_detallecontrato_planes1_idx` (`planes_idplanes`),
  KEY `fk_cliente_dnicliente` (`cliente_dnicliente`),
  KEY `fk_caja_idcaja` (`caja_idcaja`),
  CONSTRAINT `fk_caja_idcaja` FOREIGN KEY (`caja_idcaja`) REFERENCES `caja` (`idcaja`),
  CONSTRAINT `fk_cliente_dnicliente` FOREIGN KEY (`cliente_dnicliente`) REFERENCES `cliente` (`dnicliente`),
  CONSTRAINT `fk_detallecontrato_planes1` FOREIGN KEY (`planes_idplanes`) REFERENCES `planes` (`idplanes`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecontrato`
--

LOCK TABLES `detallecontrato` WRITE;
/*!40000 ALTER TABLE `detallecontrato` DISABLE KEYS */;
INSERT INTO `detallecontrato` VALUES (7,4,'08954987','c0102',1216,'2023-08-24','Completada'),(8,3,'45646940','c0101',1217,'2023-08-27','Completada'),(12,3,'08954987','c0104',1221,'2023-08-27','Completada'),(13,2,'45646940','c0105',1222,'2023-08-31','Completada'),(14,1,'46665297','c0103',1223,'2023-08-31','Pendiente'),(15,4,'46665297','c0103',1218,'2023-08-31','Completada'),(16,5,'46665297','c0105',1224,'2023-08-31','Completada'),(17,1,'12345678','c0101',1225,'2023-08-31','Completada'),(18,4,'12345678','c0105',1226,'2023-08-31','Completada'),(19,4,'10748852','c0105',45896,'2023-09-18','Completada'),(20,6,'45646940','c0101',24564,'2023-10-28','Completada'),(21,1,'45646940','c0101',1228,'2023-11-16','Pendiente');
/*!40000 ALTER TABLE `detallecontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idestado` int NOT NULL AUTO_INCREMENT,
  `Desc_estado` varchar(10) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idpago` int NOT NULL AUTO_INCREMENT,
  `fechapago` date NOT NULL,
  `montopago` double NOT NULL,
  `detallecontrato_iddetallecontrato` int NOT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pago_detallecontrato1_idx` (`detallecontrato_iddetallecontrato`),
  CONSTRAINT `fk_pago_detallecontrato1` FOREIGN KEY (`detallecontrato_iddetallecontrato`) REFERENCES `detallecontrato` (`iddetallecontrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `idplanes` int NOT NULL AUTO_INCREMENT,
  `nombreplan` varchar(30) NOT NULL,
  `descplan` varchar(45) DEFAULT NULL,
  `precioplan` double NOT NULL,
  `velocidadplan` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`idplanes`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Hiperfull 50','Solo Internet',50,'30MB','Activo'),(2,'Hiperfull 70','Solo Internet',70,'40MB','Activo'),(3,'Hiperfull 80','Internet + Cable',80,'40MB','Activo'),(4,'Hiperfull 100','Internet + Cable',100,'50MB','Activo'),(5,'Hiperfull 150','Internet + Cable',150,'100MB','Activo'),(6,'Cablefull','Solo Cable',50,'-','Activo');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `dniuser` varchar(15) NOT NULL,
  `nombre_user` varchar(45) NOT NULL,
  `apellido_user` varchar(45) NOT NULL,
  `perfil_user` varchar(12) NOT NULL,
  `password` varchar(60) NOT NULL,
  `estado_user` varchar(10) NOT NULL DEFAULT 'Activo',
  `iduser` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('45646940','Mitchell','Durand Baca','Admin','$2b$10$GBIy6hvqTJInY13vbq0ZuuV.8ob.ZjgQQJB8lBr676leRz3NgrHiC','Activo',4),('46665297','Linda Ketty','Guillen Machaca','User','$2b$10$bpHceSMNVso0R3DqcFWkXOd.0FIgcuttrR4ntbxmGJG626KnV5gOu','Activo',6);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tigo'
--

--
-- Dumping routines for database 'tigo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-21  4:59:25
