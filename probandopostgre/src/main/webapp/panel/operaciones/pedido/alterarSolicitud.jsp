<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%
    HttpSession sesion = request.getSession();
    int codigo_tipo = Integer.parseInt(request.getParameter("codigo_tipo"));
    int result = 0;
    if (codigo_tipo == 1) {
        result = new gestionPedido().registrarIngresoSalida(Integer.parseInt(request.getParameter("codigo_solicitud")), true);
    }
    else if (codigo_tipo == 2) {
        result = new gestionPedido().registrarIngresoSalida(Integer.parseInt(request.getParameter("codigo_solicitud")), false);
    }
    else if (codigo_tipo == 3)
    {
        result = new gestionPedido().completarSolicitud(Integer.parseInt(request.getParameter("codigo_solicitud")));
    }
    else if (codigo_tipo == 4)
    {
        result = new gestionPedido().cancelarSolicitud(Integer.parseInt(request.getParameter("codigo_solicitud")));
    }
    out.print(result);
%>