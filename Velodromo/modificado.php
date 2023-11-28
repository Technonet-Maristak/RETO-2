<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
include_once "./pesistance/MySQLPDO.class.php";
include_once "./entity/Numeros.class.php";
if (isset($_POST['btn_modificar'])){

    //1. Recogemos los campos
    $id=$_POST['id'];
    $n1=$_POST['n1'];
    $n2=$_POST['n2'];
    //2. Creamos el objeto
    $Numeros = new Numeros;
    $Numeros->setid($id);
    $Numeros->setn1($n1);
    $Numeros->setn2($n2);
    //echo "Numero 1: $n1" ;
    MySQLPDO::connect();
    $result = MySQLPDO::modificarcalculo($Numeros);
    if ($result != 0) {
        echo "Producto modificado correctamente";
    } else {
        echo "ERROR: No se ha podido modificar el producto";
    }

    
}

?>  
</body>
</html>