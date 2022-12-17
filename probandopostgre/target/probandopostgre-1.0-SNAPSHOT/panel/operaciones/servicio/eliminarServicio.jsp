<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionServicio"%>
<%
    String id = request.getParameter("id");
    new gestionServicio().eliminarServicio(id);
    out.print(1);
%>
