<?php
require "modelo/BD.php";
require "modelo/Empleado.php";

if (isset($_POST) && !empty($_POST)){

    $nickname = addslashes($_POST['txtUsuario']);
    $pass = hash("md5", addslashes($_POST['txtPassword'])); // Utilizando hash para encriptarla y compararla con la de la db
    $empleado = new Empleado();

    if ($empleado -> login($nickname, $pass)){
        header("location:Pag/Testo-HTML/HTML/demo-1.php");

    }else{
        echo "<script>alert('El empleado no existe')</script>";
    }

}

?>

<!DOCTYPE html>
<html lang="es" dir="ltr">

<body>
<main>


    <section id="cajafuera">

        <div id="formulariocaja">
            <form name="login" action="<?php echo $_SERVER['PHP_SELF']?>" method="post">

                <div class="formtitulo">INICIAR SESIÓN</div>
                <div class="textoscajas">&#128273; Usuario</div>
                <input type="text" name="txtUsuario" class="cajaentradatexto" placeholder="Introduzca su nick Gsus">
                <div class="textoscajas">&#128274; Contraseña</div>
                <input type="password" name="txtPassword" id="txtPassword" class="cajaentradatexto" placeholder="Introduzca su contraseña">
                <div class="afcheckbox1">
                    <div>
                        <input type="checkbox" onclick="verpassword()">
                    </div>
                    <div>
                        Mostrar contraseña
                    </div>
                </div>

                <input type="submit" value="Iniciar sesión" class="botonenviar">

                <div>¿Necesitas una cuenta? <a href="signup.php">Registrate</a></div>

            </form>
        </div>

    </section>

</main>
</body>

<script>
    function verpassword() {
        var tipo = document.getElementById("txtPassword");
        if (tipo.type == "password") {
            tipo.type = "text";
        } else {
            tipo.type = "password";
        }
    }
    
</script>

</html>

