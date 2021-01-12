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

        public function cohortes($id_cohorte){
            //ajax
            header('Content-Type: application/json');
            $leDefi = $this->defis_modele->get_defi_for_cohorte($id_cohorte);
            $response = array("defi"=>$leDefi);
            echo json_encode($response);
        }  

        public function show_les_defis(){
            $view = new View("defisView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::DEFIS_PAGE_TITLE, $content);
        }

    }
?>