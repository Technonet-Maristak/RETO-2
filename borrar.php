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
if(!isset($_POST['id'] )){
    die("Muerte");
}else{
    $id=$_POST['id'];
    MySQLPDO::connect();
    $result=MySQLPDO::borrar($id);
}if ($result !=0){
    echo "Borrado correcto";
}else{
    echo "Error";
}
    ?>
</body>
</html>