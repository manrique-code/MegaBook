<?php
namespace Dao\Mnt;

use Dao\Table;

class Carrito extends Table{
    public static function obtenerDatosCarrito()
    {
        $sqlStr = "SELECT c.idcarrito, c.idlibro, l.nombreLibro, l.coverart, ld.precio, c.cantidad, (ld.precio*c.cantidad)subtotal, ((ld.precio*c.cantidad)*0.15)impuesto  from carrito C JOIN libros l on c.idlibro=l.idlibros join  libro_detalle ld on l.idlibros = ld.idlibro;";
        return self::obtenerRegistros($sqlStr, array());
    }

    public static function obtenerTotalFact(){
        $sqlSTR= "SELECT sum(subtotal)subtotal, sum(impuesto)impuesto, (sum(subtotal)+sum(impuesto))total from
        (select c.idcarrito, c.idlibro, l.nombreLibro, l.coverart, ld.precio, c.cantidad,(ld.precio*c.cantidad)subtotal, ((ld.precio*c.cantidad)*0.15)impuesto  from carrito C JOIN libros l on c.idlibro=l.idlibros 
        join  libro_detalle ld on l.idlibros = ld.idlibro)carrito";
            
            return self::obtenerRegistros($sqlSTR,array());
    }

    public static function EliminarArticuloCarrito($idcarrito)
    {
        //dd($idlibro);
        $sqlStr = "DELETE from carrito where idcarrito =:idcarrito;";
        return self::executeNonQuery($sqlStr, array(
            "idcarrito" => $idcarrito
        ));
    }

    public static function InsertarDatosCarrito($idlibro, $cantidad){
        $sqlStr ="INSERT INTO `megabook`.`carrito` (`idlibro`, `cantidad`) VALUES (:idlibro, :cantidad);";
        $parametros = array(
            "idlibro" => $idlibro,
            "cantidad" => $cantidad
        );
        return self::executeNonQuery($sqlStr, $parametros);
    }

}