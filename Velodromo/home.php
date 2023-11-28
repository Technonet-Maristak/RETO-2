<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- Enlaza Bootstrap desde un CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Estilos para la imagen de fondo */
        body {
            background: url('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F4.bp.blogspot.com%2F-K11g7yqUjug%2FWmttgOchMPI%2FAAAAAAAENAE%2FOxFQ_ja5Kpoar5HYsqGbCQE7bnXlvQvcgCLcBGAs%2Fs1600%2F1390.jpg&f=1&nofb=1&ipt=13579d9011a867f88ad369623053c21d0650b38da937f9cd7e5a449ea4b90ed9&ipo=images.jpg') no-repeat center center fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
    <!-- Navbar fijo en la parte superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Mi Sitio Web</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="equipo/equipo.php">Uniste a un equipo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="select.php">Consultar datos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <p class="text-white">Bienvenido al velódromo</p>
        <h2 id='crono'>00:00:00</h2>
        <input type="button" value="Empezar">
        <input type="button" value="Vueltas">
    </div>

    
<?php
//crear un crono php que empieze de 00:00:00 y guarde las vueltas en var
?>

</body>
</html>
