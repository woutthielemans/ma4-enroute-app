<?php
require_once WWW_ROOT.'controller'.DS.'AppController.php';
require_once WWW_ROOT.'dao'.DS.'SpotsDAO.php';

class HomeController extends AppController 
{
    public $spotsDAO;

    public function __construct() 
    {
        parent::__construct();
        require_once WWW_ROOT.'dao'.DS.'SpotsDAO.php';
        $this->spotsDAO = new SpotsDAO();
    }

    public function home() 
    {
        $spots = $this->spotsDAO->getSpots();
        $this -> set("arrSpots", $spots);
    }
}