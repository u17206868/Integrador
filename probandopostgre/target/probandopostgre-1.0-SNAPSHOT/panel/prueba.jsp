<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@ include file="check/inicio.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../CSS/CSS_SIDEBAR_ADMINISTRADOR_YNDIRA.css">

        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../CSS/style-particles.css">
        <link rel="stylesheet" href="../CSS/CSS_ESTILO_TABLA_CLIENTE.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MENU PRINCIPAL</title>

    </head>
    <body>
        <%@ include file="barraLateral.jsp" %>
        <br/>
        <br/>
    <section id="aonomy-contact">
            <div class="container">
                <div class="aonomy-contact-container">
                    <div class="row" id="form_prenda">
                        <div class="col-xl-12">
                            <div class="form-group">
                                <center>
                                    <!-#FFA000-->
                                    <h3 style="color:#737679; font-size: 2.25rem; font-weight: 900; font-family: 'Montserrat', sans-serif;">Generar reportes</h3>
                                </center>
                            </div>
                        </div>
                        <br>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <center>
                                    <h3 style="color:#737679; font-size: 1.50rem; font-weight: 900; font-family: 'Montserrat', sans-serif;">Reporte de servicios por categorías y tipos de servicio</h3>
                                </center>
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
                                <select class="form-control-file py-2" id="prendas_servicio" name="prendas_servicio">
                                    <option value="0">Seleccionar servicio</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">
                                <input type="date" id="fecha_filtro1" value="2022-08-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">
                                <input type="date" id="fecha_filtro2" value="2022-09-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger' onclick="reportes_de_servicios();">Generar reporte</button>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <center>
                                    <h3 style="color:#737679; font-size: 1.50rem; font-weight: 900; font-family: 'Montserrat', sans-serif;">Reporte de servicios por cliente</h3>
                                </center>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="monto_min" placeholder="Ingrese monto minimo">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="text" id="monto_max" placeholder="Ingrese monto maximo">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">
                                <input type="date" id="fecha_filtro3" value="2022-08-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">
                                <input type="date" id="fecha_filtro4" value="2022-08-01" min="2022-09-01" max="2025-12-31">
                            </div>
                        </div>   
                        <div class="col-xl-2">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger' onclick="reportes_por_clientes();">Generar reporte</button>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <center>
                                    <h3 style="color:#737679; font-size: 1.50rem; font-weight: 900; font-family: 'Montserrat', sans-serif;">Resumen de servicios por fechas</h3>
                                </center>
                            </div>
                        </div>
                        <div class="col-xl-2">
                            <div class="form-group">

                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <input type="date" id="fecha_inicio" value="2022-08-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group" id="change_fecha_fin">
                                <input type="date" id="fecha_fin" value="2022-09-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger'>Generar reporte</button>
                            </div>
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
                                    function reportes_de_servicios()
                                    {
                                        window.open("operaciones/reportes/reporte-de-servicios.jsp?servicio=" + $("#prendas_servicio").val() + "&fecha1=" + $("#fecha_filtro1").val() + "&fecha2=" + $("#fecha_filtro2").val());
                                    }
                                    ;
                                    function reportes_por_clientes()
                                    {
                                        window.open("operaciones/reportes/reporte-por-clientes.jsp?fecha1=" + $("#fecha_filtro3").val() + "&fecha2=" + $("#fecha_filtro4").val() + "&monto_min=" + $("#monto_min").val() + "&monto_max=" + $("#monto_max").val());
                                    }
                                    ;
                        </script>
                    </div>
                </div>
            </div>
        </section>
    <!--<center><table></center>
    <tr></tr><tr> </tr>
    <tr>
        <td>
            Buscar Cliente por DNI:
        </td>
        <td>
            <input type="text" id="txt_buscar" maxlength="8">
        </td>
        <td>
            <input type="button" value="Buscar" class="mantenimiento_listas" onclick="recargar_clientes()">
        </td>
        <td></td>
        <td>
            <a data-toggle="modal" data-target="#login_modal"><input type="button" onclick="nuevo_cliente()" value="Agregar Cliente" class="mantenimiento_listas" ></a>
        </td>
    </tr>-->


</table>

<div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
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
                            <div class="table-title"><i class="fas fa-table mr-1"></i>LISTADO DE CLIENTES</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
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
                                        <tbody id="contenido-clientes">
                                            <%@ include file="operaciones/cliente/recargarTabla.jsp" %>
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