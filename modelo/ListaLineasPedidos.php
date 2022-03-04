<?php

class ListaLineasPedidos
{

    private $lista;
    private $tabla;

    /**
     * @param $lista
     * @param $tabla
     */
    public function __construct($lista="")
    {
        $this->lista = array();
        $this->tabla = "lineaspedidos";
    }

    /**
     * @return mixed|string
     */
    public function getLista()
    {
        return $this->lista;
    }

    /**
     * @param mixed|string $lista
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

    // METODOS PARA LA LISTA DE PEDIDOS

    /**
     * Método que consigue todas las lineas de pedidos de un idMesa que pasamos por parámetros
     * @param $idMesa
     * @return el array que contiene todos los objetos del tipo LineaPedido
     */
    public function getListaPedidosMesa($idMesa){

        $consulta = "SELECT * FROM lineasPedidos WHERE fidMesa = ".$idMesa.";";
        $conexion = new BD();
        $resultado = $conexion->consulta($consulta);

        while (list($idLineaPedido, $fidMesa, $freferenciaProducto, $tipoProducto, $nombreProducto, $descripcionProducto, $precioProducto, $ivaProducto, $cantidadProducto) = mysqli_fetch_array($resultado)) {

            $lineaPedido = new LineaPedido($idLineaPedido, $fidMesa, $freferenciaProducto, $tipoProducto, $nombreProducto, $descripcionProducto, $precioProducto, $ivaProducto, $cantidadProducto);
            array_push($this->lista, $lineaPedido);

        }

    }

    public function addLineaPedido($referencia, $idMesa){



    }

    public function comprobarExisteReferenciaPedido($referencia){

        $existe = false;
        $contador = 0;

        do {

            if ($this->lista[$contador]->getFreferenciaProducto() == $referencia) {
                $existe=true;
            }

            $contador++;

        } while (!$existe && $contador<count($this->lista));

        return $existe;

    }

    public function crearFactura ($idMesa, $nombreEmpleado, $fecha, $numeroMesa) {

        $factura = new Factura();

        $consulta = "INSERT INTO facturas VALUES (". $idMesa .", ". $nombreEmpleado . ", ". $fecha . ", ". $numeroMesa . ");";
        $conexion = new BD();
        $resultado = $conexion->consulta($consulta);

        if ($resultado->num_rows != 0) {

            echo "Se genero la factura";

            foreach ($this->lista as $lineaPedido) {

                $consulta = "INSERT INTO lineasfacturas VALUES (". $idMesa .", ". $lineaPedido->getNombreProducto() . ", ". $lineaPedido->getFreferenciaProducto(). ", ". $lineaPedido->getPrecioProducto() . ", ". $lineaPedido->getIvaProducto() . ", ". $lineaPedido->getCantidadProducto() . ");";
                $resultado = $conexion->consulta($consulta);

                if ($resultado->num_rows != 0) {

                    echo "Se inserto la fila de la factura del producto: " . $lineaPedido->getNombreProducto();

                }else {

                    echo "NO se inserto la fila de la factura del producto: " . $lineaPedido->getNombreProducto();

                }

            }

        }else {

            echo "No se pudo generar la factura";

        }

        return $factura;

    }


}