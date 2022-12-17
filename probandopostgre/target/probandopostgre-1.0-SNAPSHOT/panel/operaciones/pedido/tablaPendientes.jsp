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
    ArrayList<Pedido> pedidos = new gestionPedido().filtrarLista(nombre_cliente, "t2.dni");
    for (Pedido rs : pedidos) {
        contador++;
        html += "<tr>";
        html += "<td>" + rs.getCodigo_solicitud() + "</td>";
        html += "<td>" + rs.getNombres_apellidos() + "</td>";
        if (rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00")) {
            html += "<td><button type='button' class='btn btn-outline-info' onclick='reg_ingreso(" + rs.getCodigo_solicitud() + ")'>Registrar ingreso</button></td>";
            html += "<td>Esperando recepción</td>";
        } else {
            html += "<td>" + rs.getFecha_hora_ingreso() + "</td>";
        }
        if (rs.getFecha_hora_salida().equals("2000-01-01 12:00:00") & !rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00")) {
            html += "<td><button type='button' class='btn btn-outline-info' onclick='reg_salida(" + rs.getCodigo_solicitud() + ")'>Registrar salida</button></td>";
        } else if (!rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00")) {
            html += "<td>" + rs.getFecha_hora_salida() + "</td>";
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
        if (rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00") | rs.getFecha_hora_salida().equals("2000-01-01 12:00:00")) {
            html += "<td>Pendiente...</td>";
        } else {
            html += "<td><button type='button' class='btn btn-outline-success' onclick='completar_pedido(" + rs.getCodigo_solicitud() + ")'>Completar</button></td>";
        }
        html += "<td><button type='button' class='btn btn-outline-danger' onclick='eliminar_pedido(" + rs.getCodigo_solicitud() + ")'>Cancelar</button></td>";
        html += "<tr/>";
    }
    out.print(html);
%>