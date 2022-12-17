<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionChofer"%>
<%@page import="entidades.Chofer"%>
<%
    String html = "";
    String nombre_cho = "";
    nombre_cho = request.getParameter("nombre_cho");
    if (nombre_cho == null) {
        nombre_cho = "";
    }
    String call_ajax1 = "cargar_chofer";
    String call_ajax2 = "chofer_eliminar";
    String call_ajax3 = "chofer_horario";
    ArrayList<Chofer> choferes = new gestionChofer().filtrarChofer(nombre_cho);
    for (Chofer rs : choferes) {
        html += "<tr>";
        html += "<td>" + rs.getCodigo_cho() + "</td>";
        html += "<td>" + rs.getId_movilidad() + "</td>";
        html += "<td>" + rs.getNombre_cho() + "</td>";
        html += "<td>" + rs.getApellido_cho() + "</td>";
        html += "<td>" + rs.getDisponibilidad_cho() + "</td>";
        if (rs.getTipo_chofer()) {
            html += "<td>Recolector</td>";
        } else {
            html += "<td>Repartidor</td>";
        }
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #4D86D5;cursor: pointer;' onclick='"+ call_ajax3 +"(" + rs.getCodigo_cho() + ")' data-toggle='modal' data-target='#login_modal'>Horario+</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax1 +"(" + rs.getCodigo_cho() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax2 +"(" + rs.getCodigo_cho() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>