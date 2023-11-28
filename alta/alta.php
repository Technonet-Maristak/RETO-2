<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- Enlaza Bootstrap desde un CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
    <?php
    include_once "../entity/Usuario.class.php";
    include_once "../pesistance/MySQLPDO.class.php";

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $nombre = $_POST['nombre'];
        $contra = $_POST['contra'];
        $contra2 = $_POST['contra2'];

        // Validación de contraseñas y datos
        if ($nombre && $contra && $contra2 && $contra == $contra2) {
            $usuario = new Usuario();
            $usuario->setNombre($nombre);

            // Hashear la contraseña antes de guardarla
            $hashedPassword = password_hash($contra, PASSWORD_BCRYPT);
            $usuario->setContra($hashedPassword);

            MySQLPDO::connect();

            try {
                $resultado = MySQLPDO::insertusu($usuario);

                if ($resultado !== false) {
                    echo "Registro exitoso.";
                } else {
                    echo "Error al insertar el usuario en la base de datos.";
                }
            } catch (PDOException $e) {
                echo "Error en la base de datos: " . $e->getMessage();
            }
        } else {
            echo "Los datos ingresados son incorrectos.";
        }
        if ($resultado !== false) {
            // Registro exitoso, almacenar el nombre del usuario en una variable de sesión
            session_start();
            $_SESSION['nombre'] = $nombre;
            header("Location: ../home.php");
            exit();
        }
    }
    ?>
        <a href="../index.php" class="btn btn-primary">Ir a Inicio</a>
    </div>

    <!-- Enlaza Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
