CREATE DATABASE  IF NOT EXISTS `velodromo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `velodromo`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 10.122.24.114    Database: velodromo
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `old_ciclista`
--

DROP TABLE IF EXISTS `old_ciclista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `old_ciclista` (
  `id_tabla` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contra` varchar(300) DEFAULT NULL,
  `mail` varchar(300) DEFAULT NULL,
  `idequipo` int DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  PRIMARY KEY (`id_tabla`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_ciclista`
--

LOCK TABLES `old_ciclista` WRITE;
/*!40000 ALTER TABLE `old_ciclista` DISABLE KEYS */;
INSERT INTO `old_ciclista` VALUES (1,1,'z','z','z','fbade9e36a3f36d3d676c1b808451dd7','z@z.z',3,2),(2,3,'j','j','j','j','j@j.j',2,1),(3,3,'q','q','q','7694f4a66316e53c8cdd9d9954bd611d','q@q.q',3,2),(4,4,'w','w','w','f1290186a5d0b1ceab27f4e77c0c5d68','w@w.w',1,2),(5,2,'k','a','a','0cc175b9c0f1b6a831c399e269772661','a@a.a',2,1),(6,5,'w','w','w','f1290186a5d0b1ceab27f4e77c0c5d68','w@w.w',1,1),(7,6,'c','c','c','4a8a08f09d37b73795649038408b5f33','c@c.c',1,2),(8,2,'a','a','a','0cc175b9c0f1b6a831c399e269772661','a@a.a',1,2);
/*!40000 ALTER TABLE `old_ciclista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 10:56:35
