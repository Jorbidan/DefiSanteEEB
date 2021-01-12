<?php
    require_once(PATH_CORE."/dbModel.php");
    require_once(PATH_DTO."/cohorteDTO.php");
    require_once(PATH_DTO."/defisDTO.php");

    class DefisModel extends dbModel
    {
        const GET_ALL_COHORTES = "get_all_cohortes";
        const GET_DEFI_FOR_COHORTE = "get_defi_for_cohorte";

        public function get_all_cohortes(){
           $pdo = $this->get_pdo_instance();
           $procedure = $pdo->prepare("Call ".self::GET_ALL_COHORTES."()");
           $procedure->execute([
                
           ]);
           $lesCohortes = $procedure->fetchAll(PDO::FETCH_CLASS,"cohortesDTO");
           return $lesCohortes;
        }

        public function get_modele_for_marque($id_marque){
            $pdo = $this->get_pdo_instance();
            $procedure = $pdo->prepare("Call ".self::GET_MODELE_FOR_MARQUE_VOITURE."(:id_marque)");
            $procedure->execute([
                'id_marque' => $id_marque
           ]);
           $modeles = $procedure->fetchAll(PDO::FETCH_CLASS,"modeleDTO");
           return $modeles;
        }

        public function get_pneu_for_modele($id_modele){
            $pdo = $this->get_pdo_instance();
            $procedure = $pdo->prepare("Call ".self::GET_PNEU_FOR_MODELE."(:id_modele)");
            $procedure->execute([
                'id_modele' => $id_modele
            ]);
            $pneu = $procedure->fetchAll(PDO::FETCH_CLASS,"pneuDTO");
            return $pneu;
        }
    }
?>