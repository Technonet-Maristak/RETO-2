<?php
include_once "./entity/Usuario.class.php";
include_once "./pesistance/MySQLPDO.class.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];

    MySQLPDO::connect(); // Establece la conexión a la base de datos

    // Verifica si el usuario y la contraseña son correctos
    $resultado = MySQLPDO::buscarUsu($usuario);
    
    if ($resultado) {
        $usuarioEncontrado = $resultado[0];
        $hashContrasena = $usuarioEncontrado['contrasena'];

        if (password_verify($contrasena, $hashContrasena)) {
            // Inicio de sesión exitoso, redirige a home.php
            header("Location: home.php");
            exit();
        } else {
            // Inicio de sesión fallido, muestra un mensaje de error
            echo "Inicio de sesión incorrecto. Por favor, inténtalo de nuevo.";
        }
    } else {
        // Usuario no encontrado, muestra un mensaje de error
        echo "Usuario no encontrado. Por favor, inténtalo de nuevo.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Enlaza Bootstrap desde un CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Login</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Iniciar sesión</div>
                    <div class="card-body">
                        <form method="POST" action="index.php">
                            <div class="mb-3">
                                <label for="usuario" class="form-label">Usuario:</label>
                                <input type="text" name="usuario" id="usuario" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                        </form>
                        <a href="alta/formu.php">¿Eres nuevo? Regístrate</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Enlaza Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
