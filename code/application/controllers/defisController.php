<?php
    
    require_once(PATH_CORE."/controller.php");
    require_once(PATH_DTO."/defisDTO.php");
    require_once(PATH_MODELS."/defisModel.php");


    class DefisController extends Controller{
        const DEFIS_PAGE_TITLE = "Les Défis";
        const ERROR_DEFIS = "Erreur";
        private $defis_modele;
        
        public function __construct(){
            $this->defis_modele = new DefisModel();
        }

        public function lesDefis(){
            $this->show_les_defis();              
        }

        public function show(){
            $this->show_les_defis();
        }

        public function cohortes(){
            //ajax
            header('Content-Type: application/json');

            if(func_num_args() >0){
                $id_cohorte = func_get_arg(0);
            }else{
                $id_cohorte = null;
            }
            if ($id_cohorte == null) {
              $lesCohortes = $this->defis_modele->get_all_cohortes();
            //var_dump($lesCohortes);
              $response = array("lesCohortes"=>$lesCohortes);
              echo json_encode($response);
            }
            else
            {
                $leDefi = $this->defis_modele->get_defi_for_cohorte($id_cohorte);
                $response = array("leDefi"=>$leDefi);
                echo json_encode($response);
            }
           // var_dump($response);
        }  

        public function leDefi($id_cohorte){
            //ajax
            header('Content-Type: application/json');
            $leDefi = $this->defis_modele->get_defi_for_cohorte($id_cohorte);
            $response = array("leDefi"=>$leDefi);
            echo json_encode($response);
        }

        public function athletes($id_cohorte){
            //ajax
            header('Content-Type: application/json');
            $lesAthletes = $this->defis_modele->get_les_athletes($id_cohorte);
            $response = array("lesAthletes"=>$lesAthletes);
            echo json_encode($response);
        }

        public function show_les_defis(){
            $view = new View("defisView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::DEFIS_PAGE_TITLE, $content);
        }
        public function AjouterKm($id_athlete,$km){
            //ajax
            header('Content-Type: application/json');
            $leDefi = $this->defis_modele->add_km_athletes($id_athlete,$km);
        }
    }
?>