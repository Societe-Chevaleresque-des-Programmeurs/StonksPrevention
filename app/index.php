<?php

require __DIR__ . '/vendor/autoload.php';
use App\Utils\DB;
use Slim\Psr7\Request as Request;
use Slim\Psr7\Response as Response;
use Slim\Factory\AppFactory;
use DI\Container;
use Slim\Routing\RouteCollectorProxy;
use Tuupola\Middleware\JwtAuthenticationMiddleware;

use App\Controllers\{HomeController, UserController, EtapeController};

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
  "path" => ["/home"],
  "ignore" => ["/auth/login"],
  "cookie" => 'jwt',
  "secret" => "LaMonsterCestPourLesFaiblesMoiJeLeFaisSansRien",
  "after" => function ($response, $arguments) {
    return $response->withHeader("X-Musk", "Stonks");
  },
  "error" => function ($response, $arguments) {
    $data["status"] = "error";
    $data["message"] = $arguments["message"];

    $response->getBody()->write(
        json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT)
    );

    return $response->withHeader("Content-Type", "application/json");}
]));

$app->group('/auth',function(RouteCollectorProxy $group){
    $group->post('/login', [UserController::class, 'login']);
    $group->post('/register', [UserController::class, 'register']);
    $group->get('/register', [UserController::class, 'logout']);
});

$app->group('/parcours',function(RouteCollectorProxy $group){
  $group->get('/{id}', [ParcoursController::class, 'getParcour']);
});

$app->group('/etape',function(RouteCollectorProxy $group){
  $group->get('/{id}', [EtapeController::class, 'getEtape']);
  $group->get('/all', [EtapeController::class, 'getAll']);
  $group->get('{id_etape}/save/{id_choix}', [EtapeController::class, 'choisirSolution']);
});

$app->group('/choix',function(RouteCollectorProxy $group){
  $group->get('/etape/{id}', [ChoixController::class, 'getChpoix']);
});

$app->group('/leaderboard',function(RouteCollectorProxy $group){
  $group->get('/', [leaderboardController::class, 'getLeaderboard']);
});






$app->get('/home', [HomeController::class, 'home']);

$app->group('/etape',function(RouteCollectorProxy $group){
  $group->get('/get/{id}', [EtapeController::class, 'getEtapes']);
});


$app->run();
