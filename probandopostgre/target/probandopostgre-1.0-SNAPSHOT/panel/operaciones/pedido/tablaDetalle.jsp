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
        html += "<td>" + rs.getCodigo_detalle() + "</td>";
        html += "<td>" + rs.getCodigo_solicitud() + "</td>";
        html += "<td>" + rs.getNombre_prenda()  + "</td>";
        html += "<td>" + rs.getCantidad()  + "</td>";
        html += "<td>" + rs.getDescripcion_ca() + "</td>";
        html += "<td>" + rs.getDescripcion_se() + "</td>";
        html += "<td>" + rs.getDescripcion() + "</td>";
        html += "<td>" + rs.getSub_total() + "</td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='cargar_detalle(" + rs.getCodigo_detalle() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='detalle_eliminar(" + rs.getCodigo_detalle() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>