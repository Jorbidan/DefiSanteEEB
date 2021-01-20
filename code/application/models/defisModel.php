<?php
    require_once(PATH_CORE."/dbModel.php");
    require_once(PATH_DTO."/cohorteDTO.php");
    require_once(PATH_DTO."/defisDTO.php");
    require_once(PATH_DTO."/athleteDTO.php");


    class DefisModel extends dbModel
    {
        const GET_ALL_COHORTES_PROC = "get_all_cohortes";
        const GET_DEFI_FOR_COHORTE_PROC = "get_defi_for_cohorte";
        const GET_ALL_ATHLETES_PROC = "get_les_athletes";
        const ADD_KM_ATHLETES_PROC = "add_km_athletes";

        public function get_all_cohortes(){
           $pdo = $this->get_pdo_instance();
           $procedure = $pdo->prepare("Call ".self::GET_ALL_COHORTES_PROC."()");
           $procedure->execute([
                
           ]);
           $lesCohortes = $procedure->fetchAll(PDO::FETCH_CLASS,"cohorteDTO");
           return $lesCohortes;
        }

        public function get_defi_for_cohorte($id_cohorte){
            $pdo = $this->get_pdo_instance();
            $procedure = $pdo->prepare("Call ".self::GET_DEFI_FOR_COHORTE_PROC."(:in_id_cohorte)");
            $procedure->execute([
                'in_id_cohorte' => $id_cohorte
           ]);
           $leDefi = $procedure->fetchAll(PDO::FETCH_CLASS,"defisDTO");
           return $leDefi;
        }
        
        public function get_les_athletes($id_cohorte){
            $pdo = $this->get_pdo_instance();
            $array_les_athletes = array('' => '' );
            $procedure = $pdo->prepare("Call ".self::GET_ALL_ATHLETES_PROC."(:in_id_cohorte)");
            $procedure->execute([
                'in_id_cohorte' => $id_cohorte,
            ]);
            $lesAthletes = $procedure->fetchAll();//PDO::FETCH_CLASS,"athleteDTO"
            return $lesAthletes;
        }

        public function add_km_athletes($id_athlete, $km_ajouter){
            $pdo = $this->get_pdo_instance();
            $procedure = $pdo->prepare("Call ".self::ADD_KM_ATHLETES_PROC."(:in_id_athlete, :km_ajouter)");
            $procedure->execute([
                'in_id_athlete' => $id_athlete,
                'km_ajouter' => $km_ajouter
            ]);
        }

    }
?>