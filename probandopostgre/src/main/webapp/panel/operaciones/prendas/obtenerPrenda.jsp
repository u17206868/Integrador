<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="entidades.Prenda"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear Prenda";
    String button_ajax = "registro_prenda_ajax";
    String dataID1 = "codigo_prenda";
    String dataID2 = "nombre_prenda";
    String dataID3 = "status";
    String sms1 = "message_descripcion_prenda_ok";
    String sms2 = "message_status_ok";
    String holder1 = "Nombre de la prenda";
    String call_ajax1 = "check_prenda();";
    String call_ajax2 = "check_select_status();";
    Prenda prenda = new Prenda();
    if (id != null) {
        prenda = new gestionPrenda().obtenerPrenda(id);
        button_name = "Modificar Prenda";
        button_ajax = "modificar_prenda_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + prenda.getCodigo_prenda() + "'></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID2 + "' placeholder='" + holder1 + "' value='" + prenda.getNombre_prenda() + "' "
            + "onkeyup='" + call_ajax1 + "'><span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID3 + "' onchange='" + call_ajax2 + "'>";
    if (prenda.getStatus()) {
        html += "<option value='true' selected>Activo</option>"
                + "<option value='false'>Inactivo</option>";
    } else {
        html += "<option value='true'>Activo</option>"
                + "<option value='false' selected>Inactivo</option>";
    }
    html += "</select>"
            + "<span id='" + sms2 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'><div class='form-group'> "
            + "<center><button type='button' id='boton_login' "
            + "onclick='" + button_ajax + "()' class='btn btn-primary'>" + button_name + "</button>"
            + "<div class='col-xl-12' id='mensaje_error_registro'></div>"
            + "</center> </div> </div>";
    out.print(html);
%>