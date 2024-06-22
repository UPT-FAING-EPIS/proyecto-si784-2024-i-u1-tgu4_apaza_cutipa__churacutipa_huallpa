<?php
require_once __DIR__ . '/../DB/db.php';

class ClienteModel {
    
    public function agregarCliente($nombre, $apellido, $correo, $iddocumento, $documento, $telefono, $valido) {
        try {
            $conexion = Conectar::conexion();
            
            $sql = "INSERT INTO tbcliente (nombre, apellido, correo, iddocumento, documento, telefono, valido) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            $stmt = $conexion->prepare($sql);
            
            $stmt->bind_param("ssssiss", $nombre, $apellido, $correo, $iddocumento, $documento, $telefono, $valido);
            
            $stmt->execute();
            
            $stmt->close();
            $conexion->close();
            return true;
        } catch (Exception $e) {
            echo "Error al agregar el cliente: " . $e->getMessage();
            return false;
        }
    }
    public function obtenerUltimoIdCliente() {
        try {
            $conexion = Conectar::conexion();
            
            $sql = "SELECT MAX(idcliente) AS ultimo_id FROM tbcliente";
            
            $resultado = $conexion->query($sql);
            
            if ($resultado && $resultado->num_rows > 0) {
                $fila = $resultado->fetch_assoc();
                $ultimoId = $fila['ultimo_id'];
                $resultado->close();
                $conexion->close();
                return $ultimoId;
            } else {
                $conexion->close();
                return null;
            }
        } catch (Exception $e) {
            echo "Error al obtener el último ID de cliente: " . $e->getMessage();
            return false;
        }
    }

    /*NUEVO*/ 
    public function obtenerClientePorId($idcliente) {
        try {
            $conexion = Conectar::conexion();
            
            $sql = "SELECT * FROM tbcliente WHERE idcliente = ?";
            
            $stmt = $conexion->prepare($sql);
            
            $stmt->bind_param("i", $idcliente);
            
            $stmt->execute();
            
            $resultado = $stmt->get_result();
            
            $cliente = $resultado->fetch_assoc();
            
            $stmt->close();
            $conexion->close();
            return $cliente;
        } catch (Exception $e) {
            echo "Error al obtener cliente por ID: " . $e->getMessage();
            return false;
        }
    }
    
    
    
}
?>
