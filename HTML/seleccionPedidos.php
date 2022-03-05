<?php

require "../modelo/BD.php";
require "../modelo/ListaLineasPedidos.php";
require "../modelo/ListaProductos.php";
require "../modelo/Producto.php";
require "../modelo/Factura.php";

session_start();
$conexion = new BD();

if (isset($_SESSION['idMesa'])) {

    $idMesa = $_SESSION['idMesa'];
    $listaPedidos = new ListaLineasPedidos();
    $listaPedidos->getListaPedidosMesa($idMesa);

}

if (isset($_POST['empleado'])) {

    $_SESSION['empleado'] = $_POST['empleado'];

}else {
    $empleado = "Pepe";
}

if (isset($_SESSION['empleado'])) {

    $empleado = $_SESSION['empleado'];

}

if (!empty($_SESSION['tipo'])){
    $tipo = $_SESSION['tipo'];
} else {
    $tipo = 1;
}

// Comprobamos si se ha seleccionado algun botón del tipo de producto
if (isset($_POST) && !empty($_POST)){

    if(isset($_POST['editRestar'])){


        $listaPedidos->resLineaPedido($_POST['editRestar'], $idMesa);

    }

    if(isset($_POST['editSumar'])){

        $listaPedidos->addLineaPedido($_POST['editSumar'], $idMesa);

    }

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

    $_SESSION['tipo'] = $tipo;

    //print_r($_POST);

    // Nos devuelve el numero de mesa en el que nos encontramos
    $numMesa = $_SESSION['numMesaActual'];

    // Comprobamos si se ha seleccionado algun producto HAY QUE ARREGLAR ESTO, ya que nos llegan cordenadas
    if (isset($_POST['productoElegido'])){
        $listaPedidos->addLineaPedido($_POST['productoElegido'], $idMesa);

    }

    // Comprobamos si se ha selecionnado el boton de cerrar mesa y generar factura
    if (isset($_POST['generarFactura'])){

        if (count($listaPedidos->getLista()) > 0) {

            $idFactura = $listaPedidos->crearFactura($idMesa, "Bryan", $numMesa);
            $conexion->cerrarMesa($idMesa);
            header("location:../factura.php?idFactura=$idFactura&empleado=$empleado");

        }

    }

} else {

    // Nos guarda el numero de mesa que llega por el get a su variable y tambien en el sesion para cuando actualice pagine sepamos en que mesa seguimos
    if(empty($_GET['numMesa'])){ // Si no hay get nos carga la mesa 1
        $numMesa = 1;
    } else {
        $numMesa = $_GET['numMesa'];
    }

    // Guardamos el numMesa en el session para cuando recargue la pagina continuar en ella
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
    <link href="css/seleccionPedidos.css" rel="stylesheet" type="text/css">


    <title>TESTO TPV</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">


</head>


<body>


<div id = "contenedor">

    <!-- PARTE SUPERIOR-->
    <div id = "contenedorSuperior">

        <!-- Información de la mesa -->
        <div id = "contenedorInformacionMesa">
            <a href="mesas.php"><img class="btnVolver" alt="boton de volver" src="images/btnVolver.png" ></a>
            <p>Camarero: <?php echo $empleado?></p>
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


            <?php

                $listaPedidos = new ListaLineasPedidos();

                // Comprobamos si la mesa está en uso
                if (!$conexion->comprobarMesaOcupada($numMesa)){ // Si NO está en uso

                    // Creamos un nuevo registro mesa
                    $res = $conexion-> insertarRegistroMesa($numMesa);

                } else { // Si está en uso
                    // Guardamos la id del registro mesa
                    $idMesa = $conexion->getIdMesaOcupada($numMesa);
                    $_SESSION['idMesa'] = $idMesa;

                    // Obtenemos la lista de pedidos (en el atributo lista)
                    $listaPedidos->getListaPedidosMesa($idMesa);

                    // Cargamos la lista en divs



            ?>

                    <form id="listado" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" >


                        <?php
                        echo'<div class="columNombre editCampos">PRODUCTO</div>';
                        echo'<div class="columUnids editCampos">UNIDS</div>';
                        echo'<div class="columEdit editCampos"></div>';


                        for ($i = 0; $i < count($listaPedidos->getLista()); $i++) {
                            echo'<div class="columNombre separacionInferior">'.$listaPedidos->getLista()[$i]->getNombreProducto().'</div>';
                            echo'<div class="columUnids separacionInferior">'.$listaPedidos->getLista()[$i]->getCantidadProducto().'</div>';
                            echo'<div class="columEdit flexBotones separacionInferior">
                                    <button class = "arregloBoton" type="submit" name="editRestar" value="'.$listaPedidos->getLista()[$i]->getfreferenciaProducto(). '"><img class="imgBotonesEdit" src="images/btnRestar.png" alt="boton de restar"></button>                                                 
                                    <button class = "arregloBoton" type="submit" name="editSumar" value="' .$listaPedidos->getLista()[$i]->getfreferenciaProducto(). '"><img class="imgBotonesEdit" src="images/btnSumar.png" alt="boton de sumar"></button>
                                </div>';

                        }

            ?>

                    </form>
            <?php



                }

            ?>



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

            <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post" enctype="multipart/form-data">
                <div id = "contenedorProductos">
                    <?php
                        $contador = 0;
                        for ($i = 0; $i < count($listaProductos->getLista()); $i++) {
                            if($listaProductos->getLista()[$i]->getStock() > 0){ // Si hay stock del producto
                                echo '<div> <button class ="arregloBoton" name="productoElegido" type="submit" value ="'.$listaProductos->getLista()[$i]->getReferencia().'"><img class="tamanoImagenes imgHover" src="'.$listaProductos->getLista()[$i]->getImagen().'" alt="imagen del producto"> </button></div>';
                                //echo $listaProductos->getLista()[$i]->getReferencia();
                            } else { // Si no hay stock no se muestras
                                echo '<div></div>';

                            }
                            $contador++;
                        }

                        // Bucle para terminar de rellenar la cuadricula
                        while ($contador < 9){
                            echo '<div></div>';
                            $contador++;
                        }

                    ?>
                </div>
            </form>

        </div>

    </div>

</div>


</body>

</html>

