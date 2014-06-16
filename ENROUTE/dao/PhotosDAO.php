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
                    FROM `er_uploadedphotos`";
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
                    FROM `er_uploadedphotos`
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

        public function insertPhoto($group_id,$photopath)
        {
            $sql = "INSERT INTO `er_uploadedphotos`(group_id,photopath)
                    VALUES(:group_id,:photopath)";

            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":group_id",$group_id);
            $stmt->bindValue(":photopath",$photopath);
            $stmt->execute();

            return true;
       }

        public function getPhotosByAmount()
        {
            $sql = "SELECT id, COUNT(*) AS NumberOfPhotos
                            FROM `er_uploadedphotos`";
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
}