<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Yanbal";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

$postdata = file_get_contents("php://input");
$request = json_decode($postdata, true);

$producto = $request['producto'] ?? '';
$fecha = $request['fecha'] ?? '';
$categoria = $request['categoria'] ?? '';

$sql = "SELECT * FROM VistaVentas WHERE 1=1";

if (!empty($producto)) {
    $sql .= " AND Producto = '" . $conn->real_escape_string($producto) . "'";
}

if (!empty($fecha)) {
    $sql .= " AND Fecha = '" . $conn->real_escape_string($fecha) . "'";
}

if (!empty($categoria)) {
    $sql .= " AND Categoria = '" . $conn->real_escape_string($categoria) . "'";
}

$result = $conn->query($sql);

$ventas = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $ventas[] = $row;
    }
}

echo json_encode($ventas);

$conn->close();
?>
