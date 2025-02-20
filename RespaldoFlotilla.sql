CREATE DATABASE  IF NOT EXISTS `flotilla1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flotilla1`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: flotilla1
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `idAuto` int NOT NULL,
  `modelo` varchar(80) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `anio` int NOT NULL,
  `placa` varchar(20) NOT NULL,
  PRIMARY KEY (`idAuto`),
  UNIQUE KEY `placa` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,'Civic','Honda',2020,'ABC123'),(2,'Corolla','Toyota',2019,'XYZ456'),(3,'Mustang','Ford',2022,'MUS789'),(4,'Jetta','Volkswagen',2021,'JET101'),(5,'Sentra','Nissan',2018,'SEN202');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductor` (
  `idConductor` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `licencia` varchar(20) NOT NULL,
  PRIMARY KEY (`idConductor`),
  UNIQUE KEY `licencia` (`licencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

LOCK TABLES `conductor` WRITE;
/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
INSERT INTO `conductor` VALUES (1,'Juan Pérez','LIC12345'),(2,'María López','LIC67890'),(3,'Carlos Ramírez','LIC11223'),(4,'Andrea Torres','LIC44556'),(5,'Miguel Sánchez','LIC78901');
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo_gasolina`
--

DROP TABLE IF EXISTS `consumo_gasolina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo_gasolina` (
  `idConsumo` int NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `idAuto` int NOT NULL,
  PRIMARY KEY (`idConsumo`),
  KEY `idAuto` (`idAuto`),
  CONSTRAINT `consumo_gasolina_ibfk_1` FOREIGN KEY (`idAuto`) REFERENCES `auto` (`idAuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo_gasolina`
--

LOCK TABLES `consumo_gasolina` WRITE;
/*!40000 ALTER TABLE `consumo_gasolina` DISABLE KEYS */;
INSERT INTO `consumo_gasolina` VALUES (1,'2025-01-10',50.00,2500.00,1),(2,'2025-01-15',40.00,1000.00,2),(3,'2025-01-20',55.00,2400.00,3),(4,'2025-01-25',60.00,3000.00,4),(5,'2025-01-30',45.00,2300.00,5);
/*!40000 ALTER TABLE `consumo_gasolina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto_refacciones`
--

DROP TABLE IF EXISTS `gasto_refacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto_refacciones` (
  `idGasto` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `idMantenimiento` int NOT NULL,
  PRIMARY KEY (`idGasto`),
  KEY `idMantenimiento` (`idMantenimiento`),
  CONSTRAINT `gasto_refacciones_ibfk_1` FOREIGN KEY (`idMantenimiento`) REFERENCES `mantenimiento` (`idMantenimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto_refacciones`
--

LOCK TABLES `gasto_refacciones` WRITE;
/*!40000 ALTER TABLE `gasto_refacciones` DISABLE KEYS */;
INSERT INTO `gasto_refacciones` VALUES (1,'2025-01-10','Aceite sintético',500.00,1),(2,'2025-01-15','Pastillas de freno',1200.00,2),(3,'2025-01-20','Balanceo de llantas',800.00,3),(4,'2025-01-25','Llantas Michelin',4000.00,4),(5,'2025-01-30','Batería Bosch',2500.00,5);
/*!40000 ALTER TABLE `gasto_refacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento` (
  `idMantenimiento` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `idAuto` int NOT NULL,
  PRIMARY KEY (`idMantenimiento`),
  KEY `idAuto` (`idAuto`),
  CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`idAuto`) REFERENCES `auto` (`idAuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
INSERT INTO `mantenimiento` VALUES (1,'2025-07-10','Cambio de aceite',500.00,1),(2,'2025-01-15','Revisión de frenos',1200.00,2),(3,'2025-10-20','Alineación y balanceo',800.00,3),(4,'2025-01-25','Cambio de llantas',4000.00,4),(5,'2025-02-27','Cambio de batería',2500.00,5);
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_conduccion`
--

DROP TABLE IF EXISTS `registro_conduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_conduccion` (
  `idRegistro` int NOT NULL,
  `fecha` date NOT NULL,
  `idConductor` int NOT NULL,
  `idAuto` int NOT NULL,
  PRIMARY KEY (`idRegistro`),
  KEY `idConductor` (`idConductor`),
  KEY `idAuto` (`idAuto`),
  CONSTRAINT `registro_conduccion_ibfk_1` FOREIGN KEY (`idConductor`) REFERENCES `conductor` (`idConductor`),
  CONSTRAINT `registro_conduccion_ibfk_2` FOREIGN KEY (`idAuto`) REFERENCES `auto` (`idAuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_conduccion`
--

LOCK TABLES `registro_conduccion` WRITE;
/*!40000 ALTER TABLE `registro_conduccion` DISABLE KEYS */;
INSERT INTO `registro_conduccion` VALUES (1,'2025-02-19',1,1),(2,'2025-11-05',2,2),(3,'2025-02-19',3,3),(4,'2025-09-13',4,4),(5,'2025-01-01',5,5);
/*!40000 ALTER TABLE `registro_conduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificacion`
--

DROP TABLE IF EXISTS `verificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificacion` (
  `idVerificacion` int NOT NULL,
  `fechaVerificacion` date NOT NULL,
  `idAuto` int NOT NULL,
  PRIMARY KEY (`idVerificacion`),
  KEY `idAuto` (`idAuto`),
  CONSTRAINT `verificacion_ibfk_1` FOREIGN KEY (`idAuto`) REFERENCES `auto` (`idAuto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificacion`
--

LOCK TABLES `verificacion` WRITE;
/*!40000 ALTER TABLE `verificacion` DISABLE KEYS */;
INSERT INTO `verificacion` VALUES (1,'2029-03-05',1),(2,'2025-03-10',2),(3,'2030-03-15',3),(4,'2025-03-20',4),(5,'2027-03-25',5);
/*!40000 ALTER TABLE `verificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flotilla1'
--

--
-- Dumping routines for database 'flotilla1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-20 12:35:56
