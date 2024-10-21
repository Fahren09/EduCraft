<?php
// Incluir el archivo de conexión
require_once 'Conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $rol = $_POST['user-role'];
    $nombreCompleto = $_POST['full-name'];
    $genero = $_POST['gender'];
    $fechaNacimiento = $_POST['birth-date'];
    $email = $_POST['email'];
    $password = $_POST['password']; // Cambié 'contraseña' a 'password' para consistencia
    $imagenAvatar = ''; // Inicializa la imagen si es necesario

    // Manejo de la imagen (opcional)
    if (isset($_FILES['user-photo']) && $_FILES['user-photo']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['user-photo']['tmp_name'];
        $fileName = $_FILES['user-photo']['name'];
        $uploadFileDir = '../uploads/';
        $dest_path = $uploadFileDir . $fileName;

        // Mover la imagen a la carpeta de destino
        if (move_uploaded_file($fileTmpPath, $dest_path)) {
            $imagenAvatar = $dest_path; // Guardar la ruta de la imagen
        } else {
            echo 'Error al mover la imagen.';
            exit();
        }
    }

    try {
        // Crear una instancia de la clase Conexion
        $conexion = new Conexion();
        $db = $conexion->obtenerConexion();

        // Llamar al procedimiento almacenado
        $sql = 'CALL InsertarUsuario(:rol, :imagenAvatar, :nombreCompleto, :genero, :fechaNacimiento, :email, :password)';
        
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':rol', $rol);
        $stmt->bindParam(':imagenAvatar', $imagenAvatar);
        $stmt->bindParam(':nombreCompleto', $nombreCompleto);
        $stmt->bindParam(':genero', $genero);
        $stmt->bindParam(':fechaNacimiento', $fechaNacimiento);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $password); // Corregido a 'password'

        // Ejecutar la consulta
        if ($stmt->execute()) {
            // Si se inserta correctamente, redirigir a la página de inicio de sesión
            header('Location: ../HTML/IniciarSesion.php');
            exit();
        } else {
            echo 'Error al registrar el usuario.';
        }
    } catch (PDOException $e) {
        echo 'Error: ' . $e->getMessage();
    }
} else {
    // Manejo si no es un POST (opcional)
    echo 'Acceso no permitido.';
    exit();
}
?>