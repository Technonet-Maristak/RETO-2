<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
$id=$_GET['id'];
include_once "./pesistance/MySQLPDO.class.php";
include_once "./entity/Numeros.class.php";
if ($id !=0){
    $Numeros=MySQLPDO::connect();
    $Numeros=MySQLPDO::obtener($id);


   // $n1=$Numero->$_GET['n1'];
}else {
    die("No se ha encontrado el id");
}
if ($Numeros !=null){
    

?>
<form method="post" action="modificado.php">
    <input type="hidden" name="id" value="<?php echo $id; ?>">
    <p><input type="number" value="<?php echo $Numeros->getn1();?>" step="0.01" name="n1"></p>
    <p><input type="number" value="<?php echo $Numeros->getn2();?>" step="0.01" name="n2" ></p>
    <p><input type="submit" name="btn_modificar" value="Modificar"></p>

</form>
<?php
}
else{
    die("No se han encontrado datos ");
}
?>
</body>
</html>