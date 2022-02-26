<?php

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
        $this->tabla = "Empleados";
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



}