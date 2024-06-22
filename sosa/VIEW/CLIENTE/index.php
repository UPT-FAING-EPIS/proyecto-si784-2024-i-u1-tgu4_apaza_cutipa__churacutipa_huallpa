<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Clientes - Admin</title>
</head>
<body>
    <h1>Listar Clientes</h1>
    <form action="admin.php" method="GET">
        <input type="hidden" name="action" value="buscarCliente">
    </form>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo</th>
                <th>Documento</th>
                <th>Teléfono</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($clientes as $cliente) { ?>
                <tr>
                    <td><?php echo $cliente['idcliente']; ?></td>
                    <td><?php echo $cliente['nombre']; ?></td>
                    <td><?php echo $cliente['apellido']; ?></td>
                    <td><?php echo $cliente['correo']; ?></td>
                    <td><?php echo $cliente['documento']; ?></td>
                    <td><?php echo $cliente['telefono']; ?></td>
                    <td>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</body>
</html>
