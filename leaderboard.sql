CREATE TABLE Leaderboard(
    idParticipation INT AUTO_INCREMENT,
    idUtilisateur INT,
    idParcours INT,
    points INT,
    date DATETIME,

    PRIMARY KEY (idParticipation),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
    FOREIGN KEY (idParcours) REFERENCES Parcours(idParcours)
);