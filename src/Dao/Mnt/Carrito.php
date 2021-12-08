<?php
namespace Dao\Mnt;

use Dao\Table;

class Carrito extends Table{
    public static function obtenerDatosCarrito($usercod)
    {
        $sqlStr = "SELECT u.usercod, u.username, tmpf.factnum, tmpf.fechafact, tmpfd.idlibro, l.nombrelibro,l.coverart,tmpfd.cantidad,ld.precio, (tmpfd.cantidad*ld.precio)subtotal, ((tmpfd.cantidad*ld.precio)*0.15)impuestos,((tmpfd.cantidad*ld.precio)*1.15)total   from usuario u join tmpfactura tmpf on u.usercod = tmpf.usercod join tmpfacturadetalle tmpfd on tmpf.idtmpfactura=tmpfd.idtmpfactur 
        join libros l on tmpfd.idlibro = l.idlibros join libro_detalle ld on l.idlibros=ld.idlibro where u.usercod=:usercod";
        return self::obtenerRegistros($sqlStr, array("usercod"=>$usercod));
    }

    public static function obtenerTotalFact($usercod){
        $sqlSTR= "SELECT sum(subtotal)subtotal, sum(impuestos)impuesto, (sum(subtotal)+sum(impuestos))total from(
            select u.usercod, u.username, tmpf.factnum, tmpf.fechafact, tmpfd.idlibro, l.nombrelibro,l.coverart,tmpfd.cantidad,ld.precio, (tmpfd.cantidad*ld.precio)subtotal, ((tmpfd.cantidad*ld.precio)*0.15)impuestos,((tmpfd.cantidad*ld.precio)*1.15)total   from usuario u join tmpfactura tmpf on u.usercod = tmpf.usercod join tmpfacturadetalle tmpfd on tmpf.idtmpfactura=tmpfd.idtmpfactur 
            join libros l on tmpfd.idlibro = l.idlibros join libro_detalle ld on l.idlibros=ld.idlibro where u.usercod=:usercod)factura";
            
            return self::obtenerRegistros($sqlSTR,array("usercod"=>$usercod));
    }

    public static function EliminarArticuloCarrito($idlibro)
    {
        //dd($idlibro);
        $sqlStr = "DELETE from tmpfacturadetalle where idlibro =:idlibro";
        return self::executeNonQuery($sqlStr, array(
            "idlibro" => $idlibro
        ));
    }

}