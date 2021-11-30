<?php

namespace Controllers\Mnt;

use Controllers\PublicController;

class Categoria extends PublicController
{
    private function nope($lineaCodigo)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_categorias",
            "Ocurrió algo inesperado. Intente Nuevamente. Línea: $lineaCodigo"
        );
    }
    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_categorias",
            "Operación ejecutada Satisfactoriamente!"
        );
    }
    public function run(): void
    {
        $viewData = array(
            "mode_dsc" => "",
            "mode" => "",
            "idCategorias" => "",
            "categoriaDes" => "",
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
            $viewData["idCategorias"] = $_POST["idCategorias"];
            $viewData["categoriaDes"] = $_POST["categoriaDes"];
            $viewData["xsrftoken"] = $_POST["xsrftoken"];
            // Validate XSRF Token
            if (!isset($_SESSION["xsrftoken"]) || $viewData["xsrftoken"] != $_SESSION["xsrftoken"]) {
                $this->nope("52");
            }
            // Validaciones de Errores
            if (\Utilities\Validators::IsEmpty($viewData["categoriaDes"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "El nombre no Puede Ir Vacio!";
            }
            if (!$viewData["hasErrors"]) {
                switch ($viewData["mode"]) {
                    case "INS":
                        if (\Dao\Mnt\Categorias::crearCategoria(
                            $viewData["categoriaDes"]
                        )) {
                            $this->yeah();
                        }
                        break;
                    case "UPD":
                        if (\Dao\Mnt\Categorias::editarCategoria(
                            $viewData["categoriaDes"],
                            $viewData["idCategorias"]
                        )) {
                            $this->yeah();
                        }
                        break;
                    case "DEL":
                        if (\Dao\Mnt\Categorias::eliminarCategoria(
                            $viewData["idCategorias"]
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
            if (isset($_GET["idlibros"])) {
                $viewData["idlibros"] = $_GET["idlibros"];
                $viewData["steps"] = true;
            }
        } else {
            $tmpCategoria = \Dao\Mnt\Categorias::obtenerCategoria($viewData["idCategorias"]);
            $viewData["categoriaDes"] = $tmpCategoria["categoriaDes"];
            $viewData["mode_dsc"]  = sprintf(
                $modeDscArr[$viewData["mode"]],
                $viewData["idCategorias"],
                $viewData["categoriaDes"]
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

        \Views\Renderer::render("mnt/categoria", $viewData);
    }
}
