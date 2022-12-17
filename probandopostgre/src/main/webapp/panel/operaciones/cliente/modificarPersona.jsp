<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%
    int result = 0;
    int type = Integer.parseInt(request.getParameter("type"));
    String password = request.getParameter("password");
    String repeatpassword = request.getParameter("repeatpassword");
    String dni = request.getParameter("dni");
    if (!password.equals("") & !repeatpassword.equals("")) {
        if (password.equals(repeatpassword)) {
            new gestionCliente().modificarPassword(password, dni, type);
            result = 1;
        } else {
            result = 2;
        }
    } else {
        result = 4;
    }
    out.print(result);
%>