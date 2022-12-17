<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionChofer"%>
<%@page import="entidades.Chofer"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    String codigo_cho = request.getParameter("codigo_cho");
    String id_movilidad = request.getParameter("id_movilidad");
    String nombre_cho = request.getParameter("nombre_cho");
    String apellido_cho = request.getParameter("apellido_cho");
    String disponibilidad_cho = request.getParameter("disponibilidad_cho");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    boolean tipo_chofer = Boolean.parseBoolean(request.getParameter("tipo_chofer"));
    if (!id_movilidad.equals("0") & !nombre_cho.equals("") & !apellido_cho.equals("") & !disponibilidad_cho.equals("")) {
        new gestionChofer().modificarChofer(new Chofer(codigo_cho, id_movilidad, nombre_cho, apellido_cho, disponibilidad_cho, status, tipo_chofer ));
        result = 1;
    } else {
        result = 2;
    }
    out.print(result);
%>