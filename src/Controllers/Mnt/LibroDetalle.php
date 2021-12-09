<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class LibroDetalle extends PrivateController
{
    private function nope($lineaCodigo)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libros",
            "Ocurrión algo inesperado en la línea de código: $lineaCodigo. Intente nuevamente."
        );
    }

    private function yeah()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libros",
            "¡Operación realizada satisfactoriamente!"
        );
    }

    private function nextStep($idlibros)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libros",
            "¡Operación realizada satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode_dsc" => "",
            "mode" => "",
            "idlibros" => "",
            "nombreLibro" => "",
            "coverart" => "",
            "desc" => "",
            "precio" => "",
            "descexp" => "",
            "stock" => "",
            "hasErrors" => false,
            "Errors" => array(),
            "showAction" => true,
            "readonly" => false,
            "steps" => false
        );

        $modeDscArray = array(
            "INS" => "Nuevo libro",
            "UPD" => "Editando el libro (%s) %s",
            "DEL" => "Eliminando libro (%s) %s",
            "DSP" => "Detalle del libro (%s) %s",
        );

        if ($this->isPostBack()) {
            // dd($_POST);
            $viewData["mode"] = $_POST["mode"];
            $viewData["idlibros"] = $_POST["idlibros"];
            $viewData["precio"] = $_POST["precio"];
            $viewData["desc"] = ($_POST["desc"]) === "" ? 0 : $_POST["desc"];
            $viewData["descexp"] = ($_POST["descexp"]) === "" ? 0 : $_POST["descexp"];
            $viewData["stock"] = $_POST["stock"];
            $viewData["xsrftoken"] = $_POST["xsrftoken"];
            // Validar el XSRFTOKEN.
            if (!isset($_SESSION["xsrftoken"]) || $viewData["xsrftoken"] != $_SESSION["xsrftoken"]) {
                $this->nope("63");
            }
            if (\Utilities\Validators::IsEmpty($viewData["precio"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "¡El nombre del libro no puede ir vacio!";
            }
            if (\Utilities\Validators::IsEmpty($viewData["stock"])) {
                $viewData["hasErrors"] = true;
                $viewData["Errors"][] = "¡La descripción del libro no puede estar vacía!";
            }

            if (!$viewData["hasErrors"]) {
                switch ($viewData["mode"]) {
                    case "INS":
                        // dd($viewData);
                        if (\Dao\Mnt\LibroDetalle::crearDetalleLibro(
                            $viewData["idlibros"],
                            $viewData["stock"],
                            $viewData["desc"],
                            $viewData["descexp"],
                            $viewData["precio"]
                        ))
                            $this->yeah();
                        break;
                    case "UPD":
                        if (\Dao\Mnt\Libros::editarLibro(
                            $viewData["nombreLibro"],
                            $viewData["descripcion"],
                            \Dao\Mnt\Libros::actualizarImagen($viewData["coverart"], $viewData["idlibros"]),
                            $viewData["idlibros"]
                        ))
                            $this->yeah();
                        break;
                    case "DEL":
                        if (\Dao\Mnt\Libros::eliminarLibro($viewData["idlibros"])) $this->yeah();
                        break;
                    default:
                        $this->nope("66");
                }
            }
        } else {
            if (isset($_GET["mode"])) {
                if (!isset($modeDscArray[$_GET["mode"]])) $this->nope("71");
                $viewData["mode"] = $_GET["mode"];
            } else $this->nope("73");
            if (isset($_GET["idlibros"])) $viewData["idlibros"] = $_GET["idlibros"];
            else if ($viewData["mode"] !== "INS") $this->nope("75");
        }


        if ($viewData["mode"] == "INS") {
            $tmpLibroDetalle = \Dao\Mnt\Libros::obtenerLibro($viewData["idlibros"]);
            $viewData["coverart"] = $tmpLibroDetalle["coverart"];
            $viewData["nombreLibro"] = $tmpLibroDetalle["nombreLibro"];
            $viewData["mode_dsc"] = $modeDscArray["INS"];
            $viewData["steps"] = true;
        } else {
            // Obtenemos el libro al momento de actualizar
            $tmpLibroDetalle = \Dao\Mnt\LibroDetalle::obtenerLibroDetallePorLibro($viewData["idlibros"]);
            dd($tmpLibroDetalle);
            $viewData["coverart"] = $tmpLibroDetalle["coverart"];
            $viewData["nombreLibro"] = $tmpLibroDetalle["nombreLibro"];
            $viewData["precio"] = $tmpLibroDetalle["precio"];
            $viewData["descexp"] = $tmpLibroDetalle["descexp"];
            $viewData["stock"] = $tmpLibroDetalle["stock"];
            $viewData["desc"] = $tmpLibroDetalle["desc"];
            $viewData["mode_dsc"] = sprintf(
                $modeDscArray[$viewData["mode"]],
                $viewData["idlibros"],
                $viewData["nombreLibro"]
            );
            if ($viewData["mode"] === "DSP") {
                $viewData["showAction"] = false;
                $viewData["readonly"] = "readonly";
                // dd($viewData);
            }
            if ($viewData["mode"] === "DEL") {
                $viewData["showAction"] = false;
            }
            if ($viewData["mode"] === "UPD") $viewData["showAction"] = true;
        }
        $viewData["xsrftoken"] = md5($this->name . random_int(10000, 99999));
        $_SESSION["xsrftoken"] = $viewData["xsrftoken"];
        Renderer::render("mnt/librodetalle", $viewData);
    }
}
