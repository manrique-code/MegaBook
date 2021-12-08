<?php

namespace Dao\Mnt;

use Dao\Table;

class LibroCategorias extends Table
{
    public static function obtenerTodoCategorias($idlibros)
    {
        $sqlStr = "SELECT
                    idCategorias,
                    categoriaDes
                    FROM categorias
                    WHERE idCategorias NOT IN (SELECT
                    c.idCategorias
                    FROM libros l
                    INNER JOIN libros_categorias lc
                    ON l.idlibros = lc.idlibros
                    INNER JOIN categorias c
                    ON lc.idCategoria = c.idCategorias
                    WHERE l.idlibros = :idlibros)
                    ORDER BY categoriaDes;";
        return self::obtenerRegistros($sqlStr, array("idlibros" => $idlibros));
    }

    public static function obtenerCategoriaPorLibro($idlibros)
    {
        $sqlStr = "SELECT
                    c.idCategorias,
                    c.categoriaDes
                    FROM libros l
                    INNER JOIN libros_categorias lc
                    ON l.idlibros = lc.idlibros
                    INNER JOIN categorias c
                    ON lc.idCategoria = c.idCategorias
                    WHERE l.idlibros = :idlibros
                    ORDER BY c.idCategorias;";
        return self::obtenerRegistros($sqlStr, array("idlibros" => $idlibros));
    }

    public static function crearLibroCategoria(
        $idlibros,
        $idCategoria
    ) {
        $sqlStr = "INSERT INTO libros_categorias(idlibros, idCategoria)
                    VALUES(:idlibros, :idCategoria)";
        $params = array(
            "idlibros" => $idlibros,
            "idCategoria" => $idCategoria
        );
        return self::executeNonQuery($sqlStr, $params);
    }

    public static function eliminarLibroCategoria($idCategoria)
    {
        $sqlStr = "DELETE FROM libros_categorias WHERE idCategoria = :idCategoria";
        return self::executeNonQuery($sqlStr, array("idCategoria" => $idCategoria));
    }
}
