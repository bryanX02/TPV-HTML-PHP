<?php

class Producto
{

    private $idProducto;
    private $tipo;
    private $nombre;
    private $referencia;
    private $descripcion;
    private $stock;
    private $precio;
    private $iva;
    private $imagen;
    private $tabla;

    /**
     * @param $idProducto
     * @param $tipo
     * @param $nombre
     * @param $referencia
     * @param $descripcion
     * @param $stock
     * @param $precio
     * @param $iva
     * @param $imagen
     */
    public function __construct($idProducto, $tipo, $nombre, $referencia, $descripcion, $stock, $precio, $iva, $imagen)
    {
        $this->idProducto = $idProducto;
        $this->tipo = $tipo;
        $this->nombre = $nombre;
        $this->referencia = $referencia;
        $this->descripcion = $descripcion;
        $this->stock = $stock;
        $this->precio = $precio;
        $this->iva = $iva;
        $this->imagen = $imagen;
        $this->tabla = "productos";
    }

    /**
     * @return mixed
     */
    public function getIdProducto()
    {
        return $this->idProducto;
    }

    /**
     * @param mixed $idProducto
     */
    public function setIdProducto($idProducto)
    {
        $this->idProducto = $idProducto;
    }

    /**
     * @return mixed
     */
    public function getTipo()
    {
        return $this->tipo;
    }

    /**
     * @param mixed $tipo
     */
    public function setTipo($tipo)
    {
        $this->tipo = $tipo;
    }

    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @return mixed
     */
    public function getReferencia()
    {
        return $this->referencia;
    }

    /**
     * @param mixed $referencia
     */
    public function setReferencia($referencia)
    {
        $this->referencia = $referencia;
    }

    /**
     * @return mixed
     */
    public function getDescripcion()
    {
        return $this->descripcion;
    }

    /**
     * @param mixed $descripcion
     */
    public function setDescripcion($descripcion)
    {
        $this->descripcion = $descripcion;
    }

    /**
     * @return mixed
     */
    public function getStock()
    {
        return $this->stock;
    }

    /**
     * @param mixed $stock
     */
    public function setStock($stock)
    {
        $this->stock = $stock;
    }

    /**
     * @return mixed
     */
    public function getPrecio()
    {
        return $this->precio;
    }

    /**
     * @param mixed $precio
     */
    public function setPrecio($precio)
    {
        $this->precio = $precio;
    }

    /**
     * @return mixed
     */
    public function getIva()
    {
        return $this->iva;
    }

    /**
     * @param mixed $iva
     */
    public function setIva($iva)
    {
        $this->iva = $iva;
    }

    /**
     * @return mixed
     */
    public function getImagen()
    {
        return $this->imagen;
    }

    /**
     * @param mixed $imagen
     */
    public function setImagen($imagen)
    {
        $this->imagen = $imagen;
    }

    /**
     * @return string
     */
    public function getTabla()
    {
        return $this->tabla;
    }

    /**
     * @param string $tabla
     */
    public function setTabla($tabla)
    {
        $this->tabla = $tabla;
    }



    /**
     * @param $idProducto
     * @param $tipo
     * @param $nombre
     * @param $referencia
     * @param $descripcion
     * @param $stock
     * @param $precio
     * @param $iva
     * @param $imagen
     */
    public function llenarProducto($idProducto="", $tipo="", $nombre="", $referencia="", $descripcion="", $stock="", $precio="", $iva="", $imagen="")
    {
        $this->idProducto = $idProducto;
        $this->tipo = $tipo;
        $this->nombre = $nombre;
        $this->referencia = $referencia;
        $this->descripcion = $descripcion;
        $this->stock = $stock;
        $this->precio = $precio;
        $this->iva = $iva;
        $this->imagen = $imagen;
    }

}