<?php

class Mesa
{

    private $idMesa;
    private $numero;
    private $estado;
    private $tabla;

    /**
     * @param $idMesa
     * @param $numero
     * @param $estado
     */
    public function __construct($idMesa="", $numero="", $estado="")
    {
        $this->idMesa = $idMesa;
        $this->numero = $numero;
        $this->estado = $estado;
        $this->tabla = "mesas";
    }

    /**
     * @return mixed|string
     */
    public function getIdMesa()
    {
        return $this->idMesa;
    }

    /**
     * @param mixed|string $idMesa
     */
    public function setIdMesa($idMesa)
    {
        $this->idMesa = $idMesa;
    }

    /**
     * @return mixed|string
     */
    public function getNumero()
    {
        return $this->numero;
    }

    /**
     * @param mixed|string $numero
     */
    public function setNumero($numero)
    {
        $this->numero = $numero;
    }

    /**
     * @return mixed|string
     */
    public function getEstado()
    {
        return $this->estado;
    }

    /**
     * @param mixed|string $estado
     */
    public function setEstado($estado)
    {
        $this->estado = $estado;
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
     * @param $idMesa
     * @param $numero
     * @param $estado
     */
    public function llenarMesa($idMesa, $numero, $estado)
    {
        $this->idMesa = $idMesa;
        $this->numero = $numero;
        $this->estado = $estado;
    }

    /**
     * @param $idMesa
     *
     * Metodo que empleo para obtener una linea de factura en concreto, por su id
     */
    public function obtenerPorIdLineaFactura($idMesa)
    {

        $sql = "SELECT idMesa, numero, estado FROM " . $this->tabla . " WHERE idMesa = " . $idMesa;
        $conexion = new BD();
        $res = $conexion->consulta($sql);
        list($idMesa, $numero, $estado) = mysqli_fetch_array($res);
        $this->llenarLineaFactura($idMesa, $numero, $estado);

    }




}