<?php

class Factura
{

    private $idFactura;
    private $numeroFactura;
    private $empleado;
    private $fecha;
    private $numeroMesa;
    private $tabla;

    /**
     * @param $idFactura
     * @param $numeroFactura
     * @param $empleado
     * @param $fecha
     * @param $numeroMesa
     */
    public function __construct($idFactura="", $numeroFactura="", $empleado="", $fecha="", $numeroMesa="")
    {
        $this->idFactura = $idFactura;
        $this->numeroFactura = $numeroFactura;
        $this->empleado = $empleado;
        $this->fecha = $fecha;
        $this->numeroMesa = $numeroMesa;
        $this->tabla = "Facturas";

    }

    /**
     * @return mixed
     */
    public function getIdFactura()
    {
        return $this->idFactura;
    }

    /**
     * @param mixed $idFactura
     */
    public function setIdFactura($idFactura)
    {
        $this->idFactura = $idFactura;
    }

    /**
     * @return mixed
     */
    public function getNumeroFactura()
    {
        return $this->numeroFactura;
    }

    /**
     * @param mixed $numeroFactura
     */
    public function setNumeroFactura($numeroFactura)
    {
        $this->numeroFactura = $numeroFactura;
    }

    /**
     * @return mixed
     */
    public function getEmpleado()
    {
        return $this->empleado;
    }

    /**
     * @param mixed $empleado
     */
    public function setEmpleado($empleado)
    {
        $this->empleado = $empleado;
    }

    /**
     * @return mixed
     */
    public function getFecha()
    {
        return $this->fecha;
    }

    /**
     * @param mixed $fecha
     */
    public function setFecha($fecha)
    {
        $this->fecha = $fecha;
    }

    /**
     * @return mixed
     */
    public function getNumeroMesa()
    {
        return $this->numeroMesa;
    }

    /**
     * @param mixed $numeroMesa
     */
    public function setNumeroMesa($numeroMesa)
    {
        $this->numeroMesa = $numeroMesa;
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
     * @param $idFactura
     * @param $numeroFactura
     * @param $empleado
     * @param $fecha
     * @param $numeroMesa
     */
    public function llenarFactura($idFactura, $numeroFactura, $empleado, $fecha, $numeroMesa)
    {
        $this->idFactura = $idFactura;
        $this->numeroFactura = $numeroFactura;
        $this->empleado = $empleado;
        $this->fecha = $fecha;
        $this->numeroMesa = $numeroMesa;
        $this->tabla = "Facturas";

    }

    /**
     * @param $idFactura
     *
     * Metodo que empleo para obtener una factura en concreto, por su id
     */
    public function obtenerPorIdFactura($idFactura)
    {

        $sql = "SELECT * FROM " . $this->tabla . " WHERE idFactura = " . $idFactura;
        $conexion = new BD();
        $res = $conexion->consulta($sql);
        list($idFactura, $numeroFactura, $empleado, $fecha, $numeroMesa) = mysqli_fetch_array($res);
        $this->llenarFactura($idFactura, $numeroFactura, $empleado, $fecha, $numeroMesa);

    }




}