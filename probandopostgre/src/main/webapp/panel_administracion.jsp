<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%String titlename = "Panel de administración";%>
<%
    HttpSession sesion = request.getSession();
%>
<%if (sesion.getAttribute(txt_cargo) == null) {
        response.sendRedirect(url_index);
    } else if (sesion.getAttribute(txt_cargo).equals("2")) {%>
<%@ include file="header.jsp" %>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="<%= url_index%>">Inicio</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Recepción</a></li>
        <li class="nav-item"><a class="nav-link" href="<%= url_panel%>">Clientes</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Servicios</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Transporte</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_micuenta%>" style="color: #ffffff;">Bienvenido(a) <%=sesion.getAttribute("nombres")%></a></li>
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
                    <h3>Panel de administración</h3>         
                    <h5>Mantenimiento de clientes</h5>
                </div>
            </div><!-- end .row -->
        </div><!-- end .aonomy-section-header -->
    </div><!-- end .container -->

</section>
<!-- END HOW IT WORKS SECTION -->
<center>
    <section id="aonomy-contact">
        <div class="container">
            <form><!-- action="#" method="post"-->
                <div class="aonomy-contact-container">
                    <div class="row">
                        <%
                if (request.getParameter("id") == null) {%>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_nombres" placeholder="Nombre(s)">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_apellidos" placeholder="Apellido(s)">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_direccion" placeholder="Dirección">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_email" placeholder="Correo Electrónico" onkeyup="check_email();">  <span id='message_email_ok'></span>
                            </div><!-- end .form-group -->

                        </div><!-- end .col-xl- -->
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_celular" placeholder="Celular">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_dni" placeholder="DNI">
                            </div>
                        </div>
                        <%} else {%>
                        <%
                            Cliente cliente = new gestionCliente().obtenerCliente(request.getParameter("id"));
                        %>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_nombres" placeholder="Nombre(s)" value="<%= cliente.getNombres()%>">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_apellidos" placeholder="Apellido(s)" value="<%= cliente.getApellidos()%>">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_direccion" placeholder="Dirección" value="<%= cliente.getDireccion()%>">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_email" placeholder="Correo Electrónico" onkeyup="check_email();"  value="<%= cliente.getCorreo()%>">  <span id='message_email_ok'></span>
                            </div><!-- end .form-group -->

                        </div><!-- end .col-xl- -->
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_celular" placeholder="Celular" value="<%= cliente.getCelular()%>">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="register_dni" placeholder="DNI" value="<%= cliente.getDni()%>">
                            </div>
                        </div>
                        <%}%>

                        <div class="col-xl-6">
                            <div class="form-group">
                                <input type="password" id="register_password" placeholder="Password">
                            </div><!-- end .form-group -->

                        </div><!-- end .col-xl- -->
                        <div class="col-xl-6">
                            <div class="form-group">
                                <input type="password" id="register_repeat_password" placeholder="Repetir Password" onkeyup="check_repeat_password();"> <span id='message_repeat_ok'></span>
                            </div><!-- end .form-group -->
                        </div><!-- end .col-xl- -->
                        <div class="col-xl-12">
                            <div class="aonomy-btn">
                                <button id="boton_modificar" onclick="modificar_ajax()"><i class="icofont icofont-location-arrow"></i> Guardar cambios</button>
                            </div><!-- end .form-group -->

                        </div><!-- end .col-xl-12 -->

                        <div class="col-xl-12" id="mensaje_error_modificar">

                        </div>

                        <script type="text/javascript">

                            var check_email = function () {
                                emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
                                campo = document.getElementById('register_email').value;
                                if (emailRegex.test(campo)) {
                                    document.getElementById('message_email_ok').style.color = 'green';
                                    document.getElementById('message_email_ok').innerHTML = 'Correcto.';
                                } else {
                                    document.getElementById('message_email_ok').style.color = 'red';
                                    document.getElementById('message_email_ok').innerHTML = 'Ingreso un email incorrecto.';
                                }
                            }
                            var check_repeat_password = function () {
                                if (document.getElementById('register_password').value == document.getElementById('register_repeat_password').value) {
                                    document.getElementById('message_repeat_ok').style.color = 'green';
                                    document.getElementById('message_repeat_ok').innerHTML = 'Correcto.';
                                } else {
                                    document.getElementById('message_repeat_ok').style.color = 'red';
                                    document.getElementById('message_repeat_ok').innerHTML = 'Las contraseñas no coinciden.';
                                }
                            };
                            function modificar_ajax()
                            {
                                $.ajax({
                                    url: "modificar.jsp",
                                    data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val(),
                                    dataType: "json",
                                    method: "POST",
                                    success: function (result)
                                    {
                                        if (result == 1)
                                        {
                                            $('#mensaje_error_modificar').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Se registro correctamente un nuevo usuario</p>");
                                            setTimeout("location.href='panel_prueba.jsp';", 1000);
                                        } else if (result == 2)
                                        {
                                            $('#mensaje_error_modificar').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
                                        } else if (result == 3)
                                        {
                                            $('#mensaje_error_modificar').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Edito correctamente la cuenta</p>");
                                            //setTimeout("location.reload(true);", 1000);
                                            setTimeout("location.href='panel_prueba.jsp';", 1000);
                                        } else
                                        {
                                            $('#mensaje_error_modificar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Error desconocido - Revisa que todos los campos esten llenos</p>");
                                        }
                                        $('#boton_modificar').attr("disabled", false);
                                    },
                                    fail: function () {
                                    },
                                    beforeSend: function () {
                                        $('#boton_modificar').attr("disabled", true);
                                    }
                                });
                            }
                            ;
                        </script>

                    </div><!-- end .row -->
            </form>
        </div>
        <div class="container">
            <form>
                <div class="aonomy-contact-container">
                    <div class="row">
                        </br>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="buscar_nombres" placeholder="Ingrese el nombre">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="buscar_email" placeholder="Ingrese su correo">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="buscar_dni" placeholder="Ingrese el DNI">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="buscar_celular" placeholder="Ingrese el número">
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="aonomy-btn">
                                <button id="boton_buscar" onclick="buscar_ajax()"><i class="icofont icofont-location-arrow"></i>Buscar usuario</button>
                            </div><br>
                        </div><!-- end .col-xl-12 -->

                        <div class="col-xl-12" id="mensaje_error_busqueda">

                        </div>

                        <script type="text/javascript">
                            function buscar_ajax()
                            {
                                $('#mensaje_error_busqueda').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Buscando usuario</p>");
                                setTimeout("location.href='search.jsp?nombres=$("#buscar_nombres").val()&email=$("#buscar_email").val()&dni=$("#buscar_dni").val()&celular=$("#buscar_celular").val()';", 700);
                            }
                            ;
                        </script>

                    </div><!-- end .row -->
            </form>


        </div>
        </div><!-- end .container -->
        <div class="container">
            <div id="layoutSidenav">
                <div id="layoutSidenav_content">
                    <br>
                    <main>
                        <div class="container-fluid">
                            <!--<h1 class="mt-4">Usuarios</h1>-->
                            <div class="card mb-4">
                                <div class="card-header"><i class="fas fa-table mr-1"></i>Lista de clientes</div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Categoria</th>
                                                    <th>Nombre(s)</th>
                                                    <th>Apellido(s)</th>
                                                    <th>Dirección</th>
                                                    <th>Correo</th>
                                                    <th>Celular</th>
                                                    <th>DNI</th>
                                                    <th>Modificar</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Categoria</th>
                                                    <th>Nombre(s)</th>
                                                    <th>Apellido(s)</th>
                                                    <th>Dirección</th>
                                                    <th>Correo</th>
                                                    <th>Celular</th>
                                                    <th>DNI</th>
                                                    <th>Modificar</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%

                                                    int contador = 0;
                                                    ArrayList<Cliente> clientes = new gestionCliente().obtenerClientes();
                                                    for (Cliente rs : clientes) {
                                                        contador++;
                                                %>
                                                <tr>
                                                    <td><%= contador%></td>
                                                        <td><% if (rs.getRango().equals("1")) {
                                                            out.print("Cliente");
                                                        } else {
                                                            out.print("Admin");
                                                        }%></td>
                                                    <td><%= rs.getNombres()%></td>
                                                    <td><%= rs.getApellidos()%></td>
                                                    <td><%= rs.getDireccion()%></td>
                                                    <td><%= rs.getCorreo()%></td>
                                                    <td><%= rs.getCelular()%></td>
                                                    <td><%= rs.getDni()%></td>
                                                    <td><a href='panel_administracion.jsp?id=<%= rs.getId()%>'>Editar</a></td>
                                                    <td><a href='delete.jsp?id=<%= rs.getId()%>' >Eliminar</a></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </main>
                </div>
            </div>
        </div>
    </section>
</center>
<!-- START AONOMY FOOTER -->
<%@ include file="footer.jsp" %>

</body>
</html>
<%} else {
        response.sendRedirect(url_index);
    }
%>