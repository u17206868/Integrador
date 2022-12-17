<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%
    String html = "";
    String dni = "";
    dni = request.getParameter("dni");
    if (dni == null) {
        dni = "";
    }
    ArrayList<Cliente> clientes = new gestionCliente().autoCompletar(dni);
    for (Cliente rs : clientes) {
        html += "<option value='" + rs.getDni() +"'>";
    }
    out.print(html);
%>