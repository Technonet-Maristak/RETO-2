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
-- Temporary view structure for view `ciclistas`
--

DROP TABLE IF EXISTS `ciclistas`;
/*!50001 DROP VIEW IF EXISTS `ciclistas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ciclistas` AS SELECT 
 1 AS `idciclista`,
 1 AS `NVuelta`,
 1 AS `idequipo`,
 1 AS `NombreEquipo`,
 1 AS `Fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!50001 DROP VIEW IF EXISTS `equipos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `equipos` AS SELECT 
 1 AS `idequipo`,
 1 AS `NombreEquipo`,
 1 AS `NVuelta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ciclistas`
--

/*!50001 DROP VIEW IF EXISTS `ciclistas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user_velodromo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ciclistas` AS select `v`.`idciclista` AS `idciclista`,count(`v`.`numvuelta`) AS `NVuelta`,`c`.`idequipo` AS `idequipo`,`e`.`nombre` AS `NombreEquipo`,`v`.`fecha` AS `Fecha` from ((`vuelta` `v` join `ciclista` `c` on((`v`.`idciclista` = `c`.`id`))) join `equipo` `e` on((`c`.`idequipo` = `e`.`id`))) group by `v`.`idciclista`,`v`.`fecha` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `equipos`
--

/*!50001 DROP VIEW IF EXISTS `equipos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user_velodromo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `equipos` AS select `ciclistas`.`idequipo` AS `idequipo`,`ciclistas`.`NombreEquipo` AS `NombreEquipo`,sum(`ciclistas`.`NVuelta`) AS `NVuelta` from `ciclistas` where (`ciclistas`.`Fecha` = cast(now() as date)) group by `ciclistas`.`idequipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'velodromo'
--

--
-- Dumping routines for database 'velodromo'
--
/*!50003 DROP FUNCTION IF EXISTS `tiempoMax` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user_velodromo`@`%` FUNCTION `tiempoMax`(pidEquipo int) RETURNS int
BEGIN
declare vtiempoMax int;
select sum(tiempo) into vtiempoMax from vuelta v inner join ciclista c on c.id=v.idciclista where c.idequipo=pidEquipo;
RETURN vtiempoMax;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Descarga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user_velodromo`@`%` PROCEDURE `Descarga`()
BEGIN
declare exit handler for 1086
begin
set @texto = concat("SELECT 'ID', 'NOMBRE', 'VUELTAS' UNION ALL SELECT idequipo, NombreEquipo, NVuelta FROM equipos into outfile '/var/csv/Vueltas", date(now()), ".csv'");
PREPARE s1 FROM @texto;
EXECUTE s1;
DROP PREPARE s1;
end;

set @texto = concat("SELECT 'ID', 'NOMBRE', 'VUELTAS' UNION ALL SELECT idequipo, NombreEquipo, NVuelta FROM equipos into outfile '/var/csv/Vueltas.csv'");

PREPARE s1 FROM @texto;
EXECUTE s1;
DROP PREPARE s1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EquipoGanador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user_velodromo`@`%` PROCEDURE `EquipoGanador`()
BEGIN
DROP VIEW IF EXISTS ciclistas;
DROP VIEW IF EXISTS equipos;

CREATE view ciclistas AS SELECT idciclista, COUNT(numVuelta) AS NVuelta, c.idequipo, e.nombre AS NombreEquipo, v.fecha AS Fecha
FROM vuelta v INNER JOIN ciclista c ON v.idciclista=c.id
INNER JOIN equipo e ON c.idequipo=e.id GROUP BY idciclista, v.fecha;

CREATE VIEW equipos AS SELECT idequipo, NombreEquipo ,SUM(NVuelta) AS NVuelta FROM ciclistas WHERE fecha = DATE(NOW()) GROUP BY idequipo;

SELECT NombreEquipo, max(NVuelta) AS NVuelta FROM equipos GROUP BY NombreEquipo;

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

-- Dump completed on 2022-12-03 10:57:02
