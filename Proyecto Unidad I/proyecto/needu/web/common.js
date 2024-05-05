<script>
    function toggleMenu() {
        var menuOptions = document.getElementById("menu-options");
        if (menuOptions.style.display === "none" || menuOptions.style.display === "") {
            displayMenu(menuOptions);
        } else {
            hideMenu(menuOptions);
        }
    }

    function displayMenu(menuOptions) {
        menuOptions.style.display = "block";
        setTimeout(function() {
            menuOptions.classList.add("active");
        }, 0);
    }

    function hideMenu(menuOptions) {
        menuOptions.classList.remove("active");
        setTimeout(function() {
            menuOptions.style.display = "none";
        }, 500);
    }

    // Función para cerrar el menú cuando cambia el tamaño de la ventana
    function closeMenuOnResize() {
        var menuOptions = document.getElementById("menu-options");
        if (menuOptions.classList.contains('active')) {
            hideMenu(menuOptions);
        }
    }
    // Agregar un controlador de eventos al evento 'resize' para detectar cambios de tamaño de ventana
    window.addEventListener('resize', closeMenuOnResize);
</script>
