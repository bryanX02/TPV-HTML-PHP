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


    public function comprobarExisteReferenciaPedido($referencia){

        $existe = false;
        $contador = 0;

        while(!$existe && $contador<count($this->lista)) {

            if ($this->lista[$contador]->getFreferenciaProducto() == $referencia) {
                $existe=true;
            }

            $contador++;

        }

        return $existe;

    }

    public function crearFactura ($idMesa, $nombreEmpleado, $numeroMesa) {

        $idGenerado = -1;

        $consulta = "INSERT INTO facturas (numeroFactura, empleado, fecha, numeroMesa) VALUES (". $idMesa .", '". $nombreEmpleado . "', now(), ". $numeroMesa . ");";
        echo $consulta;
        $conexion = new BD();
        $resultado = $conexion->consultaID($consulta);

        // Cunado la consulta es un insert, $resultado guarda un boolean del resultado
        if ($resultado) {

            echo "Se genero la factura";

            foreach ($this->lista as $lineaPedido) {

                $consulta = "INSERT INTO lineasfacturas (fnumeroFactura, nombreProducto, referenciaProducto, precioProducto, ivaProducto, cantidadProducto) VALUES (". $idMesa .", '". $lineaPedido->getNombreProducto() . "', '". $lineaPedido->getFreferenciaProducto(). "', ". $lineaPedido->getPrecioProducto() . ", ". $lineaPedido->getIvaProducto() . ", ". $lineaPedido->getCantidadProducto() . ");";
                //echo $consulta;
                $resultado = $conexion->consulta($consulta);

                if ($resultado) {

                    //echo "Se inserto la fila de la factura del producto: " . $lineaPedido->getNombreProducto();

                }else {

                    //echo "NO se inserto la fila de la factura del producto: " . $lineaPedido->getNombreProducto();

                }

            }

        }else {

            echo "No se pudo generar la factura";

        }

        return $conexion->getIdGenerada();

    }

    public function addLineaPedido($referenciaProducto, $idMesa){

        $conexion = new BD();

        if ($this->comprobarExisteReferenciaPedido($referenciaProducto)){
            $sql = "UPDATE " .$this->tabla. " SET cantidadProducto = cantidadProducto + 1 WHERE freferenciaProducto = '" . $referenciaProducto."'";

        } else {

            $producto = new Producto();
            $producto->obtenerPorRefProducto($referenciaProducto);

            $sql = "INSERT INTO " .$this->tabla. " (fidMesa, freferenciaProducto, tipoProducto, nombreProducto, descripcionProducto, precioProducto, ivaProducto, cantidadProducto) values (".$idMesa.", '".$referenciaProducto."', ".$producto-> getTipo().",'".$producto-> getNombre()."', '".$producto-> getDescripcion()."', ".$producto-> getPrecio().", ".$producto-> getIva().", 1)";

        }

        $conexion->consulta($sql);

    }


}