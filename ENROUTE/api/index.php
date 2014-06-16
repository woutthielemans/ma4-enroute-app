<?php

	ini_set("display_errors", 1);
	error_reporting(E_ALL);

	define("WWW_ROOT",dirname(dirname(__FILE__)).DIRECTORY_SEPARATOR);

	require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'SpotsDAO.php';
	require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'PhotosDAO.php';
	require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'AssignmentsDAO.php';
	require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'NotificationsDAO.php';
	require_once WWW_ROOT . 'dao' . DIRECTORY_SEPARATOR . 'TeacherLocationDAO.php';
	require_once WWW_ROOT. "api" .DIRECTORY_SEPARATOR. 'Slim'. DIRECTORY_SEPARATOR .'Slim.php';

	\Slim\Slim::registerAutoloader();

	$app = new \Slim\Slim();

	$spotsDAO = new SpotsDAO();
	$photosDAO = new PhotosDAO();
	$assignmentsDAO = new AssignmentsDAO();
	$notificationsDAO = new NotificationsDAO();
	$teacherLocationDAO = new TeacherLocationDAO();

	$app->get('/spots/?', function() use ($spotsDAO){

		header('Content-Type:application/json');
		echo json_encode($spotsDAO->getSpots());
		exit();	

	});

	$app->post('/spots/?', function() use ($app, $spotsDAO){
	    header("Content-Type: application/json");
	    $post = $app->request->post();
	    if(empty($post)){
	        $post = (array) json_decode($app->request()->getBody());
	    }
	    json_encode($spotsDAO->insertSpot($post['title'],$post['subtitle'],$post['lat'],$post['lon']));
	    exit();
	});

	$app->get('/spots/:id/?', function($id) use ($spotsDAO) {

		header('Content-Type:application/json');
		echo json_encode($spotsDAO->getSpot($id));
		exit();

	});

	$app->get('/teacherlocation/?', function() use ($teacherLocationDAO){

		header('Content-Type:application/json');
		echo json_encode($teacherLocationDAO->getTeacherLocation());
		exit();	

	});

	$app->post('/teacherlocation/?', function() use ($app, $teacherLocationDAO){
	    header("Content-Type: application/json");
	    $post = $app->request->post();
	    if(empty($post)){
	        $post = (array) json_decode($app->request()->getBody());
	    }
	    json_encode($teacherLocationDAO->insertTeacherLocation($post['groupid'],$post['lon'],$post['lat']));
	    exit();
	});

	$app->get('/notifications/?', function() use ($notificationsDAO){

		header('Content-Type:application/json');
		echo json_encode($notificationsDAO->getNotifications());
		exit();

	});

	$app->get('/notifications/:id/?', function($id) use ($notificationsDAO) {

		header('Content-Type:application/json');
		echo json_encode($notificationsDAO->getNotification($id));
		exit();

	});

	$app->get('/photos/?', function() use ($photosDAO){

		header('Content-Type:application/json');
		echo json_encode($photosDAO->getPhotos());
		exit();

	});

	$app->get('/photos/:id/?', function($id) use ($photosDAO) {

		header('Content-Type:application/json');
		echo json_encode($photosDAO->getPhoto($id));
		exit();

	});

	$app->post('/photos/?', function() use ($app, $photosDAO){
	    header("Content-Type: application/json");
	    $post = $app->request->post();
	    if(empty($post)){
	        $post = (array) json_decode($app->request()->getBody());
	    }
	    json_encode($photosDAO->insertPhoto($post['group_id'],$post['path']));
	    exit();
	});

	$app->get('/assignments/?', function() use ($assignmentsDAO){

		header('Content-Type:application/json');
		echo json_encode($assignmentsDAO->getAssignments());
		exit();

	});

	$app->get('/creativeassignments/?', function() use ($assignmentsDAO){

		header('Content-Type:application/json');
		echo json_encode($assignmentsDAO->getCreativeAssignments());
		exit();

	});

	$app->get('/standardassignments/?', function() use ($assignmentsDAO){

		header('Content-Type:application/json');
		echo json_encode($assignmentsDAO->getStandardAssignments());
		exit();

	});

	$app->get('/assignments/:id/?', function($id) use ($assignmentsDAO) {

		header('Content-Type:application/json');
		echo json_encode($assignmentsDAO->getAssignemt($id));
		exit();

	});

	$app->run();