<?php
    class PneuDTO
    {
        public $id_pneu;
        public $largeur;
        public $rapport;
        public $diametre;
        

        public function __construct(){
         
        }

        public function get_id():int{
            return $this->id;
        }

    }
?>