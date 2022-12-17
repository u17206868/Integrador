<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionUsuario"%>
<%
    String id = request.getParameter("id");
    new gestionUsuario().eliminarUsuario(id);
    out.print(1);
%>