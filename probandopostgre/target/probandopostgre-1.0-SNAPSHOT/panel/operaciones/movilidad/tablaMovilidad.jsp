<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionMovilidad"%>
<%@page import="entidades.Movilidad"%>
<%
    String html = "";
    String marca_mo = "";
    marca_mo = request.getParameter("marca_mo");
    if (marca_mo == null) {
        marca_mo = "";
    }
    String call_ajax1 = "cargar_movilidad";
    String call_ajax2 = "movilidad_eliminar";
    ArrayList<Movilidad> movilidades = new gestionMovilidad().filtrarMovilidades(marca_mo);
    for (Movilidad rs : movilidades) {
        html += "<tr>";
        html += "<td>" + rs.getCod_mo() + "</td>";
        html += "<td>" + rs.getMarca_mo() + "</td>";
        html += "<td>" + rs.getModelo_mo() + "</td>";
        html += "<td>" + rs.getPlaca_mo() + "</td>";
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax1 +"(" + rs.getCod_mo() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax2 +"(" + rs.getCod_mo() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>