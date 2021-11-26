<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class Libros extends PrivateController
{
    public function run(): void
    {
        $viewData = array();
        // dd(\Dao\Mnt\Libros::obtenerTodoLibros());
        $viewData["items"] = \Dao\Mnt\Libros::obtenerLibros();
        // Verificamos si el usuario está autorizado para utilizar las funciones.
        $viewData["new_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Libros\New");
        $viewData["edit_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Libros\Edit");
        $viewData["delete_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Libros\Delete");

        Renderer::render("mnt/libros", $viewData);
    }
}
