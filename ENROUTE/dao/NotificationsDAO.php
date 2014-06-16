<?php

require_once WWW_ROOT . 'classes' . DIRECTORY_SEPARATOR . 'DatabasePDO.php';

class NotificationsDAO
{
    public $pdo;

       public function __construct()
       {
           $this->pdo = DatabasePDO::getInstance();
       }

        public function getNotifications(){
            $sql = "SELECT * 
                    FROM `er_notifications`
                    ORDER BY `time` DESC";
            $stmt = $this->pdo->prepare($sql);
            if($stmt->execute())
            {
                $notifications = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if(!empty($notifications)){
                    return $notifications;
                }
            }
            return array();
        }

        public function getNotification($id){
            $sql = "SELECT * 
                    FROM `er_notifications`
                    WHERE `id` = :id";
            $stmt = $this->pdo->prepare($sql);
            $stmt->bindValue(":id",$id);
            if($stmt->execute())
            {
                $notification = $stmt->fetch(PDO::FETCH_ASSOC);
                if(!empty($notification)){
                    return $notification;
                }
            }
            return array();
        }
}