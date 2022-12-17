<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@page import="procesos.gestionCategoria"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Servicio"%>
<%@page import="entidades.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%String titlename = "Lavanderia UTP";%>
<%
    HttpSession sesion = request.getSession();
%>
<%@ include file="header.jsp" %>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="#aonomy-header">Inicio</a></li>
        <!--<li class="nav-item"><a class="nav-link" href="#aonomy-video" >Video</a></li>-->
        <li class="nav-item"><a class="nav-link" href="#aonomy-app-prices" >Servicios</a></li>
            <%
                if (sesion.getAttribute(txt_cargo) == null) {

                } else if (sesion.getAttribute(txt_cargo).equals("1")) {%>
        <li class="nav-item"><a class="nav-link"  href="<%= url_nuevopedido%>"  style="color:#ffe460" >Nuevo pedido</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_mispedidos%>"  style="color:#ffe460" >Mis pedidos</a></li>
            <%} else if (sesion.getAttribute(txt_cargo).equals("2")) {%>
        <li class="nav-item"><a class="nav-link"  href="<%= url_pendientes%>"  style="color:#ffe460" >Pedidos pendientes</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_panel%>"  style="color:#ffe460" >Panel de Administración</a></li>
            <% } %>
            <% if (sesion.getAttribute(txt_dni) == null) {%>
        <li class="nav-item"><a class="nav-link" href="#aonomy-contact">Registro</a></li>
        <li class="nav-item"><a class="nav-link" style="color: #ffffff;cursor: pointer;" data-toggle="modal" data-target="#login_modal">Login</a></li>
            <%} else {%>
        <li class="nav-item"><a class="nav-link"  href="<%= url_micuenta%>" style="color: #ffffff;">Bienvenido(a) <%=sesion.getAttribute("nombres")%></a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_logout%>" >Logout</a></li>
            <%}%>
    </ul>
</div>

<div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Iniciar sesión</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <form action="index.jsp" method="post">
                <div class="modal-body" style="text-align: center;">
                    <div class="aonomy-contact-container">
                        <div class="row">
                            <div class="col-xl-12" id="mensaje_error">
                                <p style="color: #60ab85; font-weight: 600;">Recuerde colocar el sufijo 'c' seguido de su dni - Ejemplo: c48765432</p>
                            </div>
                            <div class="col-xl-12">
                                <div class="form-group">
                                    <input type="text" id="login_usuario" placeholder="DNI"  maxlength="9">
                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="form-group">
                                    <input type="password" id="login_password" placeholder="Contraseña"  maxlength="12">
                                </div>
                            </div>

                            <div class="col-xl-12">
                                <div class="form-group">
                                    <center><button type="button" id="boton_login" onclick="login_ajax()" class="btn btn-primary">Ingresar</button></center>
                                </div>
                            </div>
                            <!--onclick="login_ajax()"-->

                        </div>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <center><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></center>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function login_ajax()
    {
        $.ajax({

            url: "login.jsp",
            data: "dni=" + $("#login_usuario").val() + "&password=" + $("#login_password").val(),
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                if (result === 1)
                {
                    $('#mensaje_error').html("<p style='color: #60ab85; font-weight: 600;'>Inicio sesión correctamente</p>");
                    setTimeout("location.reload(true);", 500);
                    //location.reload();
                } else if (result === 2)
                {
                    $('#mensaje_error').html("<p style='color: #60ab85; font-weight: 600;'>Inicio sesión con cuenta de Colaborador</p>");
                    setTimeout("location.reload(true);", 500);
                } else if (result === 3)
                {
                    $('#mensaje_error').html("<p style='color: #60ab85; font-weight: 600;'>Inicio sesión con cuenta de Administrador</p>");
                    setTimeout("location.reload(true);", 500);
                } else
                {
                    $('#mensaje_error').html("<p style='color: #f00; font-weight: 600;'>Error, DNI o Contraseña incorrecto(s)</p>");
                }
                $('#boton_login').attr("disabled", false);
            },
            fail: function () {

            },
            beforeSend: function () {
                $('#boton_login').attr("disabled", true);
            }
        });
    }
</script>
</nav>
</div><!-- end .aonomy-navigation -->
</div><!-- end .row -->
</div><!-- end .container-->
</div><!-- end .aonomy-top -->


