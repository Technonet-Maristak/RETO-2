<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Equipos</title>
    <style>
        /* Estilos para la imagen de fondo */
        body {
            background: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F4.bp.blogspot.com%2F-K11g7yqUjug%2FWmttgOchMPI%2FAAAAAAAENAE%2FOxFQ_ja5Kpoar5HYsqGbCQE7bnXlvQvcgCLcBGAs%2Fs1600%2F1390.jpg&f=1&nofb=1&ipt=13579d9011a867f88ad369623053c21d0650b38da937f9cd7e5a449ea4b90ed9&ipo=images.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        /* Alinea el formulario en el centro de la página */
        form {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" style="z-index: 1000;">
    <div class="container">
        <a class="navbar-brand" href="#">Mi Sitio Web</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Unirse a un equipo</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../select.php">Consultar datos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../index.php">Cerrar sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <form method="post" action="alta.equipo.php">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre del equipo</label>
            <input type="text" class="form-control" id="nombre" name="nombre">
        </div>
        <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción del equipo</label>
            <input type="text" class="form-control" id="descripcion" name="descripcion">
        </div>
        <button type="submit" class="btn btn-primary" name="btn_altaequipo">Enviar</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
