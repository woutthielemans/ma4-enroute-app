<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class SpotsDAO
{
    public $pdo;

       public function __construct()
       {
           $this->pdo = DatabasePDO::getInstance();
       }

        public function getSpots(){
            $sql = "SELECT * 
                    FROM `er_spots`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $spots = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($spots)){
                    return $spots;
                }
            }
            return array();
        }

        public function getSpot($id){
            $sql = "SELECT * 
                    FROM `er_spots`
                    WHERE `id` = :id";
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":id",$id);
            if($stmt->execute())
            {
                $spot = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!empty($spot)){
                    return $spot;
                }
            }
            return array();
        }

        public function getSpotsCoors(){
            $sql = "SELECT `x_coor`,`y_coor`
                    FROM `er_spots`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $spots = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($spots)){
                    return $spots;
                }
            }
            return array();
        }

        public function insertSpot($title,$subtitle,$x_coor,$y_coor)
        {
            $sql = "INSERT INTO `er_spots`(title,subtitle,x_coor,y_coor)
                    VALUES(:title,:subtitle,:x_coor,:y_coor)";

            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":title",$title);
            $stmt->bindValue(":subtitle",$subtitle);
            $stmt->bindValue(":x_coor",$x_coor);
            $stmt->bindValue(":y_coor",$y_coor);
            $stmt->execute();

            return true;
       }
}