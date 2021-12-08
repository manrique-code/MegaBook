<?php

namespace Controllers;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;


class Carrito extends PublicController
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
            "index.php?page=carrito&mode=DSP",
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
            "idlibros"=>"",
            "idcarrito"=>"",
            "ventaslib"=>array(),
            "total"=>array(),
            "hasErrors" => false,
            "Errors" => array(),
        );
        
        if($this->isPostBack()){
           /* $viewData["mode"] = $_POST["mode"];
            $viewData["idlibros"]= $_POST["idlibros"];
            switch ($viewData["mode"]) {
                case "INS":
                    // $this->yeah($viewData["rolescod"]);
                    dd($viewData);
                    break;
                default:
                    $this->yeah($viewData["idlibros"]);
            }*/
            
        }else {
            if (isset($_GET["mode"])) {
                //dd("hola");
                $viewData["mode"] = $_GET["mode"];
            } else $this->nope($viewData["idlibros"]);
            if (isset($_GET["idlibros"])) $viewData["idlibros"] = $_GET["idlibros"];
            else if ($viewData["mode"] !== "DSP" && $viewData["mode"] !== "DEL") $this->nope();
        }


        if(isset($viewData["mode"])){
            //dd($viewData);
            $tmpCarrito=array();
            $tmpCarrito=\Dao\Mnt\Carrito::obtenerDatosCarrito();
            //dd($tmpCarrito);
            $counter = 0;
            foreach($tmpCarrito as $tmp){
                $viewData["ventaslib"][$counter]["idcarrito"]= $tmp["idcarrito"];
                $viewData["ventaslib"][$counter]["idlibro"]= $tmp["idlibro"];
                $viewData["idlibros"]= $tmp["idlibro"];
                $viewData["ventaslib"][$counter]["nombrelibro"]= $tmp["nombreLibro"];
                $viewData["ventaslib"][$counter]["coverart"]= $tmp["coverart"];
                $viewData["ventaslib"][$counter]["cantidad"]= $tmp["cantidad"];
                $viewData["ventaslib"][$counter]["precio"]= $tmp["precio"];
                $viewData["ventaslib"][$counter]["subtotal"]= $tmp["subtotal"];
                $viewData["ventaslib"][$counter]["impuesto"]= $tmp["impuesto"];
                $counter++;
            }

            $tmpTotal = \Dao\Mnt\Carrito::obtenerTotalFact();
            foreach($tmpTotal as $tmp){
                $viewData["total"][$counter]["subtotal"]= $tmp["subtotal"];
                $viewData["total"][$counter]["impuesto"]= $tmp["impuesto"];
                $viewData["total"][$counter]["total"]= $tmp["total"];
                $counter++;
            }
            //dd($viewData);
            switch ($viewData["mode"]){
                
                case "DEL":
                    
                    $viewData["idcarrito"] = $_GET["idcarrito"];
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
                   if(\Dao\Mnt\Carrito::InsertarDatosCarrito($viewData["idlibros"],$viewData["cantidad"])){
                    $this->home();
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