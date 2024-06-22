<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles de Maquinaria - Sosa e Hijas SAC</title>
    <link rel="stylesheet" href="CSS/estilos-detalleM.css">
    <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/3.4.0/model-viewer.min.js"></script>
</head>
<body>

<main class="product-details">
    <div class="product-container">
        <div class="product-images">
            <div class="main-image">
                <!-- Aquí puedes poner el modelo 3D -->
                <img src="IMAGENES/<?php echo htmlspecialchars($fila['']); ?>" alt="Colocar 3D aquí :p" id="current-image"> 
            </div>
            <div class="thumbnail-images">
            <img src="IMAGENES/<?php echo htmlspecialchars($fila['imagenprincipal']); ?>" alt="Imagen Principal" class="thumbnail">
                <img src="IMAGENES/<?php echo htmlspecialchars($fila['imagen1']); ?>" alt="Vista lateral" class="thumbnail">
                <img src="IMAGENES/<?php echo htmlspecialchars($fila['imagen2']); ?>" alt="Vista frontal" class="thumbnail">
                <img src="IMAGENES/<?php echo htmlspecialchars($fila['imagen3']); ?>" alt="Vista trasera" class="thumbnail">
                <img src="https://placehold.co/100x100" alt="Modelo 3D" class="thumbnail" data-modelo3d="IMAGENES/MODELOS3D/Modelo/scene.gltf">
            </div>
        </div>
        <div class="product-info">
            <h1><?php echo htmlspecialchars($fila['nombre']); ?></h1>
            <p class="price">$<?php echo number_format($fila['costoh'], 2); ?></p>
            <p class="availability">En stock</p>
            <div class="options">
                <label for="lock">Opciones:</label>
                <select id="lock" name="lock">
                    <option value="without-lock">Local</option>
                    <option value="with-lock">Departamental</option>
                </select>
            </div>
            <div class="quantity">
                <label for="quantity">Cantidad:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1">
            </div>
            <a href="index.php?action=cotice"><button class="btn-cta">Cotice Ahora</button></a>
            <div class="description">
                <h2>Descripción del Producto</h2>
                <p><?php echo htmlspecialchars($fila['descripcion']); ?></p>
            </div>
            <div class="product-specs">
                <h2>Especificaciones</h2>
                <p><strong>Marca:</strong> <?php echo htmlspecialchars($fila['marca']); ?></p>
                <p><strong>Modelo:</strong> <?php echo htmlspecialchars($fila['modelo']); ?></p>
                <p><strong>Número de Serie:</strong> <?php echo htmlspecialchars($fila['numserie']); ?></p>
            </div>
        </div>
    </div>
</main>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const thumbnails = document.querySelectorAll('.thumbnail');
    const mainImageContainer = document.querySelector('.main-image');

    // Función para cargar la imagen principal por defecto
    function loadDefaultImage() {
        const defaultImage = thumbnails[0].dataset.modelo3d ? thumbnails[0].dataset.modelo3d : thumbnails[0].src;
        mainImageContainer.innerHTML = `<img src="${defaultImage}" alt="Colocar 3D aquí :p" id="current-image">`;
    }

    // Cargar la imagen principal por defecto al cargar la página
    loadDefaultImage();

    // Escuchar los clics en las miniaturas
    thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener('click', function() {
            const modelo3d = this.dataset.modelo3d;
            if (modelo3d) {
                // Crear un elemento model-viewer
                const modelViewer = document.createElement('model-viewer');
                modelViewer.setAttribute('src', modelo3d);
                modelViewer.setAttribute('ar', '');
                modelViewer.setAttribute('ar-modes', 'webxr scene-viewer quick-look');
                modelViewer.setAttribute('camera-controls', '');
                modelViewer.setAttribute('auto-rotate', '');
                modelViewer.setAttribute('poster', 'poster.png');
                
                // Limpiar el contenido actual del mainImageContainer y agregar el modelo 3D
                mainImageContainer.innerHTML = '';
                mainImageContainer.appendChild(modelViewer);
            } else {
                // Si no hay modelo 3D, cargar la imagen de la miniatura
                const imgSrc = this.src;
                mainImageContainer.innerHTML = `<img src="${imgSrc}" alt="Colocar 3D aquí :p" id="current-image">`;
            }
        });
    });
});

</script>

<?php require_once "VIEW/footer.php"; ?>

</body>
</html>
