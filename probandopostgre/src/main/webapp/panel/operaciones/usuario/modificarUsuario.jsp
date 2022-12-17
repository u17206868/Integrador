<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionUsuario"%>
<%@page import="entidades.Usuario"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String direccion = request.getParameter("direccion");
    String email = request.getParameter("email");
    String celular = request.getParameter("celular");
    String dni = request.getParameter("nuevo_dni");
    String password = request.getParameter("password");
    String repeatpassword = request.getParameter("repeatpassword");
    String id = request.getParameter("id");
    String actual_dni = request.getParameter("actual_dni");
    if (!nombres.equals("") & !apellidos.equals("") & !direccion.equals("")
            & !email.equals("") & !celular.equals("") & !dni.equals("")
            & !password.equals("") & !repeatpassword.equals("")) {
        if (password.equals(repeatpassword)) {
            if (dni.equals(actual_dni)) {
                new gestionUsuario().modificarUsuario(new Usuario(id, "2", nombres, apellidos, direccion, email, celular, dni, password));
                result = 1;
            } else {
                if (new gestionUsuario().obtenerDni(dni, id) == 0) {
                    new gestionUsuario().modificarUsuario(new Usuario(id, "2", nombres, apellidos, direccion, email, celular, dni, password));
                    result = 1;
                } else {
                    result = 3;
                }
            }
        } else {
            result = 2;
        }
    } else {
        result = 4;
    }
    out.print(result);
%>