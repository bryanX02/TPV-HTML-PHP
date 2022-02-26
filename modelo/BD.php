<?php

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
    

}