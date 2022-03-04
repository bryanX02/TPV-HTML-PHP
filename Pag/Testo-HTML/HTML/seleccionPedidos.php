<?php

require "../../../modelo/BD.php";
require "../../../modelo/ListaLineasPedidos.php";
require "../../../modelo/ListaProductos.php";
require "../../../modelo/Producto.php";
require "../../../modelo/Factura.php";

$tipo = 1;
$listaLineasPedidos = new ListaLineasPedidos();

    if (isset($_POST) && !empty($_POST)){
        if(isset($_POST['1'])){
            $tipo = 1;
        } else if (isset($_POST['2'])){
            $tipo = 2;
        } else if (isset($_POST['3'])){
            $tipo = 3;
        } else if (isset($_POST['4'])){
            $tipo = 4;
        } else if (isset($_POST['5'])){
            $tipo = 5;
        } else if (isset($_POST['6'])){
            $tipo = 6;
        }

        if (isset($_POST['generarFactura'])){

            // Hay que validar primero que haya productos en la lista!!
            $factura = new Factura();

        }
    }

?>

<!DOCTYPE html>
<html lang="es" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="author" content="">
    <meta name="title" content="">
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


        #contenedor{
            max-width: 1200px;
            height: 700px;
            margin: 0 auto;
            border: 1px solid black;
        }

        /***** PARTE SUPERIOR *****/

        #contenedorSuperior {
            width: 100%;
            display: flex;

        }

        #contenedorInformacionMesa{
            width: 30%;
            border: 1px solid black;
        }

        #contenedorLogo{
            width: 70%;
            border: 1px solid black;
        }

        .logo{
            width: 20%;
            display: block;
            margin: 0 auto;
            padding-top: 8px;
        }


        /***** PARTE INFERIOR *****/


        #contenedorInferior{

            width: 100%;
            height: 85%;
            display: flex;
        }

        #contenedorListado{
            border: 1px solid black;
            display: flex;
            flex-flow: column wrap;
            justify-content: space-between;
            width: 30%;
        }

        #botonesFinales{
            border: 1px solid black;
            text-align: center;
        }

        #botonesProductos{
            width: 70%;
        }

        #contenedorTiposProducto{
            width: 100%;
            margin-bottom: 40px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
        }

        #contenedorTiposProducto > div{
            width: 25%;
            margin: 10px;

        }

        #contenedorProductos{
            width: 100%;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
        }

        .tamanoImagenes{
            width: 80px;
            display: block;
            margin: 0 auto;
        }

        #contenedorProductos > div{
            width: 22%;
            height: 80px;

        }



        /**** BOTONES ****/
        .btn {
            width: 150px;
            background: #ff6600;
            background-image: -webkit-linear-gradient(top, #ff6600, #c44e00);
            background-image: -moz-linear-gradient(top, #ff6600, #c44e00);
            background-image: -ms-linear-gradient(top, #ff6600, #c44e00);
            background-image: -o-linear-gradient(top, #ff6600, #c44e00);
            background-image: linear-gradient(to bottom, #ff6600, #c44e00);
            border-radius: 28px;
            text-shadow: 1px 1px 3px #666666;
           /* font-family: Arial;*/
            color: #ffffff;
            font-size: 15px;
            padding: 10px 20px 10px 20px;
            text-decoration: none;
            display: block;
            margin: 0 auto;
            cursor: pointer;
        }

        .btn:hover {
            background: #c44e00;
            text-decoration: none;
        }


        .btnImprimir {
            background: #990000;
            background-image: -webkit-linear-gradient(top, #990000, #7a0909);
            background-image: -moz-linear-gradient(top, #990000, #7a0909);
            background-image: -ms-linear-gradient(top, #990000, #7a0909);
            background-image: -o-linear-gradient(top, #990000, #7a0909);
            background-image: linear-gradient(to bottom, #990000, #7a0909);
            border-radius: 28px;
            text-shadow: 1px 1px 3px #666666;
            font-family: Arial;
            color: #ffffff;
            font-size: 15px;
            padding: 10px 20px 10px 20px;
            text-decoration: none;
            display: block;
            margin: 0 auto;
            cursor: pointer;
        }

        .btnImprimir:hover {
            background: #c44e00;
            background-image: -webkit-linear-gradient(top, #c44e00, #990000);
            background-image: -moz-linear-gradient(top, #c44e00, #990000);
            background-image: -ms-linear-gradient(top, #c44e00, #990000);
            background-image: -o-linear-gradient(top, #c44e00, #990000);
            background-image: linear-gradient(to bottom, #c44e00, #990000);
            text-decoration: none;
        }





    </style>

</head>


<body>


<div id = "contenedor">

    <!-- PARTE SUPERIOR-->
    <div id = "contenedorSuperior">

        <!-- Información de la mesa -->
        <div id = "contenedorInformacionMesa">
            <a href="#">Volver</a>
            <p>Camarero: Bryan Quilumba</p>
            <p>Mesa: 3</p>
        </div>

        <!-- Logo-->
        <div id = "contenedorLogo">
            <img class = "logo" src="images/logo-01.png" alt="Logo Testo">

        </div>

    </div>

    <!-- PARTE INFERIOR-->

    <div id="contenedorInferior">
        <div id ="contenedorListado">

            <div id="listado">
                <?php

                    $conexion = new BD();
                    $numMesa = 1; // Esta es la variable que nos llegaria por el get del html
                    $idMesa = null; // Variable donde guardamos la idMesa en uso
                    $listaPedidos = new ListaLineasPedidos(); // Array donde guardaremos la lista de pedidos que hay en esa lista


                    // Comprobamos si la mesa está en uso
                    if (!$conexion->comprobarMesaOcupada($numMesa)){ // Si NO está en uso

                        // Creamos un nuevo registro mesa
                        $res = $conexion-> insertarRegistroMesa($numMesa);

                    } else { // Si está en uso
                        // Guardamos la id del registro mesa
                        $idMesa = $conexion->getIdMesaOcupada($numMesa);

                        // Obtenemos la lista de pedidos (en el atributo lista)
                        $listaPedidos->getListaPedidosMesa($idMesa);

                        // Cargamos la lista en divs
                        for ($i = 0; $i < count($listaPedidos->getLista()); $i++) {
                            echo'<div>'.$listaPedidos->getLista()[$i]->getNombreProducto().' || UNID: '.$listaPedidos->getLista()[$i]->getCantidadProducto().'</div>';

                        }

                    }

                ?>
            </div>


            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" >
                <div id = "botonesFinales">
                    <input class ="btnImprimir" type="submit" name="generarFactura" value ="GENERAR FACTURA">
                </div>
            </form>


        </div>

        <div id = "botonesProductos">


            <form name="menu" action="<?php echo $_SERVER['PHP_SELF']?>" method="post" enctype="multipart/form-data">
                <div id = "contenedorTiposProducto">
                    <div><input class="btn" type="submit" name="1" id="1" value="Refrescos"></div>
                    <div><input class="btn" type="submit" name="2" id="2" value="Entrantes"></div>
                    <div><input class="btn" type="submit" name="3" id="3" value="Ensaladas"></div>
                    <div><input class="btn" type="submit" name="4" id="4" value="Complementos"></div>
                    <div><input class="btn" type="submit" name="5" id="5" value="Hamburguesas"></div>
                    <div><input class="btn" type="submit" name="6" id="6" value="Postres"></div>
                </div>
            </form>



            <?php

                $listaProductos = new ListaProductos();

                // Obtenemos la lista de productos del tipo solicitado
                $listaProductos->getProductosTipo($tipo);

                // Cargamos la lista de productos en divs

            ?>

            <form name="productoElegido" action="<?php echo $_SERVER['PHP_SELF']?>" method="post" enctype="multipart/form-data">
                <div id = "contenedorProductos">
                    <?php
                        for ($i = 0; $i < count($listaProductos->getLista()); $i++) {
                            echo '<div><input class ="tamanoImagenes" type="image" src="'.$listaProductos->getLista()[$i]->getImagen().'" value ="'.$listaProductos->getLista()[$i]->getReferencia().'"> </div>';

                        }

                    ?>
                </div>
            </form>






        </div>

    </div>

</div>


</body>

</html>

