#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP DATABASE IF EXISTS `Defi_sante_EEB`;
CREATE DATABASE  IF NOT EXISTS `Defi_sante_EEB` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Defi_sante_EEB`;

#------------------------------------------------------------
# Table: tbl_cohorte
#------------------------------------------------------------

CREATE TABLE tbl_cohorte(
        id_cohorte Int  Auto_increment  NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        km_total   Int NOT NULL
	,CONSTRAINT tbl_cohorte_PK PRIMARY KEY (id_cohorte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_athlete
#------------------------------------------------------------

CREATE TABLE tbl_athlete(
        id_athlete Int  Auto_increment  NOT NULL ,
        prenom     Varchar (50) NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        km         Int NOT NULL ,
        image      Varchar (400),
        id_cohorte Int NOT NULL
	,CONSTRAINT tbl_athlete_PK PRIMARY KEY (id_athlete)

	,CONSTRAINT tbl_athlete_tbl_cohorte_FK FOREIGN KEY (id_cohorte) REFERENCES tbl_cohorte(id_cohorte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_defi
#------------------------------------------------------------

CREATE TABLE tbl_defi(
        id_defi    Int  Auto_increment  NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        km_defi    Int NOT NULL ,
        image_defi Varchar (400) ,
        id_cohorte Int NOT NULL
	,CONSTRAINT tbl_defi_PK PRIMARY KEY (id_defi)

	,CONSTRAINT tbl_defi_tbl_cohorte_FK FOREIGN KEY (id_cohorte) REFERENCES tbl_cohorte(id_cohorte)
	,CONSTRAINT tbl_defi_tbl_cohorte_AK UNIQUE (id_cohorte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Stocked Procedures
#------------------------------------------------------------

DROP PROCEDURE IF EXISTS `get_all_cohortes`;
DELIMITER ;;
	CREATE PROCEDURE get_all_cohortes(
    )
    BEGIN
		SELECT id_cohorte,nom,km_total FROM tbl_cohorte ;
    END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS `get_defi_for_cohorte`;
DELIMITER ;;
	CREATE PROCEDURE get_defi_for_cohorte(
    in in_id_cohorte int
    )
    BEGIN
		SELECT id_defi, nom, km_defi, image_defi, id_cohorte FROM tbl_defi WHERE id_cohorte = in_id_cohorte;
    END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS `get_les_athletes`;
DELIMITER ;;
	CREATE PROCEDURE get_les_athletes(
    in in_id_cohorte int
    )
    BEGIN
		SELECT id_athlete, prenom, nom, km, image, id_cohorte FROM tbl_athlete WHERE id_cohorte = in_id_cohorte;
    END;;
DELIMITER ;;


#------------------------------------------------------------
# Entrée de donnée
#------------------------------------------------------------

insert into tbl_cohorte (nom, km_total) values ('C18', 9000.00);
insert into tbl_defi (nom, km_defi, image_defi ,id_cohorte) values ('Traversée du Canada - aller et retour', 15642.00,'http://eeb.eebeauce.com/zone/C18/canada_rouge.png', 1);

insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Alexis','Auger',366.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001411003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767321825_Alexis-Auger.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Benoit','Audette',10.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001418003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767240553_Benoit-Audette.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Charles-Bernard','Gagnon',41.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001348015/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768027374_Charles-Bernard-Gagnon.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Christian','Coupal',195.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001291003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767739712_Christian-Coupal.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Claudia','Boissonneault',186.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001151003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767401383_Claudia-Boissonneault.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Dominique','Roy',585.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001396003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768823107_Dominique-Roy.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Francis','Renaud',458.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001422015/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768659487_Francis-Renaud.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('François','St-Laurent',794.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001197003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562769032932_Francois-St-Laurent.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Frédéric','Huot',1480.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001220010/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768226862_Frederic-Huot.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Hugo','Dessaint',58.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001365003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767828006_Hugo-Dessaint.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Jonathan','Trudel',75.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001342003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562769190476_Jonathan-Trudel.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Louis','Légaré-Lapointe',188.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001270003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768409060_Louis-Legaree-Lapointe.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Luc','Levasseur',420.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001312003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768491850_Luc-Levasseur.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Lysanne','Gingras',134.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001414003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562768147104_Lysanne-Gingras.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Marie-Eve','Caron',57.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001302003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767570220_Marie-Eve-Caron.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);
insert into tbl_athlete(prenom, nom, km, image, id_cohorte) values('Mathieu','Doyon',1170.00,'https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001263003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767912308_Mathieu-Doyon.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top',1);


insert into tbl_cohorte (nom, km_total) values ('C20', 1200.00);