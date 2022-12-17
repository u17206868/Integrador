<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionMovilidad"%>
<%@page import="entidades.Movilidad"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String marca_mo = request.getParameter("marca_mo");
    String modelo_mo = request.getParameter("modelo_mo");
    String placa_mo = request.getParameter("placa_mo");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    if (!marca_mo.equals("") & !modelo_mo.equals("") & !placa_mo.equals("")) {
        new gestionMovilidad().registrarMovilidad(new Movilidad("0", marca_mo, modelo_mo, placa_mo, status));
        result = 1;
    } else {
        result = 2;
    }
    out.print(result);
%>