<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="procesos.gestionUsuario"%>
<%@page import="entidades.Cliente"%>
<%@page import="entidades.Usuario"%>
<%String titlename = "Mi cuenta";%>
<%
    HttpSession sesion = request.getSession();
%>
<%if (sesion.getAttribute(txt_cargo) == null) {
        response.sendRedirect(url_index);
    } else if (sesion.getAttribute(txt_cargo).equals("1") | sesion.getAttribute(txt_cargo).equals("2")) {%>
<%@ include file="header.jsp" %>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="<%= url_index%>">Inicio</a></li>
            <%
                if (sesion.getAttribute("cargo").equals("1")) {%>
        <li class="nav-item"><a class="nav-link"  href="<%= url_nuevopedido%>"  style="color:#ffe460" >Nuevo pedido</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_mispedidos%>"  style="color:#ffe460" >Mis pedidos</a></li>
            <%} else if (sesion.getAttribute("cargo").equals("2")) {%>
        <li class="nav-item"><a class="nav-link"  href="<%= url_pendientes%>"  style="color:#ffe460" >Pedidos pendientes</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_panel%>"  style="color:#ffe460" >Panel de Administración</a></li>
            <%}
            %>
        <li class="nav-item"><a class="nav-link"  href="<%= url_micuenta%>">Bienvenido(a) <%=sesion.getAttribute("nombres")%></a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_logout%>">Logout</a></li>
    </ul>
</div>
</nav>
</div><!-- end .aonomy-navigation -->
</div><!-- end .row -->
</div><!-- end .container-->
</div><!-- end .aonomy-top -->


<%if (sesion.getAttribute("saveid") != null) {
        response.sendRedirect(url_panel + "?id=" + sesion.getAttribute("saveid"));
        sesion.setAttribute("saveid", null);
    }
%>
</header>
<!-- END AONOMOY HEADER SECTION -->

<!-- START HOW IT WORKS SECTION -->
<section id="aonomy-works">
    <div class="container">

        <div class="aonomy-section-header">
            <div class="row">
                <div class="col-xl-12">
                    <h3>Lavanderia UTP - Mi cuenta</h3>
                    <%
                        if (sesion.getAttribute(txt_cargo).equals("1")) {
                            Cliente cliente = new gestionCliente().obtenerCliente(sesion.getAttribute("id").toString());
                    %>
                    <p>Documento de identidad: <b><%= cliente.getDni()%> </b></p><p>Apellidos y nombres: <b><%= cliente.getApellidos()%>, <%= cliente.getNombres()%></b></p>
                    <p>Dirección: <b><%= cliente.getDireccion()%> </b></p><p>Email: <b><%= cliente.getCorreo()%> </b></p>
                    <p>Celular: <b> <%= cliente.getCelular()%> </b></p>
                    <%} else if (sesion.getAttribute("cargo").equals("2") | sesion.getAttribute("cargo").equals("3")) {
                        Usuario usuario = new gestionUsuario().obtenerUsuario(sesion.getAttribute("id").toString());
                    %>
                    <p>Documento de identidad: <b><%= usuario.getDni()%> </b></p><p>Apellidos y nombres: <b><%= usuario.getApellidos()%>, <%= usuario.getNombres()%></b></p>
                    <p>Dirección: <b><%= usuario.getDireccion()%> </b></p><p>Email: <b><%= usuario.getCorreo()%> </b></p>
                    <p>Celular: <b> <%= usuario.getCelular()%> </b></p>
                    <%}
                    %>
                    <p>Password: <b>*************</b></p>
                    <p><b>------------------------------------------------------------</b></p>
                    <p>Cambiar Contraseña:</p>
                    <center>
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <div class="col-md-6" id="caja1">
                            <input type="password" class="form-control" id="register_password" value="" placeholder="Coloca tu nueva contraseña" maxlength="12" onkeyup="check_password();"><span id='message_password_ok' style="color:red"></span>
                        </div>
                        <p>Repetir Contraseña:</p>
                        <div class="col-md-6" id="caja2">
                            <input type="password" class="form-control" id="register_repeat_password" value="" placeholder="Repetir Contraseña" maxlength="12" onkeyup="check_repeat_password();"><span id='message_repeat_ok' style="color:red"></span>
                        </div><br>
                        <input type="submit" class="btn btn-success" onclick="modificar_password();" value="Guardar Cambios">
                        <div class="col-xl-12" id="mensaje_error_prendas">

                        </div>
                    </center>
                    <p><b>------------------------------------------------------------</b></p>
                    <p><b>ADVERTENCIA:</b> Si por algun motivo recibe un hackeo de su cuenta, solo podrá recuperarlo con su correo electrónico por el formuario: <b>CONTACTO.</b></p>
                </div>

            </div><!-- end .row -->
        </div><!-- end .aonomy-section-header -->
    </div><!-- end .container -->

</section>
<script languaje="javascript">
    function modificar_password()
    {
        if ($("#register_password").val() === $("#register_repeat_password").val())
        {
            $.ajax({
                url: "panel/operaciones/cliente/modificarPersona.jsp",
                data: "password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val() + "&dni=<%=sesion.getAttribute("dni").toString()%>&type=<%=sesion.getAttribute("cargo").toString()%>",
                dataType: "json",
                method: "POST",
                success: function (result)
                {
                    if (result === 1)
                    {
                        $('#boton_login').hide(200);
                        $('.boton_login').hide("fast");
                        $('#mensaje_error_prendas').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 20px;'>Modifico exitosamente su contraseña</p>");
                        $('#caja1').html("<input type='password' class='form-control' id='register_password' value='' placeholder='Coloca tu nueva contraseña' maxlength='12' onkeyup='check_password();'><span id='message_password_ok' style='color:red'></span>");
                        $('#caja2').html("<input type='password' class='form-control' id='register_repeat_password' value='' placeholder='Repetir Contraseña' maxlength='12' onkeyup='check_repeat_password();'><span id='message_repeat_ok' style='color:red'></span>");
                    } else
                    {
                        $('#mensaje_error_prendas').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Revisa que todos los campos esten llenos</p>");
                    }
                    $('#boton_registro').attr("disabled", false);
                },
                fail: function () {
                },
                beforeSend: function () {
                    $('#boton_registro').attr("disabled", true);
                }
            });
        } else
        {
            $('#mensaje_error_prendas').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Revisa que las contraseñas sean iguales</p>");
        }
    }
    ;
    var check_password = function ()
    {
        campo = document.getElementById('register_password').value;
        if (campo === "")
        {
            document.getElementById('message_password_ok').innerHTML = 'Tiene que ingresar su contraseña';
        } else
        {
            document.getElementById('message_password_ok').innerHTML = '';
        }
    };
    var check_repeat_password = function () {
        if (document.getElementById('register_repeat_password').value === "")
        {
            document.getElementById('message_repeat_ok').style.color = 'red';
            document.getElementById('message_repeat_ok').innerHTML = 'Tiene que repetir la contraseña';
        } else
        {
            if (document.getElementById('register_password').value === document.getElementById('register_repeat_password').value) {
                document.getElementById('message_repeat_ok').style.color = 'green';
                document.getElementById('message_repeat_ok').innerHTML = 'Correcto.';
            } else {
                document.getElementById('message_repeat_ok').style.color = 'red';
                document.getElementById('message_repeat_ok').innerHTML = 'Las contraseñas no coinciden.';
            }
        }
    };
</script>
<%@ include file="footer.jsp" %>

</body>
</html>
<%} else {
        response.sendRedirect(url_index);
    }
%>