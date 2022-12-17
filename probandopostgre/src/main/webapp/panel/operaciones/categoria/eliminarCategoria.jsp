<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionCategoria"%>
<%
    String id = request.getParameter("id");
    new gestionCategoria().eliminarCategoria(id);
    out.print(1);
%>
