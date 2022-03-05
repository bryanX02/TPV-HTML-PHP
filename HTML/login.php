-<?php

require ('../modelo/Empleado.php');
require ('../modelo/BD.php');

if (isset($_POST) && !empty($_POST)) {

    $user = addslashes($_POST['usuario']);
    $pass = hash("md5", addslashes($_POST['pass'])); // Utilizando hash para encriptarla y compararla con la de la db
    $empleado = new Empleado();

    if ($empleado -> login($user, $pass)){

        session_start();
        //$_SESSION['nombre'] = $user;
        header("location:mesas.php");

    }else{
        echo "<script>alert('El empleado no existe')</script>";
    }
}

?>

<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>

<body background="images/banner-3.jpg">
<div class="container h-100">
    <div class="d-flex justify-content-center h-100">
        <div class="user_card">
            <div class="d-flex justify-content-center">
                <div class="brand_logo_container">
                    <br>
                    <img src="images/logo-01.png" class="brand_logo" alt="Logo">
                </div>
            </div>

            <br>
            <br>

            <div class="d-flex justify-content-center form_container">
                <form id="login" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" >
                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" name="usuario" class="form-control input_user" value="" placeholder="usuario">
                    </div>
                    <div class="input-group mb-2">
                        <div class="input-group-append">
                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                        </div>
                        <input type="password" name="pass" class="form-control input_pass" value="" placeholder="contraseña">
                    </div>
                    <div class="d-flex justify-content-center mt-3 login_container">
                        <button type="submit" href="mesas.html" name="button" class="btn login_btn">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>