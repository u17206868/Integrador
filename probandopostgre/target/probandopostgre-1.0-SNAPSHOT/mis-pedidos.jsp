<%@page import="procesos.gestionPedido"%>
<%@page import="entidades.Pedido"%>
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
        <li class="nav-item"><a class="nav-link"  href="<%= url_nuevopedido%>"  style="color:#ffe460" >Nuevo pedido</a></li>
        <li class="nav-item"><a class="nav-link"  href="<%= url_mispedidos%>"  style="color:#ffe460" >Mis pedidos</a></li>
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
                    <h3>Mis pedidos</h3>
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
                                                    <%
                                                        ArrayList<Pedido> pedidos = new gestionPedido().listaCompleta(sesion.getAttribute("dni").toString(), "t2.dni");
                                                        int contador = 0;
                                                        String html = "";
                                                        for (Pedido rs : pedidos) {
                                                            contador++;
                                                            html += "<tr>";
                                                            html += "<td>" + rs.getCodigo_solicitud() + "</td>";
                                                            if (rs.getFecha_hora_ingreso().equals("2000-01-01 12:00:00")) {
                                                                html += "<td style='color:#D33242'>Aún no ingreso a la lavanderia</td>";
                                                            } else {
                                                                html += "<td style='color:#2F7CFF'>" + rs.getFecha_hora_ingreso() + "</td>";
                                                            }
                                                            if (rs.getFecha_hora_salida().equals("2000-01-01 12:00:00")) {
                                                                html += "<td style='color:#D33242'>Aún no salio de la lavanderia</td>";
                                                            } else {
                                                                html += "<td style='color:#2F7CFF'>" + rs.getFecha_hora_salida() + "</td>";
                                                            }
                                                            if (rs.getTipo_pedido()) {
                                                                html += "<td>No disponible</td>";
                                                                html += "<td>Presencial</td>";
                                                            } else {
                                                                html += "<td>" + rs.getDistrito() + "</td>";
                                                                html += "<td>Delivery</td>";
                                                            }
                                                            html += "<td>" + rs.getPrecio_total() + "</td>";
                                                            html += "<td><button type='button' class='btn btn-outline-primary' onclick='recargar_detalles(" + rs.getCodigo_solicitud() + ")' data-toggle='modal' data-target='#login_modal'>Detalles+</button></td>";
                                                            if (rs.getCancelado() == true) {
                                                                html += "<td style='color:#D33242'>Cancelado</td>";
                                                                html += "<td>No disponible</td>";
                                                            } else if (rs.getStatus() == false) {
                                                                html += "<td style='color:#28A745'>Completado</td>";//2F7CFF
                                                                html += "<td>No disponible</td>";
                                                            } else {
                                                                html += "<td>Pendiente...</td>";
                                                            }
                                                            if (rs.getCancelado() == false & rs.getStatus() == true) {
                                                                html += "<td><button type='button' class='btn btn-outline-danger' onclick='eliminar_pedido(" + rs.getCodigo_solicitud() + ")'>Cancelar</button></td>";
                                                            }
                                                            html += "<tr/>";
                                                        }
                                                        out.print(html);
                                                    %>
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
                        const datosDelCampo = $("#txt_buscar").val();
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
                        $.post("panel/operaciones/pedido/tablaPedidos.jsp", {txt_buscar: <%=sesion.getAttribute("dni").toString()%>},
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