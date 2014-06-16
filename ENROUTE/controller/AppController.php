<?php
class AppController 
{
	public $route = array();
	public $viewVars = array();

	public function __construct() 
	{
	    require WWW_ROOT.'parts/header.php';
	    require WWW_ROOT.'parts/errors.php';
	}

	public function filter() 
	{
		call_user_func(array($this, $this->route['action']));
	}

	public function render()
	 {
		extract($this->viewVars, EXTR_OVERWRITE);

		if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') 
		{
			require WWW_ROOT.'pages/'.strtolower($this->route['controller']).'/'.$this->route['action'].'.php';
			exit();
		}

	    require WWW_ROOT.'pages/'.$this->route['action'].'.php';

    	require WWW_ROOT.'parts/footer.php';
	}

	public function set($variableName, $value) 
	{
		$this->viewVars[$variableName] = $value;
	}

	public function addError($error)
	{
		if(!isset($_SESSION["errors"])) 
		{
			$_SESSION["errors"] = array();
		}

		$_SESSION["errors"][] = $error;
	}

	public function redirect($url) 
	{
		header("Location: {$url}");
		exit();
	}
}