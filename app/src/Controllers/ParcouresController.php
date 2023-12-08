<?php
    
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Utils\DB;
use PDO;


class EtapeController extends BaseController
{
    public function getEtape(Request $request, Response $response) {
        return;
    }

    public function getAll(Request $request, Response $response) {
        return;
    }

    public function choisirSolution(Request $request, Response $response) {
        return;
    }
    public function recuperParcoure(Request $request, Response $response){
        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM parcours");
        $stmt->execute([]);
        $etapes = $stmt->fetchAll(PDO::FETCH_OBJ);
        
        $response->getBody()->write(json_encode($etapes));
 
        return $response;
    
    }
}