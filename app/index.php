<?php

require __DIR__ . '/vendor/autoload.php';

use App\Controllers\{EtapeController, HomeController, LeaderboardController, UserController};
use App\Utils\DB;
use DI\Container;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Tuupola\Middleware\JwtAuthenticationMiddleware;

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
    $group->get('/logout', [UserController::class, 'logout']);
});

$app->group('/parcours',function(RouteCollectorProxy $group){
  $group->get('/', [ParcouresController::class, 'getParcours']);
});

$app->group('/etape',function(RouteCollectorProxy $group){
  $group->get('/get/{id}', [EtapeController::class, 'getEtape']);
  $group->get('/all', [EtapeController::class, 'getAll']);
  $group->get('{id_etape}/save/{id_choix}', [EtapeController::class, 'choisirSolution']);
});

$app->group('/choix',function(RouteCollectorProxy $group){
  $group->get('/etape/{id}', [ChoixController::class, 'getChoix']);
});

$app->group('/leaderboard',function(RouteCollectorProxy $group){
  $group->get('/make', [LeaderboardController::class, 'makeLeaderboard']);
  $group->get('/get', [LeaderboardController::class, 'getLeaderboard']);
});





/*
$app->get('/home', [HomeController::class, 'home']);

$app->group('/etape',function(RouteCollectorProxy $group){
  $group->get('/get/{id}', [EtapeController::class, 'getEtapes']);
});
*/


$app->run();
