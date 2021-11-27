<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class Libro extends PrivateController
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
            "index.php?page=mnt_libroautores&mode=CRT&idlibros=$idlibros",
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
            "descripcion" => "",
            "coverart" => "",
            "hasErrors" => false,
            "Errors" => array(),
            "showAction" => true,
            "readonly" => false,
        );

        $modeDscArray = array(
            "INS" => "Nuevo libro",
            "UPD" => "Editando el libro (%s) %s",
            "DEL" => "Eliminando libro (%s) %s",
            "DSP" => "Detalle del libro (%s) %s",
        );

        if ($this->isPostBack()) {
            $viewData["mode"] = $_POST["mode"];
            $viewData["idlibros"] = $_POST["idlibros"];
            $viewData["nombreLibro"] = $_POST["nombreLibro"];
            $viewData["descripcion"] = $_POST["descripcion"];
            if (isset($_FILES["coverart"])) $viewData["coverart"] = $_FILES["coverart"];
            switch ($viewData["mode"]) {
                case "INS":
                    if (\Dao\Mnt\Libros::crearLibro(
                        $viewData["idlibros"],
                        $viewData["nombreLibro"],
                        $viewData["descripcion"],
                        \Dao\Mnt\Libros::subirImagen($viewData["coverart"])
                    ))
                        $this->nextStep($viewData["idlibros"]);
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
        } else {
            if (isset($_GET["mode"])) {
                if (!isset($modeDscArray[$_GET["mode"]])) $this->nope("71");
                $viewData["mode"] = $_GET["mode"];
            } else $this->nope("73");
            if (isset($_GET["idlibros"])) $viewData["idlibros"] = $_GET["idlibros"];
            else if ($viewData["mode"] !== "INS") $this->nope("75");
        }

        if ($viewData["mode"] == "INS") {
            $viewData["idlibros"] = \Dao\Mnt\Libros::GUID();
            $viewData["mode_dsc"] = $modeDscArray["INS"];
            // dd($viewData["autor"]);
        } else {
            // Obtenemos el libro al momento de actualizar
            $tmpLibro = \Dao\Mnt\Libros::obtenerLibro($viewData["idlibros"]);
            // dd($tmpLibro);
            $viewData["nombreLibro"] = $tmpLibro["nombreLibro"];
            $viewData["descripcion"] = $tmpLibro["descripcion"];
            $viewData["coverart"] = $tmpLibro["coverart"];
            $viewData["mode_dsc"] = sprintf(
                $modeDscArray[$viewData["mode"]],
                $viewData["idlibros"],
                $viewData["nombreLibro"]
            );
            if ($viewData["mode"] === "DSP") {
                $viewData["showAction"] = false;
                $viewData["readonly"] = "readonly";
            }
            if ($viewData["mode"] === "DEL") {
                // $viewData["showAction"] = true;
            }
            if ($viewData["mode"] === "UPD") $viewData["showAction"] = true;
        }
        Renderer::render("mnt/libro", $viewData);
    }
}
