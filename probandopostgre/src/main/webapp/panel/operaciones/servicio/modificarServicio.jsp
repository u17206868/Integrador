<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Servicio"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String codigo_se = request.getParameter("codigo_se");
    String codigo_ca = request.getParameter("codigo_ca");
    String descripcion_se = request.getParameter("descripcion_se");
    String precio_se = request.getParameter("precio_se");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    if (!codigo_ca.equals("0") & !descripcion_se.equals("") & !precio_se.equals("")) {
        new gestionServicio().modificarServicio(new Servicio(codigo_se, codigo_ca, descripcion_se,precio_se, status ));
        result = 1;
    } else {
        result = 2;
    }
    out.print(result);
%>