<%@page import="java.util.Map"%>
<%@page import="Modelo.Oportunidad"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.OportunidadDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Needu</title>
    <link rel="stylesheet" type="text/css" href="estilos_inicio_Voluntario.css">
    <link rel="icon" type="image/jpeg" href="imagenes\logo.jpeg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Meroitic&family=Poppins:wght@500&display=swap" rel="stylesheet">
</head>
<body>

    <%@ include file="common_functions.jsp" %>

    <div class="seccion">
        <div class="fila">
            <div class="columna-mitad">
                <div class="modulo texto fondo-claro">
                    <div class="texto-interior"><h4>Voluntariado</h4></div>
                </div>
                <div class="modulo texto fondo-claro">
                    <div class="texto-interior"><h1>¡BIENVENIDO VOLUNTARIO!</h1></div>
                </div>
                <div class="modulo texto fondo-claro">
                    <div class="texto-interior">
                        <p>Tu compromiso es la fuerza que impulsa el cambio. Juntos, podemos marcar la diferencia en la vida de quienes más lo necesitan. Únete a nosotros y sé parte de esta causa solidaria.</p>
                    </div>
                </div>

            </div>
            <div class="columna-mitad ultimo">
                <div class="modulo imagen">
                    <span class="imagen-contenedor">
                        <img decoding="async" fetchpriority="high" width="801" height="801" src="imagenes/doodle_index.png" alt="doodle_index" title="doodle_index">
                    </span>
                </div>
            </div>
        </div>
    </div>
 
       <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v18.0" nonce="ZLLX3Vcw"></script>
<div class="fb-comments" data-href="http://localhost:8080/NeedU_UPT/inicio.jsp" data-width="" data-numposts="5"></div>    
    
    
    
    <input type="text" id="campoBusqueda" placeholder="Busqueda Rapida...">

    <div id="resultadosBusqueda">
        <!-- Aquí se mostrarán los resultados de la búsqueda -->
    </div>

<script>
    document.getElementById('campoBusqueda').addEventListener('input', function(e) {
        var terminoBusqueda = e.target.value;
        if (terminoBusqueda.length > 0) {
            fetch('ControladorBusqueda?terminoBusqueda=' + terminoBusqueda)
                .then(response => response.json())
                .then(data => {
                    var resultadosHTML = '';
                    data.forEach(function(opo) {
                        resultadosHTML += '<div class="resultado-busqueda">';
                        resultadosHTML += '<h3>' + opo.titulo + '</h3>';
                        resultadosHTML += '<p>' + opo.descripcion + '</p>';
                        resultadosHTML += '<p><strong>Organización:</strong> ' + opo.nombreOrganizacion + '</p>'; // Nombre de la organización
                        resultadosHTML += '<a href="InfoOportunidad.jsp?idoportunidad=' + opo.idoportunidad + '" class="btn-ver-mas">Ver más acerca de esta Oportunidad</a>';
                        resultadosHTML += '<button class="btn-chatear">Chatear</button>';
                        resultadosHTML += '</div>';
                    });
                    document.getElementById('resultadosBusqueda').innerHTML = resultadosHTML;
                })
                .catch(error => console.error('Error:', error));
        } else {
            document.getElementById('resultadosBusqueda').innerHTML = '';
        }
    });
</script>








<h1>Todas las Oportunidades:</h1>
    <%@ include file="common_functions2.jsp" %>


    <script>
    function enviarSolicitud(event, idOportunidad) {
        event.preventDefault(); // Detiene el comportamiento de envío del formulario

        fetch('ControladorSolicitud?idoportunidad=' + idOportunidad)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert(data.message);
            } else {
                alert(data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Datos enviados correctamente.');
        });
    }
    </script>

    
    
    
    <script src="common.js"></script>
    <script src="common2.js"></script>

</body>
</html>