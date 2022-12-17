<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear servicio";
    String button_ajax = "registro_servicio_ajax";
    String dataID1 = "codigo_se";
    String dataID2 = "codigo_ca";
    String dataID3 = "descripcion_se";
    String dataID4 = "precio_se";
    String dataID5 = "status";
    String sms1 = "message_servicio_ca_ok";
    String sms2 = "message_descripcion_se_ok";
    String sms3 = "message_precio_se_ok";
    String holder1 = "Marca";
    String holder2 = "Nombre del servicio";
    String holder3 = "Precio";
    String call_ajax1 = "check_select_categoria();";
    String call_ajax2 = "check_servicio();";
    String call_ajax3 = "check_precio();";
    Servicio servicio = new Servicio();
    ArrayList<Categoria> categorias = new gestionCategoria().filtrarCategoria("");
    if (id != null) {
        servicio = new gestionServicio().obtenerServicio(id);
        button_name = "Modificar servicio";
        button_ajax = "modificar_servicio_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + servicio.getCodigo_se() + "'></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID2 + "' onchange='" + call_ajax1 + "'>"
            + "<option value='0'>Categorias</option>";
    for (Categoria rs : categorias) {
        if (servicio.getCodigo_ca().equals(rs.getCodigo_ca())) {
            html += "<option value='" + rs.getCodigo_ca() + "' selected>" + rs.getDescripcion_ca() + "</option>";
        } else {
            html += "<option value='" + rs.getCodigo_ca() + "'>" + rs.getDescripcion_ca() + "</option>";
        }
    }
    html += "</select>"
            + "<span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID3 + "' placeholder='" + holder2 + "' value='" + servicio.getDescripcion_se() + "' "
            + "onkeyup='" + call_ajax2 + "'><span id='" + sms2 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID4 + "' placeholder='" + holder3 + "' value='" + servicio.getPrecio_se() + "' maxlength='4' onkeypress='validate(event);' "
            + "onkeyup='" + call_ajax3 + "'><span id='" + sms3 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID5 + "'>";
    if (servicio.getStatus()) {
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