<div class="aonomy-header-bottom">
    <div class="container">
        <div class="row">
            <div class="aonomy-header-details">
                <div class="col-xl-12">
                    <h1>Ropa impecable desde la comodidad de tu hogar!</h1>
                </div><!-- end .col-xl-12 -->

                <div class="col-xl-8 offset-xl-2">
                    <h2 style="font-size: 24px;color: #ffe460;">Anuncio importante:</h2><br />
                    <p>El mejor servicio de lavandería de todo Arequipa.<br />
                        Ofrecemos los mejores servicios de lavanderia a bajo costo.</p>
                </div><!-- end .col-xl-12 -->

                <div class="col-xl-12">
                    <div class="aonmoy-header-buttons">
                        <%
                            if (sesion.getAttribute(txt_cargo) == null) {%>
                        <a class="aonomy-header-learn-more" href="#aonomy-contact">Registro</a>
                        <%} else if (sesion.getAttribute(txt_cargo).equals("2") | sesion.getAttribute(txt_cargo).equals("3")){%>
                        <center>
                            <div class="col-xl-6">
                                <div class="aonmoy-header-buttons">
                                    <a class="aonomy-header-download" href="atencion-lavanderia.jsp" style="color:#ffffff;width: 100%;background-color: #fd86ff3d;font-weight: 300;border: 1px solid #fff6;margin: 0 0 10px 0;">Atención en la Lavandería</a>
                                </div><!-- end .aonomy-header-buttons -->
                            </div>
                            <div class="col-xl-6">
                                <div class="aonmoy-header-buttons">
                                    <a class="aonomy-header-download" href="atencion-domicilio.jsp" style="color:#ffffff;width: 100%;background-color: #fd86ff3d;font-weight: 300;border: 1px solid #fff6;margin: 0 0 10px 0;">Atención a domicilio</a>
                                </div><!-- end .aonomy-header-buttons target="_blank" -->
                            </div>
                        </center>
                            <%}%>
                    </div><!-- end .aonomy-header-buttons -->
                </div><!-- end .col-xl-12 -->


            </div><!-- end .aonomy-header-details -->
        </div><!-- end .row -->
    </div><!-- end .container -->
</div><!-- end .aonomy-header-bottom -->
</header>
<!-- END AONOMOY HEADER SECTION -->

<!-- START HOW IT WORKS SECTION -->
<section id="aonomy-works">
    <div class="container">

        <div class="aonomy-section-header">
            <div class="row">
                <div class="col-xl-12">
                    <center><div class='onesignal-customlink-container'></div></center>
                    <h3>Nuestra web</h3>
                    <p><b>LavanderiaUTP</b> ofrece a su alcance este servicio web para solicitar nuestros servicios.</p>
                </div><!-- end .col-lg-12 -->
            </div><!-- end .row -->
        </div><!-- end .aonomy-section-header -->

        <div class="aonomy-works-section-container">
            <div class="row">

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-right">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon1.png"  alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>Diseño Amigable</h5>
                    <p>Diseño Amigable con el usuario. </p>
                </div><!-- end .aonomy-works-box -->

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-down">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon2.png"  alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>Comodidad</h5>
                    <p>Podrá solicitar el servicio de lavandería desde su hogar.</p>
                </div><!-- end .aonomy-works-box -->

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-left">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon3.png"  alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>24/7 Soporte</h5>
                    <p>Soporte por WhatsApp 24/7</p>
                </div><!-- end .aonomy-works-box -->

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-right">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon4.png" alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>Pago Facil</h5>
                    <p>Diferentes medios de pago. </p>
                </div><!-- end .aonomy-works-box -->

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-up">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon5.png" alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>Seguridad</h5>
                    <p>Nos encargamos que sea lo más seguro posible. </p>
                </div><!-- end .aonomy-works-box -->

                <div class="col-xl-4 col-lg-4 col-md-6 col-12 aonomy-works-box" data-aos="fade-left">
                    <div class="aonomy-works-icon">
                        <img src="assets/img/icon6.png" alt="Aonomy Icon">
                    </div><!-- aonomy-works-icon -->
                    <h5>Sencillez</h5>
                    <p>Podrá monitorear sus pedidos con facilidad y cancelarlos por si ha cometido un error. </p>
                </div><!-- end .aonomy-works-box -->

            </div><!-- end .row -->
        </div><!-- end .aonomy-works-section-container -->
    </div><!-- end .container -->

