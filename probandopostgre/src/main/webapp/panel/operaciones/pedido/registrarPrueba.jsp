<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Consultar"%>
<%@page import="entidades.Detalle"%>
<%
    int result = 0;
    HttpSession sesion = request.getSession();
    ArrayList<Detalle> detalles = new gestionPedido().pruebaDetalles(request.getParameter("prendas_tipo"), request.getParameter("prendas_cantidad"),
            request.getParameter("prendas_categoria"), request.getParameter("prendas_servicio"), request.getParameter("prendas_descripcion"), request.getParameter("sub_total"));
    for (Detalle x : detalles) {
        out.println(x.getCodigo_detalle() + x.getCodigo_solicitud() + x.getNombre_prenda() + x.getCantidad() + x.getDescripcion_ca() + x.getDescripcion_se() + x.getDescripcion() + x.getSub_total() + "-------");
    }
%>