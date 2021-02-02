<?php
    class Request{
        private $full_URL;
        private $controller_name;
        private $params;
        private $action;

        public function __construct(){
            $this->full_URL = $_SERVER["REQUEST_URI"];;
            $this->parse();
        }

        public function get_controller_name(){
            return $this->controller_name;
        }

        public function get_action(){
            return $this->action;
        }

        public function get_params(){
            return $this->params;
        }

        private function parse()
        {   
            $url_without_query_param =  explode('?', $this->full_URL)[0];
            $explode_url = explode('/', $url_without_query_param);
            $explode_url = array_slice($explode_url, 1);//au lieu du 1 mettre un 3 sr le nas (pour skiper les / necessaires)

            if(count($explode_url)>0 && !$this->IsNullOrEmptyString($explode_url[0])){
                $this->controller_name = $explode_url[0];
                $this->assign_action($explode_url);
            }else{
                $this->set_default_controller(); 
                $this->set_default_action(); 
                $this->params = null; 
            }
        }
        
        private function assign_action($explode_url){
            if(count($explode_url)>1 && !$this->IsNullOrEmptyString($explode_url[1])){
                $this->action = $explode_url[1];
                $this->assign_params($explode_url);
            }else{
                $this->set_default_action();
                $this->params = null; 
            }
        }

        private function assign_params($explode_url){
            if(count($explode_url)>2){
                $this->params = array_map('urldecode',array_slice($explode_url, 2));
            }else{

                $this->set_default_params();
            }
        }

        private function set_default_controller(){
            $this->controller_name = "home"; 
        }

        private function set_default_action(){
            $this->action = "show"; 
        }

        private function set_default_params(){
            $this->params = array(); 
        }

        private function IsNullOrEmptyString($str){
            return (!isset($str) || trim($str) === '');
        }

        
    }
?>