DROP DATABASE IF EXISTS  `db_exerciceAJAX` ;
CREATE DATABASE  IF NOT EXISTS `db_exerciceAJAX` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_exerciceAJAX`;


DROP TABLE IF EXISTS `tbl_modele_pneu`;
DROP TABLE IF EXISTS `tbl_pneu`;
DROP TABLE IF EXISTS `tbl_modele`;
DROP TABLE IF EXISTS `tbl_marque_voiture`;


CREATE TABLE `tbl_marque_voiture` (
  `id_marque_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_marque_voiture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_modele` (
  `id_modele` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_marque_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_modele`),
  FOREIGN KEY (`id_marque_voiture`) REFERENCES tbl_marque_voiture(`id_marque_voiture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_pneu` (
  `id_pneu` int(11) NOT NULL AUTO_INCREMENT,
  `largeur`  int(11) NOT NULL,
  `rapport` int(11) NOT NULL,
   `diametre` int(11) NOT NULL,
  PRIMARY KEY (`id_pneu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tbl_pneu_modele` (
  `id_pneu` int(11) NOT NULL AUTO_INCREMENT,
  `id_modele`  int(11) NOT NULL,
  PRIMARY KEY (`id_pneu`),
  FOREIGN KEY (`id_pneu`) REFERENCES tbl_pneu(`id_pneu`),
  FOREIGN KEY (`id_modele`) REFERENCES tbl_modele(`id_modele`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP procedure IF EXISTS `get_all_marque_voiture`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_marque_voiture`()
BEGIN
	SELECT `id_marque_voiture`,`name`
  FROM `tbl_marque_voiture`; 
END;;
DELIMITER ;

DROP procedure IF EXISTS `get_modele_for_marque_voiture`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_modele_for_marque_voiture`(
	IN `selected_marque_voiture_id` int
)
BEGIN
	SELECT `id_modele`,`name`
	FROM `tbl_modele`
	WHERE `id_marque_voiture` = `selected_marque_voiture_id`; 
END;;
DELIMITER ;

DROP procedure IF EXISTS `get_pneu_for_modele`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_pneu_for_modele`(
	IN `selected_modele_id` int
)
BEGIN
	SELECT  `tbl_pneu`.`id_pneu`,`largeur`,`rapport`,`diametre`
	FROM `tbl_pneu`
    INNER JOIN `tbl_pneu_modele` 
		ON  `tbl_pneu_modele`.`id_pneu` = `tbl_pneu`.`id_pneu`
    WHERE `id_modele` = `selected_modele_id`; 
END;;
DELIMITER ;

INSERT INTO `tbl_marque_voiture` (`name`)
	VALUES  ('Toyota'),
		('General motors'),
		('Volkswagen');
        
INSERT INTO `tbl_modele` (`name`,`id_marque_voiture`)
	VALUES  ('Camry',1),
		('Echo',1),
        ('Corolla',1),
        ('Cruze',2),
        ('Bolt',2),
        ('Blazer',2),
        ('Golf',3),
		('Jetta',3);
        
INSERT INTO `tbl_pneu` (`largeur`,`rapport`,`diametre`)
	VALUES  (215,55,17),
		(175,65,15),
		(205,55,16),
		(215,60,16),
		(215,50,17),
		(235,65,18),
		(235,55,20),
		(195,65,15),
		(205,60,16);
        
INSERT INTO `tbl_pneu_modele` (`id_pneu`,`id_modele`)
	VALUES  (1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5),
		(6,6),
		(7,6),
		(8,7),
		(9,8);
        

    
 







