<%@page import="Modelo.Control"%>
<%@page import="java.util.List" %>
<%@page import="ModeloDAO.ControlDAO" %>
<title>Needu</title>
<style>
    <%@ include file="/Usuario/common_styles.jsp" %>
</style>
<link rel="icon" type="image/jpeg" href="imagenes\logo.jpeg"> 
<!-- L�gica de Java para obtener las listas -->
<%
// Obtener listas del request
List<Control> registrosUsuario = (List<Control>) request.getAttribute("registrosUsuario");
List<Control> todosRegistros = (List<Control>) request.getAttribute("todosRegistros");

// Verificar si las listas no est�n vac�as
if (registrosUsuario != null && todosRegistros != null) {
%>

<%
    // Convertir la lista de registros a una cadena de consulta para enviarla en la URL
    String listaQueryString = "";
    if (registrosUsuario != null && !registrosUsuario.isEmpty()) {
        StringBuilder stringBuilder = new StringBuilder();
        for (Control control : registrosUsuario) {
            stringBuilder.append("idcontrol=").append(control.getIdcontrol()).append("&");
            stringBuilder.append("idusuario=").append(control.getIdusuario()).append("&");
            stringBuilder.append("usuario=").append(control.getUsuario()).append("&");
            stringBuilder.append("hora_entrada=").append(control.getHora_entrada()).append("&");
            stringBuilder.append("hora_salida=").append(control.getHora_salida()).append("&");
        }
        listaQueryString = stringBuilder.toString();
        listaQueryString = listaQueryString.substring(0, listaQueryString.length() - 1); // Eliminar el �ltimo '&'
    }
%>
<div class="menu">
  <a href="ControladorLogin?accion=redirigirInicio">Inicio</a>
  <a href="ControladorChat?accion=allchats">Chat</a>
  <a href="ControladorNotificacion?accion=notificacion">Notificaciones</a>
  <a href="ControladorPerfil?accion=perfil">Perfil</a>
  <a href="ControladorUsuario?accion=control">Control de usuarios</a>
  <a href="ControladorLogin?accion=logout">Cerrar Sesi�n</a>
</div>
<a href="ControladorAdmin?accion=generarInforme" class="btn">Generar Informe</a>

<h2>Registros del usuario actual:</h2>
<table class="registro-table">
    <tr>
        <th>ID Control</th>
        <th>ID Usuario</th>
        <th>Usuario</th>
        <th>Hora de entrada</th>
        <th>Hora de salida</th>
    </tr>
    <% for (Control control : registrosUsuario) { %>
    <tr>
        <td><%= control.getIdcontrol() %></td>
        <td><%= control.getIdusuario() %></td>
        <td><%= control.getUsuario() %></td>
        <td><%= control.getHora_entrada() %></td>
        <td><%= control.getHora_salida() %></td>
    </tr>
    <% } %>
</table>

<!-- HTML/JSP para mostrar la lista de todos los registros -->
<h2>Todos los registros:</h2>
<table class="registro-table">
    <tr>
        <th>ID Control</th>
        <th>ID Usuario</th>
        <th>Usuario</th>
        <th>Hora de entrada</th>
        <th>Hora de salida</th>
    </tr>
    <% for (Control control : todosRegistros) { %>
    <tr>
        <td><%= control.getIdcontrol() %></td>
        <td><%= control.getIdusuario() %></td>
        <td><%= control.getUsuario() %></td>
        <td><%= control.getHora_entrada() %></td>
        <td><%= control.getHora_salida() %></td>
    </tr>
    <% } %>
</table>

<%
} else {
    out.println("No se han encontrado registros.");
}
%>
