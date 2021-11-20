<?php

namespace Dao\Mnt;

use Dao\Table;

class Autores extends Table
{
    public static function obtenerAutores()
    {
        $sqlStr = "SELECT * from autores";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerAutor($idAutor)
    {
        $sqlStr = "SELECT * from autores WHERE idAutor = :idAutor;";
        return self::obtenerUnRegistro($sqlStr, array("idAutor" => $idAutor));
    }

    public static function insertarAutor(
        $nombreAutor,
        $apellidoAutor,
        $genero
    ) {
        $sqlStr = "INSERT INTO autores(nombreAutor, apellidoAutor, genero) VALUE(:nombreAutor, :apellidoAutor, :genero);";
        $parametros = array(
            "nombreAutor" => $nombreAutor,
            "apellidoAutor" => $apellidoAutor,
            "genero" => $genero
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function actualizarAutor(
        $idAutor,
        $nombreAutor,
        $apellidoAutor,
        $genero
    ) {
        $sqlStr = "UPDATE autores SET nombreAutor = :nombreAutor, apellidoAutor = :apellidoAutor, genero = :genero WHERE idAutor = :idAutor";
        $parametros = array(
            "idAutor" => $idAutor,
            "nombreAutor" => $nombreAutor,
            "apellidoAutor" => $apellidoAutor,
            "genero" => $genero
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }


    public static function eliminarAutor($idAutor)
    {
        $sqlStr = "DELETE FROM autores WHERE  idAutor=:idAutor;";
        return self::executeNonQuery($sqlStr, array(
            "idAutor" => $idAutor
        ));
    }
}
