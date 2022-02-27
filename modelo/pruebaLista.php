<?php
?>

<!DOCTYPE html>
<html lang="es" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="author" content="Sergio Serrano">
    <meta name="title" content="Pruebas de php">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="shortcut icon" href="" type=" image/x-icon">
    <link rel="icon" href="" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="">


    <title>El texto que va en la pestaña</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <style>
        /*FUENTES DEL PROYECTO*/
        * {

            font-family: 'Roboto', Arial, Verdana, sans-serif;
        }

        /*COLORES DEL PROYECYO*/




    </style>

</head>


<body id="top">

<div> <!-- Este es el div del hueco que nos dejan para meter la lista -->

    <?php
    require "BD.php";

    $numMesa = 1; // Esta es la variable que nos llegaria por el get del html
    $idMesa = null; // Variable donde guardamos la idMesa en uso
    $listaPedidos = array(); // Array donde guardaremos la lista de pedidos que hay en esa lista
    $conexion = new BD();

    // Comprobamos si la mesa está en uso
    if (!$conexion->comprobarMesaOcupada($numMesa)){ // Si NO está en uso

        // Creamos un nuevo registro mesa
        $res = $conexion-> insertarRegistroMesa($numMesa);

    } else { // Si está en uso
        // Guardamos la id del registro mesa
        $idMesa = $conexion->getIdMesaOcupada($numMesa);

        // Guardamos la lista de pedidos
        $listaPedidos = $conexion->getListaPedidosMesa($idMesa);

        // Cargamos la lista en divs
        for ($i = 0; $i < count($listaPedidos); $i++) {
            // Ejemplo de prueba
            echo'<div>'.$listaPedidos[$i]->getNombreProducto().' || UNID: '.$listaPedidos[$i]->getCantidadProducto().'</div>';

        }

    }



    ?>

</div>

<div>

</div>



</body>

</html>