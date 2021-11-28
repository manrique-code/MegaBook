<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;


class Categorias extends PrivateController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["items"] = \Dao\Mnt\Categorias::obtenerCategorias();
        $viewData["new_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Categorias\New");
        $viewData["edit_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Categorias\Edit");
        $viewData["delete_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Categorias\Delete");
        Renderer::render("mnt/categorias", $viewData);
    }
}
