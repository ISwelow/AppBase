<?php
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
    $id = $_GET["id"];

    $servidor = "localhost";
    $usuario = "root";
    $contrasena = "";
    $baseDeDatos = "OXXO";
    $tabla = "products";

    $conn = mysqli_connect($servidor, $usuario, $contrasena, $baseDeDatos);

    // Obtén el id del disfraz antes de eliminarlo
    $sqlGetProductoId = "SELECT id FROM $tabla WHERE id = $id";
    $resultGetProductoId = mysqli_query($conn, $sqlGetProductoId);

    if (!$resultGetProductoId) {
        http_response_code(500);
        echo json_encode(['error' => 'Error al obtener el ID del producto']);
        exit;
    }

    $row = mysqli_fetch_assoc($resultGetProductoId);
    $disfrazId = $row['id'];

    // Elimina los comentarios asociados al disfraz
    $sqlDeleteTransactions = "DELETE FROM transactions WHERE costume_id = $disfrazId";
$resultDeleteTransactions = mysqli_query($conn, $sqlDeleteTransactions);

if (!$resultDeleteTransactions) {
    http_response_code(500);
    echo json_encode(['error' => 'Error al eliminar transacciones asociadas']);
    exit;
}

    // Elimina el disfraz
    $sql = "DELETE FROM $tabla WHERE id = $id";

    if (mysqli_query($conn, $sql)) {
        header("Location: Disfraces.php");
        exit();
    } else {
        echo "Error al eliminar el disfraz: " . mysqli_error($conn);
    }

    mysqli_close($conn);
} else {
    echo "Acceso no válido.";
}
?>