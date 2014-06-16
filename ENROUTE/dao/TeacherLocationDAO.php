
<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class TeacherLocationDAO
{
    public $pdo;

       public function __construct()
       {
           $this->pdo = DatabasePDO::getInstance();
       }

        public function getTeacherLocation(){
            $sql = "SELECT * 
                    FROM `er_teacherlocation`
                    WHERE `id`=(
                    SELECT MAX(id) FROM `er_teacherlocation`)";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $teacherlocation = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($teacherlocation)){
                    return $teacherlocation;
                }
            }
            return array();
        }

        public function deletePreviousTeacherLocation()
        {
            $sql = "TRUNCATE TABLE `er_teacherlocation`";

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute();

            return true;
       }

        public function insertTeacherLocation($group_id,$longitude,$latitude)
        {
            $this->deletePreviousTeacherLocation();
            $sql = "INSERT INTO `er_teacherlocation`(group_id,longitude,latitude)
                    VALUES(:group_id,:longitude,:latitude)";
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":group_id",$group_id);
            $stmt->bindValue(":longitude",$longitude);
            $stmt->bindValue(":latitude",$latitude);
            $stmt->execute();

            return true;
       }
}