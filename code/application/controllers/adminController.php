<?php
    
    require_once(PATH_CORE."/controller.php");
    require_once(PATH_DTO."/defisDTO.php");
    require_once(PATH_DTO."/athleteDTO.php");
    require_once(PATH_DTO."/cohorteDTO.php");
    require_once(PATH_MODELS."/adminModel.php");


    class AdminController extends Controller{
        const ADMIN_PAGE_TITLE = "Administration du site";
        private $admin_modele;
        
        public function __construct(){
            $this->admin_modele = new AdminModel();
        }

        public function show(){
            $view = new View("adminView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::ADMIN_PAGE_TITLE, $content);
        }

        
    }
?>