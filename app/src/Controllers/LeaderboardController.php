<?php
    
namespace App\Controllers;

use App\Utils\Constants;
use Firebase\JWT\JWT;
use PDO;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class LeaderboardController extends BaseController
{
    public function getLeaderboard(Request $request, Response $response)
    {
        $conn = $this->db->connect();
        $result = $conn->query('SELECT * FROM Leaderboard ORDER BY points DESC, date DESC;');
        $leaderboard = $result->fetchAll(PDO::FETCH_OBJ);

        $response->getBody()->write(json_encode($leaderboard));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(200);
    }

    public function makeLeaderboard(Request $request, Response $response) {
        if (!isset($_COOKIE['jwt']))
            return $response->withStatus(401);

        // Récupération de l'utilisateur courant
        $jwt = str_replace('Bearer ', '', $_COOKIE['jwt']['HTTP_AUTHORIZATION'][0]);
        $decoded = JWT::decode($jwt, Constants::JWT_SECRET);
        var_dump($decoded);
        return $response->withStatus(500);
        $idUtilisateur = 0;

        $conn = $this->db->connect();

        // Récupérer le dernier parcours effectué par l'utilisateur
        $stmt = $conn->prepare('SELECT idParcours FROM Etape E INNER JOIN Choix C ON E.idEtape = C.idEtape 
            INNER JOIN Tentaivechoix T ON C.idChoix = T.idChoix 
            INNER JOIN tentative T2 ON T.idTentative = T2.idTentative
            WHERE idUtilisateur = ?
            ORDER BY T2.idTentative DESC LIMIT 1;');

        $stmt->bindParam(1, $idUtilisateur);
        $idParcours = $stmt->fetch();

        // Faire la somme des points de l'utilisateur courant
        $stmt = $conn->prepare('SELECT SUM(pointChoix) FROM Tentative T
            INNER JOIN Tentaivechoix T2 ON T.idTentative = T2.idTentative
            INNER JOIN Choix C ON T2.idChoix = C.idChoix
            INNER JOIN Etape E ON C.idEtape = E.idEtape
            WHERE idUtilisateur = ? AND idParcours = ?');

        $stmt->bindParam(1, $idUtilisateur);
        $stmt->bindParam(2, $idParcours);

        $totalPoints = $stmt->fetch();

        // Créer un enregistrement dans la table Leaderboard
        $stmt = $conn->prepare('INSERT INTO Leaderboard (idUtilisateur, idParcours, points, date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)');

        $stmt->bindParam(1, $idUtilisateur);
        $stmt->bindParam(2, $idParcours);
        $stmt->bindParam(3, $totalPoints);

        $stmt->execute();

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(200);
    }

}