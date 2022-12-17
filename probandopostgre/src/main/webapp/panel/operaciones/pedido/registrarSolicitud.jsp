<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Solicitud"%>
<%
    HttpSession sesion = request.getSession();
    int result = new gestionPedido().generarSolicitud(Integer.parseInt(request.getParameter("tipo_solicitud")),new Solicitud(0,Integer.parseInt(request.getParameter("id-item")),Integer.parseInt(request.getParameter("chofer_visita")),
            Integer.parseInt(request.getParameter("fecha_visita")),Integer.parseInt(request.getParameter("horario_visita")),Integer.parseInt(request.getParameter("chofer_entrega")),
            Integer.parseInt(request.getParameter("fecha_entrega")),Integer.parseInt(request.getParameter("horario_entrega")),Integer.parseInt(request.getParameter("cod_departamento")),
            Integer.parseInt(request.getParameter("cod_provincia")),Integer.parseInt(request.getParameter("cod_distrito")),Integer.parseInt(request.getParameter("precio_total")),true,
            "2000-01-01 12:00:00","2000-01-01 12:00:00",Boolean.parseBoolean(request.getParameter("tipo_atencion")),false,
            request.getParameter("prendas_tipo"),request.getParameter("prendas_cantidad"),request.getParameter("prendas_categoria"),request.getParameter("prendas_servicio"),
            request.getParameter("prendas_descripcion"),request.getParameter("sub_total")));
    out.print(result);
%>