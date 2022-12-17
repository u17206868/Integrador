<%@page import="entidades.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="atributos.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionCliente"%>
<%@page import="entidades.Cliente"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="entidades.Categoria"%>
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
        <title>Generar reportes</title>
    </head>
    <body>
        <%@ include file="barraLateral.jsp" %>
        <br/>
        <br/>
        <%    ArrayList<Categoria> categorias = new gestionCategoria().obtenerLista();
        %>
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
                                <input type="date" id="fecha_filtro4" value="2022-09-01" min="2022-08-01" max="2025-12-31">
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
                                <input type="date" id="fecha_filtro5" value="2022-08-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group" id="change_fecha_fin">
                                <input type="date" id="fecha_filtro6" value="2022-09-01" min="2022-08-01" max="2025-12-31">
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="form-group">
                                <button type='button' class='btn btn-danger' onclick="reporte_resumido();">Generar reporte</button>
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
                                    function reporte_resumido()
                                    {
                                        window.open("operaciones/reportes/reporte-resumido.jsp?fecha1=" + $("#fecha_filtro5").val() + "&fecha2=" + $("#fecha_filtro6").val());
                                    }
                                    ;
                        </script>
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