<?php
    require_once(PATH_CORE."/dbModel.php");
    require_once(PATH_DTO."/pneuDTO.php");
    require_once(PATH_DTO."/marqueVoitureDTO.php");
    require_once(PATH_DTO."/modeleDTO.php");

    class PneuModel extends dbModel
    {
        const GET_ALL_MARQUE_VOITURE = "get_all_marque_voiture";
        const GET_MODELE_FOR_MARQUE_VOITURE = "get_modele_for_marque_voiture";
        const GET_PNEU_FOR_MODELE = "get_pneu_for_modele";

        public function get_all_marque_voiture(){
           $pdo = $this->get_pdo_instance();
           $procedure = $pdo->prepare("Call ".self::GET_ALL_MARQUE_VOITURE."()");
           $procedure->execute([
                
           ]);
           $marques = $procedure->fetchAll(PDO::FETCH_CLASS,"marqueVoitureDTO");
           return $marques;
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