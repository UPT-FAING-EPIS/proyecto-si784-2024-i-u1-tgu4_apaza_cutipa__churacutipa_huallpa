<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Chat" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chats Disponibles</title>
    <style>
        <%@ include file="/Usuario/common_styles.jsp" %>
    </style>
    <link rel="icon" type="image/jpeg" href="imagenes\logo.jpeg"> 
</head>
<body>
    <div class="menu">
  <a href="ControladorLogin?accion=redirigirInicio">Inicio</a>
  <a href="ControladorChat?accion=allchats">Chat</a>
  <a href="ControladorNotificacion?accion=notificacion">Notificaciones</a>
  <a href="ControladorPerfil?accion=perfil">Perfil</a>
  <a href="ControladorUsuario?accion=control">Control de usuarios</a>
  <a href="ControladorLogin?accion=logout">Cerrar Sesión</a>
</div>
    <h1>Chats Disponibles</h1>

    <%-- Obtener la lista de chats del atributo de la solicitud --%>
    <% List<Chat> listaChats = (List<Chat>) request.getAttribute("listaChats");
    int idusuario = (int) session.getAttribute("idusuario");%>

    <table border="1">
        <thead>
            <tr>
                <th>Nombre 1</th>
                <th>Nombre 2</th>
                <th>Fecha</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterar sobre la lista de chats y mostrar la información --%>
            <% for (Chat chat : listaChats) { %>
                <tr>
                    <td><%= chat.getNombre1()%></td>
                    <td><%= chat.getNombre2()%></td>
                    <td><%= chat.getFechacreacion() %></td>
                    <td><a href="ControladorChat?accion=chat&idusuario1=<%= chat.getIdusuario1()%>&idusuario2=<%= chat.getIdusuario2()%>&idchat=<%= chat.getIdchat()%>&nombre1=<%= chat.getNombre1()%>&nombre2=<%= chat.getNombre2()%>">Ir al chat</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
