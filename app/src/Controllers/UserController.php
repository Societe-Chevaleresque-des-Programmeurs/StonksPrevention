<?php

namespace App\Controllers;
use App\Controllers\BaseController;

use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;
use Firebase\JWT\BeforeValidException;
use Firebase\JWT\JWT;

use PDO;

class UserController extends BaseController
{

    private static $key = "LaMonsterCestPourLesFaiblesMoiJeLeFaisSansRien";

    public static function getKey() {
        return UserController::$key;
    }

    public static function validate_jwt_token($jwt_token, $secret_key) {
        try {
            return JWT::decode($jwt_token, $secret_key, array('HS256'));
        } catch (ExpiredException $e) {
            throw new \Exception('Token expired');
        } catch (SignatureInvalidException $e) {
            throw new \Exception('Invalid token signature');
        } catch (BeforeValidException $e) {
            throw new \Exception('Token not valid yet');
        } catch (\Exception $e) {
            throw new \Exception('Invalid token');
        }
    }

    public static function generate_jwt_token($user_id, $secret_key) {
        $issued_at = time();
        $expiration_time = $issued_at + (60 * 60); // valid for 1 hour

        $payload = array(
            'iat' => $issued_at,
            'exp' => $expiration_time,
            'sub' => $user_id
        );

        return JWT::encode($payload, $secret_key, 'HS512');
    }

    public function login($request,$response, $args){
        $pseudo = $request->getParsedBody('pseudo');
        $password = $request->getParsedBody('password');

        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Utilisateur WHERE pseudoUtilisateur = :pseudo");
        $stmt->execute([':pseudo' => $pseudo]);
        $utilisateur = $stmt->fetch(PDO::FETCH_OBJ);

        if ($utilisateur  && password_hash($password, PASSWORD_DEFAULT) == $utilisateur['motDePasseUtilisateur']) {
            $hash = password_hash($password, PASSWORD_DEFAULT);

            $jwt_token = UserController::generate_jwt_token(
                $utilisateur['id'] , UserController::$key
            );

            setcookie('jwt', $jwt_token, ['path'=> '/']);    
            $response
                ->getBody()
                ->write(['success' => True]);
                
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        } else {
            $response
                ->getBody()
                ->write(['success' => False]);
                
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        }
    }

    public function register($request,$response, $args){
        $pseudo = $request->getParsedBody('pseudo');
        $password = $request->getParsedBody('password');

        $conn = $this->db->connect();
        $stmt = $conn->prepare("SELECT * FROM Utilisateur WHERE pseudoUtilisateur = :pseudo");
        $stmt->execute([':pseudo' => $pseudo]);
        $utilisateur = $stmt->fetch(PDO::FETCH_OBJ);

        if($utilisateur) {
            $response
                ->getBody()
                ->write(['success' => False, 'error' => ['Utilisateur existe déjà.']]);

            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        }

        $stmt = $conn->prepare("INSERT INTO Utilisateur (pseudoUtilisateur, motDePasseUtilisateur) VALUES (:pseudo, :mdp)");
        $stmt->execute([':pseudo' => $pseudo, ':mdp' => password_hash($password, PASSWORD_DEFAULT)]);

        $jwt_token = UserController::generate_jwt_token(
            $utilisateur['id'] , UserController::$key
        );

        setcookie('jwt', $jwt_token, ['path'=> '/']);    
        $response
            ->getBody()
            ->write(['success' => True]);
            
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    
    }

    public function logout($request,$response, $args){
        unset($_SESSION['jwt']);   
        return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus(200);
    }
}
