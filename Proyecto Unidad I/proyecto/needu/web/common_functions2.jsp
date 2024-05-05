<div class="contenedor-oportunidades">
    <% 
        OportunidadDAO oportunidadDao = new OportunidadDAO();
        List<Map<String, Object>> oportunidades = oportunidadDao.listarOportunidades();
        if (!oportunidades.isEmpty()) {
            for (Map<String, Object> opo : oportunidades) {
    %>
        <!-- Cada oportunidad es un 'card' en la cuadrícula -->
        <div class='card-oportunidad'>
            <img src="imagenes/imaGenerico.png" alt="Imagen genérica" class="imagen-oportunidad">
            <div class="info-oportunidad">
                <h2><%= opo.get("titulo").toString() %></h2>
                <p>Descripción: <%= opo.get("descripcion").toString() %></p>
                <p>Fecha: <%= opo.get("fecha").toString() %></p>
                <p>Organización: <%= opo.get("nombreOrganizacion").toString() %></p>
                <!-- Botón de compartir en Facebook -->
                <div class="fb-share-button" 
                    data-href="${fn:escapeXml(request.getRequestURL())}"
                    data-layout="button_count" 
                    data-size="small"
                    data-description="<%= opo.get("descripcion").toString() %>">
                    <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=${fn:escapeXml(request.getRequestURL())}&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Compartir</a>
                </div>
                <!-- Botón de compartir en Twitter -->
                <div>
                    <a href="https://twitter.com/share?text=<%= "¡Únete a esta oportunidad en NeedU_UPT!%0A%0ATítulo: " + opo.get("titulo").toString() + "%0ADescripción: " + opo.get("descripcion").toString().replaceAll("\\n", "%0A") %>" class="twitter-share-button" data-show-count="false">Tweet</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
                <a href="InfoOportunidad.jsp?idoportunidad=<%= opo.get("idoportunidad").toString() %>" class="btn-ver-mas">Ver más acerca de esta Oportunidad</a>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <p>No hay oportunidades disponibles</p>
    <%
        }
    %>
</div>