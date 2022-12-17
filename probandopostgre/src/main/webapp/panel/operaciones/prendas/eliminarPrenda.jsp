<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionPrenda"%>
<%
    String id = request.getParameter("id");
    new gestionPrenda().eliminarPrenda(id);
    out.print(1);
%>
