<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="entidades.Prenda"%>
<%
    String html = "";
    String nombre_prenda = "";
    nombre_prenda = request.getParameter("nombre_prenda");
    if (nombre_prenda == null) {
        nombre_prenda = "";
    }
    String call_ajax1 = "cargar_prenda";
    String call_ajax2 = "prenda_eliminar";
    ArrayList<Prenda> prendas = new gestionPrenda().filtrarPrenda(nombre_prenda);
    for (Prenda rs : prendas) {
        html += "<tr>";
        html += "<td>" + rs.getCodigo_prenda() + "</td>";
        html += "<td>" + rs.getNombre_prenda() + "</td>";
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='" + call_ajax1 + "(" + rs.getCodigo_prenda() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='" + call_ajax2 + "(" + rs.getCodigo_prenda() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>