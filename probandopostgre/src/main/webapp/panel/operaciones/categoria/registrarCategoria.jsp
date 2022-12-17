<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String descripcion_ca = request.getParameter("descripcion_ca");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    if (!descripcion_ca.equals("")) {
        new gestionCategoria().registrarCategoria(new Categoria("0", descripcion_ca, status));
        result = 1;
    } else {
        result = 2;
    }
    out.print(result);
%>