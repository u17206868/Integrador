<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionCliente"%>
<%
    String id = request.getParameter("id");
    new gestionCliente().eliminarCliente(id);
    out.print(1);
%>