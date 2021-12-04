<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class LibroAutores extends PrivateController
{
    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_roles",
            "Ocurrió algo inesperado. Intente nuevamente."
        );
    }

    private function yeah($idlibros)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libroautores&mode=DSP&idlibros=$idlibros",
            "¡Operación ejecutada satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode" => "",
            "idlibros" => "",
            "nombreLibro" => "",
            "idAutor" => "",
            "nombreAutor" => "",
            "autor" => array(),
            "noAutor" => array(),
            "steps" => true
        );

        if (isset($_GET["mode"])) {
            $viewData["mode"] = $_GET["mode"];
        } else $this->nope();
        if (isset($_GET["idlibros"])) $viewData["idlibros"] = $_GET["idlibros"];
        else if ($viewData["mode"] !== "INS") $this->nope();

        if (isset($viewData["mode"])) {
            $viewData["autor"] = \Dao\Mnt\LibroAutores::obtenerAutoresPorLibro($viewData["idlibros"]);
            $viewData["noAutor"] = \Dao\Mnt\LibroAutores::obtenerNoAutorPorLibro($viewData["idlibros"]);
            $viewData["idAutor"] = (isset($_GET["idautor"])) ? $_GET["idautor"] : "";
            switch ($viewData["mode"]) {
                case "INS":
                    // dd($viewData);
                    if (\Dao\Mnt\LibroAutores::crearLibroConAutor(
                        $viewData["idlibros"],
                        $viewData["idAutor"]
                    )) $this->yeah($viewData["idlibros"]);
                    break;
                case "DEL":
                    if (\Dao\Mnt\LibroAutores::eliminarLibroConAutor($viewData["idAutor"])) $this->yeah($viewData["idlibros"]);
                    break;
            }
        }
        Renderer::render("mnt/libroautor", $viewData);
    }
}
