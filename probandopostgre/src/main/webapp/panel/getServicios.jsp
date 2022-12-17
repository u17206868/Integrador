<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Categoria"%>
<%
    String codigo_ca = request.getParameter("codigo_ca");
    ArrayList<Servicio> servicios = new gestionServicio().filtrarCategoria(new gestionCategoria().getIDCategoria(codigo_ca));
    String html = "<option value='0'>Seleccionar servicio</option>";
    //String html = "&lt;option value='0'&gt;Servicia&lt;/option&gt;";
    for (Servicio rs : servicios) {
        //html += "&lt;option value='" + rs.getCodigo_se() +"'&gt;" + rs.getDescripcion_se()+ "&lt;/option&gt;";
        html += "<option value='" + rs.getCodigo_se() + "'>" + rs.getDescripcion_se() + " S/" + rs.getPrecio_se() + ".00</option>";
    }
    out.print(html);
%>