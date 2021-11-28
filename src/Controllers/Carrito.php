<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;


class Carrito extends PublicController
{
    public function run() :void 
    {
        $viewData = array();
        Renderer::render("principal/carrito", $viewData);
    }
}