</section><!-- end #aonomy-works -->
<!-- END HOW IT WORKS SECTION -->
<!-- START AONOMY APP PRICES -->
<section id="aonomy-app-prices">
    <div class="container">

        <div class="aonomy-section-header">
            <div class="row">
                <div class="col-xl-12">
                    <h3>Nuestros servicios</h3>
                    <p>Estos precios son oficiales</p>
                </div>
            </div>
        </div>

        <div class="aonomoy-app-prices-container">
            <div class="row">
                <%
                    ArrayList<Categoria> categorias = new gestionCategoria().obtenerLista();
                    for (Categoria x : categorias) {
                        ArrayList<Servicio> servicios = new gestionServicio().filtrarCategoria(x.getCodigo_ca());
                %>
                <div class="col-xl-3 col-lg-3 col-md-3">
                    <div class="aonomy-app-price">
                        <h5><%= x.getDescripcion_ca()%></h5>
                        <img src="assets/img/starter.png" alt="<%= x.getDescripcion_ca()%>">
                        <ul class="aonomy-price-feature">
                            <%
                                for (Servicio y : servicios) {%>
                            <li><%= y.getDescripcion_se()%><b style="font-weight:900;">S/<%= y.getPrecio_se()%>.00</b></li>
                                <%}
                                %>
                        </ul>
                    </div><!-- end .aonomy-app-price -->
                </div><!-- end .col-xl-4-->
                <%}
                %>
            </div> <br/><br/>

        </div><!-- end .aonomy-app-prices-container -->

    </div><!-- end .container -->
</section><!-- end #aonomy-app-prices -->
<!-- END AONOMY APP PRICES -->


