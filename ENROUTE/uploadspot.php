<?php

header('Content-Type: application/json');

ini_set("display_errors", 1);
error_reporting(E_ALL);

define('DS', DIRECTORY_SEPARATOR);
define('WWW_ROOT', dirname(__FILE__) . DS);
require_once WWW_ROOT . 'classes'. DS .'Config.php';
require_once WWW_ROOT . 'dao' . DS . 'SpotsDAO.php';
$spotsDAO = new SpotsDAO();
require_once WWW_ROOT . 'dao' . DS . 'TeacherLocation.php';
$teacherLocationDAO = new TeacherLocationDAO();

$handle = fopen('php://input','r');
$jsonInput = fgets($handle);
$decoded = json_decode($jsonInput,true);
// var_dump($decoded);
// $spotsDAO->insertSpot($decoded['title'],$decoded['subtitle'],$decoded['lon'],$decoded['lat']);
// $spotsDAO->insertSpot("JS","Test","51.055163","3.712296");
// $teacherLocationDAO->insertTeacherLocation(99,"51.055163","3.712296");

?>	