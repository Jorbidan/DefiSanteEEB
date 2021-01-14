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
        km_total   Int NOT NULL ,
        id_defi    Int NOT NULL
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
        id_cohorte Int NOT NULL
	,CONSTRAINT tbl_athlete_PK PRIMARY KEY (id_athlete)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tbl_defi
#------------------------------------------------------------

CREATE TABLE tbl_defi(
        id_defi    Int  Auto_increment  NOT NULL ,
        nom        Varchar (50) NOT NULL ,
        km_defi    Int NOT NULL ,
        id_cohorte Int NOT NULL
	,CONSTRAINT tbl_defi_PK PRIMARY KEY (id_defi)
)ENGINE=InnoDB;

ALTER TABLE tbl_cohorte
	ADD CONSTRAINT tbl_cohorte_tbl_defi0_FK
	FOREIGN KEY (id_defi)
	REFERENCES tbl_defi(id_defi);

ALTER TABLE tbl_cohorte 
	ADD CONSTRAINT tbl_cohorte_tbl_defi0_AK 
	UNIQUE (id_defi);

ALTER TABLE tbl_athlete
	ADD CONSTRAINT tbl_athlete_tbl_cohorte0_FK
	FOREIGN KEY (id_cohorte)
	REFERENCES tbl_cohorte(id_cohorte);

ALTER TABLE tbl_defi
	ADD CONSTRAINT tbl_defi_tbl_cohorte0_FK
	FOREIGN KEY (id_cohorte)
	REFERENCES tbl_cohorte(id_cohorte);

ALTER TABLE tbl_defi 
	ADD CONSTRAINT tbl_defi_tbl_cohorte0_AK 
	UNIQUE (id_cohorte);
    
#------------------------------------------------------------
# Entrée de donnée
#------------------------------------------------------------


