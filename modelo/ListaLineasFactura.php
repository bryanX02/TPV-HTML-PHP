<?php

class ListaLineasFactura
{

    private $lista;
    private $tabla;

    /**
     * @param $lista
     * @param $tabla
     */
    public function __construct($lista="", $tabla="")
    {
        $this->lista = array();
        $this->tabla = "lineasfacturas";
    }

    /**
     * @return array
     */
    public function getLista()
    {
        return $this->lista;
    }

    /**
     * @param array $lista
     */
    public function setLista($lista)
    {
        $this->lista = $lista;
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
     * @param $numeroFactura
     * Funcion que epleamos para obtener una lista de Lineas de una Facturas
     */
    public function obtenerListaLineasFacturas($fnumeroFactura){

        $sql = "SELECT * FROM " . $this->tabla . " WHERE fnumeroFactura = " . $fnumeroFactura . ";";
        $conexion = new BD();
        $res = $conexion->consulta($sql);

        while (list($idFactura, $fnumeroFactura, $nombreProducto, $referenciaProducto, $precioProducto, $ivaProducto, $cantidadProducto) = mysqli_fetch_array($res)) {
            $fila = new LineaFactura($idFactura, $fnumeroFactura, $nombreProducto, $referenciaProducto, $precioProducto, $ivaProducto, $cantidadProducto);
            array_push($this->lista, $fila);
        }
    }

    // Funcion que podemos emplear para saber si un determinado numero corresponde a una factura
    public function existeNumero($numeroFactura){

        $existe = false;

        try{
            foreach ($this->lista as $factura){

                if($factura->getNumeroFactura()==$numeroFactura){
                    $existe=true;
                }

            }

        }catch (Exception $e){
            /*Lanzar alerta*/
        }

        return $existe;

    }

}