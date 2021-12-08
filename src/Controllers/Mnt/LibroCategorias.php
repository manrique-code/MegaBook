<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class LibroCategorias extends PrivateController
{
    private function nope()
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_libros",
            "Ocurrió algo inesperado. Intente nuevamente."
        );
    }

    private function yeah($idlibros)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_librocategorias&mode=DSP&idlibros=$idlibros",
            "¡Operación ejecutada satisfactoriamente!"
        );
    }

    private function nextStep($idlibros)
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=mnt_librodetalle&mode=INS&idlibros=$idlibros",
            "¡Operación realizada satisfactoriamente!"
        );
    }

    public function run(): void
    {
        $viewData = array(
            "mode" => "",
            "idlibros" => "",
            "nombreLibro" => "",
            "idcategoria" => "",
            "categoriades" => "",
            "categoria" => array(),
            "noCategoria" => array(),
            "steps" => true
        );

        if (isset($_GET["mode"])) {
            $viewData["mode"] = $_GET["mode"];
        } else $this->nope();
        if (isset($_GET["idlibros"])) $viewData["idlibros"] = $_GET["idlibros"];
        else if ($viewData["mode"] !== "INS") $this->nope();

        if (isset($viewData["mode"])) {
            $viewData["nombreLibro"] = \Dao\Mnt\Libros::obtenerLibro($viewData["idlibros"])["nombreLibro"];
            $viewData["noCategoria"] = \Dao\Mnt\LibroCategorias::obtenerTodoCategorias($viewData["idlibros"]);
            $viewData["categoria"] = \Dao\Mnt\LibroCategorias::obtenerCategoriaPorLibro($viewData["idlibros"]);
            $viewData["idcategoria"] = (isset($_GET["idcategoria"])) ? $_GET["idcategoria"] : "";
            switch ($viewData["mode"]) {
                case "INS":
                    if (\Dao\Mnt\LibroCategorias::crearLibroCategoria(
                        $viewData["idlibros"],
                        $viewData["idcategoria"]
                    ))  $this->yeah($viewData["idlibros"]);
                case "DEL":
                    if (\Dao\Mnt\LibroCategorias::eliminarLibroCategoria($viewData["idcategoria"])) $this->yeah($viewData["idlibros"]);
            }
        }
        Renderer::render("mnt/librocategorias", $viewData);
    }
}
