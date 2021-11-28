<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;
use Controllers\PublicController;
use Views\Renderer;


class Usuarios extends PrivateController
{
    public function run() :void 
    {
        $viewData = array();
        $viewData["items"] = \Dao\Mnt\Usuarios::obtenerUsuarios();
        $viewData["new_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Usuarios\New");
        $viewData["edit_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Usuarios\Edit");
        $viewData["delete_enabled"] = self::isFeatureAutorized("Controllers\Mnt\Usuarios\Delete");
        Renderer::render("mnt/usuarios", $viewData);
    }
}