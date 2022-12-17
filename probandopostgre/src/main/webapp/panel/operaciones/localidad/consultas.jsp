<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionLocalidad"%>
<%@page import="entidades.Departamento"%>
<%@page import="entidades.Provincia"%>
<%@page import="entidades.Distrito"%>
<%
    int tipo = Integer.parseInt(request.getParameter("tipo"));
    if (tipo == 1) {
        ArrayList<Provincia> provincias = new gestionLocalidad().listaProvincia(Integer.parseInt(request.getParameter("cod_departamento")));
        String html = "<option value='0'>Seleccionar Provincia</option>";
        for (Provincia rs : provincias) {
            //html += "&lt;option value='" + rs.getCodigo_se() +"'&gt;" + rs.getDescripcion_se()+ "&lt;/option&gt;";
            html += "<option value='" + rs.getCod_provincia() + "'>" + rs.getNombre_provincia() + "</option>";
        }
        out.print(html);
    } else if (tipo == 2) {
        ArrayList<Distrito> distritos = new gestionLocalidad().listaDistrito(Integer.parseInt(request.getParameter("cod_provincia")));
        String html = "<option value='0'>Seleccionar Distrito</option>";
        for (Distrito rs : distritos) {
            //html += "&lt;option value='" + rs.getCodigo_se() +"'&gt;" + rs.getDescripcion_se()+ "&lt;/option&gt;";
            html += "<option value='" + rs.getCod_distrito() + "'>" + rs.getNombre_distrito() + "</option>";
        }
        out.print(html);
    }
%>