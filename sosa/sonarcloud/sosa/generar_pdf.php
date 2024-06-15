<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require_once __DIR__ . '/DB/LIBS/LIB_PDF/fpdf.php';
require_once __DIR__ . '/DB/db.php'; // Asegúrate de incluir tu archivo de conexión a la base de datos

if (isset($_SESSION['pdf_data'])) {
    $data = $_SESSION['pdf_data'];
    $idcliente = $data['idcliente'];
    $idcotizacion = $data['idcotizacion'];
    $correo_destinatario = $data['correo_destinatario']; // Nuevo - Almacenar el correo del destinatario en la sesión

    // Realizar la consulta SQL para obtener los detalles
    $query = "SELECT 
                c.idcotizacion, 
                cl.nombre AS cliente_nombre, 
                cl.apellido AS cliente_apellido, 
                cl.correo AS cliente_correo, 
                m.nombre AS maquinaria_nombre, 
                m.marca AS maquinaria_marca, 
                m.modelo AS maquinaria_modelo, 
                l.ciudad AS lugar_ciudad, 
                c.total, 
                c.tiempo 
            FROM 
                tbcotizacion c
                JOIN tbcliente cl ON c.idcliente = cl.idcliente
                JOIN tbmaquinaria m ON c.idmaquinaria = m.idmaquinaria
                JOIN tblugar l ON c.idlugar = l.idlugar
            WHERE 
                c.idcotizacion = ?";

    // Establecer conexión a la base de datos
    $conn = Conectar::conexion();

    if ($stmt = $conn->prepare($query)) {
        $stmt->bind_param("i", $idcotizacion);
        $stmt->execute();
        $result = $stmt->get_result();
        $detalle = $result->fetch_assoc();
        $stmt->close();
    } else {
        echo "Error al preparar la consulta: " . $conn->error;
        exit();
    }

    // Generar PDF
    class PDF extends FPDF {
        public function Header() {
            // Logo
            $this->Image('sosalogo.png', 10, 10, 50);
            
            // Título
            $this->SetFont('Arial', 'B', 12);
            $this->Cell(0, 10, 'Cotizacion Detallada', 0, 1, 'C');
            $this->Ln(10); // Espacio después del título
        }
        
        public function Body($detalle) {
            $this->AddPage(); // Agregar una nueva página después del encabezado con el logo
            
            // Contenido de la cotización
            $this->SetFont('Arial', '', 12);
            $this->Cell(0, 10, 'ID Cotizacion: ' . $detalle['idcotizacion'], 0, 1, 'L');
            $this->Cell(0, 10, 'Cliente: ' . $detalle['cliente_nombre'] . ' ' . $detalle['cliente_apellido'], 0, 1, 'L');
            $this->Cell(0, 10, 'Correo Cliente: ' . $detalle['cliente_correo'], 0, 1, 'L');
            $this->Cell(0, 10, 'Maquinaria: ' . $detalle['maquinaria_nombre'], 0, 1, 'L');
            $this->Cell(0, 10, 'Marca Maquinaria: ' . $detalle['maquinaria_marca'], 0, 1, 'L');
            $this->Cell(0, 10, 'Modelo Maquinaria: ' . $detalle['maquinaria_modelo'], 0, 1, 'L');
            $this->Cell(0, 10, 'Lugar: ' . $detalle['lugar_ciudad'], 0, 1, 'L');
            $this->Cell(0, 10, 'Total: ' . $detalle['total'], 0, 1, 'L');
            $this->Cell(0, 10, 'Tiempo: ' . $detalle['tiempo'], 0, 1, 'L');
        }
        
        
    }

    $pdf = new PDF();
    $pdf->AddPage();
    $pdf->Body($detalle);

    // Guardar el PDF en el servidor
    $timestamp = date('Y-m-d_H-i-s');
    $pdf_file_path = __DIR__ . '/DB/PDFS/_idcot_' . $idcotizacion . '_' . $timestamp . '.pdf';
    $pdf->Output('F', $pdf_file_path);

    // Almacenar la ruta del archivo PDF y el correo del destinatario en la sesión
    $_SESSION['pdf_file_path'] = $pdf_file_path;
    $_SESSION['correo_cliente'] = $detalle['cliente_correo'];

    // Redirigir a email.php para enviar el correo
    header('Location: email.php');
    exit();
} else {
    require_once("seguridad.php"); 
    echo "No hay datos para generar el PDF.";
}
?>
