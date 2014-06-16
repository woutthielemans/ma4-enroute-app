<?php

	function trace($var){
		echo "<pre>";
		print_r($var);
		echo "</pre>";
	}

	function addError($error){
		if(!isset($_SESSION["errors"])) {
			$_SESSION["errors"] = array();
		}
		$_SESSION["errors"][] = $error;
	}

?>