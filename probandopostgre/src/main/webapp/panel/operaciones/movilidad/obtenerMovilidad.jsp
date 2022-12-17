<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionMovilidad"%>
<%@page import="entidades.Movilidad"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear movilidad";
    String button_ajax = "registro_movilidad_ajax";
    String dataID1 = "id_movilidad";
    String dataID2 = "marca_mo";
    String dataID3 = "modelo_mo";
    String dataID4 = "placa_mo";
    String dataID5 = "status";
    String sms1 = "message_marca_ok";
    String sms2 = "message_modelo_ok";
    String sms3 = "message_placa_ok";
    String holder1 = "Marca";
    String holder2 = "Modelo";
    String holder3 = "Placa";
    String call_ajax1 = "check_marca();";
    String call_ajax2 = "check_modelo();";
    String call_ajax3 = "check_placa();";
    Movilidad movilidad = new Movilidad();
    if (id != null) {
        movilidad = new gestionMovilidad().obtenerMovilidad(id);
        button_name = "Modificar movilidad";
        button_ajax = "modificar_movilidad_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + movilidad.getCod_mo() + "'></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID2 + "' placeholder='" + holder1 + "' value='" + movilidad.getMarca_mo() + "' "
            + "onkeyup='" + call_ajax1 + "'><span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID3 + "' placeholder='" + holder2 + "' value='" + movilidad.getModelo_mo() + "' "
            + "onkeyup='" + call_ajax2 + "'><span id='" + sms2 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID4 + "' placeholder='" + holder3 + "' value='" + movilidad.getPlaca_mo() + "' "
            + "onkeyup='" + call_ajax3 + "'><span id='" + sms3 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID5 + "'>";
    if (movilidad.getStatus()) {
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