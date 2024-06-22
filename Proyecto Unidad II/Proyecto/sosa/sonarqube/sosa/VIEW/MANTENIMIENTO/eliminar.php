<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Mantenimiento</title>
</head>
<body>
    <h1>Eliminar Mantenimiento</h1>
    <p>¿Estás seguro de que deseas eliminar este mantenimiento?</p>
    <?php
        // Sanitize the idmantenimiento parameter
        $idmantenimiento = filter_input(INPUT_GET, 'idmantenimiento', FILTER_SANITIZE_NUMBER_INT);
    ?>
    <form action="admin.php?action=eliminarMantenimiento&idmantenimiento=<?php echo htmlspecialchars($idmantenimiento, ENT_QUOTES, 'UTF-8'); ?>" method="POST">
        <button type="submit">Eliminar</button>
        <a href="admin.php?action=MenuMantenimiento">Cancelar</a>
    </form>
</body>
</html>
