<?php
/*
include 'Conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['username'];
    $contrasena = $_POST['password'];

    $conexion = new Conexion();
    $db = $conexion->obtenerConexion();

    $sql = "CALL IniciarSesion(:email, :contrasena)";
    $stmt = $db->prepare($sql);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':contrasena', $contrasena);

    try {
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            if (isset($result['Id_Usuario'])) {
                // Inicio de sesión exitoso
                header("Location: ../HTML/PaginaPrincipal-2.php");
                exit();
            } else {
                echo json_encode(["mensaje" => $result['mensaje']]);
            }
        } else {
            echo json_encode(["mensaje" => "Error al iniciar sesión."]);
        }
    } catch (Exception $e) {
        echo json_encode(["mensaje" => "Error en la base de datos: " . $e->getMessage()]);
    }
}
    */
?>
