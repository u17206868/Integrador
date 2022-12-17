<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Detalle"%>
<%
    String html = "";
    String nombre_cliente = "";
    int codigo_solicitud;
    nombre_cliente = request.getParameter("codigo");
    if (nombre_cliente == null) {
        codigo_solicitud = 0;
    }
    else
    {
      codigo_solicitud = Integer.parseInt(request.getParameter("codigo"));
    }
    ArrayList<Detalle> detalles = new gestionPedido().filtrarDetalle(codigo_solicitud);
    for (Detalle rs : detalles) {
        html += "<tr>";
        html += "<td>" + rs.getCantidad() + " " + rs.getDescripcion_se() + " - " + rs.getNombre_prenda() + "</td>";
        html += "<td>" + rs.getDescripcion() + "</td>";
        html += "<td>" + rs.getSub_total()  + "</td>";
        html += "<tr/>";
    }
    out.print(html);
%>