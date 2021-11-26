<?php
namespace Controllers\Mnt;

use Controllers\PrivateController;
use Controllers\publicController;
use Views\Renderer;

Class Autores extends publicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["items"] = \Dao\Mnt\Autores::obtenerAutores();
        $viewData["new_enabled"] = true;
        $viewData["edit_enabled"] = true;
        $viewData["delete_enabled"] = true;
        Renderer::render("mnt/autores",$viewData);
    }
}
