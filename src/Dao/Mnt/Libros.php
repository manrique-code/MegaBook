<?php

namespace Dao\Mnt;

use Dao\Table;

class Libros extends Table
{
    // Obtenemos todos los libros con sus categorias y autores.
    public static function obtenerTodoLibros()
    {
        $sqlStr = "SELECT
                    l.idlibros,
                    l.nombreLibro,
                    l.coverart,
                    ld.precio,
                    ld.`desc`,
                    ld.descexp,
                    a.idAutor,
                    CONCAT(a.nombreAutor, ' ', a.apellidoAutor) as nombreAutor
                    FROM libros l
                    INNER JOIN libro_detalle ld
                    ON l.idlibros = ld.idlibro
                    INNER JOIN libros_autores la
                    ON l.idlibros = la.idlibros
                    INNER JOIN autores a
                    ON la.idAutor = a.idAutor;";
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
        $descripcion,
        $coverart
    ) {
        $sqlStr = "INSERT INTO libros(idlibros, nombreLibro, descripcion, coverart) VALUES(:idlibros,:nombreLibro, :descripcion, :coverart);";
        return self::executeNonQuery($sqlStr, array(
            "idlibros" => $idlibros,
            "nombreLibro" => $nombreLibro,
            "descripcion" => $descripcion,
            "coverart" => $coverart
        ));
    }

    // Editamos un libro de la base de datos.
    public static function editarLibro(
        $nombreLibro,
        $descripcion,
        $coverart,
        $idlibros
    ) {
        $sqlStr = "UPDATE libros SET nombreLibro = :nombreLibro, descripcion = :descripcion, coverart = :coverart WHERE idlibros = :idlibros;";
        return self::executeNonQuery($sqlStr, array(
            "nombreLibro" => $nombreLibro,
            "descripcion" => $descripcion,
            "coverart" => $coverart,
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

    public static function obtenerCoverartLibro($idlibros)
    {
        $sqlStr = "SELECT coverart FROM libros WHERE idlibros = :idlibros";
        return self::obtenerUnRegistro($sqlStr, array("idlibros" => $idlibros));
    }

    public static function GUID()
    {
        $guid = sprintf('%04X%04X-%04X-%04X-%04X-%04X%04X%04X', mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(16384, 20479), mt_rand(32768, 49151), mt_rand(0, 65535), mt_rand(0, 65535), mt_rand(0, 65535));
        return substr($guid, 0, 64);
    }

    // Función que se encarga de subir el cover del libro.
    public static function subirImagen($imagen)
    {
        $serverPath = "c:/xampp/htdocs/MegaBook/";
        $coverPath = "public/imgs/coverarts/" . $imagen["name"];
        return (move_uploaded_file($imagen["tmp_name"], $serverPath . $coverPath)) ? $coverPath : false;
    }

    // Función que elimina el cover del libro.
    public static function eliminarImagen($idlibros)
    {
        $serverPath = "c:/xampp/htdocs/MegaBook/";
        $coverPath = self::obtenerCoverartLibro($idlibros)["coverart"];
        if ($coverPath) {
            $imagenPath = $serverPath . $coverPath;
            return (file_exists($imagenPath)) ? unlink($imagenPath) : false;
        }
        return true;
    }

    // Función que actualiza el cover del libro.
    public static function actualizarImagen($imagen, $idlibros)
    {
        $coverPath = self::obtenerCoverartLibro($idlibros)["coverart"];
        // dd(!is_null($coverPath));
        if ($coverPath) {
            $IMAGE_ON_DATABASE = substr($coverPath, 22);
            if ($imagen["name"] !== $IMAGE_ON_DATABASE) if (self::eliminarImagen($idlibros)) return self::subirImagen($imagen);
            return $coverPath;
        } else return self::subirImagen($imagen);
    }
}
