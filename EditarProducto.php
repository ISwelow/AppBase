<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST["id"];
    $illustration = $_POST["illustration"];
    $name = $_POST["name"];
    $quantity = $_POST["quantity"];
    $type = $_POST["tipo"];
    $description = $_POST["description"];
    $price = $_POST["price"];

   
    $servidor = "localhost";
    $usuario = "root";
    $contrasena = "";
    $baseDeDatos = "OXXO";
    $tabla = "products";

    $conn = mysqli_connect($servidor, $usuario, $contrasena, $baseDeDatos);

    if (!$conn) {
        die("La conexión a la base de datos ha fallado: " . mysqli_connect_error());
    }

    // Consulta para actualizar el perfil con el ID proporcionado
    $sql = "UPDATE $tabla SET  illustration = '$illustration', name = '$name', quantity = '$quantity', type = '$type', description = '$description', price = '$price'  WHERE id = $id";

    if (mysqli_query($conn, $sql)) {
        // Redireccionar a la vista de perfil después de la actualización
        header("Location: Porductos.php");
        exit();
    } else {
        echo "Error al actualizar la producto: " . mysqli_error($conn);
    }

    mysqli_close($conn);
} else {
    echo "Acceso no válido.";
}
?>