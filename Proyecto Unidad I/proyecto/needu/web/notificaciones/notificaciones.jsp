<%@page import="java.util.List"%>
<%@page import="ModeloDAO.NotificacionDAO"%>
<%@page import="Modelo.Notificacion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Notificaciones</title>
    <meta charset="UTF-8">
    <title>Notificaciones</title>
    <style>
        <%@ include file="/notificaciones/common_styles.jsp" %>
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
    <%
    int idusuario = (int) session.getAttribute("idusuario");
    NotificacionDAO dao = new NotificacionDAO();
    List<Notificacion> lista = dao.listarMensajes(idusuario);
%>
    <div class="container">
        <h1>Notificaciones</h1>
        <div class="notification">
            <h3>Mensajes    <h4><a href="ControladorNotificacion?accion=marcar">Marcar como leído todas</a></h4></h3>
            <ul class="notification-list">
                <% for (Notificacion not : lista) { %>
                    <li class="notification-item">
                        <strong><%= not.getFecha() %></strong><br>
                        <%= not.getMensaje() %><br>
                        <a href="ControladorChat?accion=allchats">Abrir</a>
                    </li>
                <% } %>
            </ul>
        </div>
        <div class="notification">
            <h3>Solicitudes</h3>
            <ul class="notification-list">
                <% lista = dao.listarSolicitudes(idusuario);
                for (Notificacion not : lista) { %>
                    <li class="notification-item">
                        <strong><%= not.getFecha() %></strong><br>
                        <%= not.getMensaje() %><br>
                        <a href="#">Abrir</a>
                    </li>
                <% } %>
            </ul>
        </div>
        <div class="notification">
            <h3>Aprobaciones</h3>
            <ul class="notification-list">
                <% lista = dao.listarAprobaciones(idusuario);
                for (Notificacion not : lista) { %>
                    <li class="notification-item">
                        <strong><%= not.getFecha() %></strong><br>
                        <%= not.getMensaje() %><br>
                        <a href="#">Abrir</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</body>
</html>
