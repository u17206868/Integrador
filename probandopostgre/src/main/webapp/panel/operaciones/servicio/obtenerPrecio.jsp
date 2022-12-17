<%@page import="procesos.gestionServicio"%>
<%
    int html = new gestionServicio().obtenerPrecio(request.getParameter("descripcion_se"));
    out.print(html);
%>