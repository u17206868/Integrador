<%-- 
    Document   : register
    Created on : 29 set. 2022, 00:47:23
    Author     : tianb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.JavaEmailSender"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Pedido"%>
<%@page import="entidades.Detalle"%>
<%
    int cod_pedido = Integer.parseInt(request.getParameter("cod_pedido"));
    Pedido pedido = new gestionPedido().getPedido(cod_pedido);
    ArrayList<Detalle> detalles = new gestionPedido().getDetalle(cod_pedido);
    String html = "<table style='max-width: 600px; padding: 10px; margin:0 auto; border-collapse: collapse;'>"
            + "<tr>"
            + "<td style='background-color: #154fc0; text-align: left; padding: 0'>"
            + "<img width='20%' style='display:block; margin: 1.5% 3%' src='http://129.151.111.223:8080/titulo.png'></td></tr><tr>"
            + "<td style='background-color: #ecf0f1'>"
            + "<div style='color: #34495e; margin: 4% 10% 2%; text-align: justify;font-family: sans-serif'>"
            + "<h2 style='color: #e67e22; margin: 0 0 7px'>"
            + "Hola, " + pedido.getNombres_apellidos() + ".<br>Gracias por solicitar nuestros servicios."
            + "</h2> <p style='margin: 2px; font-size: 15px'>"
            + "Aqui tiene los detalles de su pedido:<br><br>"
            + "Numero del pedido: " + pedido.getCodigo_solicitud() + "<br>"
            //+ "Fecha de pedido: Viernes, 12 de noviembre de 2022</p><br>"
            + "<table style='max-width: 600px; padding: 10px; margin:30 auto; border-collapse: collapse;' style='background-color: #ecf0f1' border='1px solid #dee2e6'>"
            + "<thead><tr><th>Prenda</th><th>Cantidad.</th><th>Servicio</th><th>Sub Total</th></tr></thead>"
            + "<tbody>";
    for (Detalle rs : detalles) {
    html += "<tr>"
            + "<td>" + rs.getNombre_prenda() + "</td>"
            + "<td>" + rs.getCantidad() + "</td>"
            + "<td>" + rs.getDescripcion_se() + "</td>"
            + "<td>S/" + rs.getSub_total() + ".00</td>"
            + "</tr>";
    }
            html += "<tr><th id='total' colspan='3'>Total:</th><td>S/" + pedido.getPrecio_total() + ".00</td></tr>"
            + "</tbody></table><br><div style='width: 100%; text-align: center'>"
            + "<a style='text-decoration: none; border-radius: 5px; padding: 11px 23px; color: white; background-color: #3498db' href='http://129.151.111.223:8080/lavanderiautp/'>"
            + "Ir a la pagina</a> </div> <p style='color: #b3b3b3; font-size: 12px; text-align: center;margin: 30px 0 0'>"
            + "Copyright © LavanderiaUTP 2022</p> </div> </td> </tr> </table>";
    new JavaEmailSender(pedido.getCorreo(), "Lavanderia UTP - Información del pedido", html).generarCorreo();
    out.print(0);
%>