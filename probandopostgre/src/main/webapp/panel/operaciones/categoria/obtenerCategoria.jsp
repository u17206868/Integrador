<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear categoria";
    String button_ajax = "registro_categoria_ajax";
    String dataID1 = "codigo_ca";
    String dataID2 = "descripcion_ca";
    String dataID3 = "status";
    String sms1 = "message_des_categoria_ok";
    String holder1 = "Nombre de la categoria";
    String call_ajax1 = "check_des_categoria();";
    Categoria categoria = new Categoria();
    if (id != null) {
        categoria = new gestionCategoria().obtenerCategoria(id);
        button_name = "Modificar categoria";
        button_ajax = "modificar_categoria_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + categoria.getCodigo_ca() + "'></div></div>" 
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID2 + "' placeholder='" + holder1 + "' value='" + categoria.getDescripcion_ca() + "' "
            + "onkeyup='" + call_ajax1 + "'><span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID3 + "'>";
    if (categoria.getStatus()) {
        html += "<option value='true' selected>Activo</option>"
                + "<option value='false'>Inactivo</option>";
    } else {
        html += "<option value='true'>Activo</option>"
                + "<option value='false' selected>Inactivo</option>";
    }
    html += "</select>"
            + "</div></div>"
            + "<div class='col-xl-12'><div class='form-group'> "
            + "<center><button type='button' id='boton_login' "
            + "onclick='" + button_ajax + "()' class='btn btn-primary'>" + button_name + "</button>"
            + "<div class='col-xl-12' id='mensaje_error_registro'></div>"
            + "</center> </div> </div>";
    out.print(html);
%>