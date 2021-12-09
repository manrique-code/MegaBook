<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;


class Perfil extends PrivateController
{
    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=home",
            "Ocurrió algo inesperado. Intente Nuevamente."
        );
    }
    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_perfil&mode=DSP",
            "Operación ejecutada Satisfactoriamente!"
        );
    }
    private function home()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=home",
            "Operación ejecutada Satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode" => "",
            "usercod"=>"",
            "useremail"=>"",
            "username"=>"",
            "userpswd"=>"",
            "userfching"=>"",
            "userpswdest"=>"",
            "userpswdexp"=>"",
            "userest"=>"",
            "useractcod"=>"",
            "userpswdchg"=>"",
            "usertipo"=>"",
            "hasErrors" => false,
            "Errors" => array(),
        );
        
        if($this->isPostBack()){
           /* $viewData["mode"] = $_POST["mode"];
            $viewData["usercod"]= $_POST["usercod"];
            switch ($viewData["mode"]) {
                case "INS":
                    // $this->yeah($viewData["rolescod"]);
                    dd($viewData);
                    break;
                default:
                    $this->yeah($viewData["usercod"]);
            }*/
            
        }else {
            if (isset($_GET["mode"])) {
                //dd("hola");
                $viewData["mode"] = $_GET["mode"];
            } else $this->nope();
            if (isset($_GET["usercod"])) $viewData["usercod"] = $_GET["usercod"];
            else if ($viewData["mode"] !== "DSP" && $viewData["mode"] !== "DEL") $this->nope();
        }


        if(isset($viewData["mode"])){
            //dd($viewData);
            $tmpPerfil=array();
            //dd($tmpPerfil);
            $tmpPerfil=\Dao\Mnt\Perfil::obtenerPerfiles($viewData["usercod"]);
            //dd($tmpPerfil);
            $viewData["usercod"] = $tmpPerfil["usercod"];
            $viewData["useremail"] = $tmpPerfil["useremail"];
            $viewData["username"] = $tmpPerfil["username"];
            $viewData["userpswd"] = $tmpPerfil["userpswd"];
            $viewData["userfching"] = $tmpPerfil["userfching"];
            $viewData["userpswdest"] = $tmpPerfil["userpswdest"];
            $viewData["userpswdexp"] = $tmpPerfil["userpswdexp"];
            $viewData["userest"] = $tmpPerfil["userest"];
            $viewData["useractcod"] = $tmpPerfil["useractcod"];
            $viewData["userpswdchg"] = $tmpPerfil["userpswdchg"];
            $viewData["usertipo"] = $tmpPerfil["usertipo"];
            //dd($viewData);
            
            //dd($viewData);
            /*switch ($viewData["mode"]){
                
                case "DEL":
                    
                    $viewData["idPerfil"] = $_GET["idcarrito"];
                    //dd($viewData);
                    if(\Dao\Mnt\Carrito::EliminarArticuloCarrito($viewData["idcarrito"])){
                        $this->yeah();
                        
                    }else{
                        dd("hay error");
                    }
                case "INS":
                    //dd("hay error");
                    if($viewData["cantidad"]==null){
                        $viewData["cantidad"]=1;
                    }
                   if(\Dao\Mnt\Carrito::InsertarDatosCarrito($viewData["usercod"],$viewData["cantidad"])){
                    $this->home();
                    }else{
                        dd("hay error");
                    }
            }*/
        }
        
        

        // Hacer elementos en comun

        // Generar un token XSRF para evitar esos ataques
        //$viewData["xsrftoken"] = md5($this->name . random_int(10000, 99999));
        //$_SESSION["xsrftoken"] = $viewData["xsrftoken"];

        Renderer::render("mnt/perfil", $viewData);
    }
}
	