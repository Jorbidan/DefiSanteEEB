<?php
    class ModeleDTO
    {
        public $id_modele;
        public $name;
  
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>