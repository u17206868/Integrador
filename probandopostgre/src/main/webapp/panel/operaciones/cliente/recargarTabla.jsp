<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%
    String html = "";
    String dni = "";
    dni = request.getParameter("dni");
    /*if (!request.getParameter("dni").equals("")) {
        dni = request.getParameter("dni");
    }*/
    if (dni == null) {
        dni = "";
    }
    int contador = 0;
    //ArrayList<Cliente> clientes = new gestionCliente().obtenerClientes();
    ArrayList<Cliente> clientes = new gestionCliente().filtrarClientes(dni);
    for (Cliente rs : clientes) {
        contador++;
        html += "<tr>";
        html += "<td>" + contador + "</td>";
        html += "<td>" + rs.getNombres() + "</td>";
        html += "<td>" + rs.getApellidos() + "</td>";
        html += "<td>" + rs.getDireccion() + "</td>";
        html += "<td>" + rs.getCorreo() + "</td>";
        html += "<td>" + rs.getCelular() + "</td>";
        html += "<td>" + rs.getDni() + "</td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='cargar_cliente(" + rs.getId() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='confirmar_eliminar(" + rs.getId() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>