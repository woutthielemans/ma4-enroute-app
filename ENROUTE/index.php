<?php
ob_start();
session_start();
define('DS', DIRECTORY_SEPARATOR);
define('WWW_ROOT', dirname(__FILE__) . DS);

require_once WWW_ROOT . 'includes' . DS . 'functions.php';
require_once WWW_ROOT . 'includes' . DS . 'routes.php';
require_once WWW_ROOT . 'classes' . DS . 'Config.php';

if(empty($_GET['page'])) 
{
    $_GET['page'] = 'home';
}

if(empty($routes[$_GET['page']])) 
{
    header("Location: index.php");
    exit();
}

$route = $routes[$_GET['page']];
$controllerName = $route['controller'] . 'Controller';

require_once WWW_ROOT . 'controller'. DS . $controllerName . ".php";

$controllerObj = new $controllerName();
$controllerObj->route = $route;
$controllerObj->filter();
$controllerObj->render();