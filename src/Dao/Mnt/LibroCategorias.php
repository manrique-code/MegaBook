<?php

namespace Dao\Mnt;

use Dao\Table;

class LibroCategorias extends Table
{
    public static function obtenerTodoCategorias()
    {
        $sqlStr = "SELECT * FROM Categorias";
        return self::obtenerRegistros($sqlStr, array());
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
                    ORDER BY c.categoriaDes;";
        return self::obtenerRegistros($sqlStr, array("idlibros" => $idlibros));
    }
}
