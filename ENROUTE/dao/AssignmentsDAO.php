<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class AssignmentsDAO
{
    public $pdo;

       public function __construct()
       {
           $this->pdo = DatabasePDO::getInstance();
       }

        public function getAssignments(){
            $sql = "SELECT * 
                    FROM `er_assignments`";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $assignments = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($assignments)){
                    return $assignments;
                }
            }
            return array();
        }

        public function getCreativeAssignments(){
            $sql = "SELECT * 
                    FROM `er_assignments`
                    WHERE `type` = 1";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $assignments = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($assignments)){
                    return $assignments;
                }
            }
            return array();
        }

        public function getStandardAssignments(){
            $sql = "SELECT * 
                    FROM `er_assignments`
                    WHERE `type` = 2";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $assignments = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($assignments)){
                    return $assignments;
                }
            }
            return array();
        }

        public function getAssignment($id){
            $sql = "SELECT * 
                    FROM `er_assignments`
                    WHERE `id` = :id";
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":id",$id);
            if($stmt->execute())
            {
                $assignment = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!empty($assignment)){
                    return $assignment;
                }
            }
            return array();
        }
}