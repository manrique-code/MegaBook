<?php

namespace Dao\Mnt;

use Dao\Table;

class LibroAutores extends Table
{
    public static function obtenerTodoAutores()
    {
        $sqlStr = "SELECT idAutor, CONCAT(nombreAutor, ' ', apellidoAutor) as nombreAutor FROM autores;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerAutoresPorLibro($idlibros)
    {
        $sqlStr = "SELECT
                    l.idlibros,
                    l.nombreLibro,
                    a.idAutor,
                    CONCAT(a.nombreAutor, ' ', a.apellidoAutor) AS nombreAutor
                    FROM libros l
                    INNER JOIN libros_autores la
                    ON l.idlibros = la.idlibros
                    INNER JOIN autores a
                    ON la.idAutor = a.idAutor
                    WHERE l.idlibros = :idlibros
                    ORDER BY nombreAutor;";
        return self::obtenerRegistros($sqlStr, array("idlibros" => $idlibros));
    }

    // Función para obtener los autores que no son realizadores de un libro en específico.
    public static function obtenerNoAutorPorLibro($idlibros)
    {
        $sqlStr = "SELECT
                    idAutor,
                    CONCAT(nombreAutor, ' ', apellidoAutor) as nombreAutor
                    FROM autores
                    WHERE idAutor NOT IN
                    (SELECT a.idAutor
                    FROM libros l
                    INNER JOIN libros_autores la
                    ON l.idlibros = la.idlibros
                    INNER JOIN autores a
                    on la.idAutor = a.idAutor
                    WHERE l.idlibros = :idlibros)
                    ORDER BY nombreAutor;";
        return self::obtenerRegistros($sqlStr, array(
            "idlibros" => $idlibros
        ));
    }

    public static function crearLibroConAutor($idlibros, $idAutor)
    {
        $sqlStr = "INSERT INTO libros_autores(idlibros, idAutor) VALUES(:idlibros, :idAutor);";
        $datos = array(
            "idlibros" => $idlibros,
            "idAutor" => $idAutor
        );
        return self::executeNonQuery($sqlStr, $datos);
    }

    public static function eliminarLibroConAutor($idAutor)
    {
        $sqlStr = "DELETE FROM libros_autores WHERE idAutor = :idAutor";
        return self::executeNonQuery($sqlStr, array("idAutor" => $idAutor));
    }
}
