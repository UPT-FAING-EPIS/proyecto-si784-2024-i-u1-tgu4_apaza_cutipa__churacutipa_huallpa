<?php
$idcliente = isset($_GET['idcliente']) ? $_GET['idcliente'] : '';
$idcotizacion = isset($_GET['idcotizacion']) ? $_GET['idcotizacion'] : '';
$maquinarias = isset($_GET['maquinarias']) ? json_decode(urldecode($_GET['maquinarias']), true) : [];
$lugares = isset($_GET['lugares']) ? json_decode(urldecode($_GET['lugares']), true) : [];
$cliente = isset($_GET['cliente']) ? json_decode(urldecode($_GET['cliente']), true) : null;

echo "<p>ID Cliente: " . htmlspecialchars($idcliente) . "</p>";
echo "<p>ID Cotización: " . htmlspecialchars($idcotizacion) . "</p>";

// Mostrar información del cliente si está disponible
if ($cliente && is_array($cliente) && isset($cliente['nombre'], $cliente['apellido'], $cliente['correo'])) {
    echo "<p>Nombre del cliente: " . htmlspecialchars($cliente['nombre']) . "</p>";
    echo "<p>Apellido del cliente: " . htmlspecialchars($cliente['apellido']) . "</p>";
    echo "<p>Correo electrónico: " . htmlspecialchars($cliente['correo']) . "</p>";
} else {
    echo "<p>Detalles del cliente no disponibles.</p>";
}

echo "<h3>Maquinarias</h3>";

if (!empty($maquinarias)) {
    echo "<form id='formulario' action='../../CONTROLLER/cotice2_controller.php' method='post'>";
    echo "<input type='hidden' name='idcliente' value='" . htmlspecialchars($idcliente) . "'>";
    echo "<input type='hidden' name='idcotizacion' value='" . htmlspecialchars($idcotizacion) . "'>";
    echo "<select name='idmaquinaria' id='idmaquinaria'>";
    foreach ($maquinarias as $maquinaria) {
        echo "<option value='" . htmlspecialchars($maquinaria['idmaquinaria']) . "' data-costoh='" . htmlspecialchars($maquinaria['costoh']) . "'>" . htmlspecialchars($maquinaria['nombre']) . "</option>";
    }
    echo "</select>";
    echo "<p>Indique el número de horas a trabajar:</p>";
    echo "<input type='text' id='numero' name='numero' placeholder='Ingrese un número' inputmode='numeric' pattern='\\d*' onkeypress='return event.charCode >= 48 && event.charCode <= 57'>";
    echo "<input type='hidden' name='total' id='total'>"; // Campo oculto para enviar el total
    echo "<input type='hidden' name='tiempo' id='tiempo'>"; // Campo oculto para enviar el tiempo
    echo "<div id='detalleMaquinaria'></div>";
    echo "<h3>Lugares</h3>";
    if (!empty($lugares)) {
        echo "<select name='idlugar' id='idlugar'>";
        foreach ($lugares as $lugar) {
            echo "<option value='" . htmlspecialchars($lugar['idlugar']) . "'>" . htmlspecialchars($lugar['ciudad']) . "</option>";
        }
        echo "</select>";
    } else {
        echo "<p>No hay lugares disponibles.</p>";
    }
    echo "<button type='button' id='enviarBtn' onclick='enviarFormulario()'>Enviar Selección</button>";
    echo "</form>";
} else {
    echo "<p>No hay maquinarias disponibles.</p>";
}

// Elemento para mostrar el resultado
echo "<p>Costo estimado a pagar: S/. <span id='resultado'></span></p>";
echo "<p>Tiempo estimado en días: <span id='tiempoDias'></span></p>";
echo "<p>Este cálculo se realiza asumiendo que un operador trabaja 8 horas por día. Por lo tanto, dividimos el número de horas ingresadas por 8 para obtener el equivalente en días.</p>";
?>
