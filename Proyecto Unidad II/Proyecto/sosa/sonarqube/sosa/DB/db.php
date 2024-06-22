<?php
namespace Database;
// Archivo de configuración de la base de datos(db.php)
class Conectar{
    public static function conexion(){
        // Cargar las propiedades desde el archivo de configuración
        $config = parse_ini_file('config.ini', true);

        // Obtener las credenciales del archivo de configuración
        $host = $config['database']['url'];
        $username = $config['database']['username'];
        $password = $config['database']['password'];
        $dbname = $config['database']['dbname'];

        // Establecer la conexión con la base de datos
        $conexion = new mysqli($host, $username, $password, $dbname);

        // Verificar si la conexión fue exitosa
        if ($conexion->connect_error) {
            die("Connection failed: " . $conexion->connect_error);
        }

        // Establecer el conjunto de caracteres a utf8
        $conexion->query("SET NAMES 'utf8'");

        return $conexion;
    }
}
?>
