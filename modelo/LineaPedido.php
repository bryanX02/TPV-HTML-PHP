<?php

class LineaPedido
{

    private $idLineaPedido;
    private $fidMesa;
    private $freferenciaProducto;
    private $tipoProducto;
    private $nombreProducto;
    private $descripcionProducto;
    private $precioProducto;
    private $ivaProducto;
    private $cantidadProducto;
    private $tabla;

    /**
     * @param $idLineaPedido
     * @param $fidMesa
     * @param $freferenciaProducto
     * @param $tipoProducto
     * @param $nombreProducto
     * @param $descripcionProducto
     * @param $precioProducto
     * @param $ivaProducto
     * @param $cantidadProducto
     */
    public function __construct($idLineaPedido="", $fidMesa="", $freferenciaProducto="", $tipoProducto="", $nombreProducto="", $descripcionProducto="", $precioProducto="", $ivaProducto="", $cantidadProducto="")
    {
        $this->idLineaPedido = $idLineaPedido;
        $this->fidMesa = $fidMesa;
        $this->freferenciaProducto = $freferenciaProducto;
        $this->tipoProducto = $tipoProducto;
        $this->nombreProducto = $nombreProducto;
        $this->descripcionProducto = $descripcionProducto;
        $this->precioProducto = $precioProducto;
        $this->ivaProducto = $ivaProducto;
        $this->cantidadProducto = $cantidadProducto;
        $this->tabla = "linaespedidos";
    }

    /**
     * @return mixed
     */
    public function getIdLineaPedido()
    {
        return $this->idLineaPedido;
    }

    /**
     * @param mixed $idLineaPedido
     */
    public function setIdLineaPedido($idLineaPedido)
    {
        $this->idLineaPedido = $idLineaPedido;
    }

    /**
     * @return mixed
     */
    public function getFidMesa()
    {
        return $this->fidMesa;
    }

    /**
     * @param mixed $fidMesa
     */
    public function setFidMesa($fidMesa)
    {
        $this->fidMesa = $fidMesa;
    }

    /**
     * @return mixed
     */
    public function getFreferenciaProducto()
    {
        return $this->freferenciaProducto;
    }

    /**
     * @param mixed $freferenciaProducto
     */
    public function setFreferenciaProducto($freferenciaProducto)
    {
        $this->freferenciaProducto = $freferenciaProducto;
    }

    /**
     * @return mixed
     */
    public function getTipoProducto()
    {
        return $this->tipoProducto;
    }

    /**
     * @param mixed $tipoProducto
     */
    public function setTipoProducto($tipoProducto)
    {
        $this->tipoProducto = $tipoProducto;
    }

    /**
     * @return mixed
     */
    public function getNombreProducto()
    {
        return $this->nombreProducto;
    }

    /**
     * @param mixed $nombreProducto
     */
    public function setNombreProducto($nombreProducto)
    {
        $this->nombreProducto = $nombreProducto;
    }

    /**
     * @return mixed
     */
    public function getDescripcionProducto()
    {
        return $this->descripcionProducto;
    }

    /**
     * @param mixed $descripcionProducto
     */
    public function setDescripcionProducto($descripcionProducto)
    {
        $this->descripcionProducto = $descripcionProducto;
    }

    /**
     * @return mixed
     */
    public function getPrecioProducto()
    {
        return $this->precioProducto;
    }

    /**
     * @param mixed $precioProducto
     */
    public function setPrecioProducto($precioProducto)
    {
        $this->precioProducto = $precioProducto;
    }

    /**
     * @return mixed
     */
    public function getIvaProducto()
    {
        return $this->ivaProducto;
    }

    /**
     * @param mixed $ivaProducto
     */
    public function setIvaProducto($ivaProducto)
    {
        $this->ivaProducto = $ivaProducto;
    }

    /**
     * @return mixed
     */
    public function getCantidadProducto()
    {
        return $this->cantidadProducto;
    }

    /**
     * @param mixed $cantidadProducto
     */
    public function setCantidadProducto($cantidadProducto)
    {
        $this->cantidadProducto = $cantidadProducto;
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
     * @param $idLineaPedido
     * @param $fidMesa
     * @param $freferenciaProducto
     * @param $tipoProducto
     * @param $nombreProducto
     * @param $descripcionProducto
     * @param $precioProducto
     * @param $ivaProducto
     * @param $cantidadProducto
     */
    public function llenarLineaPedido($idLineaPedido, $fidMesa, $freferenciaProducto, $tipoProducto, $nombreProducto, $descripcionProducto, $precioProducto, $ivaProducto, $cantidadProducto)
    {
        $this->idLineaPedido = $idLineaPedido;
        $this->fidMesa = $fidMesa;
        $this->freferenciaProducto = $freferenciaProducto;
        $this->tipoProducto = $tipoProducto;
        $this->nombreProducto = $nombreProducto;
        $this->descripcionProducto = $descripcionProducto;
        $this->precioProducto = $precioProducto;
        $this->ivaProducto = $ivaProducto;
        $this->cantidadProducto = $cantidadProducto;
    }




}