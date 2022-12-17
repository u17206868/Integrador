<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionHorario"%>
<%@page import="entidades.Fecha_trabajo"%>
<%@page import="entidades.Hora_trabajo"%>
<%
    int tipo = Integer.parseInt(request.getParameter("tipo"));
    if (tipo == 1)//FECHA RECOLECTAR
    {
        ArrayList<Fecha_trabajo> fechas = new gestionHorario().getFecha(Integer.parseInt(request.getParameter("codigo_cho")), "2000-01-01");
        String html = "<option value='0'>Seleccionar Fecha</option>";
        for (Fecha_trabajo rs : fechas) {
            html += "<option value='" + rs.getCod_fecha() + "'>" + rs.getTime_fecha() + "</option>";
        }
        out.print(html);
    } else if (tipo == 2) {
        ArrayList<Hora_trabajo> horas = new gestionHorario().getHora(Integer.parseInt(request.getParameter("cod_fecha")));
        String html = "<option value='0'>Seleccionar Hora</option>";
        for (Hora_trabajo rs : horas) {
            html += "<option value='" + rs.getCod_hora() + "'>" + rs.getTime_hora() + "</option>";
        }
        out.print(html);
    } else if (tipo == 3)//FECHA REPARTIR
    {
        String fecha_visita = "2000-01-01";
        if (!request.getParameter("fecha_visita").equals("0")) {
            fecha_visita = new gestionHorario().get1Fecha(Integer.parseInt(request.getParameter("fecha_visita")));
        }
        ArrayList<Fecha_trabajo> fechas = new gestionHorario().getFecha(Integer.parseInt(request.getParameter("codigo_cho")), fecha_visita);
        String html = "<option value='0'>Seleccionar Fecha</option>";
        for (Fecha_trabajo rs : fechas) {
            html += "<option value='" + rs.getCod_fecha() + "'>" + rs.getTime_fecha() + "</option>";
        }
        out.print(html);
    } else if (tipo == 4) {
        ArrayList<Hora_trabajo> horas = new gestionHorario().getHora(Integer.parseInt(request.getParameter("cod_fecha")));
        String html = "<option value='0'>Seleccionar Hora</option>";
        for (Hora_trabajo rs : horas) {
            html += "<option value='" + rs.getCod_hora() + "'>" + rs.getTime_hora() + "</option>";
        }
        out.print(html);
    }
%>