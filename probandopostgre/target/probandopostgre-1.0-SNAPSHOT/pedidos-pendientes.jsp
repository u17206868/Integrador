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
<%String titlename = "Pedidos pendientes";%>
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
<div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Detalles</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <form action="index.jsp" method="post">
                <div class="modal-body" style="text-align: center;">
                    <div class="aonomy-contact-container">
                        <div class="row" id="form-nuevocliente">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Descripción Prenda</th>
                                            <th>Observaciones</th>
                                            <th>Sub Total</th>
                                        </tr>
                                    </thead>
                                    <tbody id="contenido-detalle">

                                    </tbody>
                                </table>
                            </div>
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
                    <h3>Pedidos pendientes</h3>
                </div>
                <div class="col-xl-12">
                    <br>
                    <center>
                        <div class="aonomy-contact-container">
                            <div class="form-group">
                                <div class="col-xl-4">
                                    <!--<input type="text" id="dni_usuario" placeholder="Ingrese el DNI del usuario" maxlength="8">-->
                                    <label>Buscar usuario por su DNI:
                                        <input list="browsers" name="myBrowser" id="txt_buscar" onkeyup="autocompletarCliente();" maxlength="8" /></label>
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
                <div class="aonomy-contact-container">
                    <div class="row" id="hidden-costo">
                        <input type="hidden" id="costo-item" value="">
                    </div>
                </div>
                <div id="layoutSidenav">
                    <div id="layoutSidenav_content">
                        <br>
                        <main>
                            <div class="container-fluid">
                                <!--<h1 class="mt-4">Usuarios</h1>-->
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-table mr-1"></i>Lista de pedidos</div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"><!--table-dark.table-striped-->
                                                <thead>
                                                    <tr>
                                                        <th>Cod.</th>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Fecha y hora de recepción</th>
                                                        <th>Fecha y hora de entrega</th>
                                                        <th>Distrito</th>
                                                        <th>Tipo de solicitud</th>
                                                        <th>Total</th>
                                                        <th>Detalles</th>
                                                        <th>Estado</th>
                                                        <th>Cancelar</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Cod.</th>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Fecha y hora de recepción</th>
                                                        <th>Fecha y hora de entrega</th>
                                                        <th>Distrito</th>
                                                        <th>Tipo de solicitud</th>
                                                        <th>Total</th>
                                                        <th>Detalles</th>
                                                        <th>Estado</th>
                                                        <th>Cancelar</th>
                                                    </tr>
                                                </tfoot>

                                                <tbody id="contenido-clientes">
                                                    <%@ include file="panel/operaciones/pedido/tablaPendientes.jsp" %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                <script languaje="javascript">
                                        function recargar_detalles(cod_detalle)
                                        {
                                            $.post("panel/operaciones/pedido/tablaDetalles.jsp", {codigo: cod_detalle},
                                                    function (data)
                                                    {
                                                        $('#contenido-detalle').html(data);
                                                    }
                                            );
                                        }
                                        ;
                                        function autocompletarCliente() {
                                            const datosDelCampo = $("#txt_buscar").val()
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
                                            $.post("panel/operaciones/cliente/getClientePedido.jsp", {dni_usuario: $("#txt_buscar").val()}, //
                                                    function (data)
                                                    {
                                                        $('#mensaje_error_busqueda').html(data);
                                                        $('#mensaje_error_generar').html("");
                                                        filtrarCliente();
                                                    }
                                            );
                                        }
                                        ;
                                        function filtrarCliente() {
                                            const datosDelCampo = $("#txt_buscar").val()
                                            if (datosDelCampo.length === 8)
                                            {
                                                $.post("panel/operaciones/pedido/tablaPendientes.jsp", {txt_buscar: datosDelCampo},
                                                        function (data)
                                                        {
                                                            $('#contenido-clientes').html(data);
                                                        }
                                                );
                                            }
                                        }
                                        ;
                                        function reg_ingreso(indice)
                                        {
                                            Swal.fire({
                                                title: '¿Quiere registrar el ingreso de prendas?',
                                                text: "Se registrará el momento actual",
                                                //icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#17A2B8',
                                                cancelButtonColor: '#DC3545',
                                                confirmButtonText: 'Registrar fecha y hora de ingreso',
                                                cancelButtonText: 'Cancelar'
                                            }).then((result) => {
                                                if (result.isConfirmed)
                                                {
                                                    $.ajax({

                                                        url: "panel/operaciones/pedido/alterarSolicitud.jsp",
                                                        data: "codigo_tipo=1&codigo_solicitud=" + indice,
                                                        dataType: "json",
                                                        method: "POST",
                                                        success: function (result)
                                                        {
                                                            if (result === 1)
                                                            {
                                                                //Exitoso;
                                                                recargar_pedido();
                                                            } else
                                                            {
                                                                //Error;
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
                                            });
                                        }
                                        ;
                                        function reg_salida(indice)
                                        {
                                            Swal.fire({
                                                title: '¿Quiere registrar la salida de prendas?',
                                                text: "Se registrará el momento actual",
                                                //icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#17A2B8',
                                                cancelButtonColor: '#DC3545',
                                                confirmButtonText: 'Registrar fecha y hora de salida',
                                                cancelButtonText: 'Cancelar'
                                            }).then((result) => {
                                                if (result.isConfirmed)
                                                {
                                                    $.ajax({

                                                        url: "panel/operaciones/pedido/alterarSolicitud.jsp",
                                                        data: "codigo_tipo=2&codigo_solicitud=" + indice,
                                                        dataType: "json",
                                                        method: "POST",
                                                        success: function (result)
                                                        {
                                                            if (result === 1)
                                                            {
                                                                //Exitoso;
                                                                recargar_pedido();
                                                            } else
                                                            {
                                                                //Error;
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
                                            });
                                        }
                                        ;
                                        function completar_pedido(indice)
                                        {
                                            Swal.fire({
                                                title: '¿Quiere completar la solicitud?',
                                                text: "Se dará por concluida la solicitud satisfactoriamente",
                                                //icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#28A745',
                                                cancelButtonColor: '#DC3545',
                                                confirmButtonText: 'Completar pedido',
                                                cancelButtonText: 'Cancelar'
                                            }).then((result) => {
                                                if (result.isConfirmed)
                                                {
                                                    $.ajax({

                                                        url: "panel/operaciones/pedido/alterarSolicitud.jsp",
                                                        data: "codigo_tipo=3&codigo_solicitud=" + indice,
                                                        dataType: "json",
                                                        method: "POST",
                                                        success: function (result)
                                                        {
                                                            if (result === 1)
                                                            {
                                                                //Exitoso;
                                                                recargar_pedido();
                                                            } else
                                                            {
                                                                //Error;
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
                                            });
                                        }
                                        ;
                                        function eliminar_pedido(indice)
                                        {
                                            Swal.fire({
                                                title: '¿Cancelar el pedido?',
                                                text: "Se cancelará el pedido",
                                                //icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#DC3545',
                                                cancelButtonColor: '#007BFF',
                                                confirmButtonText: 'Cancelar pedido',
                                                cancelButtonText: 'Cerrar'
                                            }).then((result) => {
                                                if (result.isConfirmed)
                                                {
                                                    $.ajax({

                                                        url: "panel/operaciones/pedido/alterarSolicitud.jsp",
                                                        data: "codigo_tipo=4&codigo_solicitud=" + indice,
                                                        dataType: "json",
                                                        method: "POST",
                                                        success: function (result)
                                                        {
                                                            if (result === 1)
                                                            {
                                                                //Exitoso;
                                                                recargar_pedido();
                                                            } else
                                                            {
                                                                //Error;
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
                                            });
                                        }
                                        ;
                                        function recargar_pedido()
                                        {
                                            $.post("panel/operaciones/pedido/tablaPendientes.jsp", {txt_buscar: ""},
                                                    function (data)
                                                    {
                                                        $('#contenido-clientes').html(data);
                                                    }
                                            );
                                        }
                                        ;
                </script>
            </div><!-- end .row -->
        </div><!-- end .aonomy-section-header -->
    </div><!-- end .container -->

</section>
<!-- END HOW IT WORKS SECTION -->
<center>
    <section id="aonomy-contact">
        <div class="container">

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