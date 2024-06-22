<?php
session_start();
require_once __DIR__ . '/../MODEL/cliente_model.php';
require_once __DIR__ . '/../MODEL/cotizacion_model.php';
require_once __DIR__ . '/../MODEL/Maquinaria.php';
require_once __DIR__ . '/../MODEL/lugar_model.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idcliente = $_POST["idcliente"];
    $idcotizacion = $_POST["idcotizacion"];
    $idmaquinaria = $_POST["idmaquinaria"];
    $idlugar = $_POST["idlugar"];
    $total = $_POST["total"];
    $tiempo = $_POST["numero"];
    
    $cotizacionModel = new CotizacionModel();

    $result = $cotizacionModel->actualizarCotizacion($idcotizacion, $idcliente, $idmaquinaria, $idlugar, $total, $tiempo);

    if ($result) {
        $_SESSION['pdf_data'] = [
            'idcliente' => $idcliente,
            'idcotizacion' => $idcotizacion
        ];
        header('Location: ../generar_pdf.php');
        exit();

    } else {
        include_once '../VIEW/COTICE/alerta.php'; 
        session_unset();
        session_destroy();
        exit();
    }
}
?>
