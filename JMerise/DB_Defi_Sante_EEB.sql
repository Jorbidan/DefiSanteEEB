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
        nom        Varchar (50) NOT NULL 
	,CONSTRAINT tbl_cohorte_PK PRIMARY KEY (id_cohorte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_athlete
#------------------------------------------------------------

CREATE TABLE tbl_athlete(
        id_athlete Int  Auto_increment  NOT NULL ,
        prenom     Varchar (50) NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        image      Varchar (400)
	,CONSTRAINT tbl_athlete_PK PRIMARY KEY (id_athlete)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_defi
#------------------------------------------------------------

CREATE TABLE tbl_defi(
        id_defi    Int  Auto_increment  NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        km_defi    float NOT NULL ,
        id_cohorte Int NOT NULL,
        image_defi Varchar(50),
		km_cumul    float NOT NULL

	,CONSTRAINT tbl_defi_PK PRIMARY KEY (id_defi)

	,CONSTRAINT tbl_defi_tbl_cohorte_FK FOREIGN KEY (id_cohorte) REFERENCES tbl_cohorte(id_cohorte)
	,CONSTRAINT tbl_defi_tbl_cohorte_AK UNIQUE (id_cohorte)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir
#------------------------------------------------------------

CREATE TABLE tbl_appartenir(
        id_athlete Int NOT NULL ,
        id_cohorte Int NOT NULL ,
        km_athlete Int NOT NULL
	,CONSTRAINT Appartenir_PK PRIMARY KEY (id_athlete,id_cohorte)

	,CONSTRAINT Appartenir_tbl_athlete_FK FOREIGN KEY (id_athlete) REFERENCES tbl_athlete(id_athlete)
	,CONSTRAINT Appartenir_tbl_cohorte0_FK FOREIGN KEY (id_cohorte) REFERENCES tbl_cohorte(id_cohorte)
)ENGINE=InnoDB;




#------------------------------------------------------------
# Stocked Procedures
#------------------------------------------------------------

DROP PROCEDURE IF EXISTS `get_all_cohortes`;
DELIMITER ;;
	CREATE PROCEDURE get_all_cohortes(
    )
    BEGIN
		SELECT id_cohorte,nom FROM tbl_cohorte ;
    END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS `get_defi_for_cohorte`;
DELIMITER ;;
	CREATE PROCEDURE get_defi_for_cohorte(
    in in_id_cohorte int
    )
    BEGIN
		SELECT id_defi, nom, km_defi, image_defi, km_cumul, id_cohorte FROM tbl_defi WHERE id_cohorte = in_id_cohorte;
    END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS `get_les_athletes`;
DELIMITER ;;
	CREATE PROCEDURE get_les_athletes(
    in in_id_cohorte int
    )
    BEGIN
       SELECT tbl_athlete.id_athlete, nom, prenom, image FROM tbl_athlete INNER JOIN tbl_appartenir ON tbl_athlete.id_athlete = tbl_appartenir.id_athlete WHERE id_cohorte = in_id_cohorte;
    END;;
DELIMITER ;;

DROP PROCEDURE IF EXISTS `add_km_athletes`;
DELIMITER ;;
	CREATE PROCEDURE add_km_athletes(
    in in_id_athlete int,
    in km_ajouter int,
    in in_id_cohorte int
    )
    BEGIN
    update tbl_appartenir
    SET km_athlete = km_athlete + km_ajouter
    WHERE id_athlete = in_id_athlete AND id_cohorte = in_id_cohorte;
    END;;
DELIMITER ;;


#------------------------------------------------------------
# Entrée de donnée
#------------------------------------------------------------

insert into tbl_cohorte (nom) values ('C18');
insert into tbl_cohorte (nom) values ('C20');

insert into tbl_athlete(prenom, nom, image) values('Alexis','Auger','https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001411003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767321825_Alexis-Auger.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top');
insert into tbl_athlete(prenom, nom, image) values('Benoit','Audette','https://www.eebeauce.com/remote.axd/creatorexport.zoho.com/eebeauce/portail-eeb/Photos_Membres/3066070000001418003/Photo_eeb/image-download/rFDkVk1p3sfgbZ9dgOgYW2MmsuVbAhg24OkWTKJMtf5R0BWUJB8S7egmu2z9rhgGCaMBSvUgx2h4sJHmN8S8kKu8SBE64tGBwv0v/1562767240553_Benoit-Audette.jpg?width=600&height=600&bgcolor=fff&mode=crop&anchor=top');
insert into tbl_athlete(prenom, nom, image) values('Emile','Bureau','https://i.ytimg.com/vi/Yx0dkkcX6x8/maxresdefault.jpg');
insert into tbl_athlete(prenom, nom, image) values('Jordan','Côté','https://eebeauce.ficelle.app/v1/?src=https%3A%2F%2Fwww.eebeauce.com%2Fuploads%2FPhotos-staff%2FJordan-Co%CC%82te%CC%81.jpg&width=300');


insert into tbl_appartenir(id_athlete, id_cohorte, km_athlete) values(1,1,360);
insert into tbl_appartenir(id_athlete, id_cohorte, km_athlete) values(2,1,0);
insert into tbl_appartenir(id_athlete, id_cohorte, km_athlete) values(3,2,420);
insert into tbl_appartenir(id_athlete, id_cohorte, km_athlete) values(4,2,70);


insert into tbl_defi (nom, km_defi, image_defi, km_cumul, id_cohorte) values ('Traversée du Canada - aller et retour', 15642.00,'http://eeb.eebeauce.com/zone/C18/canada_rouge.png',2000, 1);
insert into tbl_defi (nom, km_defi, km_cumul, id_cohorte) values ('Test sans image dans la base de donnée', 100.00, 0, 2);
