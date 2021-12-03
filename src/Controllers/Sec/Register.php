<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use \Utilities\Validators;
use Exception;
use PhpParser\Node\Expr\BinaryOp\Equal;

class Register extends PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $txtPswd2 = "";
    private $txtNombre = "";
    private $txtFecha = "";

    private $errorEmail ="";
    private $errorNombre ="";
    private $errorPswd = "";
    private $errorConfirmacion = "";
    private $errorFecha="";
    private $hasErrors = false;
    public function run() :void
    {

        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];
            $this->txtPswd2 = $_POST["txtPswd2"];
            $this->txtFecha = $_POST["txtFecha"];
            $this->txtNombre = $_POST["txtNombre"];

            //validaciones
            if (!(Validators::IsValidEmail($this->txtEmail))) {
                $this->errorEmail = "El correo no tiene el formato adecuado";
                $this->hasErrors = true;
            }
            if (!Validators::IsValidPassword($this->txtPswd)) {
                $this->errorPswd = "1) La contraseña debe tener al menos 8 caracteres una mayúscula, un número y un caracter especial.";
                $this->hasErrors = true;
            }

            if(!Validators::ISPasswordEqual($this->txtPswd,$this->txtPswd2)){
                $this->errorConfirmacion = "2) La contraseña debe ser igual";
                $this->hasErrors = true;
            }

            if(Validators::IsEmpty($this->txtNombre)){
                $this->errorNombre = "El nombre no puede estar vacio";
                $this->hasErrors = true;
            }
            if(Validators::IsEmpty($this->txtFecha)){
                $this->errorFecha = "Coloque su Fecha de Nacimiento";
                $this->hasErrors = true;
            }

            
            if (!$this->hasErrors) {
                try{
                    if (\Dao\Security\Security::newUsuario($this->txtEmail, $this->txtPswd,$this->txtFecha,$this->txtNombre)) {
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "¡Usuario Registrado Satisfactoriamente!");
                    }
                } catch (Error $ex){
                    die($ex);
                }
            }
        }
        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/sigin", $viewData);
    }
}
?>
