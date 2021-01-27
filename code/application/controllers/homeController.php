<?php

    require_once(PATH_CORE."/controller.php");
  

    class HomeController extends Controller{
        
        const DEFIS_PAGE_TITLE = "Défis santé EEB";
        const ERROR_DEFIS = "Erreur";
 
        public function __construct(){
            
        }

        public function show(){
            $view = new View("defisView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::DEFIS_PAGE_TITLE, $content);
        }
    }
?>