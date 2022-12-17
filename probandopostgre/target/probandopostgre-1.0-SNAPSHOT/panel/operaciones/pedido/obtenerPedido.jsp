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
<%
    ArrayList<Categoria> categorias = new gestionCategoria().obtenerLista();
    ArrayList<Prenda> prendas = new gestionPrenda().obtenerLista();
    ArrayList<Departamento> departamentos = new gestionLocalidad().listaDepartamento();
    ArrayList<Chofer> chofer_recolector = new gestionChofer().listaRecolector();
    ArrayList<Chofer> chofer_repartidor = new gestionChofer().listaRepartidor();
%>
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
                                function cargar_provincias()
                                {
                                    $.post("panel/operaciones/localidad/consultas.jsp", {tipo: 1, cod_departamento: $("#cod_departamento").val()},
                                            function (data)
                                            {
                                                $('#cod_provincia').html(data);
                                                $('#cod_distrito').html("<option value='0'>Seleccionar Distrito</option>");
                                            }
                                    );
                                }
                                ;
                                function cargar_distritos()
                                {
                                    $.post("panel/operaciones/localidad/consultas.jsp", {tipo: 2, cod_provincia: $("#cod_provincia").val()},
                                            function (data)
                                            {
                                                $('#cod_distrito').html(data);
                                            }
                                    );
                                }
                                ;
                                function cargar_fechas_recolectar()
                                {
                                    $.post("panel/operaciones/horario/consultas.jsp", {tipo: 1, codigo_cho: $("#chofer_visita").val()},
                                            function (data)
                                            {
                                                $('#fecha_visita').html(data);
                                                $('#horario_visita').html("<option value='0'>Seleccionar Hora</option>");
                                            }
                                    );
                                }
                                ;
                                function cargar_fechas_repartir()
                                {
                                    $.post("panel/operaciones/horario/consultas.jsp", {tipo: 3, codigo_cho: $("#chofer_entrega").val(), fecha_visita: $("#fecha_visita").val()},
                                            function (data)
                                            {
                                                $('#fecha_entrega').html(data);
                                                $('#horario_entrega').html("<option value='0'>Seleccionar Hora</option>");
                                            }
                                    );
                                }
                                ;
                                function cargar_horas_recolectar()
                                {
                                    $.post("panel/operaciones/horario/consultas.jsp", {tipo: 2, cod_fecha: $("#fecha_visita").val()},
                                            function (data)
                                            {
                                                $('#horario_visita').html(data);
                                                cargar_fechas_repartir();
                                            }
                                    );
                                }
                                ;
                                function cargar_horas_repartir()
                                {
                                    $.post("panel/operaciones/horario/consultas.jsp", {tipo: 4, cod_fecha: $("#fecha_entrega").val()},
                                            function (data)
                                            {
                                                $('#horario_entrega').html(data);
                                            }
                                    );
                                }
                                ;
                                function registro_pedido_ajax()
                                {
                                    let costoTotal = 0;
                                    prendas.forEach(function (elemento, indice, array)
                                    {
                                        costoTotal = costoTotal + (elemento.servicio_costo * elemento.prendas_cantidad);
                                    });
                                    if (costoTotal !== 0)
                                    {
                                        $.ajax({
                                            url: "panel/operaciones/pedido/registrarPedido.jsp",
                                            data: "id-item=" + $("#id-item").val() + "&chofer_visita=" + $("#chofer_visita").val() + "&fecha_visita=" + $("#fecha_visita").val() + "&horario_visita=" + $("#horario_visita").val() + "&chofer_entrega=" + $("#chofer_entrega").val() + "&fecha_entrega=" + $("#fecha_entrega").val() + "&horario_entrega=" + $("#horario_entrega").val() + "&cod_departamento=" + $("#cod_departamento").val() + "&cod_provincia=" + $("#cod_provincia").val() + "&cod_distrito=" + $("#cod_distrito").val() + "&precio_total=" + costoTotal,
                                            dataType: "json",
                                            method: "POST",
                                            success: function (result)
                                            {
                                                if (result === 0)
                                                {
                                                    $('#mensaje_error_busqueda').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Error desconocido - Revisa que todos los campos esten llenos</p>");
                                                } else
                                                {
                                                    prendas.forEach(function (elemento, indice, array)
                                                    {
                                                        $.ajax({
                                                            url: "panel/operaciones/pedido/registrarDetalle.jsp",
                                                            data: "codigo_solicitud=" + result + "&prendas_tipo=" + elemento.prendas_tipo + "&prendas_cantidad=" + elemento.prendas_cantidad + "&prendas_categoria=" + elemento.prendas_categoria + "&prendas_servicio=" + elemento.prendas_servicio + "&prendas_descripcion=" + elemento.prendas_descripcion + "&sub_total=" + (elemento.servicio_costo * elemento.prendas_cantidad),
                                                            dataType: "json",
                                                            method: "POST",
                                                            success: function (ready)
                                                            {

                                                            },
                                                            fail: function () { },
                                                            beforeSend: function () {
                                                                $('#boton_registro').attr("disabled", true);
                                                            }
                                                        });
                                                    });
                                                    $('#boton_login').hide(200);
                                                    $('.boton_login').hide("fast");
                                                    $('#mensaje_error_busqueda').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente su pedido</p>");
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
                                    else
                                    {
                                        $('#mensaje_error_busqueda').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Error desconocido - Revisa que todos los campos esten llenos</p>");
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
                        <div class="col-xl-12">
                            <div class="form-group">
                                <<input type="text" id="id_cliente" placeholder="Ingrese el DNI del cliente" maxlength="8">
                            </div>
                        </div>
                        <div class="row" id="hidden-id">
                            <input type="hidden" id="id-item" value="<%= %>">
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <span id="message_" style='color:green'>Seleccione su localidad:</span>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="cod_departamento" onchange="cargar_provincias();">
                                    <option value="0">Seleccionar Departamento</option>
                                    <%
                                        for (Departamento x : departamentos) {%>
                                    <option value="<%= x.getCod_departamento()%>"><%= x.getNombre_departamento()%></option>
                                    <%}
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="cod_provincia" onchange="cargar_distritos();">
                                    <option value="0">Seleccionar Provincia</option>

                                </select>
                            </div>
                        </div><!-- comment -->
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="cod_distrito">
                                    <option value="0">Seleccionar Distrito</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <span id="message_" style='color:goldenrod'>Elegir horario para recoger las prendas:</span>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="chofer_visita" onchange="cargar_fechas_recolectar();">
                                    <option value="0">Seleccionar Chofer</option>
                                    <%
                                        for (Chofer x : chofer_recolector) {%>
                                    <option value="<%= x.getCodigo_cho()%>"><%= x.getNombre_cho() + " " + x.getApellido_cho()%></option>
                                    <%}
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="fecha_visita" onchange="cargar_horas_recolectar();">
                                    <option value="0">Seleccionar Fecha</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="horario_visita">
                                    <option value="0">Seleccionar Hora</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="form-group">
                                <span id="message_" style='color:goldenrod'>Elegir horario para la devolución de prendas:</span>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="chofer_entrega" onchange="cargar_fechas_repartir();">
                                    <option value="0">Seleccionar Chofer</option>
                                    <%
                                        for (Chofer x : chofer_repartidor) {%>
                                    <option value="<%= x.getCodigo_cho()%>"><%= x.getNombre_cho() + " " + x.getApellido_cho()%></option>
                                    <%}
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="fecha_entrega" onchange="cargar_horas_repartir();">
                                    <option value="0">Seleccionar Fecha</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="form-group">
                                <select class="form-control-file py-2" id="horario_entrega">
                                    <option value="0">Seleccionar Hora</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="aonomy-btn">
                                <button id="boton_buscar" onclick="registro_pedido_ajax()">Generar solicitud</button>
                            </div><br>
                        </div>

                        <div class="col-xl-12" id="mensaje_error_busqueda">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>