<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%
    String dni = request.getParameter("dni_usuario");
    Cliente cliente = new Cliente();
    if (dni != null) {
        cliente = new gestionCliente().obtenerClienteDNI(dni);
    }
    String html = "";
    if (!cliente.getId().equals("0")) {
        /*html = "<div class='row' id='hidden'><input type='hidden' id='id-item' value='" + cliente.getId() + "'></div>"
                + "<p>Documento de identidad: <b>" + cliente.getDni() + "</b>"
                + "</p><p>Apellidos y nombres: <b>" + cliente.getApellidos() + ", " + cliente.getNombres() + "</b>"
                + "</p><p>Dirección: <b>" + cliente.getDireccion() + "</b></p>";*/
        html = "<div class='row' id='hidden'><input type='hidden' id='id-item' value='" + cliente.getId() + "'></div>"
        + "<div class='table-responsive'>"
        + "<table class='table' id='dataTable' width='100%' cellspacing='0'>"
        + "<thead>"
        + "<tr>"
        + "<th>Documento de identidad</th>"
        + "<th>Apellidos y nombres</th>"
        + "<th>Número de celular</th>"
        + "<th>Distrito</th>"
        + "</tr>"
        + "</thead>"
        + "<tbody>"
        + "<tr>"
        + "<td>" + cliente.getDni() +"</td>"
        + "<td>" + cliente.getApellidos() + ", " + cliente.getNombres() +"</td>"
        + "<td>" + cliente.getCelular() +"</td>"
        + "<td>" + cliente.getDireccion() +"</td>"
        + "</tr>"
        + "</tbody>"
        + "</table>"
        + "</div>";
    }
    else
    {
        html = "<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>No se encontro ningun usuario.</p><div class='row' id='hidden'><input type='hidden' id='id-item' value='0'></div>";
    }
    out.print(html);
%>