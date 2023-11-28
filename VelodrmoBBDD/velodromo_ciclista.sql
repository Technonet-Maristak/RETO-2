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
-- Table structure for table `ciclista`
--

DROP TABLE IF EXISTS `ciclista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclista` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contra` varchar(300) NOT NULL,
  `mail` varchar(300) NOT NULL,
  `idequipo` int DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  `modificacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_idequipo_idx` (`idequipo`),
  KEY `FK_idrol_idx` (`idrol`),
  CONSTRAINT `FK_idequipo` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_idrol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclista`
--

LOCK TABLES `ciclista` WRITE;
/*!40000 ALTER TABLE `ciclista` DISABLE KEYS */;
INSERT INTO `ciclista` VALUES (1,'admin','admin','admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.com',3,1,NULL),(3,'Mikel','Rojas','mikelr','81dc9bdb52d04dc20036dbd8313ed055','mikel.rojas@maristak.net',3,2,NULL),(4,'Maite','Gallastegui','maiteg','81dc9bdb52d04dc20036dbd8313ed055','maite.gallastegui@maristak.net',3,2,NULL),(5,'Maialen','Alonso','maialena','81dc9bdb52d04dc20036dbd8313ed055','maialen.alonso@maristak.net',3,2,NULL),(6,'Aimar','Arrinda','aimara','81dc9bdb52d04dc20036dbd8313ed055','aimar.arrinda@maristak.net',3,2,NULL),(7,'Fernando','Budai','fernandob','81dc9bdb52d04dc20036dbd8313ed055','fenando.budai@maristak.net',4,2,NULL),(8,'Mikel','Bilbao','mikelb','81dc9bdb52d04dc20036dbd8313ed055','mikel.bilbao@maristak.net',4,2,NULL),(9,'Marcos','Seoane','marcoss','81dc9bdb52d04dc20036dbd8313ed055','marcos.seoane@maristak.net',4,2,NULL),(10,'Julen Michael','Shobowale','jm','81dc9bdb52d04dc20036dbd8313ed055','julenmichael.shobowale@maristak.net',4,2,NULL),(11,'ander','olabarria','ob','99faee4e1a331a7595932b7c18f9f5f6','khffkhfgjkg',3,2,NULL),(12,'Edu','Martinez','edum','ecd696b15816de725770ed4f8f97a2d6','edu@gmail.com',3,2,NULL);
/*!40000 ALTER TABLE `ciclista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `ciclista_BEFORE_UPDATE` BEFORE UPDATE ON `ciclista` FOR EACH ROW BEGIN

if new.id <> old.id 
then set new.modificacion = concat(new.modificacion, "id ");
end if;
if new.nombre <> old.nombre 
then set new.modificacion = concat(new.modificacion, "nombre ");
end if;
if new.apellido <> old.apellido 
then set new.modificacion = concat(new.modificacion, "apellido ");
end if;
if new.usuario <> old.usuario 
then set new.modificacion = concat(new.modificacion, "usuario ");
end if;
if new.contra <> old.contra 
then set new.modificacion = concat(new.modificacion, "contra ");
end if;
if new.mail <> old.mail 
then set new.modificacion = concat(new.modificacion, "mail ");
end if;
if new.idequipo <> old.idequipo 
then set new.modificacion = concat(new.modificacion, "idequipo ");
end if;
if new.idrol <> old.idrol 
then set new.modificacion = concat(new.modificacion, "idrol ");
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`%`*/ /*!50003 TRIGGER `borra_old_ciclista` BEFORE DELETE ON `ciclista` FOR EACH ROW BEGIN

insert into old_ciclista (id, nombre, apellido, usuario, contra, mail, idequipo, idrol) VALUES (old.id, old.nombre, old.apellido, old.usuario, old.contra, old.mail, old.idequipo, old.idrol);

END */;;
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

-- Dump completed on 2022-12-03 10:56:39
