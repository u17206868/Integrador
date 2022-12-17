<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionChofer"%>
<%
    String id = request.getParameter("id");
    new gestionChofer().eliminarChofer(id);
    out.print(1);
%>
