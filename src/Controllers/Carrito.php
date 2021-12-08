<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;


class Carrito extends PublicController
{
    private function nope($usercod)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=carrito&mode=DSP&usercod=$usercod",
            "Ocurrió algo inesperado. Intente Nuevamente."
        );
    }
    private function yeah($usercod)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=carrito&mode=DSP&usercod=$usercod",
            "Operación ejecutada Satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode" => "",
            "usercod" => "",
            "username" => "",
            "idlibros"=>"",
            "ventaslib"=>array(),
            "total"=>array(),
            "hasErrors" => false,
            "Errors" => array(),
        );
        
        if($this->isPostBack()){
            $viewData["mode"] = $_POST["mode"];
            $viewData["usercod"]= $_POST["usercod"];
            switch ($viewData["mode"]) {
                case "INS":
                    // $this->yeah($viewData["rolescod"]);
                    dd($viewData);
                    break;
                default:
                    $this->yeah($viewData["usercod"]);
            }
            
        }else {
            if (isset($_GET["mode"])) {
                //dd("hola");
                $viewData["mode"] = $_GET["mode"];
            } else $this->nope($viewData["usercode"]);
            if (isset($_GET["usercod"])) $viewData["usercod"] = $_GET["usercod"];
            else if ($viewData["mode"] !== "INS") $this->nope($viewData["usercode"]);
        }


        if(isset($viewData["mode"])){

            $tmpCarrito=array();
            $tmpCarrito=\Dao\Mnt\Carrito::obtenerDatosCarrito($viewData["usercod"]);
            //dd($viewData);
            $counter = 0;
            foreach($tmpCarrito as $tmp){
                $viewData["ventaslib"][$counter]["usercod"]= $tmp["usercod"];
                $viewData["ventaslib"][$counter]["username"]= $tmp["username"];
                $viewData["ventaslib"][$counter]["factnum"]= $tmp["factnum"];
                $viewData["ventaslib"][$counter]["fechafact"]= $tmp["fechafact"];
                $viewData["ventaslib"][$counter]["idlibro"]= $tmp["idlibro"];
                $viewData["idlibros"]= $tmp["idlibro"];
                $viewData["ventaslib"][$counter]["nombrelibro"]= $tmp["nombrelibro"];
                $viewData["ventaslib"][$counter]["coverart"]= $tmp["coverart"];
                $viewData["ventaslib"][$counter]["cantidad"]= $tmp["cantidad"];
                $viewData["ventaslib"][$counter]["precio"]= $tmp["precio"];
                $viewData["ventaslib"][$counter]["subtotal"]= $tmp["subtotal"];
                $viewData["ventaslib"][$counter]["impuestos"]= $tmp["impuestos"];
                $viewData["ventaslib"][$counter]["total"]= $tmp["total"];
                $counter++;
            }

            $tmpTotal = \Dao\Mnt\Carrito::obtenerTotalFact($viewData["usercod"]);
            foreach($tmpTotal as $tmp){
                $viewData["total"][$counter]["subtotal"]= $tmp["subtotal"];
                $viewData["total"][$counter]["impuesto"]= $tmp["impuesto"];
                $viewData["total"][$counter]["total"]= $tmp["total"];
                $counter++;
            }
            //dd($viewData);
            switch ($viewData["mode"]){
                
                case "DEL":
                    //dd($viewData);
                    if(\Dao\Mnt\Carrito::EliminarArticuloCarrito($viewData["idlibros"])){
                        $this->yeah($viewData["usercod"]);
                        //dd($viewData);
                    }else{
                        dd("hay error");
                    }
            }
        }
        
        

        // Hacer elementos en comun

        // Generar un token XSRF para evitar esos ataques
        //$viewData["xsrftoken"] = md5($this->name . random_int(10000, 99999));
        //$_SESSION["xsrftoken"] = $viewData["xsrftoken"];

        Renderer::render("principal/carrito", $viewData);
    }
}