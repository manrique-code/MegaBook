<?php

namespace Dao\Mnt;

use Dao\Table;

class LibroDetalle extends Table
{
    public static function obtenerTodoLibroDetalle()
    {
        $sqlStr = "SELECT
                    l.idlibros,
                    l.nombreLibro,
                    l.coverart,
                    ld.*
                    FROM libros l
                    INNER JOIN libro_detalle ld
                    on l.idlibros = ld.idlibro
                    ORDER BY l.nombreLibro;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerLibroDetalle()
    {
        $sqlStr = "SELECT
                    l.idlibro,
                    l.nombreLibro,
                    l.coverart,
                    ld.*
                  FROM libro_detalle";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerLibroDetallePorLibro($idlibros)
    {
        $sqlStr = "SELECT
                    l.idlibros,
                    l.nombreLibro,
                    l.coverart,
                    ld.stock,
                    ld.precio,
                    ld.`desc`,
                    TO_DAYS(ld.descexp) - TO_DAYS(NOW()) as descexp
                    FROM libros l
                    INNER JOIN libro_detalle ld
                    on l.idlibros = ld.idlibro
                    WHERE l.idlibros = :idlibros;";
        return self::obtenerUnRegistro($sqlStr, array(
            "idlibros" => $idlibros
        ));
    }

    public static function crearDetalleLibro(
        $idlibros,
        $stock,
        $desc,
        $descexp,
        $precio
    ) {
        $sqlStr = "INSERT INTO libro_detalle(
                        idlibro,
                        stock,
                        `desc`,
                        descexp,
                        precio
                    ) VALUES (
                        :idlibros,
                        :stock,
                        :desc,
                        (SELECT DATE_ADD(NOW(), INTERVAL :descexp DAY)),
                        :precio
                    );";
        $params = array(
            "idlibros" => $idlibros,
            "stock" => $stock,
            "desc" => $desc,
            "descexp" => $descexp,
            "precio" => $precio
        );
        return self::executeNonQuery($sqlStr, $params);
    }

    public static function actualizarLibroDetalle(
        $idlibros,
        $stock,
        $desc,
        $descexp,
        $precio
    ) {
        $sqlStr = "UPDATE libro_detalle
                    SET stock = :stock,
                        `desc` = :desc,
                        descexp = :descexp,
                        precio = :precio
                    WHERE idlibro = :idlibro;";
        $params = array(
            "idlibros" => $idlibros,
            "stock" => $stock,
            "desc" => $descexp,
            "precio" => $precio
        );
        return self::executeNonQuery($sqlStr, $params);
    }

    public static function eliminarLibroDetalle($idlibros)
    {
        $sqlStr = "DELETE FROM libro_detalle WHERE idlibros = :idlibros";
        return self::executeNonQuery($sqlStr, array("idlibros" => $idlibros));
    }
}
