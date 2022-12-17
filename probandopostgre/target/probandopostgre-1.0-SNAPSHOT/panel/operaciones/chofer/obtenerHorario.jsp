<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionChofer"%>
<%@page import="procesos.gestionHorario"%>
<%@page import="entidades.Mes_trabajo"%>
<%@page import="entidades.Chofer"%>
<%
    String id = request.getParameter("id");
    String button_name = "Generar horario";
    String button_ajax = "generar_horario_ajax";
    String dataID1 = "codigo_cho";
    String dataID2 = "cod_month";
    String dataID3 = "cod_year";
    String sms1 = "message_month_ok";
    String sms2 = "message_year_ok";
    String call_ajax1 = "check_select_month();";
    String call_ajax2 = "check_select_year();";
    Chofer chofer = new gestionChofer().obtenerChofer(id);
    ArrayList<Mes_trabajo> horariosChofer = new gestionHorario().obtenerMeses(Integer.parseInt(id));
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='" + dataID1 + "' value='" + chofer.getCodigo_cho() + "'></div></div>"
            + "<div class='col-xl-6'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID2 + "' onchange='" + call_ajax1 + "'>"
            + "<option value='01'>Enero</option>"
            + "<option value='02'>Febrero</option>"
            + "<option value='03'>Marzo</option>"
            + "<option value='04'>Abril</option>"
            + "<option value='05'>Mayo</option>"
            + "<option value='06'>Junio</option>"
            + "<option value='07'>Julio</option>"
            + "<option value='08'>Agosto</option>"
            + "<option value='09'>Setiembre</option>"
            + "<option value='10'>Octubre</option>"
            + "<option value='11'>Noviembre</option>"
            + "<option value='12'>Diciembre</option>"
            + "</select>"
            + "<span id='" + sms1 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-6'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='" + dataID3 + "' onchange='" + call_ajax2 + "'>"
            + "<option value='2022'>2022</option>"
            + "<option value='2023'>2023</option>"
            + "<option value='2024'>2024</option>"
            + "<option value='2025'>2025</option>"
            + "<option value='2026'>2026</option>"
            + "<option value='2027'>2027</option>"
            + "<option value='2028'>2028</option>"
            + "<option value='2029'>2029</option>"
            + "<option value='2030'>2030</option>"
            + "<option value='2031'>2031</option>"
            + "<option value='2032'>2032</option>"
            + "</select>"
            + "<span id='" + sms2 + "' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'><div class='form-group'> "
            + "<center><button type='button' id='boton_login' "
            + "onclick='" + button_ajax + "()' class='btn btn-primary'>" + button_name + "</button>"
            + "<div class='col-xl-12' id='mensaje_error_generar'></div>"
            + "</center></div> </div>"
            + "<div class='card-body'>"
            + "<div class='table-responsive'>"
            + "<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'>"
            + "<thead><tr><th>Fechas registradas</th></tr></thead>"
            + "<tfoot><tr><th>Fechas registradas</th></tr></tfoot>"
            + "<tbody id='contenido-clientes'>";
    for (Mes_trabajo x : horariosChofer) {
        html += "<tr>"
                + "<td>" + x.getRegistro_mes() + "</td>"
                + "</tr>";
    }
    html += "</tbody>"
            + "</table>"
            + "</div></div>";
    out.print(html);
%>