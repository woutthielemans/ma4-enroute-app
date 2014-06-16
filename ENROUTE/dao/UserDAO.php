<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class UserDAO
{
	public $pdo;

    public function __construct()
   	{
       $this->pdo = DatabasePDO::getInstance();
   	}

   	public function validateCode($code)
   	{
   		$sql = 'SELECT * FROM er_codes WHERE code = :code';

        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":code", sha1($code));

        if($stmt-> execute())
        {
        	 return $stmt->fetch(PDO::FETCH_ASSOC);
        }
   	}
}