<?php
namespace Dao\Mnt;

use Dao\Table;

class Perfil extends Table{
    public static function obtenerPerfiles($usercod)
    {
        $sqlStr = "SELECT * from usuario Where usercod = :usercod;";
        return self::obtenerUnRegistro($sqlStr, array("usercod" => $usercod));

    }
}