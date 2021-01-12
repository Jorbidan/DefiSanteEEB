<?php

class View{
  
  
    protected $template = null;

    public function __construct($template) {
        $this->template = $template;
    }

    public function render(Array $data) {
        extract($data);
        ob_start();
        include( PATH_VIEWS."/". $this->template);
        $content = ob_get_contents();
        ob_end_clean();
        return $content;
    }
}

?>