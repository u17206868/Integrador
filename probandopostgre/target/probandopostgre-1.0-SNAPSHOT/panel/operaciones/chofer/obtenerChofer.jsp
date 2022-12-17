<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionChofer"%>
<%@page import="entidades.Chofer"%>
<%@page import="procesos.gestionMovilidad"%>
<%@page import="entidades.Movilidad"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear chofer";
    String button_ajax = "registro_chofer_ajax";
    String dataID1 = "codigo_cho";
    String dataID2 = "id_movilidad";
    String dataID3 = "register_nombres";
    String dataID4 = "register_apellidos";
    String dataID5 = "disponibilidad_cho";
    String dataID6 = "status";
    String dataID7 = "tipo_chofer";
    String sms1 = "message_chofer_mov_ok";
    String sms2 = "message_nombres_ok";
    String sms3 = "message_apellidos_ok";
    String sms4 = "message_disponibilidad_cho_ok";
    String holder1 = "Nombre(s)";
    String holder2 = "Apellido(s)";
    String holder3 = "Disponibilidad";
    String call_ajax1 = "check_select_movilidad();";
    String call_ajax2 = "check_nombres();";
    String call_ajax3 = "check_apellidos();";
    String call_ajax4 = "check_disponibilidad();";
    Chofer chofer = new Chofer();
    ArrayList<Movilidad> movilidades = new gestionMovilidad().filtrarMovilidades("");
    if (id != null) {
        chofer = new gestionChofer().obtenerChofer(id);
        button_name = "Modificar chofer";
        button_ajax = "modificar_chofer_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + chofer.getCodigo_cho() + "'></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID2 + "' onchange='" + call_ajax1 + "'>"
            + "<option value='0'>Movilidades</option>";
    for (Movilidad rs : movilidades) {
        if (chofer.getId_movilidad().equals(rs.getCod_mo())) {
            html += "<option value='" + rs.getCod_mo() + "' selected>" + rs.getMarca_mo() + " - " + rs.getModelo_mo() + " - " + rs.getPlaca_mo() + "</option>";
        } else {
            html += "<option value='" + rs.getCod_mo() + "'>" + rs.getMarca_mo() + " - " + rs.getModelo_mo() + " - " + rs.getPlaca_mo() + "</option>";
        }
    }
    html += "</select>"
            + "<span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID3 + "' placeholder='" + holder1 + "' value='" + chofer.getNombre_cho() + "' "
            + "onkeyup='" + call_ajax2 + "'><span id='" + sms2 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID4 + "' placeholder='" + holder2 + "' value='" + chofer.getApellido_cho() + "' "
            + "onkeyup='" + call_ajax3 + "'><span id='" + sms3 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='" + dataID5 + "' placeholder='" + holder3 + "' value='" + chofer.getDisponibilidad_cho() + "' "
            + "onkeyup='" + call_ajax4 + "'><span id='" + sms4 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID7 + "'>";
    if (chofer.getTipo_chofer()) {
        html += "<option value='true' selected>Recolector</option>"
                + "<option value='false'>Repartidor</option>";
    } else {
        html += "<option value='true'>Recolector</option>"
                + "<option value='false' selected>Repartidor</option>";
    }
    html += "</select>"
            + "</div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID6 + "'>";
    if (chofer.getStatus()) {
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