<?php
    class AthleteDTO
    {
        public $id_athlete;
        public $prenom;
        public $nom;
        public $image;

        
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>