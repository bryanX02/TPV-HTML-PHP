<?php

require "../../../modelo/BD.php";
require "../../../modelo/ListaLineasPedidos.php";
require "../../../modelo/ListaProductos.php";
require "../../../modelo/Producto.php";
require "../../../modelo/Factura.php";

session_start();

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

        // Nos devuelve el numero de mesa en el que nos encontramos
        $numMesa = $_SESSION['numMesaActual'];

    } else {

        // Nos guarda el numero de mesa que llega por el get a su variable y tambien en el sesion para cuando actualice pagine sepamos en que mesa seguimos
        $numMesa = $_GET['numMesa'];
        $_SESSION['numMesaActual'] = $numMesa;
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
            background: #BD977E;


        }

        #contenedor > div {
            padding: 10px;
        }

        /***** PARTE SUPERIOR *****/

        #contenedorSuperior {

            width: 100%;
            display: flex;


        }

        #contenedorInformacionMesa{
            width: 25%;
            margin-right: 5px;
            background: white;
            padding: 4px;
            border-radius: 4px;
            filter:alpha(opacity=70);
            -moz-opacity:.70;opacity:.70;
        }

        #contenedorLogo{
            width: 71.5%;
            background: white;
            padding: 4px;
            border-radius: 4px;
            filter:alpha(opacity=70);
            -moz-opacity:.70;opacity:.70;
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
            height: 73%;
            display: flex;
        }

        #contenedorListado{
            background: white;
            border-radius: 4px;
            margin-right: 5px;
            display: flex;
            flex-flow: column wrap;
            justify-content: space-around;
            width: 30%;
            height: 103.5%;
        }

        #listado{
            border: 2px solid gray;
            margin: 0 auto;
            width: 90%;
            height: 82%;

        }

        #botonesFinales{

            text-align: center;
        }

        #botonesProductos{
            width: 67%;
        }

        #contenedorTiposProducto{
            background: #FFDCC4;
            padding: 4px;
            border-radius: 4px;
            width: 100%;
            margin-bottom: 15px;
            display: flex;
            flex-flow: row wrap;
            justify-content: space-around;
        }

        #contenedorTiposProducto > div{
            width: 25%;
            margin: 6px;

        }

        #contenedorProductos{
            width: 100%;
            display: flex;
            flex-flow: row wrap;
            justify-content:space-around;



        }

        .tamanoImagenes{
            width: 120px;
            display: block;
            margin: 0 auto;
        }

        .imgHover:hover {
            -webkit-filter: contrast(130%);
            filter: contrast(110%);
            transform: scale(1.05);

        }

        #contenedorProductos > div{
            width: 32%;
            height: 120px;
            margin-bottom: 10px;

            background: #FFDCC4;
            padding: 4px;
            border-radius: 4px;

        }



        /**** BOTONES ****/
        .btn {
            width: 160px;
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
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 1px;
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

        .btnVolver{
            width: 40px;
        }




    </style>

</head>


<body>


<div id = "contenedor">

    <!-- PARTE SUPERIOR-->
    <div id = "contenedorSuperior">

        <!-- Información de la mesa -->
        <div id = "contenedorInformacionMesa">
            <a href="mesas.html"><img class="btnVolver" alt="boton de volver" src="images/btnVolver.png" ></a>
            <p>Camarero: Bryan Quilumba</p>
            <p>Mesa: <?php echo $numMesa?></p>
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
                    <div><input class="btn" type="submit" name="1" id="1" value="REFRESCOS"></div>
                    <div><input class="btn" type="submit" name="2" id="2" value="ENTRANTES"></div>
                    <div><input class="btn" type="submit" name="3" id="3" value="ENSALADAS"></div>
                    <div><input class="btn" type="submit" name="4" id="4" value="COMPLEMENTOS"></div>
                    <div><input class="btn" type="submit" name="5" id="5" value="HAMBURGUESAS"></div>
                    <div><input class="btn" type="submit" name="6" id="6" value="POSTRES"></div>
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
                            echo '<div><input class ="tamanoImagenes imgHover" type="image" src="'.$listaProductos->getLista()[$i]->getImagen().'" value ="'.$listaProductos->getLista()[$i]->getReferencia().'"> </div>';

                        }

                    ?>
                </div>
            </form>






        </div>

    </div>

</div>


</body>

</html>

