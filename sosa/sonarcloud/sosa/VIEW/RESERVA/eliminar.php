<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Reserva</title>
</head>
<body>
    <h1>Eliminar Reserva</h1>
    <p>¿Estás seguro de que deseas eliminar esta reserva?</p>
    <?php
        // Sanitize the idreserva parameter
        $idreserva = filter_input(INPUT_GET, 'idreserva', FILTER_SANITIZE_NUMBER_INT);
    ?>
    <form action="admin.php?action=eliminarReserva&idreserva=<?php echo htmlspecialchars($idreserva, ENT_QUOTES, 'UTF-8'); ?>" method="POST">
        <button type="submit">Eliminar</button>
        <a href="admin.php?action=MenuReserva">Cancelar</a>
    </form>
</body>
</html>
