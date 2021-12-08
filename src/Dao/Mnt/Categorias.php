<?php

namespace Dao\Mnt;

use Dao\Table;

class Categorias extends Table
{
    public static function obtenerCategorias($orden = null)
    {
        $sqlStr = "";
        switch ($orden) {
            case "alf":
                $sqlStr = "SELECT * FROM categorias ORDER BY categoriaDes";
                break;
            default:
                $sqlStr = "SELECT * FROM categorias";
                break;
        }
        return self::obtenerRegistros($sqlStr, array());
    }
    public static function obtenerCategoria($idCategorias)
    {
        $sqlStr = "SELECT * from categorias where idCategorias = :idCategorias;";
        return self::obtenerUnRegistro($sqlStr, array("idCategorias" => intval($idCategorias)));
    }
    public static function crearCategoria($categoriaDes)
    {
        $sqlstr = "INSERT INTO categorias (categoriaDes) values (:categoriaDes);";
        $parametros = array(
            "categoriaDes" => $categoriaDes
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }

    public static function editarCategoria($categoriaDes, $idCategorias)
    {
        $sqlstr = "UPDATE categorias set categoriaDes=:categoriaDes where idCategorias = :idCategorias;";
        $parametros = array(
            "categoriaDes" =>  $categoriaDes,
            "idCategorias" => intval($idCategorias)
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }

    public static function eliminarCategoria($idCategorias)
    {
        $sqlstr = "DELETE FROM categorias where idCategorias=:idCategorias;";
        $parametros = array(
            "idCategorias" => intval($idCategorias)
        );
        return self::executeNonQuery($sqlstr, $parametros);
    }
}
