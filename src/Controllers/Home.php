<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;

class Home extends PublicController
{
    public function run(): void
    {
        $viewData = array(
            "libros" => array(),
            "categorias" => array(),
            "login" => array(),
            "userName" => "",
            "hasLibros" => false
        );
        $viewData["libros"] = \Dao\Mnt\Libros::obtenerTodoLibros();
        $viewData["categorias"] = \Dao\Mnt\Categorias::obtenerCategorias("alf");
        $viewData["login"] = $_SESSION["login"];
        $viewData["userName"] = $viewData["login"]["userName"];
        // dd($_SESSION["login"]);
        if (sizeof($viewData["libros"]) > 0) $viewData["hasLibros"] = true;
        // dd($viewData);
        Renderer::render("home/home", $viewData);
    }
}