<!-- START AONOMY SUBSCRIPTION SECTION -->
<%
    if (sesion.getAttribute(txt_dni) == null) {%>
<section id="aonomy-download" data-stellar-background-ratio="0.5">
    <div class="container">

        <div class="aonomy-section-header">
            <div class="row">
                <div class="col-xl-12">
                    <h3>Regístrate</h3>
                    <p>Para poder solicitar nuestros servicios es necesario registrarse, llena <b style="color:#40d2ab;">TODOS LOS CAMPOS</b> para no tener ningun inconveniente en sus solicitudes.</p>
                </div>
            </div><!-- end .row -->
            <br /><br /><br />
        </div><!-- end .aonomy-section-header -->
    </div><!-- end .container -->
</section>
<!-- END AONOMY SUBSCRIPTION SECTION -->

<!-- START AONOMY CONTACT SECTION -->

<section id="aonomy-contact">
    <div class="container">
        <form action="#" method="post">
            <div class="aonomy-contact-container">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_nombres" placeholder="Nombre(s)" onkeyup="check_nombres();"> <span id='message_nombres_ok' style="color:red"></span>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_apellidos" placeholder="Apellido(s)" onkeyup="check_apellidos();"> <span id='message_apellidos_ok' style="color:red"></span>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_direccion" placeholder="Dirección" onkeyup="check_direccion();">  <span id='message_direccion_ok' style="color:red"></span>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_email" placeholder="Correo Electrónico" onkeyup="check_email();">  <span id='message_email_ok' style="color:red"></span>
                        </div><!-- end .form-group -->

                    </div><!-- end .col-xl- -->
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_celular" placeholder="Celular" maxlength="9" onkeypress="validate(event);" onkeyup="check_celular();">  <span id='message_celular_ok' style="color:red"></span>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="form-group">
                            <input type="text" id="register_dni" placeholder="DNI"  maxlength="8" onkeypress="validate(event);" onkeyup="check_dni();">  <span id='message_dni_ok' style="color:red"></span>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="form-group">
                            <input type="password" id="register_password" placeholder="Contraseña" maxlength="12" onkeyup="check_password();">  <span id='message_password_ok' style="color:red"></span>
                        </div><!-- end .form-group -->

                    </div><!-- end .col-xl- -->
                    <div class="col-xl-6">
                        <div class="form-group">
                            <input type="password" id="register_repeat_password" placeholder="Repetir Contraseña" onkeyup="check_repeat_password();"  maxlength="12"> <span id='message_repeat_ok'></span>
                        </div><!-- end .form-group -->
                    </div><!-- end .col-xl- -->
                    <div class="col-xl-12">
                        <div class="aonomy-btn">
                            <button id="boton_registro" onclick="registro_ajax()"><i class="icofont icofont-location-arrow"></i> REGISTRARSE</button>
                        </div><!-- end .form-group -->

                    </div><!-- end .col-xl-12 -->

                    <div class="col-xl-12" id="mensaje_error_registro">
                        <p style="color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;">Recuerde que el usuario de su nueva cuenta tendra el sufijo de 'c' seguido de su DNI - Ejemplo: c48765432</p>
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
                        var check_nombres = function ()
                        {
                            campo = document.getElementById('register_nombres').value;
                            if (campo == "")
                            {
                                document.getElementById('message_nombres_ok').innerHTML = 'Tiene que ingresar su nombre';
                            } else
                            {
                                document.getElementById('message_nombres_ok').innerHTML = '';
                            }
                        }
                        var check_apellidos = function ()
                        {
                            campo = document.getElementById('register_apellidos').value;
                            if (campo == "")
                            {
                                document.getElementById('message_apellidos_ok').innerHTML = 'Tiene que ingresar sus apellidos';
                            } else
                            {
                                document.getElementById('message_apellidos_ok').innerHTML = '';
                            }
                        }
                        var check_direccion = function ()
                        {
                            campo = document.getElementById('register_direccion').value;
                            if (campo == "")
                            {
                                document.getElementById('message_direccion_ok').innerHTML = 'Tiene que ingresar su dirección';
                            } else
                            {
                                document.getElementById('message_direccion_ok').innerHTML = '';
                            }
                        }
                        var check_celular = function ()
                        {
                            campo = document.getElementById('register_celular').value;
                            if (campo == "")
                            {
                                document.getElementById('message_celular_ok').innerHTML = 'Tiene que ingresar su número';
                            } else
                            {
                                if (campo.length === 9)
                                {
                                    document.getElementById('message_celular_ok').innerHTML = '';
                                } else
                                {
                                    document.getElementById('message_celular_ok').innerHTML = 'El número celular tiene 9 digitos';
                                }
                            }
                        }
                        var check_dni = function ()
                        {
                            campo = document.getElementById('register_dni').value;
                            if (campo == "")
                            {
                                document.getElementById('message_dni_ok').innerHTML = 'Tiene que ingresar su documento';
                            } else
                            {
                                if (campo.length === 8)
                                {
                                    document.getElementById('message_dni_ok').innerHTML = '';
                                } else
                                {
                                    document.getElementById('message_dni_ok').innerHTML = 'El dni tiene 8 digitos';
                                }
                            }
                        }
                        var check_password = function ()
                        {
                            campo = document.getElementById('register_password').value;
                            if (campo == "")
                            {
                                document.getElementById('message_password_ok').innerHTML = 'Tiene que ingresar su contraseña';
                            } else
                            {
                                document.getElementById('message_password_ok').innerHTML = '';
                            }
                        }
                        var validate = function (evt) {
                            var theEvent = evt || window.event;
                            if (theEvent.type === 'paste')
                            {
                                key = event.clipboardData.getData('text/plain');
                            } else
                            {
                                var key = theEvent.keyCode || theEvent.which;
                                key = String.fromCharCode(key);
                            }
                            var regex = /[0-9]|\./;
                            if (!regex.test(key)) {
                                theEvent.returnValue = false;
                                if (theEvent.preventDefault)
                                    theEvent.preventDefault();
                            }
                        }
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
                        function registro_ajax()
                        {
                            $.ajax({
                                url: "register.jsp",
                                data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val(),
                                dataType: "json",
                                method: "POST",
                                success: function (result)
                                {
                                    if (result == 1)
                                    {
                                        $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Se registro correctamente en LAVANDERIA UTP - Ingrese con su cuenta</p>");
                                        $('#boton_registro').hide(200);
                                        $('.boton_registro').hide("fast");
                                    } else if (result == 2)
                                    {
                                        $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
                                    } else if (result == 3)
                                    {
                                        $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - El dni ya esta registrado</p>");
                                    } else
                                    {
                                        $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Error desconocido - Revisa que todos los campos esten llenos</p>");
                                        check_nombres();
                                        check_apellidos();
                                        check_direccion();
                                        check_email();
                                        check_celular();
                                        check_dni();
                                        check_password();
                                        check_repeat_password();
                                    }
                                    $('#boton_registro').attr("disabled", false);
                                },
                                fail: function () {
                                },
                                beforeSend: function () {
                                    $('#boton_registro').attr("disabled", true);
                                }
                            });
                        }
                        ;


                    </script>

                </div><!-- end .row -->
        </form>
    </div><!-- end .aonomy-contact-container -->

    <center><div class='onesignal-customlink-container'></div></center>

</div><!-- end .container -->
</section>
<% }%>
<!-- END AONOMY CONTACT SECTION -->

<!-- START AONOMY FOOTER -->
<%@ include file="footer.jsp" %>
</body>
</html>