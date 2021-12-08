<?php

namespace Dao\Mnt;

use Dao\Table;

class LibrosCategorias extends Table
{
      
    public static function obtenerLibrosCategorias()
    {
        $sqlStr = " SELECT a.idCategoria,a.idLibros
        FROM categorias b
        INNER JOIN libros_categorias a
        ON b.idCategorias = a.idCategoria
        INNER JOIN libros c
        ON a.idLibros = c.idLibros;";
        return self::obtenerRegistros($sqlStr, array());
    }


    public static function obtenerTodoLibrosCategoria()
    {
        $sqlStr = "SELECT a.idLibros,c.nombreLibro,b.CategoriaDes
        FROM categorias b
        INNER JOIN libros_categorias a
        ON b.idCategorias = a.idCategoria
        INNER JOIN libros c
        ON a.idLibros = c.idLibros;";
        return self::obtenerRegistros($sqlStr, array());
    }
    public static function obtenerLibroCategoria($idLibros)
    {
        $sqlStr = "SELECT a.idCategoria,a.idLibros
        FROM categorias b
        INNER JOIN libros_categorias a
        ON b.idCategorias = a.idCategoria
        INNER JOIN libros c
        ON a.idLibros = c.idLibros WHERE idLibros = :idLibros;";
      
        return self::obtenerUnRegistro($sqlStr, array(
            "idlibros" => $idLibros));
    }

    public static function obtenerNonFunciones($idCategorias)
    {
        $sqlStr = "SELECT idLibros, nombreLibro FROM Libros
        WHERE idLibros NOT IN
        (SELECT idLibros
        FROM libros a
        INNER JOIN libros_categorias b
        ON a.idLibros = b.idLibros
        INNER JOIN categorias c
        ON b.idCategoria = c.idCategorias
        WHERE c.idCategorias = :idCategorias);";
        return self::obtenerRegistros($sqlStr, array("idCategorias" => $idCategorias));
    }

    public static function InsertarLibroCategoria(
        $idCategoria,
        $idLibros
    ) {
        $sqlStr = "INSERT INTO libros_categorias(
                        idCategoria,
                        idLibros,
                     
                    ) values (
                        :idCategoria,
                        :idLibros,
                    );";
        return self::executeNonQuery($sqlStr, array(
            "idCategoria" => $idCategoria,
            "idLibros" => $idLibros
        ));
    }
    public static function actualizarLibroCategoria(
        $idCategoria,
        $idLibros,


    ) {
        $sqlStr = "UPDATE libros_categorias SET idCategoria = :idCategoria where  idLibros = :libros;";
        $parametros = array(
            "idCategoria" => $idCategoria,
            "idLibros" => $idLibros,

        );
        return self::executeNonQuery($sqlStr, $parametros);
    }

    public static function eliminarLibroCategoria($idCategoria,$idLibros)
    {
        $sqlStr = "DELETE FROM libros_categorias WHERE idCategoria = :idCategoria and idLibros = :idLibro";
        return self::executeNonQuery($sqlStr, array("idCategoria" => $idCategoria,"idLibros" => $idLibros ));
    }
}
