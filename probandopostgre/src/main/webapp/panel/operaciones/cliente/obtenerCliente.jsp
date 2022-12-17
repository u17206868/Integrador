<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%
    String id = request.getParameter("id");
    String button_name = "Crear cliente";
    String button_ajax = "registro_ajax";
    Cliente cliente = new Cliente();
    if (id != null) {
        cliente = new gestionCliente().obtenerCliente(id);
        button_name = "Modificar cliente";
        button_ajax = "modificar_ajax";
    }
    String html = "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='actual_dni' value='" + cliente.getDni() + "'></div></div>" 
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='hidden' id='modificar_id' value='" + cliente.getId() + "'></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='register_nombres' placeholder='Nombre(s)' value='" + cliente.getNombres() + "' "
            + "onkeyup='check_nombres();'><span id='message_nombres_ok' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='register_apellidos' placeholder='Apellido(s)' value='" + cliente.getApellidos() + "' "
            + "onkeyup='check_apellidos();'><span id='message_apellidos_ok' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='register_direccion' placeholder='Dirección' value='" + cliente.getDireccion() + "' "
            + "onkeyup='check_direccion();'><span id='message_direccion_ok' style='color:red'></span></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'>"
            + "<input type='text' id='register_email' placeholder='Correo Electrónico' onkeyup='check_email();' value='" + cliente.getCorreo() + "'>"
            + "<span id='message_email_ok'></span> </div><!-- end .form-group --> </div><!-- end .col-xl- -->"
            + "<div class='col-xl-6'> <div class='form-group'>"
            + "<input type='text' id='register_celular' placeholder='Celular' value='" + cliente.getCelular()
            + "' maxlength='9' onkeypress='validate(event);' onkeyup='check_celular();'><span id='message_celular_ok' style='color:red'></span></div></div>"
            + "<div class='col-xl-6'> <div class='form-group'>"
            + "<input type='text' id='register_dni' placeholder='DNI' value='" + cliente.getDni()
            + "' maxlength='8' onkeypress='validate(event);' onkeyup='check_dni();'><span id='message_dni_ok' style='color:red'></span></div></div>"
            + "<div class='col-xl-6'> <div class='form-group'>"
            + "<input type='password' id='register_password' placeholder='Password' maxlength='12' "
            + "onkeyup='check_password();'><span id='message_password_ok' style='color:red'></span></div><!-- end .form-group -->"
            + "</div><!-- end .col-xl- --> <div class='col-xl-6'> <div class='form-group'>"
            + "<input type='password' id='register_repeat_password' placeholder='Repetir Password' "
            + "onkeyup='check_repeat_password();' maxlength='12'>"
            + "<span id='message_repeat_ok'></span> </div><!-- end .form-group --> "
            + "</div><!-- end .col-xl- --> <div class='col-xl-12'>"
            + "<div class='form-group'> <center><button type='button' id='boton_login' "
            + "onclick='" + button_ajax + "()' class='btn btn-primary'>" + button_name + "</button>"
            + "<div class='col-xl-12' id='mensaje_error_registro'></div>"
            + "</center> </div> </div>";
    out.print(html);
%>