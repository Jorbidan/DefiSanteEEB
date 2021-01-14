<?php
    class CohorteDTO
    {
        public $id_cohorte;
        public $nom;
        public $km_total;
        
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>