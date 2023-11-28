<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alta calculadora</title>
    <!-- Enlaza Bootstrap desde un CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Alta de Usuario</div>
                    <div class="card-body">
                        <form method="POST" action="alta.php">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" name="nombre" id="nombre" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="contra" class="form-label">Contraseña:</label>
                                <input type="password" name="contra" id="contra" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="contra2" class="form-label">Confirmar Contraseña:</label>
                                <input type="password" name="contra2" id="contra2" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Dar de alta</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Enlaza Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>