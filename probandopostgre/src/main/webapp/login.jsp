<%-- 
    Document   : login
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="procesos.gestionLogin"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    //JSONArray jsonArray = new JSONArray();

    String dni = request.getParameter("dni");
    String password = request.getParameter("password");
    if (dni.length() < 9) {
        dni = "c123123123";
    }
    if (dni.substring(0, 1).equals("c")) {
        out.print(new gestionLogin().loginCliente(dni.substring(1, 9), password, sesion));
    } else if (dni.substring(0, 1).equals("u") | dni.substring(0, 1).equals("a")) {
        out.print(new gestionLogin().loginUsuario(dni.substring(1, 9), password, sesion));
    } else {
        out.print(5);
    }
%>