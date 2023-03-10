<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@ include file="check/inicio.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../CSS/CSS_SIDEBAR_ADMINISTRADOR_YNDIRA.css">

        <!--<link rel="stylesheet" href="../assets/css/table.css">-->
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../CSS/style-particles.css">
        <link rel="stylesheet" href="../CSS/CSS_ESTILO_TABLA_CLIENTE.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pedidos</title>

    </head>
    <body>
        <%@ include file="barraLateral.jsp" %>
        <br/>
        <section id="aonomy-contact">
            <div class="container">
                <div class="aonomy-contact-container">
                    <div class="row" id="form_prenda">
                        <div class="col-xl-4">
                            <div class="form-group">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="txt_buscar" placeholder="Buscar PEDIDO por Nombre del cliente" maxlength="20">
                            </div>
                        </div>
                        <div class="col-xl-1">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger' onclick="recargar_pedido();">Buscar</button>
                            </div>
                        </div>
                        <!--<div class="col-xl-3">
                            <div class="form-group">
                                <a data-toggle="modal" data-target="#login_modal"><button type='button' class='btn btn-danger' onclick="nuevo_cliente();">Agregar Pedido</button></a>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </section>
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
                                                    <th>Descripci??n Prenda</th>
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
        <section class="tablaClientes">
            <div class="container">
                <div id="layoutSidenav">
                    <div id="layoutSidenav_content">
                        <br>
                        <main>
                            <div class="container-fluid">
                                <!--<h1 class="mt-4">Usuarios</h1>-->
                                <div class="card mb-4">
                                    <div class="table-title"><i class="fas fa-table mr-1"></i>LISTADO DE PEDIDOS</div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Cod.</th>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Detalles de solicitud</th>
                                                        <th>Detalles de entrega</th>
                                                        <th>Distrito</th>
                                                        <th>Total</th>
                                                        <th>Estado</th>
                                                        <th>Modificar</th>
                                                        <th>Eliminar</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Cod.</th>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Detalles de solicitud</th>
                                                        <th>Detalles de entrega</th>
                                                        <th>Distrito</th>
                                                        <th>Total</th>
                                                        <th>Estado</th>
                                                        <th>Modificar</th>
                                                        <th>Eliminar</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody id="contenido-clientes">
                                                    <%@ include file="operaciones/pedido/tablaPedido.jsp" %>
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
        <script languaje="">
            function recargar_detalles(cod_detalle)
            {
                $.post("operaciones/pedido/tablaDetalles.jsp", {codigo: cod_detalle},
                        function (data)
                        {
                            $('#contenido-detalle').html(data);
                        }
                );
            }
            ;
        </script>
        <script src="../assets/js/jquery-3.1.1.min.js"></script>
        <script src="../JS/JS-SIDEBAR_ANIMADO-YNDIRA.js" charset="utf-8"></script>
        <script src="../assets/js/jquery.min.js"></script>
        <script src="js/funciones-web.js"></script>
        <script src="js/funciones-html.js"></script>
        <script src="../assets/js/jquery-migrate.js"></script>
        <script src="../assets/js/bootstrap.js"></script>
        <script src="../assets/js/waypoints.js"></script>
        <script src="../assets/js/jquery.counterup.js"></script>
        <script src="../assets/js/aos.js"></script>
        <script src="../assets/js/jquery.stellar.js"></script>
        <script src="../assets/js/owl.carousel.js"></script>
        <script src="../assets/js/particles.js"></script>
        <script src="../assets/js/lity.js"></script>
        <!--<script src="../assets/js/app-particles.js"></script>-->
    </body>
</html>
<%@ include file="check/final.jsp" %>