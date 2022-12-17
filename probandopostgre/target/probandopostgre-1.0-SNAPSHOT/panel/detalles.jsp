<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@ include file="check/inicio.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../CSS/CSS_SIDEBAR_ADMINISTRADOR_YNDIRA.css">

        <link rel="stylesheet" href="../assets/css/table.css">
        <link rel="stylesheet" href="../CSS/style-particles.css">
        <link rel="stylesheet" href="../CSS/CSS_ESTILO_TABLA_CLIENTE.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalles de pedidos</title>

    </head>
    <body>
        <%@ include file="barraLateral.jsp" %>
        <br/>
        <section id="aonomy-contact">
            <div class="container">
                <div class="aonomy-contact-container">
                    <div class="row" id="form_prenda">
                        <div class="col-xl-3">
                            <div class="form-group">
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <input type="text" id="txt_buscar" placeholder="Buscar detalles de su pedido por codigo" maxlength="20">
                            </div>
                        </div>
                        <div class="col-xl-1">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger' onclick="recargar_detalle();">Buscar</button>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <a data-toggle="modal" data-target="#login_modal"><button type='button' class='btn btn-danger' onclick="nuevo_cliente();">Agregar Pedido</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="modal fade" id="login_modal" tabindex="-1" role="dialog modal-xl" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header" id="titleventana">
                        <h4 class="modal-title" id="myModalLabel">Modificar cliente</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form>
                        <div class="modal-body" style="text-align: center;">
                            <div class="aonomy-contact-container">
                                <div class="row" id="form-nuevocliente">
                                    <div class="col-xl-12">
                                        <div class="form-group">
                                            <center><button type="button" id="boton_login" onclick="registro_ajax()" class="btn btn-primary">Ingresar</button></center>
                                        </div>
                                    </div>
                                    <div class="col-xl-12" id="mensaje_error_registro">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer">
                        <center><button type="button" class="btn btn-default" data-dismiss="modal" id="boton_cerrar" onclick="simular_clic()">Cerrar</button></center>
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
                                    <div class="table-title"><i class="fas fa-table mr-1"></i>DETALLES DE PEDIDOS</div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Cod. Detalle</th>
                                                        <th>Cod. Solicitud</th>
                                                        <th>Nombre Prenda</th>
                                                        <th>Cantidad</th>
                                                        <th>Categoria</th>
                                                        <th>Servicio</th>
                                                        <th>Descripción</th>
                                                        <th>Sub Total</th>
                                                        <th>Modificar</th>
                                                        <th>Eliminar</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Cod. Detalle</th>
                                                        <th>Cod. Solicitud</th>
                                                        <th>Nombre Prenda</th>
                                                        <th>Cantidad</th>
                                                        <th>Categoria</th>
                                                        <th>Servicio</th>
                                                        <th>Descripción</th>
                                                        <th>Sub Total</th>
                                                        <th>Modificar</th>
                                                        <th>Eliminar</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody id="contenido-clientes">
                                                    <%@ include file="operaciones/pedido/tablaDetalle.jsp" %>
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