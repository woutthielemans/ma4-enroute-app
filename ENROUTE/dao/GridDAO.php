<?php

require_once WWW_ROOT.'classes'.DIRECTORY_SEPARATOR.'DatabasePDO.php';

class GridDAO
{
  public $pdo;

  public function __construct()
  {
     $this->pdo = DatabasePDO::getInstance();
  }

  public function create($jsonstring, $groupid, $code)
  {
    $sql = 'INSERT INTO er_grids(jsonstring, groupid, code) VALUES(:jsonstring, :groupid, :code)';
    $stmt = $this->pdo->prepare($sql);
    $stmt->bindValue(":code", $code); 
    $stmt->bindValue(":groupid", $groupid);
    $stmt->bindValue(":jsonstring", $jsonstring);

    if($stmt-> execute())
    {
       return true;
    }
    else
    {
      return false;
    }
  }

  public function read($code, $groupid)
  {
    $sql = "SELECT * FROM er_grids WHERE code = :code AND groupid = :groupid";
    $stmt = $this->pdo->prepare($sql);
    $stmt->bindValue(":code", $code);
    $stmt->bindValue(":groupid", $groupid);

    if($stmt-> execute())
    {
       return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
  }

  public function update($code, $groupid)
  {

  }
}