<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Pedido"%>
<%
    String html = "";
    String nombre_cliente = "";
    nombre_cliente = request.getParameter("nombre_cliente");
    if (nombre_cliente == null) {
        nombre_cliente = "";
    }
    int contador = 0;
    ArrayList<Pedido> pedidos = new gestionPedido().listaCompleta(nombre_cliente, "t2.nombres");
    for (Pedido rs : pedidos) {
        contador++;
        html += "<tr>";
        html += "<td>" + rs.getCodigo_solicitud() + "</td>";
        html += "<td>" + rs.getNombres_apellidos() + "</td>";
        html += "<td>" + "Placa: " + rs.getPlaca_recolector() + " - " + rs.getNombre_recolector() + " - " + rs.getFecha_recolector()  + "</td>";
        html += "<td>" + "Placa: " + rs.getPlaca_repartidor() + " - " + rs.getNombre_repartidor() + " - " + rs.getFecha_repartidor()  + "</td>";
        html += "<td>" + rs.getDistrito() + "</td>";
        html += "<td>" + rs.getPrecio_total() + "</td>";
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='recargar_detalles(" + rs.getCodigo_solicitud() + ")' data-toggle='modal' data-target='#login_modal'>Detalles</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='pedido_eliminar(" + rs.getCodigo_solicitud() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>