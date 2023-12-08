<?php
    
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Utils\DB;
use PDO;


class ChoixController extends BaseController
{
    public function getChoix(Request $request, Response $response, $args) {
        $id = $args['id'];

        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Choix WHERE idChoix = :idChoix");
        $stmt->execute(['idChoix' => $id]);
        $choix = $stmt->fetchAll(PDO::FETCH_OBJ);

        if (!$id) {
            $response->getBody()->write(json_encode(['success'=>False, 'error'=>['Id inconnu.']]));

            return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(200);
        }

        $response->getBody()->write(json_encode($choix));

        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(200);
    }

}