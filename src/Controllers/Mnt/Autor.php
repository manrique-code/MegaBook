<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Controllers\PublicController;

class Autor extends PrivateController
{
    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_autores",
            "Ocurrió algo inesperado. Intente Nuevamente."
        );
    }
    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_autores",
            "Operación ejecutada Satisfactoriamente!"
        );
    }

    private function nextStep($idlibros)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_categoria&mode=INS&idAutor=0&idlibros=$idlibros",
            "¡Operación realizada satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode_dsc" => "",
            "mode" => "",
            "idAutor" => "",
            "nombreAutor" => "",
            "apellidoAutor" => "",
            "genero_MAS" => "",
            "genero_Fem" => "",
            "genero_OTR" => "",
            "hasErrors" => false,
            "Errors" => array(),
            "showaction" => true,
            "readonly" => false,
            "ultimoIdAutor" => "",
            "idlibros" => ""
        );
        $modeDscArr = array(
            "INS" => "Nuevo Autor",
            "UPD" => "Editando Autor (%s) %s",
            "DEL" => "Eliminando Autor (%s) %s",
            "DSP" => "Detalle de Autor (%s) %s",
            "CRT" => "¿Cuál es el autor del libro (%s)?"
        );

        if ($this->isPostBack()) {
            // se ejecuta al dar click sobre guardar
            $viewData["mode"] = $_POST["mode"];
            $viewData["idAutor"] = $_POST["idAutor"];
            $viewData["nombreAutor"] = $_POST["nombreAutor"];
            $viewData["apellidoAutor"] = $_POST["apellidoAutor"];
            $viewData["genero"] = $_POST["genero"];
            $viewData["xsrftoken"] = $_POST["xsrftoken"];
            $viewData["idlibros"] = $_POST["idlibros"];
            // Validate XSRF Token
            if (!isset($_SESSION["xsrftoken"]) || $viewData["xsrftoken"] != $_SESSION["xsrftoken"]) {
                $this->nope();
            }
            // Validaciones de Errores
            if (\Utilities\Validators::IsEmpty($viewData["nombreAutor"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "El nombre no Puede Ir Vacio!";
            }
            if (\Utilities\Validators::IsEmpty($viewData["apellidoAutor"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "El apellido no Puede Ir Vacio!";
            }
            /*if (($viewData["genero"] == "MAS"
                || $viewData["genero"] == "FEM"
                || $viewData["genero"] == "OTR"
                ) == false
            ) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "Estado de Autor Incorrecto!";
            }*/


            if (!$viewData["hasErrors"]) {
                switch ($viewData["mode"]) {
                    case "INS":
                        // dd($viewData);
                        if (\Dao\Mnt\Autores::insertarAutor(
                            $viewData["nombreAutor"],
                            $viewData["apellidoAutor"],
                            $viewData["genero"]
                        )) {
                            // dd(\Dao\Mnt\Autores::obtenerUltimoID()["UltimoID"]);
                            if (trim($viewData["idlibros"]) !== "") {
                                if (\Dao\Mnt\LibroAutores::crearLibroConAutor(
                                    $viewData["idlibros"],
                                    \Dao\Mnt\Autores::obtenerUltimoID()["UltimoID"]
                                )) $this->yeah();
                            }
                            $this->yeah();
                        }
                        break;
                    case "UPD":
                        if (\Dao\Mnt\Autores::actualizarAutor(
                            $viewData["idAutor"],
                            $viewData["nombreAutor"],
                            $viewData["apellidoAutor"],
                            $viewData["genero"]
                        )) {
                            $this->yeah();
                        }
                        break;
                    case "DEL":
                        if (\Dao\Mnt\Autores::eliminarAutor(
                            $viewData["idAutor"]
                        )) {
                            $this->yeah();
                        }
                        break;
                }
            }
        } else {
            // se ejecuta si se refresca o viene la peticion
            // desde la lista
            if (isset($_GET["mode"])) {
                if (!isset($modeDscArr[$_GET["mode"]])) {
                    $this->nope();
                }
                $viewData["mode"] = $_GET["mode"];
            } else {
                $this->nope();
            }
            if (isset($_GET["idAutor"])) {
                $viewData["idAutor"] = $_GET["idAutor"];
            } else {
                if ($viewData["mode"] !== "INS") {
                    $this->nope();
                }
            }
        }

        // Hacer elementos en comun

        if ($viewData["mode"] == "INS") {
            $viewData["mode_dsc"]  = $modeDscArr["INS"];
            // revisamos si hay un libro que insertar.
            if (isset($_GET["idlibros"])) {
                $viewData["idlibros"] = $_GET["idlibros"];
            }
        } else {
            $tmpCategoria = \Dao\Mnt\Autores::obtenerAutor($viewData["idAutor"]);
            $viewData["nombreAutor"] = $tmpCategoria["nombreAutor"];
            $viewData["apellidoAutor"] = $tmpCategoria["apellidoAutor"];
            $viewData["genero_MAS"] = $tmpCategoria["genero"] == "MAS" ? "selected" : "";
            $viewData["genero_FEM"] = $tmpCategoria["genero"] == "FEM" ? "selected" : "";
            $viewData["genero_OTR"] = $tmpCategoria["genero"] == "OTR" ? "selected" : "";
            $viewData["mode_dsc"]  = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData["idAutor"],
                $viewData["nombreAutor"],
                $viewData["apellidoAutor"]
            );
            if ($viewData["mode"] == "DSP") {
                $viewData["showaction"] = false;
                $viewData["readonly"] = "readonly";
            }
            if ($viewData["mode"] == "DEL") {

                $viewData["readonly"] = "readonly";
            }
        }
        // Generar un token XSRF para evitar esos ataques
        $viewData["xsrftoken"] = md5($this->name . random_int(10000, 99999));
        $_SESSION["xsrftoken"] = $viewData["xsrftoken"];

        \Views\Renderer::render("mnt/autor", $viewData);
    }
}
