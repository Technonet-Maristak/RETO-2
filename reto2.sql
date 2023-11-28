set global log_bin_trust_function_creators = 1;
set SQL_SAFE_UPDATES = 0;
CREATE SCHEMA `reto2` ;

CREATE TABLE `reto2`.`ciclista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NULL,
  `clave` VARCHAR(45) NULL,
  `idgrupo` INT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `reto2`.`equipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `equipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `reto2`.`secreto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clave` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `reto2`.`vuelta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NULL DEFAULT current_timestamp(),
  `idciclista` INT NULL,
  `numerodevuelta` INT NULL,
  `tiempodevuelta` INT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `reto2`.`ciclista` 
ADD CONSTRAINT `FK_idgrupo`
  FOREIGN KEY (`idgrupo`)
  REFERENCES `reto2`.`equipo` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `reto2`.`vuelta` 
ADD INDEX `FK_idciclista_idx` (`idciclista` ASC) VISIBLE;
;
ALTER TABLE `reto2`.`vuelta` 
ADD CONSTRAINT `FK_idciclista`
  FOREIGN KEY (`idciclista`)
  REFERENCES `reto2`.`ciclista` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

INSERT INTO `reto2`.`equipo`
(`equipo`)
VALUES
('Grupo1'), ('Grupo2'), ('Grupo3'), ('Grupo4'), ('Grupo5');
/*VIEWS*/
/*Cabe destacar que en la pagina web ya existen buscadores para visualizar diferentes informaciones de la bbdd.*/
/* Esta vista nos servira para ver que equipo de los participantes ha dado mas vueltas. */
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `LUIS`@`%` 
    SQL SECURITY DEFINER
VIEW `GANADOR` AS
    SELECT 
        `equipo`.`equipo` AS `equipo`,
        COUNT(`vuelta`.`numerodevuelta`) AS `vueltastotales`,
        SUM(`vuelta`.`tiempodevuelta`) AS `tiempototal`
    FROM
        ((`vuelta`
        JOIN `ciclista` ON ((`vuelta`.`idciclista` = `ciclista`.`id`)))
        JOIN `equipo` ON ((`ciclista`.`idgrupo` = `equipo`.`id`)))
    GROUP BY `equipo`.`equipo`
    ORDER BY `vueltastotales` DESC
    LIMIT 1;

/* Esta vista nos servira para ver la informacion referente a los ciclistas registrados */
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `LUIS`@`%` 
    SQL SECURITY DEFINER
VIEW `Vnombres` AS
    SELECT 
        `ciclista`.`nombre` AS `ciclista`,
        `ciclista`.`apellido` AS `apellido`,
        `ciclista`.`idgrupo` AS `equipo`
    FROM
        `ciclista`;
    
/**/
CREATE TABLE `reto2`.`oldciclista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NULL,
  `equipo` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
/**/


/* SI UN CICLISTA ES MODIFICADO SABREMOS LA FECHA DE DICHA MODIFICACION */
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `reto2`.`ciclista_BEFORE_UPDATE` BEFORE UPDATE ON `ciclista` FOR EACH ROW
BEGIN
set new.ultimamodificacion = now();
END $$
DELIMITER ;

ALTER TABLE `reto2`.`vuelta` 
ADD COLUMN `fechamod` DATE NULL AFTER `tiempodevuelta`;

/* TAMBIEN QUERREMOS SABER LA FECHA DE MODIFICACION EN CASO DE MODIFICAR UNA VUELTA */
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `reto2`.`vuelta_BEFORE_UPDATE` BEFORE UPDATE ON `vuelta` FOR EACH ROW
BEGIN
set new.fechamod = now();
END $$
DELIMITER ;

/* PROCEDIMIENTO PARA EL ALMACENAMIENTO DE CUENTAS DE ADMINISTRADOR EL CUAL INSERTARA EN LA TABLA SECRETO AL ADMINISTRADOR Y ENCRIPTARA SU CLAVE */
DELIMITER $$
CREATE DEFINER=`LUIS`@`%` PROCEDURE `psecreto`(pnombre varchar(45), pclave varchar(45))
BEGIN
declare cod varchar(45);
declare continue handler for 1146
begin
CREATE TABLE if not exists `reto2`.`secreto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clave` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL);
end;

set cod = md5(pclave);
insert into secreto (nombre, clave) VALUES (pnombre,cod);
END $$
DELIMITER ;

/* FUNCION QUE NOS DEVUELVE EL NOMBRE DEL EQUIPO ESTO LO USAREMOS PARA RELLENAR EL CAMPO DE EQUIPO EN LA TABLA OLDCICLISTA LO CUAL NOS DIRA A QUE EQUIPO PERTENICIA EL CICLISTA ANTES DE SER DADO DE BAJA A TRAVES DE UN TRIGGER */
/* EN DICHA TABLA TAMBIEN CREAREMOS UN CAMPO QUE DE FORMA POR DEFECTO INSERTE LA FECHA EN LA QUE SE DIO DE BAJA AL CICLISTA */
ALTER TABLE `reto2`.`oldciclista` 
ADD COLUMN `fechadebaja` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() AFTER `nombre`;

/* TODO ESTO FUNCIONA EN CONJUNTO CON LOS UPDATES, INSERTS Y DELETES QUE HACEMOS DESDE LA WEB ES POR ESO QUE NO NECESITAMOS DE PROCEDIMIENTOS EXTRAS YA QUE HAY FUNCIONALIDADES YA DEFINIDAS EN EL CODIGO PHP DE LA WEB*/
DELIMITER $$
CREATE DEFINER=`LUIS`@`%` FUNCTION `fgrupo`(fciclista varchar(45)) RETURNS varchar(45) CHARSET utf8mb4
BEGIN
declare fgrupo varchar(45);
select idgrupo into fgrupo from ciclista where nombre = fciclista;
set fgrupo = concat('Grupo',fgrupo);
RETURN fgrupo;
END $$
DELIMITER ;

/* TRIGGER */
/* CUANDO UN CICLISTA SEA ELIMINADO, ALMACENAREMOS SUS DATOS EN OTRA TABLA*/
DROP TRIGGER IF EXISTS `reto2`.`ciclista_BEFORE_DELETE`;
DELIMITER $$
USE `reto2`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reto2`.`ciclista_BEFORE_DELETE` BEFORE DELETE ON `ciclista` FOR EACH ROW
BEGIN
INSERT INTO oldciclista (nombre, apellido, equipo) VALUES (old.nombre, old.apellido, fgrupo(old.nombre));
END$$
DELIMITER ;

