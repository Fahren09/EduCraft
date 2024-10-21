<?php
/*
// Incluir el archivo de conexión
require_once 'Conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];

    try {
        // Crear una instancia de la clase Conexion
        $conexion = new Conexion();
        $db = $conexion->obtenerConexion();

        // Verificar si el correo ya existe
        $sql = 'SELECT COUNT(*) FROM Usuario WHERE Email = :email';
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $userCount = $stmt->fetchColumn();

        if ($userCount > 0) {
            echo 'exists'; // El correo ya está registrado
        } else {
            echo 'available'; // El correo está disponible
        }
    } catch (PDOException $e) {
        echo 'error';
    }
} else {
    echo 'Acceso no permitido.';
}
    */
?>

