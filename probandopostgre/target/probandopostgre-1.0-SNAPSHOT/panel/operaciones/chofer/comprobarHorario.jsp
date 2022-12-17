<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionHorario"%>
<%
    HttpSession sesion = request.getSession();
    int codigo_cho = Integer.parseInt(request.getParameter("codigo_cho"));
    String cod_month = request.getParameter("cod_month");
    String cod_year = request.getParameter("cod_year");
    String nueva_fecha = cod_year + "-" + cod_month + "-01" ;
    out.print(new gestionHorario().registrarHorario(codigo_cho, nueva_fecha));
%>