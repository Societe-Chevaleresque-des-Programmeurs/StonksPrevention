DELETE FROM Parcours;
DELETE FROM Etape;
DELETE FROM Choix;

INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(1, 'État du climat', "Découvrez quel est l'état actuel du climat et quelles sont les causes de son changement.", 1);
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(2, 'Impact sur les sociétés humaines', "À quoi s'étendre et comment se préparer au changement climatique ?", 6);
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours) VALUES(3, "Solutions d'atténuation", "Les solitions d'atténuation sont nombreuses, mais lesquelles sont réellement efficaces ? Tester vos connaissances et apprenez à faire face aux idées reçues", 11);

-- Parcours 1
    -- Étape 1
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, pointMaxEtape, explicationEtape, ordreEtape, idParcours) VALUES(1, 'Confiance responsabilité humain', 'vraiFaux', "La responsabilité de l'influence humaine sur le climat n'est pas avéré.", 'Fond WGI.png', 100, "Le GIEC conclue dans son dernier rapport qu'il est sans équivoque que l'influence humaine a réchauffé l'atmosphère, l’océan et les terres.", 1, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 1);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 1);
    -- Étape 2
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, pointMaxEtape, explicationEtape, ordreEtape, idParcours) VALUES(2, 'Part de la variabilité naturelle', 'questionLibre', "Quelle est la part de la variabilité naturelle dans le changement climatique ?", 'Contribution RC.png', 100, "La variabilité interne de la Terre ainsi que les facteurs solaires et volcaniques n'exerce pas d'impact significatif sur le changement observé.", 2, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('0;rien;aucune;insignifiante', 100, 2); 
    -- Étape 3
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, pointMaxEtape, explicationEtape, ordreEtape, idParcours) VALUES(3, 'Précédents changements observés', 'QCM', "Le climat a déjà changé par le passé, qu'est ce qui différencie le changement d'aujourd'hui des autres ?", 'IPCC_AR6_WGI_TS_Figure_1.png', 100, "Les précédents changements de cette ampleur s'étalaient sur plusieurs centaines de milliers d'années", 3, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Rien', 0, 3); 
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('La rapidité', 100, 3); 
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Les températures atteintes', 0, 3); 
    -- Étape 4
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, pointMaxEtape, explicationEtape, ordreEtape, idParcours) VALUES(4, 'Principaux gaz à effet de serre', 'questionLibre', "Quelles molécules se cachent derrière l'appellation de gaz à effet de serre (GES) ?", 'Figure RID.2.png', 100, "Le dioxyde de carbone est le GES le plus connu car c'est celui qui participe le plus au réchauffement climatique, il faut cependant aussi noter l'importance du rôle du méthane et des Oxydes nitreux", 4, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('co2;dioxyde de carbone', 33, 4); 
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('ch4;méthane', 33, 4);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("n2o;oxyde nitreux;protoxyde d'azote;monoxyde de diazote;hémioxyde d'azote", 33, 4);
    -- Étape 5
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, pointMaxEtape, explicationEtape, ordreEtape, idParcours) VALUES(5, 'Irréversibilité', 'QCM', "À quelle échelle les changements observés sont-ils irréversibles ?", 'Fond WGI.png', 100, "Le GIEC note que de nombreux changements dus aux émissions de gaz à effet de serre passées et à venir sont irréversibles à l’échelle de siècles à millénaires, en particulier les changements concernant l’océan, les calottes glaciaires et le niveau de la mer à l’échelle du globe.", 5, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("Années à décénies ", 0, 5);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Décénies à siècles', 0, 5);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Siècles à millénaires', 100, 5);
        