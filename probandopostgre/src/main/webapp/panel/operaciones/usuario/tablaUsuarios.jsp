<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionUsuario"%>
<%@page import="entidades.Usuario"%>
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
    String cargo = "";
    //ArrayList<Cliente> clientes = new gestionCliente().obtenerClientes();
    ArrayList<Usuario> usuarios = new gestionUsuario().filtrarUsuarios(dni);
    for (Usuario rs : usuarios) {
        contador++;
        html += "<tr>";
        html += "<td>" + contador + "</td>";
        if (rs.getRango().equals("2")) {
            cargo = "Usuario";
        } else if (rs.getRango().equals("3")) {
            cargo = "Administrador";
        }
        html += "<td>" + cargo + "</td>";
        html += "<td>" + rs.getNombres() + "</td>";
        html += "<td>" + rs.getApellidos() + "</td>";
        html += "<td>" + rs.getDireccion() + "</td>";
        html += "<td>" + rs.getCorreo() + "</td>";
        html += "<td>" + rs.getCelular() + "</td>";
        html += "<td>" + rs.getDni() + "</td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='cargar_usuario(" + rs.getId() + ")' data-toggle='modal' data-target='#login_modal'>Editar</a></td>";
        html += "<td><a style='color: #f00;cursor: pointer;' onclick='usuario_eliminar(" + rs.getId() + ")'>Eliminar</a></td>";
        html += "<tr/>";
    }
    out.print(html);
%>