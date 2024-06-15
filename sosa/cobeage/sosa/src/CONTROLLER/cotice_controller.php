<?php
require_once __DIR__ . '/../MODEL/cliente_model.php';
require_once __DIR__ . '/../MODEL/cotizacion_model.php';
require_once __DIR__ . '/../MODEL/Maquinaria.php';
require_once __DIR__ . '/../MODEL/lugar_model.php';

class ClsCotice {
    public function mostrarFormulario() {
        require_once(__DIR__ . '/../VIEW/COTICE/formularioCotice.php');
    }
    
    public function validarDocumento($iddocumento, $documento) {
        // Verificar si el documento contiene 7 dígitos consecutivos repetidos
        if (preg_match('/(\d)\1{6}/', $documento)) {
            return "no";
        }
    
        $url = "https://dniruc.apisperu.com/api/v1/";
        if ($iddocumento == "1") {
            $url .= "dni/" . $documento;
        } elseif ($iddocumento == "2") {
            $url .= "ruc/" . $documento;
        }
    
        $url .= "?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImFwYXphZHNhQGdtYWlsLmNvbSJ9.XmfXRak5dQQXmJ6KExpBe7q-CYTXlGGyJvNug9tUCkI";
    
        $json = file_get_contents($url);
        $data = json_decode($json);
    
        $valido = "no";
        if ($iddocumento == "1") {
            if ($data && isset($data->success) && $data->success === true) {
                $valido = "si";
            }
        } elseif ($iddocumento == "2") {
            if ($data && isset($data->estado) && $data->estado === "ACTIVO" && isset($data->condicion) && $data->condicion === "HABIDO") {
                $valido = "si";
            }
        }
    
        return $valido;
    }
    

    public function procesarFormulario($nombre, $apellido, $correo, $iddocumento, $documento, $telefono) {
        $valido = $this->validarDocumento($iddocumento, $documento);
        $clienteModel = new ClienteModel();
        $idcliente = $clienteModel->agregarCliente($nombre, $apellido, $correo, $iddocumento, $documento, $telefono, $valido);
        $idcliente = $clienteModel ->obtenerUltimoIdCliente();

        if ($idcliente !== null) {
            if ($valido === 'no') {
                header("Location: ../comprobacion.php");
                echo "Su documento";
                exit;
            }
    
            $cotizacionModel = new CotizacionModel();
            $idcotizacion = $cotizacionModel->agregarCotizacion($idcliente);
            
            if ($idcotizacion !== null) {
                $maquinariaModel = new Maquinaria();
                $maquinarias = $maquinariaModel->listar_Maquinarias();
                
                $lugarModel = new LugarModel();
                $lugares = $lugarModel->obtenerTodosLugares();

                // Obtener toda la información del cliente
                $cliente = $clienteModel->obtenerClientePorId($idcliente);
                
                // Pasar datos a la vista detalleCotice.php
                header("Location: ../VIEW/COTICE/detalleCotice.php?idcliente=$idcliente&idcotizacion=$idcotizacion&maquinarias=" . urlencode(serialize($maquinarias)) . "&lugares=" . urlencode(serialize($lugares)) . "&cliente=" . urlencode(serialize($cliente)));
                exit;
            } else {
                echo "Error: No se pudo obtener el último ID de cotización.";
                exit;
            }
        } else {
            echo "Error: No se pudo obtener el último ID de cliente.";
            exit;
        }
    }

}

$cotice = new ClsCotice();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $correo = $_POST["correo"];
    $iddocumento = $_POST["iddocumento"];
    $documento = $_POST["documento"];
    $telefono = $_POST["telefono"];

    $cotice->procesarFormulario($nombre, $apellido, $correo, $iddocumento, $documento, $telefono);
} else {
    $cotice->mostrarFormulario();
}
?>
