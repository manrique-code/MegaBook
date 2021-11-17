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
        $viewData["new_enabled"] = $this->isFeatureAutorized("mnt_usuarios_new");
        $viewData["edit_enabled"] = $this->isFeatureAutorized("mnt_usuarios_edit");
        $viewData["delete_enabled"] = $this->isFeatureAutorized("mnt_usuarios_delete");
        Renderer::render("mnt/usuarios", $viewData);
    }
}