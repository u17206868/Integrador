<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Servicio"%>
<%
    String html = "";
    String descripcion_se = "";
    descripcion_se = request.getParameter("descripcion_se");
    if (descripcion_se == null) {
        descripcion_se = "";
    }
    String call_ajax1 = "cargar_servicio";
    String call_ajax2 = "servicio_eliminar";
    ArrayList<Servicio> servicios = new gestionServicio().filtrarServicio(descripcion_se);
    for (Servicio rs : servicios) {
        html += "<tr>";
        html += "<td>" + rs.getCodigo_se() + "</td>";
        html += "<td>" + rs.getCodigo_ca() + "</td>";
        html += "<td>" + rs.getDescripcion_se() + "</td>";
        html += "<td>" + rs.getPrecio_se() + "</td>";
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax1 +"(" + rs.getCodigo_se() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax2 +"(" + rs.getCodigo_se() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>