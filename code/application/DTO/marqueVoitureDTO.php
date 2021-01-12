<?php
    class MarqueVoitureDTO
    {
        public $id_marque_voiture;
        public $name;
  
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>