ALTER TABLE `reto2`.`ciclista` 
ADD COLUMN `modificaciones` VARCHAR(45) NULL AFTER `ultimamodificacion`;

/* EL siguiente trigger definira en la tabla ciclista que campos han sido modificados y en que fecha */
DELIMITER $$
CREATE DEFINER=`LUIS`@`%` TRIGGER `ciclista_BEFORE_UPDATE` BEFORE UPDATE ON `ciclista` FOR EACH ROW BEGIN
declare textito varchar(200);
set textito = 'Se han modificado los siguientes campos: ';
set new.ultimamodificacion = now();
if old.nombre <> new.nombre then
	set textito = concat(textito, 'nombre ');
end if;
if old.apellido <> new.apellido then
	set textito = concat(textito, 'apellido ');
end if;
if old.clave <> new.clave then
	set textito = concat(textito, 'clave ');
end if;
if old.idgrupo <> new.idgrupo then
	set textito = concat(textito, 'idgrupo');
end if;
set new.modificaciones = textito;
END $$
DELIMITER ;

/* Crearemos un procedimiento que genere descargue el resultado de nuestro equipo ganador ejecutaremos dicho procedimiento desde la web*/
USE `reto2`;
DROP procedure IF EXISTS `reto2`.`DescargaWINNER`;
;
DELIMITER $$
USE `reto2`$$
CREATE DEFINER=`LUIS`@`%` PROCEDURE `DescargaWINNER`()
BEGIN
declare exit handler for 1086
begin
set @texto = concat("SELECT * UNION ALL SELECT equipo, vueltastotales, tiempototal FROM vvueltas into outfile '/var/lib/mysql-files/Vueltas", date(now()), ".csv'");
PREPARE s1 FROM @texto;
EXECUTE s1;
DROP PREPARE s1;
end;
set @texto = concat("SELECT * UNION ALL SELECT equipo, vueltastotales, tiempototal FROM vvueltas into outfile '/var/lib/mysql-files/Vueltas.csv'");
PREPARE s1 FROM @texto;
EXECUTE s1;
DROP PREPARE s1;
END$$
DELIMITER ;
;

/* creacion de la tabla oldvuelta */
CREATE TABLE `reto2`.`oldvuelta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP NULL,
  `ciclista` VARCHAR(45) NULL,
  `numerodevuelta` INT NULL,
  `tiempodevuelta` INT NULL,
  `fechadeborrado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

/* Creamos un triger que recogera los datos de las vueltas borradas */
DROP TRIGGER IF EXISTS `reto2`.`vuelta_BEFORE_DELETE`;

DELIMITER $$
USE `reto2`$$
CREATE DEFINER = CURRENT_USER TRIGGER `reto2`.`vuelta_BEFORE_DELETE` BEFORE DELETE ON `vuelta` FOR EACH ROW
BEGIN
INSERT INTO oldvuelta (fecha, ciclista, numerodevuelta, tiempodevuelta) values (old.fecha, old.idciclista, old.numerodevuelta, old.tiempodevuelta);
END$$
DELIMITER ;
