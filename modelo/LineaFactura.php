<?php

class LineaFactura
{

    private $idLineaFactura;
    private $fnumeroFactura;
    private $nombreProducto;
    private $refenciaProducto;
    private $precioProducto;
    private $ivaProducto;
    private $tabla;

    /**
     * @param $idLineaFactura
     * @param $fnumeroFactura
     * @param $nombreProducto
     * @param $refenciaProducto
     * @param $precioProducto
     * @param $ivaProducto
     */
    public function __construct($idLineaFactura="", $fnumeroFactura="", $nombreProducto="", $refenciaProducto="", $precioProducto="", $ivaProducto="")
    {
        $this->idLineaFactura = $idLineaFactura;
        $this->fnumeroFactura = $fnumeroFactura;
        $this->nombreProducto = $nombreProducto;
        $this->refenciaProducto = $refenciaProducto;
        $this->precioProducto = $precioProducto;
        $this->ivaProducto = $ivaProducto;
        $this->tabla = "lineasfacturas";
    }

    /**
     * @return mixed
     */
    public function getIdLineaFactura()
    {
        return $this->idLineaFactura;
    }

    /**
     * @param mixed $idLineaFactura
     */
    public function setIdLineaFactura($idLineaFactura)
    {
        $this->idLineaFactura = $idLineaFactura;
    }

    /**
     * @return mixed
     */
    public function getFnumeroFactura()
    {
        return $this->fnumeroFactura;
    }

    /**
     * @param mixed $fnumeroFactura
     */
    public function setFnumeroFactura($fnumeroFactura)
    {
        $this->fnumeroFactura = $fnumeroFactura;
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
    public function getRefenciaProducto()
    {
        return $this->refenciaProducto;
    }

    /**
     * @param mixed $refenciaProducto
     */
    public function setRefenciaProducto($refenciaProducto)
    {
        $this->refenciaProducto = $refenciaProducto;
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
     * @param $idLineaFactura
     * @param $fnumeroFactura
     * @param $nombreProducto
     * @param $refenciaProducto
     * @param $precioProducto
     * @param $ivaProducto
     */
    public function llenarLineaFactura($idLineaFactura, $fnumeroFactura, $nombreProducto, $refenciaProducto, $precioProducto, $ivaProducto)
    {
        $this->idLineaFactura = $idLineaFactura;
        $this->fnumeroFactura = $fnumeroFactura;
        $this->nombreProducto = $nombreProducto;
        $this->refenciaProducto = $refenciaProducto;
        $this->precioProducto = $precioProducto;
        $this->ivaProducto = $ivaProducto;

    }

    /**
     * @param $idLineaFactura
     *
     * Metodo que empleo para obtener una linea de factura en concreto, por su id
     */
    public function obtenerPorIdLineaFactura($idLineaFactura)
    {

        $sql = "SELECT idLineaFactura, fnumeroFactura, nombreProducto, referenciaProducto, precioProducto, ivaProducto FROM " . $this->tabla . " WHERE idLineaFactura = " . $idLineaFactura;
        $conexion = new BD();
        $res = $conexion->consulta($sql);
        list($idLineaFactura, $fnumeroFactura, $nombreProducto, $referenciaProducto, $precioProducto, $ivaProducto) = mysqli_fetch_array($res);
        $this->llenarLineaFactura($idLineaFactura, $fnumeroFactura, $nombreProducto, $referenciaProducto, $precioProducto, $ivaProducto);

    }

}