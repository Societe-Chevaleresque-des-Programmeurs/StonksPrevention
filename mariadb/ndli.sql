#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

USE NUITINFO;

#------------------------------------------------------------
# Table: Parcours
#------------------------------------------------------------

CREATE TABLE Parcours(
        idParcours          Int  Auto_increment  NOT NULL ,
        nomParcours         Varchar (150) NOT NULL ,
        descriptionParcours Varchar (500) NOT NULL ,
        etapeTeteParcours   Int NOT NULL
	,CONSTRAINT Parcours_PK PRIMARY KEY (idParcours)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etape
#------------------------------------------------------------

CREATE TABLE Etape(
        idEtape          Int  Auto_increment  NOT NULL ,
        typeEtape        Enum ("questionLibre","QCM","plusOuMoins","vraiFaux") NOT NULL ,
        texteEtape       Varchar (500) NOT NULL ,
        imageEtape       Varchar (50) NOT NULL ,
        explicationEtape Varchar (500) NOT NULL ,
        ordreEtape       Int NOT NULL ,
        nomEtape         Varchar (150) NOT NULL ,
        idParcours       Int NOT NULL
	,CONSTRAINT Etape_AK UNIQUE (nomEtape)
	,CONSTRAINT Etape_PK PRIMARY KEY (idEtape)

	,CONSTRAINT Etape_Parcours_FK FOREIGN KEY (idParcours) REFERENCES Parcours(idParcours)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Choix
#------------------------------------------------------------

CREATE TABLE Choix(
        idChoix    Int  Auto_increment  NOT NULL ,
        nomChoix   Varchar (150) NOT NULL ,
        pointChoix Int NOT NULL ,
        idEtape    Int NOT NULL
	,CONSTRAINT Choix_PK PRIMARY KEY (idChoix)

	,CONSTRAINT Choix_Etape_FK FOREIGN KEY (idEtape) REFERENCES Etape(idEtape)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        idUtilisateur         Int  Auto_increment  NOT NULL ,
        motDePasseUtilisateur Varchar (150) NOT NULL ,
        pseudoUtilisateur     Varchar (50) NOT NULL
	,CONSTRAINT Utilisateur_AK UNIQUE (pseudoUtilisateur)
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (idUtilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tentative
#------------------------------------------------------------

CREATE TABLE tentative(
        idTentative   Int  Auto_increment  NOT NULL ,
        idUtilisateur Int NOT NULL
	,CONSTRAINT tentative_PK PRIMARY KEY (idTentative)

	,CONSTRAINT tentative_Utilisateur_FK FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: tentaivechoix
#------------------------------------------------------------

CREATE TABLE tentaivechoix(
        idChoix     Int NOT NULL ,
        idTentative Int NOT NULL
	,CONSTRAINT tentaivechoix_PK PRIMARY KEY (idChoix,idTentative)

	,CONSTRAINT tentaivechoix_Choix_FK FOREIGN KEY (idChoix) REFERENCES Choix(idChoix)
	,CONSTRAINT tentaivechoix_tentative0_FK FOREIGN KEY (idTentative) REFERENCES tentative(idTentative)
)ENGINE=InnoDB;

DELETE FROM Parcours;
DELETE FROM Etape;
DELETE FROM Choix;

INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(1, 'État du climat', "Découvrez quel est l'état actuel du climat et quelles sont les causes de son changement.", 1);
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(2, 'Impact sur les sociétés humaines', "À quoi s'étendre et comment se préparer au changement climatique ?", 6);
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(3, "Solutions d'atténuation", "Les solitions d'atténuation sont nombreuses, mais lesquelles sont réellement efficaces ? Tester vos connaissances et apprenez à faire face aux idées reçues", 11);

-- Parcours 1
    -- Étape 1
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(1, 'Confiance responsabilité humain', 'vraiFaux', "La responsabilité de l'influence humaine sur le climat n'est pas avéré.", 'Fond WGI.png', "Le GIEC conclue dans son dernier rapport qu'il est sans équivoque que l'influence humaine a réchauffé l'atmosphère, l’océan et les terres.", 1, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 1);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 1);
    -- Étape 2
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(2, 'Part de la variabilité naturelle', 'questionLibre', "Quelle est la part de la variabilité naturelle dans le changement climatique ?", 'Contribution RC.png', "La variabilité interne de la Terre ainsi que les facteurs solaires et volcaniques n'exerce pas d'impact significatif sur le changement observé.", 2, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('0;rien;aucune;insignifiante', 100, 2); 
    -- Étape 3
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(3, 'Précédents changements observés', 'QCM', "Le climat a déjà changé par le passé, qu'est ce qui différencie le changement d'aujourd'hui des autres ?", 'IPCC_AR6_WGI_TS_Figure_1.png', "Les précédents changements de cette ampleur s'étalaient sur plusieurs centaines de milliers d'années", 3, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Rien', 0, 3); 
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('La rapidité', 100, 3); 
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Les températures atteintes', 0, 3); 
    -- Étape 4
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(4, 'Principaux gaz à effet de serre', 'questionLibre', "Quelles molécules se cachent derrière l'appellation de gaz à effet de serre (GES) ?", 'Figure RID.2.png', "Le dioxyde de carbone est le GES le plus connu car c'est celui qui participe le plus au réchauffement climatique, il faut cependant aussi noter l'importance du rôle du méthane et des Oxydes nitreux", 4, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('co2;dioxyde de carbone', 33, 4); 
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('ch4;méthane', 33, 4);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("n2o;oxyde nitreux;protoxyde d'azote;monoxyde de diazote;hémioxyde d'azote", 33, 4);
    -- Étape 5
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(5, 'Irréversibilité', 'QCM', "À quelle échelle les changements observés sont-ils irréversibles ?", 'Fond WGI.png', "Le GIEC note que de nombreux changements dus aux émissions de gaz à effet de serre passées et à venir sont irréversibles à l’échelle de siècles à millénaires, en particulier les changements concernant l’océan, les calottes glaciaires et le niveau de la mer à l’échelle du globe.", 5, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("Années à décénies ", 0, 5);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Décénies à siècles', 0, 5);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Siècles à millénaires', 100, 5);
        