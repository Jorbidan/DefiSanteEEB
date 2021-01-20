<?php
    class DefisDTO
    {
        public $id_defi;
        public $nom;
        public $km_defi;
        public $image_defi;
        public $km_cumul;
        public $id_cohorte;
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>