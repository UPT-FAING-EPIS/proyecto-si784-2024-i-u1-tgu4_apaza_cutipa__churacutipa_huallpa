<?php
define('MAQUINARIA_MODEL_PATH', 'MODEL/Maquinaria.php');

Class clsMaquinaria{
    //VISTA CLIENTE
    public static function catalogoMaquinaria(){
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $datos = $maq->listar_maquinarias();
            require_once("VIEW/CATALOGO/catalogoMaquinaria.php");
        } catch (Exception $e) {
            // Manejo de errores
            echo "Error: " . $e->getMessage();
        }
    }
    // Funcion del controlador para mostrar detalles de una maquinaria cuando se le haga click
    public static function detalleMaquinaria() {
        $idmaquinaria = filter_input(INPUT_GET, 'idmaquinaria', FILTER_VALIDATE_INT);
        if ($idmaquinaria === false || $idmaquinaria === null) {
            echo "Error: ID de maquinaria no válido";
            return;
        }
        
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $fila = $maq->mostrarMaquinaria($idmaquinaria);
            require_once("VIEW/CATALOGO/detalleMaquinaria.php");
        } catch (Exception $e) {
            // Manejo de errores
            echo "Error: " . $e->getMessage();
        }
    }
    //VISTA ADMINISTRADOR
    // Función para listar maquinaria en la interfaz del administrador
    public static function listarMaquinariaAdmin() {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria(); // Asegúrate de usar el nombre correcto de la clase del modelo
            $datos = $maq->listarMaquinarias(); // Corregido: llama al método listarMaquinarias
            require_once("VIEW/MAQUINARIA/index.php"); // Asegúrate de tener una vista adecuada para listar la maquinaria en la interfaz del administrador
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    //funcion para agregar maquinaria 
    public static function agregarMaquinariaAdmin($numserie, $nombre, $marca, $modelo, $costoh, $imagenprincipal) {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $maq->agregarMaquinaria($numserie, $nombre, $marca, $modelo, $costoh, $imagenprincipal);
            echo "Maquinaria agregada correctamente.";
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    
    // Eliminar maquinaria
    public function eliminarMaquinariaAdmin($id) {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $resultado = $maq->eliminarMaquinaria($id);
            if ($resultado) {
                echo "Maquinaria eliminada correctamente.";
            } else {
                echo "Error: No se encontró maquinaria con ese ID.";
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    // Función para editar maquinaria
    public static function editarMaquinariaAdmin($id, $numserie, $nombre, $marca, $modelo, $costoh, $imagenprincipal) {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $maq->editarMaquinaria($id, $numserie, $nombre, $marca, $modelo, $costoh, $imagenprincipal);
            echo "Maquinaria editada correctamente.";
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    // Función para buscar maquinaria
    public static function buscarMaquinariaAdmin($termino) {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $resultados = $maq->buscarMaquinaria($termino);
            $datos = $resultados;
            require_once("VIEW/MAQUINARIA/index.php");
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    
    public static function mostrarFormularioEditar($id) {
        try {
            require_once(MAQUINARIA_MODEL_PATH);
            $maq = new Maquinaria();
            $maquinaria = $maq->buscarMaquinariaPorId($id);
            require_once("VIEW/MAQUINARIA/editar.php");
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
    
}
?>
