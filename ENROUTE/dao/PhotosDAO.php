<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class PhotosDAO
{
    public $pdo;

       public function __construct()
       {
           $this->pdo = DatabasePDO::getInstance();
       }

        public function getPhotos(){
            $sql = "SELECT * 
                    FROM `ndip_photos`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $photos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($photos)){
                    return $photos;
                }
            }
            return array();
        }

        public function getPhoto($id){
            $sql = "SELECT * 
                    FROM `ndip_photos`
                    WHERE `id` = :id";
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":id",$id);
            if($stmt->execute())
            {
                $photo = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!empty($photo)){
                    return $photo;
                }
            }
            return array();
        }

        public function getPhotosCoors(){
            $sql = "SELECT `x_coor`,`y_coor`
                    FROM `ndip_photos`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $photos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($photos)){
                    return $photos;
                }
            }
            return array();
        }

        public function insertPhoto($name)
        {
            $sql = "INSERT INTO `ndip_photos`(name)
                    VALUES(:name)";

            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":name",$name);
            $stmt->execute();

            return true;
       }

        public function getPhotosByAmount()
        {
            $sql = "SELECT id, COUNT(*) AS NumberOfPhotos
                            FROM `ndip_photos`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $photos = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!empty($photos))
                {
                    return $photos;
                }
            }
            return false;
        }

    public function getPhotosByCodeAndGroupId($code, $groupid)
    {
        $sql = 'SELECT * FROM er_uploadedphotos WHERE code = :code AND group_id = :groupid';
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(":code", $code);
        $stmt->bindValue(":groupid", $groupid);

        if($stmt-> execute())
        {
           return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }
}