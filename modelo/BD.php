<?php
require "Mesa.php";
require "LineaPedido.php";

class BD
{

    private $server = "localhost";
    private $usuario = "root";
    private $pass = "";
    private $basedatos = "tpv";

    private $conexion;
    private $resultado;

    /**
     * BD constructor.
     * Contructor de la BD
     */
    public function __construct(){

        $this->conexion = new mysqli($this->server, $this->usuario, $this->pass, $this->basedatos);
        $this->conexion->select_db($this->basedatos);
        $this->conexion->query("SET NAMES 'utf8'");

    }

    /**
     * @param $consulta
     * @return bool|mysqli_result
     * Funcion que nos ahorra codigo a la hora de ejecutar una sentencia sql
     */
    public function consulta($consulta){
        // echo $consulta;
        $this->resultado =   $this->conexion->query($consulta);
        $res = $this->resultado ;
        return $res;
    }

    // METODOS PARA LAS MESAS

    /**
     * Método que comprueba si la mesa que pasamos por parámetros está en uso
     * @param $numMesa
     * @return un booleano: true si está ocupada y false si no
     */
    public function comprobarMesaOcupada($numMesa){
        $mesaOcupada = false;
        $sql = "SELECT * FROM mesas WHERE numero = '" . $numMesa."' and estado = 1";
        $res = $this->conexion->query($sql);

        if ($res->num_rows != 0){
            $mesaOcupada= true;
        }

        return $mesaOcupada;
    }

    /**
     * Método que nos devulve el idMesa del registro que tiene la mesa ocupada con el numero de mesa que llega por parámetros
     * @param $numMesa
     * @return el idMesa
     */
    public function getIdMesaOcupada($numMesa){
        $sql = "SELECT idMesa FROM mesas WHERE numero = '" . $numMesa."' and estado = 1";
        $this->resultado = $this->conexion->query($sql);

        // Esto nos ayuda a sacarlo del objeto de la clase mysqli_result para poder usar el número
        while ($row = $this->resultado->fetch_assoc()) {
            $res = $row['idMesa'];
        }

        return $res;

    }

    /**
     * Método que inserta un nuevo registro en la tabla mesa y deja el estado de la mesa en ocupado (1)
     * @param $numMesa
     * @return  el número de registros creados
     */
    public function insertarRegistroMesa($numMesa){
        $sql = "INSERT INTO mesas (numero, estado) values ($numMesa, 1)";
        $this->resultado = $this->conexion->query($sql);
        $res = $this->resultado;

        return $res;
    }



    

}