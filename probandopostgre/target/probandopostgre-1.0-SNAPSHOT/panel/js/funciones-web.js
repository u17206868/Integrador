function confirmar_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar al cliente?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/cliente/eliminarCliente.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_clientes();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function usuario_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar al usuario?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/usuario/eliminarUsuario.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_usuarios();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function movilidad_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar esta movilidad?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/movilidad/eliminarMovilidad.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_movilidad();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function categoria_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar esta categoria?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/categoria/eliminarCategoria.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_categoria();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function servicio_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar este servicio?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/servicio/eliminarServicio.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_servicio();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function chofer_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar a este chofer?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/chofer/eliminarChofer.jsp",
            data: "id=" + id,
            dataType: "json",
            method: "POST",
            success: function (result)
            {
                recargar_chofer();
            },
            fail: function () { },
            beforeSend: function () {
                $('#boton_registro').attr("disabled", true);
            }
        });
    }
}
;
function cargar_cliente(id)
{
    $.post("operaciones/cliente/obtenerCliente.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar cliente</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_usuario(id)
{
    $.post("operaciones/usuario/obtenerUsuario.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar usuario</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_movilidad(id)
{
    $.post("operaciones/movilidad/obtenerMovilidad.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar movilidad</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_categoria(id)
{
    $.post("operaciones/categoria/obtenerCategoria.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar categoria</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_servicio(id)
{
    $.post("operaciones/servicio/obtenerServicio.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar servicio</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_prenda(id)
{
    $.post("operaciones/prendas/obtenerPrenda.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar servicio</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function cargar_chofer(id)
{
    $.post("operaciones/chofer/obtenerChofer.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar chofer</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;

function chofer_horario(id)
{
    $.post("operaciones/chofer/obtenerHorario.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Nuevo horario</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_cliente()
{
    $.post("operaciones/cliente/obtenerCliente.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo cliente</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_usuario()
{
    $.post("operaciones/usuario/obtenerUsuario.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo usuario</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_movilidad()
{
    $.post("operaciones/movilidad/obtenerMovilidad.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nueva movilidad</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_categoria()
{
    $.post("operaciones/categoria/obtenerCategoria.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nueva categoria</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_servicio()
{
    $.post("operaciones/servicio/obtenerServicio.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo servicio</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_prenda()
{
    $.post("operaciones/prendas/obtenerPrenda.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo servicio</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_chofer()
{
    $.post("operaciones/chofer/obtenerChofer.jsp",
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo chofer</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function recargar_clientes()
{
    $.post("operaciones/cliente/recargarTabla.jsp", {dni: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_usuarios()
{
    $.post("operaciones/usuario/tablaUsuarios.jsp", {dni: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_movilidad()
{
    $.post("operaciones/movilidad/tablaMovilidad.jsp", {marca_mo: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_categoria()
{
    $.post("operaciones/categoria/tablaCategoria.jsp", {descripcion_ca: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_servicio()
{
    $.post("operaciones/servicio/tablaServicio.jsp", {descripcion_se: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_prenda()
{
    $.post("operaciones/prendas/tablaPrenda.jsp", {nombre_prenda: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_pedido()
{
    $.post("operaciones/pedido/tablaPedido.jsp", {nombre_cliente: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_detalle()
{
    $.post("operaciones/pedido/tablaDetalle.jsp", {codigo: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function recargar_chofer()
{
    $.post("operaciones/chofer/tablaChofer.jsp", {nombre_cho: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;
function simular_clic()
{
    document.getElementById("boton_cerrar").click();
}
;
function modificar_ajax()
{
    $.ajax({
        url: "operaciones/cliente/modificarCliente.jsp",
        data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&nuevo_dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val() + "&id=" + $("#modificar_id").val() + "&actual_dni=" + $("#actual_dni").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Se modifico correctamente</p>");
                recargar_clientes();
                setTimeout(1000);
                simular_clic();
                

            } else if (result === 2)
            {
                $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
            } else if (result === 3)
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
function modificar_user_ajax()
{
    $.ajax({
        url: "operaciones/usuario/modificarUsuario.jsp",
        data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&nuevo_dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val() + "&id=" + $("#modificar_id").val() + "&actual_dni=" + $("#actual_dni").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Se modifico correctamente</p>");
                recargar_usuarios()
                setTimeout(1000);
                simular_clic();
                

            } else if (result === 2)
            {
                $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
            } else if (result === 3)
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
function modificar_movilidad_ajax()
{
    $.ajax({
        url: "operaciones/movilidad/modificarMovilidad.jsp",
        data: "marca_mo=" + $("#marca_mo").val() + "&modelo_mo=" + $("#modelo_mo").val() + "&placa_mo=" + $("#placa_mo").val() + "&id_movilidad=" + $("#id_movilidad").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Modifico exitosamente una movilidad</p>");
                recargar_movilidad();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_marca();
                check_modelo();
                check_placa();
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
function modificar_categoria_ajax()
{
    $.ajax({
        url: "operaciones/categoria/modificarCategoria.jsp",
        data: "descripcion_ca=" + $("#descripcion_ca").val() + "&codigo_ca=" + $("#codigo_ca").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Modifico exitosamente la categoria</p>");
                recargar_categoria();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_des_categoria();
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
function modificar_servicio_ajax()
{
    $.ajax({
        url: "operaciones/servicio/modificarServicio.jsp",
        data: "codigo_se=" + $("#codigo_se").val() + "&codigo_ca=" + $("#codigo_ca").val() + "&descripcion_se=" + $("#descripcion_se").val() + "&precio_se=" + $("#precio_se").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Modifico exitosamente el servicio</p>");
                recargar_servicio();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_select_categoria();
                check_servicio();
                check_precio();
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
function modificar_prenda_ajax()
{
    $.ajax({
        url: "operaciones/prendas/modificarPrenda.jsp",
        data: "codigo_prenda=" + $("#codigo_prenda").val() + "&nombre_prenda=" + $("#nombre_prenda").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Modifico exitosamente una prenda</p>");
                recargar_prenda();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                
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
function modificar_chofer_ajax()
{
    $.ajax({
        url: "operaciones/chofer/modificarChofer.jsp",
        data: "codigo_cho=" + $("#codigo_cho").val() + "&id_movilidad=" + $("#id_movilidad").val() + "&nombre_cho=" + $("#register_nombres").val() + "&apellido_cho=" + $("#register_apellidos").val() + "&disponibilidad_cho=" + $("#disponibilidad_cho").val() + "&status=" + $("#status").val() + "&tipo_chofer=" + $("#tipo_chofer").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Modifico exitosamente al chofer</p>");
                recargar_chofer();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_select_movilidad();
                check_nombres();
                check_apellidos();
                check_disponibilidad();
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
function registro_ajax()
{
    $.ajax({
        url: "operaciones/cliente/registrarCliente.jsp",
        data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente un cliente</p>");
                recargar_clientes();
                setTimeout(1000);
                simular_clic();

            } else if (result === 2)
            {
                $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
            } else if (result === 3)
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
function registro_user_ajax()
{
    $.ajax({
        url: "operaciones/usuario/registrarUsuario.jsp",
        data: "nombres=" + $("#register_nombres").val() + "&apellidos=" + $("#register_apellidos").val() + "&direccion=" + $("#register_direccion").val() + "&email=" + $("#register_email").val() + "&celular=" + $("#register_celular").val() + "&dni=" + $("#register_dni").val() + "&password=" + $("#register_password").val() + "&repeatpassword=" + $("#register_repeat_password").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente un cliente</p>");
                recargar_usuarios()
                setTimeout(1000);
                simular_clic();

            } else if (result === 2)
            {
                $('#mensaje_error_registro').html("<p style='color: #8716ab; font-weight: 600;text-align: center;font-size: 30px;'>Error - Las contraseñas no coinciden</p>");
            } else if (result === 3)
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
function registro_movilidad_ajax()
{
    $.ajax({
        url: "operaciones/movilidad/registrarMovilidad.jsp",
        data: "marca_mo=" + $("#marca_mo").val() + "&modelo_mo=" + $("#modelo_mo").val() + "&placa_mo=" + $("#placa_mo").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente una movilidad</p>");
                recargar_movilidad();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_marca();
                check_modelo();
                check_placa();
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
function registro_categoria_ajax()
{
    $.ajax({
        url: "operaciones/categoria/registrarCategoria.jsp",
        data: "descripcion_ca=" + $("#descripcion_ca").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente una categoria</p>");
                recargar_categoria();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_des_categoria();
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
function registro_servicio_ajax()
{
    $.ajax({
        url: "operaciones/servicio/registrarServicio.jsp",
        data: "codigo_ca=" + $("#codigo_ca").val() + "&descripcion_se=" + $("#descripcion_se").val() + "&precio_se=" + $("#precio_se").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente un servicio</p>");
                recargar_servicio();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_select_categoria();
                check_servicio();
                check_precio();
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
function registro_prenda_ajax()
{
    $.ajax({
        url: "operaciones/prendas/registrarPrenda.jsp",
        data: "codigo_prenda=" + $("#codigo_prenda").val() + "&nombre_prenda=" + $("#nombre_prenda").val() + "&status=" + $("#status").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente una prenda</p>");
                recargar_prenda();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_select_categoria();
                check_servicio();
                check_precio();
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
function registro_chofer_ajax()
{
    $.ajax({
        url: "operaciones/chofer/registrarChofer.jsp",
        data: "id_movilidad=" + $("#id_movilidad").val() + "&nombre_cho=" + $("#register_nombres").val() + "&apellido_cho=" + $("#register_apellidos").val() + "&disponibilidad_cho=" + $("#disponibilidad_cho").val() + "&status=" + $("#status").val() + "&tipo_chofer=" + $("#tipo_chofer").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_registro').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 30px;'>Registro exitosamente un chofer</p>");
                recargar_chofer();
                setTimeout(1000);
                simular_clic();

            } 
            else
            {
                $('#mensaje_error_registro').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 30px;'>Revisa que todos los campos esten llenos</p>");
                check_select_movilidad();
                check_nombres();
                check_apellidos();
                check_disponibilidad();
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
function generar_horario_ajax()
{
    $.ajax({
        url: "operaciones/chofer/comprobarHorario.jsp",
        data: "codigo_cho=" + $("#codigo_cho").val() + "&cod_month=" + $("#cod_month").val() + "&cod_year=" + $("#cod_year").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            if (result === 1)
            {
                $('#boton_login').hide(200);
                $('.boton_login').hide("fast");
                $('#mensaje_error_generar').html("<p style='color: #60ab85; font-weight: 600;text-align: center;font-size: 17px;'>Genero exitosamente el horario</p>");
                setTimeout(1000);
                simular_clic();

            } 
            else if (result === 2)
            {
                $('#mensaje_error_generar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 17px;'>Ya ha registrado este horario, seleccione otra fecha</p>");

            }
            else if (result === 4)
            {
                $('#mensaje_error_generar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 17px;'>Revisa que todos los campos esten llenos</p>");

            }
            else
            {
                $('#mensaje_error_generar').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 17px;'>Ocurrio un error desconocido</p>");
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
;