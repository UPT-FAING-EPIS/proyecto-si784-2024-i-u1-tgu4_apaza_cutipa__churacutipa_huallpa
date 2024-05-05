<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Mensaje" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <link rel="icon" type="image/jpeg" href="../imagenes/logo.jpeg">
    <style>
        <%@ include file="/Usuario/common_styles.jsp" %>
    </style>
    <link rel="icon" type="image/jpeg" href="imagenes\logo.jpeg"> 
</head>
<body>
    <div class="menu">
  <a href="inicio.jsp">Inicio</a>
  <a href="ControladorChat?accion=allchats">Chat</a>
  <a href="ControladorNotificacion?accion=notificacion">Notificaciones</a>
  <a href="ControladorPerfil?accion=perfil">Perfil</a>
  <a href="ControladorUsuario?accion=control">Control de usuarios</a>
  <a href="ControladorLogin?accion=logout">Cerrar Sesión</a>
</div>
    <div class="chat-container">
        <div class="chat-header">
            <h2>Chat</h2>
        </div>

        <div class="chat-messages" id="chat-messages">
            <%
                List<Mensaje> listaMensajes = (List<Mensaje>) request.getAttribute("listaMensajes");
                int idusuario = (int) session.getAttribute("idusuario");
                out.println("idusuario: " + idusuario);
                String nombreUsuario = (String) session.getAttribute("nombreUsuario");
                
                for (Mensaje mensaje : listaMensajes) {
                    String claseMensaje = (mensaje.getEmisor() == idusuario) ? "emisor" : "receptor";
            %>
                    <div class="mensaje <%= claseMensaje %>">
                        <div class="mensaje-info">
                            <span><%= mensaje.getNombre_emisor() %></span>
                            <span class="hora-pequena"><%= mensaje.getHora() %></span>
                        </div>
                        <div class="contenido-mensaje">
                            <%= mensaje.getMensaje() %>
                        </div>
                    </div>
            <%
                }
            %>
        </div>

        <div class="input-container">
            <form method="post" action="ControladorChat?accion=send">
                <input type="hidden" name="idchat" value="${fn:escapeXml(request.getParameter("idchat"))}">
                <input type="hidden" name="idusuario1" value="${fn:escapeXml(request.getParameter("idusuario1"))}">
                <input type="hidden" name="idusuario2" value="${fn:escapeXml(request.getParameter("idusuario2"))}">
                <input type="hidden" name="nombre1" value="${fn:escapeXml(request.getParameter("nombre1"))}">
                <input type="hidden" name="nombre2" value="${fn:escapeXml(request.getParameter("nombre2"))}">
                <input type="text" name="txtmensaje" placeholder="Escribe tu mensaje..." required>
                <button type="submit">Enviar</button>
            </form>
            
        </div>
    </div>

    <script>
        // Auto scroll to the bottom
        var chatMessages = document.getElementById('chat-messages');
        chatMessages.scrollTop = chatMessages.scrollHeight;
    </script>
</body>
</html>
