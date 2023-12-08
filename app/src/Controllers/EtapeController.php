<?php
    
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Utils\DB;
use PDO;


class EtapeController extends BaseController
{
    public function getEtapes (Request $request, Response $response, $args) {
        $id = $args['id'];
        
        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Etape WHERE idEtape = :idEtape");
        $stmt->execute([':idEtape' => $id]);
        $etapes = $stmt->fetchAll(PDO::FETCH_OBJ);
        
        $response->getBody()->write(json_encode($etapes));
 
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(200);
    }


}
