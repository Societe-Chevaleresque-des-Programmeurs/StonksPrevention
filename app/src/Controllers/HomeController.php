<?php
    
namespace App\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use App\Utils\DB;
use PDO;


class HomeController extends BaseController
{
    public function home(Request $request, Response $response) {
        $id = 0;
        
        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Etape");
        $stmt->execute([]);
        $etapes = $stmt->fetchAll(PDO::FETCH_OBJ);
        
        //$html = $this->renderer->fetch("index.html", json_encode($etapes));
        

        $response->getBody()->write(json_encode($etapes));
 
        return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(200);
    }

}