<?php

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $servidor = "localhost";
    $usuario = "root";
    $contrasena = "";
    $baseDeDatos = "OXXO";
    $tabla = "products";

    $conn = mysqli_connect($servidor, $usuario, $contrasena, $baseDeDatos);

    if (!$conn) {
        die("La conexión a la base de datos ha fallado: " . mysqli_connect_error());
    }

    $name = $_POST["name"];
    $image = $_POST["image"];
    $product_name = $_POST["product_name"];
    $description = $_POST["description"];
    $price = $_POST["price"];
    $stock = $_POST["stock"];

    $sql = "INSERT INTO $tabla (name, image, prodcut_name, description, price, stock) VALUES ('$name', '$image', 
    '$product_name', '$description', '$price', '$stock')";

    if (mysqli_query($conn, $sql)) {
        echo "Producto agregada exitosamente.";
    } else {
        echo "Error al agregar producto: " . mysqli_error($conn);
    }

    
    mysqli_close($conn);
} else {
    echo "Acceso no autorizado.";
}

header("Location: Productos.php");
exit();
?>