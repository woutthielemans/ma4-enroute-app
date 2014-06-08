<?php
define('DS', DIRECTORY_SEPARATOR);
define('WWW_ROOT', dirname(__FILE__) . DS);
$uploaddir = 'uploadedphotos/';
require_once WWW_ROOT . 'classes'. DS .'Config.php';
require_once WWW_ROOT . 'dao' . DS . 'PhotosDAO.php';
$photosDAO = new PhotosDAO();
$numberOfPhotos = $photosDAO->getPhotosByAmount();

$number = $numberOfPhotos["NumberOfPhotos"]+1;
$file = $number.".jpg";
$uploadfile = $uploaddir . $file;

echo "file=".$file;

if (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $uploadfile)) {
    echo $file;
    $photosDAO->insertPhoto($file);
}
else {
    echo "error";
}
?>