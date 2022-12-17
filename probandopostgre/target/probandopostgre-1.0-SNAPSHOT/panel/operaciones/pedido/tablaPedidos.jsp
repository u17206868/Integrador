<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Pedido"%>
<%
    String html = "";
    String nombre_cliente = "";
    nombre_cliente = request.getParameter("txt_buscar");
    if (nombre_cliente == null) {
        nombre_cliente = "";
    }
    int contador = 0;
    ArrayList<Pedido> pedidos = new gestionPedido().listaCompleta(nombre_cliente, "t2.dni");
    for (Pedido rs : pedidos) {
        contador++;
        html += "<tr>";
        html += "<td>" + rs.getCodigo_solicitud() + "</td>";
        if (rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00")) {
            html += "<td style='color:#D33242'>Aún no ingreso a la lavanderia</td>";
        } else {
            html += "<td style='color:#2F7CFF'>" + rs.getFecha_hora_ingreso() + "</td>";
        }
        if (rs.getFecha_hora_salida().equals("2000-01-01 12:00:00")) {
            html += "<td style='color:#D33242'>Aún no salio de la lavanderia</td>";
        } else {
            html += "<td style='color:#2F7CFF'>" + rs.getFecha_hora_salida() + "</td>";
        }
        if (rs.getTipo_pedido()) {
            html += "<td>No disponible</td>";
            html += "<td>Presencial</td>";
        } else {
            html += "<td>" + rs.getDistrito() + "</td>";
            html += "<td>Delivery</td>";
        }
        html += "<td>" + rs.getPrecio_total() + "</td>";
        html += "<td><button type='button' class='btn btn-outline-primary' onclick='recargar_detalles(" + rs.getCodigo_solicitud() + ")' data-toggle='modal' data-target='#login_modal'>Detalles+</button></td>";
        if (rs.getCancelado() == true) {
            html += "<td style='color:#D33242'>Cancelado</td>";
            html += "<td>No disponible</td>";
        } else if (rs.getStatus() == false) {
            html += "<td style='color:#28A745'>Completado</td>";//2F7CFF
            html += "<td>No disponible</td>";
        } else {
            html += "<td>Pendiente...</td>";
        }
        if (rs.getCancelado() == false & rs.getStatus() == true) {
            html += "<td><button type='button' class='btn btn-outline-danger' onclick='eliminar_pedido(" + rs.getCodigo_solicitud() + ")'>Cancelar</button></td>";
        }
        html += "<tr/>";
    }
    out.print(html);
%>