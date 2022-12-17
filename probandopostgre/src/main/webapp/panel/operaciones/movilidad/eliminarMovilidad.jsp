<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionMovilidad"%>
<%
    String id = request.getParameter("id");
    new gestionMovilidad().eliminarMovilidad(id);
    out.print(1);
%>
