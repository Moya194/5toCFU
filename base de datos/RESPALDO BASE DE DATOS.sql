-- CREATE DATABASE  IF NOT EXISTS `catastroanimales` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- USE `catastroanimales`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: catastroanimales
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `UsuarioId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'andres','andres',5);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Especie` varchar(50) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `Descripcion` text,
  `Raza` varchar(100) DEFAULT NULL,
  `Habitat` varchar(100) DEFAULT NULL,
  `Alimento` varchar(100) DEFAULT NULL,
  `OtroAlimento` varchar(100) DEFAULT NULL,
  `Obtencion` varchar(100) DEFAULT NULL,
  `Tenencia` varchar(100) DEFAULT NULL,
  `Reproductivo` tinyint(1) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'THOMA','GRIS','FELINO','2025-02-13','M','NA','RUSSIAN ','','','','','',0,''),(2,'princeso','amarrillo','felino','2025-02-13','M','NA','nopse','CASA','CASERO','NA','ADOPCION','CASA',0,'NA');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariomascota`
--

DROP TABLE IF EXISTS `usuariomascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariomascota` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UsuarioId` int NOT NULL,
  `MascotaId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UsuarioId` (`UsuarioId`,`MascotaId`),
  KEY `MascotaId` (`MascotaId`),
  CONSTRAINT `usuariomascota_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `usuariomascota_ibfk_2` FOREIGN KEY (`MascotaId`) REFERENCES `mascotas` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariomascota`
--

LOCK TABLES `usuariomascota` WRITE;
/*!40000 ALTER TABLE `usuariomascota` DISABLE KEYS */;
INSERT INTO `usuariomascota` VALUES (1,2,1),(2,3,2);
/*!40000 ALTER TABLE `usuariomascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Ocupacion` varchar(100) DEFAULT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `TelefonoFijo` varchar(20) DEFAULT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cedula` (`Cedula`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'MATHEW','CARRILLO','24 DE MAYO Y GARCIA MORENO','ESTUDIANTE','1316046951','0992600415','02110512','pachaytc@gmail.com','Usuario'),(3,'karla ','barrera ','asd','ad','10101010101','0992600415','022110512','akrla@gmail.com','Usuario'),(5,'JUAN','FERNANDO','NA','NA','10101010109','09999999999','02110512','juan@gmail.com','Usuario');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacunas`
--

DROP TABLE IF EXISTS `vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `FechaAplicacion` date DEFAULT NULL,
  `MascotaId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `MascotaId` (`MascotaId`),
  CONSTRAINT `vacunas_ibfk_1` FOREIGN KEY (`MascotaId`) REFERENCES `mascotas` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacunas`
--

LOCK TABLES `vacunas` WRITE;
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` VALUES (1,'RABIA','NA','2025-02-13',1),(2,'RABIA ','600MG','2025-02-05',2);
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'catastroanimales'
--

--
-- Dumping routines for database 'catastroanimales'
--
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarUsuario`(
    IN p_Nombre VARCHAR(100),
    IN p_Apellido VARCHAR(100),
    IN p_Direccion VARCHAR(255),
    IN p_Ocupacion VARCHAR(100),
    IN p_Cedula VARCHAR(20),
    IN p_Telefono VARCHAR(20),
    IN p_TelefonoFijo VARCHAR(20),
    IN p_Correo VARCHAR(150),
    IN p_Tipo VARCHAR(50)
)
BEGIN
    DECLARE v_UsuarioId INT;

    -- Insertar el usuario
    INSERT INTO Usuarios (Nombre, Apellido, Direccion, Ocupacion, Cedula, Telefono, TelefonoFijo, Correo, Tipo)
    VALUES (p_Nombre, p_Apellido, p_Direccion, p_Ocupacion, p_Cedula, p_Telefono, p_TelefonoFijo, p_Correo, p_Tipo);

    SET v_UsuarioId = LAST_INSERT_ID();

    -- Crear cuenta de usuario con la cédula como username y password (cifrado con SHA2)
    INSERT INTO Cuentas (Username, Password, UsuarioId)
    VALUES (p_Cedula, SHA2(p_Cedula, 256), v_UsuarioId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-14  2:59:45
