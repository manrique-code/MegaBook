<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;

class LibrosDetalles extends PrivateController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["items"] = \Dao\Mnt\LibroDetalle::obtenerTodoLibroDetalle();
        $viewData["new_enabled"] = self::isFeatureAutorized("Controllers\Mnt\LibrosDetalles\New");
        $viewData["edit_enabled"] = self::isFeatureAutorized("Controllers\Mnt\LibrosDetalles\Edit");
        $viewData["delete_enabled"] = self::isFeatureAutorized("Controllers\Mnt\LibrosDetalles\Delete");

        Renderer::render("mnt/librosdetalles", $viewData);
    }
}
