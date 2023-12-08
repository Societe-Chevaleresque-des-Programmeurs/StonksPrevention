<?php

require __DIR__ . '/vendor/autoload.php';

use App\Utils\DB;
use DI\Container;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Tuupola\Middleware\JwtAuthenticationMiddleware;

use App\Controllers\{HomeController, UserController, EtapeController, LeaderboardController, ParcouresController, ChoixController};

$db = new DB();
$container = new Container();
AppFactory::setContainer($container);
$app = AppFactory::create();

$app->addBodyParsingMiddleware();
$app->addRoutingMiddleware();
$app->addErrorMiddleware(true, true, true);
// $app->add(new BasePathMiddleware($app));


$app->add(new Tuupola\Middleware\JwtAuthentication([
  "algorithm" => ["HS512"],
  'secure' => false,
  "ignore" => ["/"],
  "cookie" => 'jwt',
  "secret" => "LaMonsterCestPourLesFaiblesMoiJeLeFaisSansRien"
]));


$app->get('/', function ($request, $response, $args) {
    return $response->withStatus(302)->withHeader('Location', '/public/index.html');
});


$app->get('public/{params:.*}', function ($request, $response, $args) {
  var_dump($_SERVER['REQUEST_URI']);
  $file = 'public/index.html';
  if (file_exists($_SERVER['REQUEST_URI'])) {
    $response->getBody()->write(file_get_contents($file));

    return $response
        ->withHeader('content-type', 'text/html')
        ->withStatus(200);
  }
});




$app->group('/api', function (RouteCollectorProxy $group) {
  $group->group('/parcoure', function (RouteCollectorProxy $group) {
    // retourne l'ensemble des parcours
    $group->get('', [ParcouresController::class, 'getParcours']);
  });

  $group->group('/auth', function (RouteCollectorProxy $group) {
    $group->post('/login', [UserController::class, 'login']);
    $group->post('/register', [UserController::class, 'register']);
    $group->get('/logout  ', [UserController::class, 'logout']);
  });


  $group->group('/etape', function (RouteCollectorProxy $group) {
    // retourne les parcours associés à un id.
    $group->get('/get/{id}', [EtapeController::class, 'getEtape']);
    // retournes toutes les étapes
    $group->get('/all', [EtapeController::class, 'getAll']);
    // sauvegarde une étape selon le choix et renvoie l'id du suivant.
    $group->get('{id_etape}/save/{id_choix}', [EtapeController::class, 'choisirSolution']);
  });

  // retourne les choix associé à une étape
  $group->group('/choix', function (RouteCollectorProxy $group) {
    $group->get('/etape/{id}', [ChoixController::class, 'getChoix']);
  });

  $group->group('/leaderboard', function (RouteCollectorProxy $group) {
    $group->get('/make', [LeaderboardController::class, 'makeLeaderboard']);
    $group->get('/get', [LeaderboardController::class, 'getLeaderboard']);
  });
});


/*
$app->get('/home', [HomeController::class, 'home']);

$app->group('/etape',function(RouteCollectorProxy $group){
  $group->get('/get/{id}', [EtapeController::class, 'getEtapes']);
});
*/


$app->run();


