<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    include_once "../pesistance/MySQLPDO.class.php";
    include_once "../entity/Equipo.class.php";
    $nombre=$_POST['nombre'];
    $descripcion=$_POST['descripcion'];

    $equipo = new Equipo ();
    $equipo->setNombre($nombre);
    $equipo->setDescripcion($descripcion);
    MySQLPDO::connect();
    $result=MySQLPDO::altaequipo($equipo);
    //$equipo->getFecha_creacion()
    
    if ($result != null){
echo "Equipo $nombre creado correctamente";
    } else {
        echo "Error";
    }
    ?>
</body>
</html>