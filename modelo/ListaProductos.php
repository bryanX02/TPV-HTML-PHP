<?php



class ListaProductos
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
        $this->tabla = "productos";
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

    public function getProductosTipo($tipo){
        $consulta = "SELECT * FROM " .$this->tabla. " WHERE tipo = ".$tipo.";";
        $conexion = new BD();
        $resultado = $conexion->consulta($consulta);

        while (list($idProducto, $tipo, $nombre, $referencia, $descripcion, $stock, $precio, $iva, $imagen) = mysqli_fetch_array($resultado)) {

            $listaProductos = new Producto($idProducto, $tipo, $nombre, $referencia, $descripcion, $stock, $precio, $iva, $imagen);
            array_push($this->lista, $listaProductos);

        }

    }

}