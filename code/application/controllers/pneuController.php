<?php
    
    require_once(PATH_CORE."/controller.php");
    require_once(PATH_DTO."/pneuDTO.php");
    require_once(PATH_MODELS."/pneuModel.php");


    class PneuController extends Controller{
        const PNEU_PAGE_TITLE = "Outil pour pneus";
        const ERROR_PNEU = "Erreur";
        private $pneu_modele;
        
        public function __construct(){
            $this->pneu_modele = new PneuModel();
        }

        public function outil(){
            $this->show_outil();
               
        }

        public function show(){
            $this->show_outil();
        }

        public function marque(){
            //ajax
            header('Content-Type: application/json');

            if(func_num_args() >0){
                $id_marque_voiture = func_get_arg(0);
            }else{
                $id_marque_voiture = null;
            }
            if ($id_marque_voiture == null) {
              $lesMarques = $this->pneu_modele->get_all_marque_voiture();
              $response = array("marques"=>$lesMarques);
              echo json_encode($response);
            }
            else
            {
                $lesModels = $this->pneu_modele->get_modele_for_marque($id_marque_voiture);
                $response = array("model"=>$lesModels);
                echo json_encode($response);
            }
        } 


        public function modele($id_modele){
            //ajax
            header('Content-Type: application/json');
            $lesPneus = $this->pneu_modele->get_pneu_for_modele($id_modele);
            $response = array("pneu"=>$lesPneus);
            echo json_encode($response);
        }   

        public function show_outil(){
            $view = new View("pneuView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::PNEU_PAGE_TITLE, $content);
        }

    }
?>