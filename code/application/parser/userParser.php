<?php
    require_once(PATH_DTO."/userDTO.php");
    class UserParser {

        public Static function parse_post(){
            $name = null;

            if(isset($_POST["name"])){
                $name = $_POST["name"];
            }
            $userDTO = new UserDTO();
            $userDTO->set_name($name);
            return $userDTO;
        }

        public Static function parseWithString(){
            parse_str(file_get_contents("php://input"),$post_vars);

            $id_user = null;
            $first_name = null;
            $last_name = null;
            
            if(isset($post_vars["id_user"])){
                $id_user = $post_vars["id_user"];
            }
            if(isset($post_vars["first_name"])){
                $first_name = $post_vars["first_name"];
            }
            if(isset($post_vars["last_name"])){
                $last_name = $post_vars["last_name"];
            }
            return new UserDTO($id_user ,$first_name, $last_name);
        }

    }
?>