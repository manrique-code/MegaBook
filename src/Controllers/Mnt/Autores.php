<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Controllers\publicController;
use Views\Renderer;

Class Autores extends PrivateController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["items"] = \Dao\Mnt\Autores::obtenerAutores();
        $viewData["new_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Autores\New");
        $viewData["edit_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Autores\Edit");
        $viewData["delete_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Autores\Delete");
        Renderer::render("mnt/autores",$viewData);
    }
}
