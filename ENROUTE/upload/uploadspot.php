<?php
define('DS', DIRECTORY_SEPARATOR);
define('WWW_ROOT', dirname(__FILE__) . DS);
require_once WWW_ROOT . 'classes'. DS .'Config.php';
require_once WWW_ROOT . 'dao' . DS . 'SpotsDAO.php';
$spotsDAO = new SpotsDAO();

$handle = fopen('php://input','r');
$jsonInput = fgets($handle);
// Decoding JSON into an Array
$decoded = json_decode($jsonInput,true);
echo $decoded;
// decoded uitlezen -> juiste waarden meegeven met insertSpots
$spotsDAO->insertSpots($decoded['title'],$decoded['subtitle'],$decoded['lon'],$decoded['lan']);

?>