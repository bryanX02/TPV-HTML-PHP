<?php

require ('BD.php');

class Empleado
{

    private $idEmpleado;
    private $nombre;
    private $user;
    private $pass;
    private $tabla;

    /**
     * @param $idEmpleado
     * @param $nombre
     * @param $user
     * @param $pass
     */
    public function __construct($idEmpleado="", $nombre="", $user="", $pass="")
    {
        $this->idEmpleado = $idEmpleado;
        $this->nombre = $nombre;
        $this->user = $user;
        $this->pass = $pass;
        $this->tabla = "empleados";
    }

    /**
     * @return mixed
     */
    public function getIdEmpleado()
    {
        return $this->idEmpleado;
    }

    /**
     * @param mixed $idEmpleado
     */
    public function setIdEmpleado($idEmpleado)
    {
        $this->idEmpleado = $idEmpleado;
    }

    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @return mixed
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param mixed $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }

    /**
     * @return mixed
     */
    public function getPass()
    {
        return $this->pass;
    }

    /**
     * @param mixed $pass
     */
    public function setPass($pass)
    {
        $this->pass = $pass;
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
     * @param $idEmpleado
     * @param $nombre
     * @param $user
     * @param $pass
     */
    public function llenarEmpleado ($idEmpleado, $nombre, $user, $pass)
    {
        $this->idEmpleado = $idEmpleado;
        $this->nombre = $nombre;
        $this->user = $user;
        $this->pass = $pass;
    }

    /**
     * Método que valida si el usuario existe y crea la session
     * @param $user
     * @param $pass
     * @return bool
     */
    public function login($user, $pass)
    {
        $existe = false;

        $sql = "select * from " . $this->tabla . " where user = '" .$user. "' and pass = '" .$pass."';";
        $conexion = new BD();
        $res = $conexion ->consulta($sql);
        //echo $sql;
        if ($res->num_rows != 0){

            list($idEmpleado, $nombre, $user, $pass) = mysqli_fetch_array($res);
            session_start();
            $_SESSION['idEmpleado'] = $idEmpleado;
            $_SESSION['nombre'] = $nombre;
            $_SESSION['user'] = $user;
            $_SESSION['pass'] = $pass;
            $existe = true;
        }

        return $existe;

    }

    /**
     * @param $idEmpleado
     *
     * Metodo que empleo para obtener un empleado en concreto, por su id
     */
    public function obtenerPorIdEmpleado($idEmpleado)
    {

        $sql = "SELECT * FROM " . $this->tabla . " WHERE idEmpleado = " . $idEmpleado;
        $conexion = new BD();
        $res = $conexion->consulta($sql);
        list($idEmpleado, $nombre, $user, $pass) = mysqli_fetch_array($res);
        $this->llenarEmpleado($idEmpleado, $nombre, $user, $pass);

    }
}