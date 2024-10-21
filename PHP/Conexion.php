<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

class Conexion {
    private $conexion;
    
    public function __construct() {
        $Host = 'localhost';
        $Usuario = 'root';
        $Contrasena = '';
        $Puerto = 3307; // Cambia el puerto si es necesario
        $DBnombre = 'DB_BDM_CURSOS'; // Nombre de la base de datos
        
        try {
            // Establecer la conexión con PDO al servidor MySQL
            $this->conexion = new PDO("mysql:host=$Host;port=$Puerto", $Usuario, $Contrasena);
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Crear la base de datos si no existe
            //$sqlCreateDB = "CREATE DATABASE IF NOT EXISTS $DBnombre";
            //$this->conexion->exec($sqlCreateDB);
            //echo "Base de datos creada o ya existía.<br>";

            // Usar la base de datos
            $this->conexion->exec("USE $DBnombre");
            echo "Usando la base de datos: $DBnombre. 😊<br>";

            // Mostrar las tablas existentes
            $sqlShowTables = "SHOW TABLES";
            $result = $this->conexion->query($sqlShowTables);
            
            // Verificar si hay tablas en la base de datos
            if ($result->rowCount() > 0) {
                echo "Tablas en la base de datos $DBnombre:<br>";
                while ($row = $result->fetch(PDO::FETCH_NUM)) {
                    echo $row[0] . "<br>";
                }
            } else {
                echo "No hay tablas en la base de datos $DBnombre.<br>";
            }

        } catch (PDOException $exp) {
            // Mostrar mensaje de error si la conexión o la ejecución de SQL falla
            echo "Fallo la conexión o la ejecución de SQL :(<br>";
            die($exp->getMessage());
        }
    }
    
    public function obtenerConexion() {
        return $this->conexion;
    }
}

// Prueba de la conexión y mostrar tablas
$conexion = new Conexion();
?>
