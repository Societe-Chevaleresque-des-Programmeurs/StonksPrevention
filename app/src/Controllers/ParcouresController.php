<?php
    
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Utils\DB;
use PDO;

class ParcouresController extends BaseController
{
    public function getParcours(Request $request, Response $response){
        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Parcours");
        $stmt->execute([]);
        $etapes = $stmt->fetchAll(PDO::FETCH_OBJ);
        
        $response->getBody()->write(json_encode($etapes));
 
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    }
}