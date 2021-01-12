<?php
  
    require_once(PATH_CORE."/view.php");
    class Controller{

        protected function render_template_with_content($title, $content){
            $data = array("title"=>$title, "content"=>$content);
            $view = new View("template.php");
            echo $view->render($data);
        }

        protected function render_error($title, $errorMessage){
            $view = new View("errorView.php");
                $data = array("errorMessage"=>$errorMessage);
                $content = $view->render($data);
                echo $this->render_template_with_content($title, $content);
        }
   
    }
?>