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
            "hasLibros" => false
        );
        $viewData["libros"] = \Dao\Mnt\Libros::obtenerTodoLibros();
        if (sizeof($viewData["libros"]) > 0) $viewData["hasLibros"] = true;
        // dd($viewData);
        Renderer::render("home/home", $viewData);
    }
}
