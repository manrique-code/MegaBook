<?php

namespace Controllers\Mnt;

use Controllers\PublicController;

class Categoria extends PublicController
{
    private function nope($lineaCodigo)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libroscategorias",
            "Ocurrió algo inesperado. Intente Nuevamente. Línea: $lineaCodigo"
        );
    }
    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libroscategorias",
            "Operación ejecutada Satisfactoriamente!"
        );
    }
    public function run(): void
    {
        $viewData = array(
            "mode_dsc" => "",
            "mode" => "",
            "idCategoria" => "",
            "idLibros" => "",
            "hasErrors" => false,
            "Errors" => array(),
            "showaction" => true,
            "readonly" => false,
            "idlibros" => "",
            "steps" => false
        );
        $modeDscArr = array(
            "INS" => "Nueva Categoría",
            "UPD" => "Editando Categoría (%s) %s",
            "DEL" => "Eliminando Categoría (%s) %s",
            "DSP" => "Detalle de Categoría (%s) %s"
        );

        if ($this->isPostBack()) {
            // se ejecuta al dar click sobre guardar
            $viewData["mode"] = $_POST["mode"];
            $viewData["idCategoria"] = $_POST["idCategoria"];
            $viewData["idLibros"] = $_POST["idLibros"];
            $viewData["xsrftoken"] = $_POST["xsrftoken"];
            // Validate XSRF Token
            if (!isset($_SESSION["xsrftoken"]) || $viewData["xsrftoken"] != $_SESSION["xsrftoken"]) {
                $this->nope("52");
            }
            // Validaciones de Errores
            if (\Utilities\Validators::IsEmpty($viewData["idCategoria"]) ($viewData["idLibros"]) ) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "El codigo del libro y de categoria no pueden estar vacios!";
            }
            if (!$viewData["hasErrors"]) {
                switch ($viewData["mode"]) {
                    case "INS":
                        if (\Dao\Mnt\LibrosCategorias::InsertarLibroCategoria(
                            $viewData["idCategoria"],
                            $viewData["idLibros"]
                        )) {
                            $this->yeah();
                        }
                        break;
                    case "UPD":
                        if (\Dao\Mnt\LibrosCategorias::actualizarLibroCategoria(
                            $viewData["idLibros"],
                            $viewData["idCategoria"]
                        )) {
                            $this->yeah();
                        }
                        break;
                    case "DEL":
                        if (\Dao\Mnt\LibrosCategorias::eliminarLibroCategoria(
                            $viewData["idCategoria"],
                            $viewData["idLibros"]
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
                    $this->nope("90");
                }
                $viewData["mode"] = $_GET["mode"];
            } else {
                $this->nope("94");
            }
            if (isset($_GET["idcategorias"])) {
                $viewData["idCategorias"] = $_GET["idcategorias"];
            } else {
                if ($viewData["mode"] !== "INS") {
                    $this->nope("100");
                }
            }
        }

        // Hacer elementos en comun

        if ($viewData["mode"] == "INS") {
            $viewData["mode_dsc"]  = $modeDscArr["INS"];
            if (isset($_GET["idLibros"])) {
                $viewData["idLibros"] = $_GET["idLibros"];
                $viewData["steps"] = true;
            }
        } else {
            $tmpCategoria = \Dao\Mnt\LibrosCategorias::obtenerLibroCategoria($viewData["idLibros"]);
            $viewData["idCategoria"] = $tmpCategoria["idCategoria"];
            $viewData["mode_dsc"]  = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData["idCategoria"],
                $viewData["idLibros"]
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

        \Views\Renderer::render("mnt/librocategoria", $viewData);
    }
}
