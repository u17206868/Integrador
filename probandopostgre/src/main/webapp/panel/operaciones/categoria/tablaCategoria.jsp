<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
<%
    String html = "";
    String descripcion_ca = "";
    descripcion_ca = request.getParameter("descripcion_ca");
    if (descripcion_ca == null) {
        descripcion_ca = "";
    }
    String call_ajax1 = "cargar_categoria";
    String call_ajax2 = "categoria_eliminar";
    ArrayList<Categoria> categorias = new gestionCategoria().filtrarCategoria(descripcion_ca);
    for (Categoria rs : categorias) {
        html += "<tr>";
        html += "<td>" + rs.getCodigo_ca() + "</td>";
        html += "<td>" + rs.getDescripcion_ca() + "</td>";
        if (rs.getStatus()) {
            html += "<td>Activo</td>";
        } else {
            html += "<td>Inactivo</td>";
        }
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax1 +"(" + rs.getCodigo_ca() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='"+ call_ajax2 +"(" + rs.getCodigo_ca() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>