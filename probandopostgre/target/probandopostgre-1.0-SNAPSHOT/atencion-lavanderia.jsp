<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="entidades.Prenda"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
<%@page import="procesos.gestionLocalidad"%>
<%@page import="entidades.Departamento"%>
<%@page import="procesos.gestionChofer"%>
<%@page import="entidades.Chofer"%>
<%String titlename = "Atención en la Lavanderia";%>
<%
    HttpSession sesion = request.getSession();
%>
<%if (sesion.getAttribute(txt_cargo) == null) {
        response.sendRedirect(url_index);
    } else if (sesion.getAttribute(txt_cargo).equals("1") | sesion.getAttribute(txt_cargo).equals("2") | sesion.getAttribute(txt_cargo).equals("3")) {%>
<%@ include file="header.jsp" %>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="<%= url_index%>">Inicio</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_pendientes%>"  style="color:#ffe460" >Pedidos pendientes</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_panel%>"  style="color:#ffe460" >Panel de Administración</a></li>
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
<%
    ArrayList<Categoria> categorias = new gestionCategoria().obtenerLista();
    ArrayList<Prenda> prendas = new gestionPrenda().obtenerLista();
    ArrayList<Departamento> departamentos = new gestionLocalidad().listaDepartamento();
    ArrayList<Chofer> chofer_recolector = new gestionChofer().listaRecolector();
    ArrayList<Chofer> chofer_repartidor = new gestionChofer().listaRepartidor();
%>
<section id="aonomy-works">
    <div class="container">

        <div class="aonomy-section-header">
            <div class="row">
                <div class="col-xl-12">
                    <h3>Atención en la Lavanderia</h3>
                </div>
                <div class="col-xl-12">
                    <br>
                    <center>
                        <div class="aonomy-contact-container">
                            <div class="form-group">
                                <div class="col-xl-4">
                                    <!--<input type="text" id="dni_usuario" placeholder="Ingrese el DNI del usuario" maxlength="8">-->
                                    <label>Buscar usuario por su DNI:
                                        <input list="browsers" name="myBrowser" id="dni_usuario" onkeyup="autocompletarCliente();" maxlength="8" /></label>
                                    <datalist id="browsers">
                                    </datalist>
                                </div>
                            </div>
                        </div>
                    </center><!-- end .aonomy-header-buttons -->
                </div>
                <div class="col-xl-12">
                    <div class="aonomy-contact-container">
                        <div class="form-group">
                            <div class="col-xl-12">
                                <div class="aonomy-btn">
                                    <button id="boton_guardar_prenda" onclick="obtener_usuario_dni();">Buscar usuario</button>
                                </div><br>
                            </div>
                            <div class="col-xl-12" id="mensaje_error_busqueda">
                                <div class="row" id="hidden-id">
                                    <input type="hidden" id="id-item" value="0">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- end .row -->
        </div><!-- end .aonomy-section-header -->
    </div><!-- end .container -->

</section>
<!-- END HOW IT WORKS SECTION -->
<center>
    <script src="panel/js/carrito.js"></script>
    <section id="aonomy-contact">
        <div class="container">
            <div class="aonomy-contact-container">
                <div class="row" id="form_prenda">
                    </br>
                    <div class="col-xl-3">
                        <div class="form-group">
                            <select class="form-control-file py-2" id="prendas_tipo" name="prendas_tipo">
                                <option value="0">Seleccionar prenda</option>
                                <%
                                    for (Prenda x : prendas) {%>
                                <option value="<%= x.getNombre_prenda()%>"><%= x.getNombre_prenda()%></option>
                                <%}
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-xl-3">
                        <div class="form-group">
                            <select class="form-control-file py-2" id="prendas_cantidad" name="prendas_cantidad">
                                <option value="0">Seleccionar cantidad</option>
                                <%
                                    for (int x = 0; x < 12; x++) {%>
                                <option value="<%= (x + 1)%>"><%= (x + 1)%></option>
                                <%}
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-xl-3">
                        <div class="form-group">
                            <select class="form-control-file py-2" id="prendas_categoria" name="prendas_categoria" onchange="cargar_servicios();">
                                <option value="0">Seleccionar categoria</option>
                                <%
                                    for (Categoria x : categorias) {%>
                                <option value="<%= x.getDescripcion_ca()%>"><%= x.getDescripcion_ca()%></option>
                                <%}
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-xl-3">
                        <div class="form-group">
                            <select class="form-control-file py-2" id="prendas_servicio" name="prendas_servicio" onchange="obtener_costo();">
                                <option value="0">Seleccionar servicio</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="form-group">
                            <input type="text" id="prendas_descripcion" placeholder="Ingrese una descripcion de la prenda">
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <div class="aonomy-btn">
                            <button id="boton_guardar_prenda" onclick="guardararray_local();">Guardar prenda</button>
                        </div><br>
                    </div>
                    <div class="col-xl-12" id="mensaje_error_prendas">

                    </div>
                </div>
                <div class="row" id="hidden-costo">
                    <input type="hidden" id="costo-item" value="">
                </div>
                <div class="row" id="form-resultado">
                    <div class="col-xl-12" id="tempTabla">

                    </div>
                    <script src="assets/js/jquery-3.1.1.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                    <script languaje="javascript">
                                function cargar_servicios()
                                {
                                    $.post("getServicios.jsp", {codigo_ca: $("#prendas_categoria").val()},
                                            function (data)
                                            {
                                                $('#prendas_servicio').html(data);
                                            }
                                    );
                                }
                                ;
                                function autocompletarCliente() {
                                    const datosDelCampo = $("#dni_usuario").val()
                                    if (datosDelCampo.length > 1 & datosDelCampo.length < 8)
                                    {
                                        $.post("panel/operaciones/cliente/autoCompletar.jsp", {dni: datosDelCampo},
                                                function (data)
                                                {
                                                    $('#browsers').html(data);
                                                }
                                        );
                                    } else
                                        (datosDelCampo.length === 1 | datosDelCampo.length === 0)
                                    {
                                        $('#browsers').html("");
                                    }
                                }
                                ;
                                function obtener_usuario_dni()
                                {
                                    $.post("panel/operaciones/cliente/getClientePedido.jsp", {dni_usuario: $("#dni_usuario").val()}, //
                                            function (data)
                                            {
                                                $('#mensaje_error_busqueda').html(data);
                                                $('#mensaje_error_generar').html("");
                                            }
                                    );
                                }
                                ;
                                function registro_total_ajax()
                                {
                                    if ($("#id-item").val() === "0")
                                    {
                                        $('#mensaje_error_generar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Falta seleccionar al cliente.</p>");
                                    } else {
                                        let costoTotal = 0;
                                        prendas.forEach(function (elemento, indice, array)
                                        {
                                            costoTotal = costoTotal + elemento.costo_subtotal;
                                        });
                                        if (costoTotal !== 0)
                                        {
                                            let prendas_tipo = "";
                                            let prendas_cantidad = "";
                                            let prendas_categoria = "";
                                            let prendas_servicio = "";
                                            let prendas_descripcion = "";
                                            let sub_total = "";
                                            prendas.forEach(function (elemento, indice, array)
                                            {
                                                prendas_tipo = prendas_tipo + elemento.prendas_tipo + "*";
                                                prendas_cantidad = prendas_cantidad + elemento.prendas_cantidad + "*";
                                                prendas_categoria = prendas_categoria + elemento.prendas_categoria + "*";
                                                prendas_servicio = prendas_servicio + elemento.prendas_servicio + "*";
                                                prendas_descripcion = prendas_descripcion + elemento.prendas_descripcion + "*";
                                                sub_total = sub_total + elemento.costo_subtotal + "*";
                                            });
                                            $.ajax({
                                                url: "panel/operaciones/pedido/registrarSolicitud.jsp",
                                                data: "id-item=" + $("#id-item").val() + "&chofer_visita=" + $("#chofer_visita").val() +
                                                        "&fecha_visita=" + $("#fecha_visita").val() + "&horario_visita=" + $("#horario_visita").val() +
                                                        "&chofer_entrega=" + $("#chofer_entrega").val() + "&fecha_entrega=" + $("#fecha_entrega").val() +
                                                        "&horario_entrega=" + $("#horario_entrega").val() + "&cod_departamento=" + $("#cod_departamento").val() +
                                                        "&cod_provincia=" + $("#cod_provincia").val() + "&cod_distrito=" + $("#cod_distrito").val() +
                                                        "&precio_total=" + costoTotal + "&prendas_tipo=" + prendas_tipo + "&prendas_cantidad=" + prendas_cantidad +
                                                        "&prendas_categoria=" + prendas_categoria + "&prendas_servicio=" + prendas_servicio +
                                                        "&prendas_descripcion=" + prendas_descripcion + "&sub_total=" + sub_total + "&tipo_solicitud=2&tipo_atencion=true",
                                                dataType: "json",
                                                method: "POST",
                                                success: function (ready)
                                                {
                                                    if (ready !== 0)
                                                    {
                                                        $.post("panel/operaciones/pedido/enviarmail.jsp", {cod_pedido: ready},
                                                                function (correo)
                                                                {
                                                                    Swal.fire({
                                                                        title: '¿Quiere imprimir su comprobante del pedido?',
                                                                        text: "Se abrirá una nueva pestaña con la información del pedido.",
                                                                        //icon: 'warning',
                                                                        showCancelButton: true,
                                                                        confirmButtonColor: '#17A2B8',
                                                                        cancelButtonColor: '#DC3545',
                                                                        confirmButtonText: 'Imprimir',
                                                                        cancelButtonText: 'Cancelar'
                                                                    }).then((result) => {
                                                                        if (result.isConfirmed)
                                                                        {
                                                                            window.open("panel/operaciones/reportes/boleta-de-venta.jsp?solicitud=" + ready);
                                                                            location.reload();
                                                                        } else
                                                                        {
                                                                            location.reload();
                                                                        }
                                                                    });
                                                                }
                                                        );
                                                    }
                                                },
                                                fail: function () { },
                                                beforeSend: function () {
                                                    $('#boton_registro').attr("disabled", true);
                                                }
                                            });
                                        } else {
                                            $('#mensaje_error_generar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Su carrito de compras se encuentra vacio</p>");
                                        }
                                    }
                                }
                                ;
                    </script>
                </div>
            </div>
            <div class="container">
                <div class="aonomy-contact-container">
                    <div class="row">
                        </br>
                        <input type="hidden" id="cod_departamento" value="4">
                        <input type="hidden" id="cod_provincia" value="35">
                        <input type="hidden" id="cod_distrito" value="337">
                        <input type="hidden" id="chofer_visita" value="3">
                        <input type="hidden" id="fecha_visita" value="89">
                        <input type="hidden" id="horario_visita" value="969">
                        <input type="hidden" id="chofer_entrega" value="3">
                        <input type="hidden" id="fecha_entrega" value="89">
                        <input type="hidden" id="horario_entrega" value="969">
                        <div class="col-xl-12">
                            <div class="aonomy-btn">
                                <button id="boton_buscar" onclick="registro_total_ajax()">Generar solicitud</button>
                            </div><br>
                        </div>

                        <div class="col-xl-12" id="mensaje_error_generar">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</center>
<%@ include file="footer.jsp" %>

</body>
</html>
<%} else {
        response.sendRedirect(url_index);
    }
%>