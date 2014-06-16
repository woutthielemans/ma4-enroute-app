<!-- begin

ini_set("display_errors", 1);
error_reporting(E_ALL);

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
	echo $_FILES;
    echo $file;
    $photosDAO->insertPhoto($file);
}
else {
    echo "error";
}

end -->

<?php 

$result_json = array();

// headers for not caching the results
header('Cache-Control: no-cache, must-revalidate');
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');

// headers to tell that result is JSON
header('Content-type: application/json');


if ( !isset($_FILES['upfile']['error']) ||
	 is_array($_FILES['upfile']['error'])
    ) {        
	$result_json['error'] = 'Invalid parameter';
}else{	
	$result_json['error'] = false;
}

switch ($_FILES['upfile']['error']) {
		case UPLOAD_ERR_OK:
		$result_json['msg_error'] = 'Er zijn geen errors gevonden';
		break;

		case UPLOAD_ERR_NO_FILE:
			$result_json['error'] = 'No file sent';

		case UPLOAD_ERR_INI_SIZE:
		case UPLOAD_ERR_FORM_SIZE:
			$result_json['error'] = 'Exceeded filesize';
		
		default:
	        $result_json['error'] = 'Unknown error';
}

if ($_FILES['upfile']['size'] > 100000000) {
	$result_json['error'] = 'Exceeded filesize';
}else{
	$result_json['msg_size'] = 'Het is niet te groot';
}

$finfo = new finfo(FILEINFO_MIME_TYPE);

if (false === $ext = array_search(
	$finfo->file($_FILES['upfile']['tmp_name']),
    	array(        	
            'jpeg' => 'image/jpeg'          
        ),
        true
    )) {
        $result_json['error'] = 'Invalid file format';
}

if( !file_exists( 'uploadedphotos' ) ){
	mkdir("uploadedphotos");
	$result_json['error'] = 'geen map uploadedphotos gevonden';
}


if( move_uploaded_file($_FILES['upfile']['tmp_name'],  'uploadedphotos/' . $_POST['userName'] . '.jpeg') ){
	$result_json['msg_move'] = 'Verplaatst';
}else{
	$result_json['msg_move'] = 'Kan het niet verplaatsen';
}


if (!move_uploaded_file(
    $_FILES['upfile']['tmp_name'],
    sprintf('./uploads/%s.%s',
    	sha1_file($_FILES['upfile']['tmp_name']),
    	$ext
    )
    )) {
        $result_json['error'] = 'Failed to move uploaded file';
}

// send the result now
echo json_encode($result_json);

/*
try {

	if (!move_uploaded_file(
	    $_FILES['upfile']['tmp_name'],
	    sprintf('./uploads/%s.%s',
	    	sha1_file($_FILES['upfile']['tmp_name']),
	    	$ext
	    )
	    )) {
	        //throw new RuntimeException('Failed to move uploaded file.');
	}

	//echo json_encode(array('succes'=>true));
} catch (RuntimeException $e) {

    //echo $e->getMessage();

}
*/
?>
