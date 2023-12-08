DELETE FROM Parcours;
DELETE FROM Etape;
DELETE FROM Choix;

-- Parcours 1
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours, explicationFinParcours) VALUES(1, 'État du climat', "Découvrez quel est l'état actuel du climat et quelles sont les causes de son changement.", 1, "Le groupe 1 du GIEC s'occupe de synthétiser la littérature scientifique sur les éléments physiques relatifs au changement climatique. Il répond aux principales questions sur la réalité de ce changement, son rôle est essentiel et permet de s'assurer des différentes causes à l'oeuvre.");
    -- Étape 1
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(1, 'Confiance responsabilité humain', 'vraiFaux', "La responsabilité de l'influence humaine sur le climat n'est pas avéré.", 'Fond WGI.png', "Le GIEC conclue dans son dernier rapport qu'il est sans équivoque que l'influence humaine a réchauffé l'atmosphère, l’océan et les terres.", 1, 1);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 1);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 1);
    -- Étape 2
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(2, 'Part de la variabilité naturelle', 'questionLibre', "Quelle est la part de la variabilité naturelle dans le changement climatique ?", 'Contribution facteurs RC.png', "La variabilité interne de la Terre ainsi que les facteurs solaires et volcaniques n'exerce pas d'impact significatif sur le changement observé.", 2, 1);
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
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(4, 'Principaux gaz à effet de serre', 'questionLibre', "Quelles molécules se cachent derrière l'appellation de gaz à effet de serre (GES) ?", 'Contribution molécules.png', "Le dioxyde de carbone est le GES le plus connu car c'est celui qui participe le plus au réchauffement climatique, il faut cependant aussi noter l'importance du rôle du méthane et des Oxydes nitreux", 4, 1);
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
        
-- Parcours 2
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours, explicationFinParcours) VALUES(2, 'Impact sur les sociétés humaines', "À quoi s'étendre et comment se préparer au changement climatique ?", 6, "");
    -- Étape 1
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(6, 'Événements extrêmes', 'QCM', "À cause du réchauffement climatique, les événements extrême deviendront :", 'WGII.png', "La variabilité interne de la Terre ainsi que les facteurs solaires et volcaniques n'exerce pas d'impact significatif sur le changement observé.", 1, 2);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('moins fréquents et moins intense', 0, 6);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('plus fréquents et moins intense', 0, 6);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('moins fréquents et plus intense', 0, 6);
        -- Choix 4
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('plus fréquents et plus intense', 100, 6);
    -- Étape 2
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(7, "Capacités d'adaptations", 'vraiFaux', "L'humanité a la capacité de s'adapter à n'importe quel changement climatique.", "IPCC_AR6_WGII_Figure_SPM_005.png", "La capacité d'apdatation des sociétés humaines au changement climatique est très grande, mais elle a des limites. Passé certains niveaux de réchauffement, l'adaptation devient impossible.", 2, 2);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 7);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 7);
    -- Étape 3
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(8, "Possibilités d'adaptations", 'vraiFaux', "On ne sait pas si les politiques d'adaptation sont efficaces", 'WGII.png', "Le GIEC qu'il existe des options d'adaptation réalisables et efficaces qui peuvent réduire les risques pour les personnes et la nature.", 3, 2);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 8);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 8);
    -- Étape 4
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(9, "Priorité dans l'adaptation", 'questionLibre', "Quelles sont les priorités dans l'élaboration d'une politique d'adaptation ?", 'WGII.png', "Les priorités à prendre en compte dans une politique d'adaptation sont la réduction des risques, l'équité et la justice.", 4, 2);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('risques', 33, 9);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('équité', 33, 9);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("justice", 33, 9);
    -- Étape 5
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(10, 'Maladaptation', 'questionLibre', "Qu'est-ce qu'une maladaptation ?", 'Fond WGII.png', "La maladaptation fait référence aux actions qui peuvent entraîner un risque accru de conséquences néfastes liées au climat, notamment via une augmentation des émissions de gaz à effet de serre, une vulnérabilité accrue ou modifiée au changement climatique, des résultats plus inéquitables ou une diminution du bien-être, maintenant ou à l'avenir.", 5, 2);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("risque accru;risques accrus", 25, 10);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('conséquences néfastes', 25, 10);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('vulnérabilité accrue', 25, 10);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('inéquitable;inéquitables', 25, 10);

-- Parcours 3
INSERT INTO Parcours(idParcours, nomParcours, descriptionParcours, etapeTeteParcours, explicationFinParcours) VALUES(3, "Solutions d'atténuation", "Les solitions d'atténuation sont nombreuses, mais lesquelles sont réellement efficaces ? Tester vos connaissances et apprenez à faire face aux idées reçues", 11, "");
    -- Étape 1
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(11, 'Empreinte carbone européen', 'plusOuMoins', "L'empreinte carbone moyenne d'un européen est-elle plus ou moins de 10tCO2 ? ", 'WGIII.png', "L'empreinte carbone moyenne d'un européen était de 7,8tCO2 en 2018, c'est moins qu'un nord américain (17tCO2) mais plus qu'un sud asiatique (1,5tCO2).", 1, 3);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Plus de 10tCO2', 0, 11);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Moins de 10tCO2', 100, 11);
    -- Étape 2
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(12, "Coûts nouvelles technologies", 'QCM', "Au cours des 10 dernières années, le coût des énergies renouvelables et des batteries électriques ont :", "IPCC_AR6_WGIII_FigureSPM3.png", "Ces 10 dernières années leurs coûts ont drastiquement chuté, cette tendance dure même depuis 20 ans pour la pluspart de ces technologies.", 2, 3);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('baissé', 100, 12);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('stagné', 0, 12);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('augmenté', 0, 12);
    -- Étape 3
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(13, "Voiture électrique", 'vraiFaux', "Une voiture électrique émet plus de gaz à effet de serre (GES) que son équivalent thermique", 'Figure 10.4 WGIII.png', "À la production une voiture électrique émet 50% de GES en plus que son équivalent thermique, mais tout au long de sa vie, elle émettra 70% de GES en moins si l'électricité utilisée est bas carbone. Il faut noté qu'il sera toujours plus favorable de faire le trajet avec un mode de déplacement actif quand cela est possible.", 3, 3);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Vrai', 0, 13);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 100, 13);
    -- Étape 4
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(14, "Viande", 'QCM', "Par rapport à une même quantité de boeuf, un produit à base de soja est :", 'Figure 12.6 WGIII.png', "Les alternatives végétales sont beaucoup moins émettrices de GES, en plus de porter des co-bénéfices sur la santé.", 4, 3);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('5 fois plus émetteur de GES', 0, 14);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('5 fois moins émetteur de GES', 0, 14);
        -- Choix 3
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("15 fois plus émetteur de GES", 100, 14);
    -- Étape 5
    INSERT INTO Etape(idEtape, nomEtape, typeEtape, texteEtape, imageEtape, explicationEtape, ordreEtape, idParcours) VALUES(15, 'Nucléaire', 'vraiFaux', "L'énergie nucléaire civile peut nous permettre de lutter contre le changement climatique.", 'Bilan carbone électricité RTE.png', "L'énergie nucléaire civile est une source d'énergie bas carbone. En France, elle compose 70% du mix électrique et permet de produire une électricité presque entièrement décarbonée (RTE).", 5, 3);
        -- Choix 1
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES("Vrai", 100, 15);
        -- Choix 2
        INSERT INTO Choix(nomChoix, pointChoix, idEtape) VALUES('Faux', 0, 15);
