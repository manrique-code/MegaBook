<?php

namespace Dao\Mnt;

use Dao\Table;

class Libros extends Table
{
    // Obtenemos todos los libros con sus categorias y autores.
    public static function obtenerTodoLibros()
    {
        $sqlStr = "SELECT l.idlibros,
                            l.nombreLibro,
                            CONCAT(a.nombreAutor, a.apellidoAutor) as nombreAutor,
                            GROUP_CONCAT(c.categoriaDes SEPARATOR ', ') as categorias
                    FROM libros l
                    INNER JOIN libros_autores la
                    ON l.idlibros = la.idlibros
                    INNER JOIN autores a
                    on la.idAutor = a.idAutor
                    INNER JOIN libros_categorias lc
                    ON l.idlibros = lc.idlibros
                    INNER JOIN categorias c
                    on lc.idCategoria = c.idCategorias
                    ORDER BY l.idlibros;";
        return self::obtenerRegistros($sqlStr, array());
    }
    // Obtener todos los libros que están en el inventario.
    public static function obtenerLibros()
    {
        $sqlStr = "SELECT * FROM libros;";
        return self::obtenerRegistros($sqlStr, array());
    }

    // Obtenemos un libro por id.
    public static function obtenerLibro($idlibros)
    {
        $sqlStr = "SELECT * FROM libros WHERE idlibros = :idlibros;";
        return self::obtenerUnRegistro($sqlStr, array(
            "idlibros" => $idlibros
        ));
    }

    // Creamos un libro en la base de datos.
    public static function crearLibro(
        $idlibros,
        $nombreLibro,
        $descripcion
    ) {
        $sqlStr = "INSERT INTO libros(idlibros, nombreLibro, descripcion) VALUES(:idlibros,:nombreLibro, :descripcion);";
        return self::executeNonQuery($sqlStr, array(
            "idlibros" => $idlibros,
            "nombreLibro" => $nombreLibro,
            "descripcion" => $descripcion
        ));
    }

    // Editamos un libro de la base de datos.
    public static function editarLibro(
        $nombreLibro,
        $descripcion,
        $idlibros
    ) {
        $sqlStr = "UPDATE libros SET nombreLibro = :nombreLibro, descripcion = :descripcion WHERE idlibros = :idlibros;";
        return self::executeNonQuery($sqlStr, array(
            "nombreLibro" => $nombreLibro,
            "descripcion" => $descripcion,
            "idlibros" => $idlibros
        ));
    }

    // Eliminamos un libro.
    public static function eliminarLibro(
        $idlibros
    ) {
        $sqlStr = "DELETE FROM libros WHERE idlibros = :idlibros;";
        return self::executeNonQuery($sqlStr, array(
            "idlibros" => $idlibros
        ));
    }
}
