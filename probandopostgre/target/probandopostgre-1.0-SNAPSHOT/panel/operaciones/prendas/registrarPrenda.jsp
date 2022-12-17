<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="entidades.Prenda"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String nombre_prenda = request.getParameter("nombre_prenda");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    if (!nombre_prenda.equals("")) {
        new gestionPrenda().registrarPrenda(new Prenda(0, nombre_prenda, status));
        result = 1;
    } else {
        result = 2;
    }
    out.print(result);
%>