function confirmar_eliminar(id)
{
    var respuesta = confirm("¿Quieres eliminar al usuario?");
    if (respuesta === true)
    {
        $.ajax({
            url: "operaciones/eliminar.jsp",
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
function cargar_cliente(id)
{
    $.post("getupdateUser.jsp", {id: id},
            function (data)
            {
                $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Modificar cliente</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                $('#form-nuevocliente').html(data);
            }
    );
}
;
function nuevo_cliente()
{

    $('#titleventana').html("<h4 class='modal-title' id='myModalLabel'>Crear nuevo cliente</h4> <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
    $('#form-nuevocliente').html("<div class='col-xl-12' id='mensaje_error'></div><div class='col-xl-12'> <div class='form-group'> <input type='text' id='register_nombres' placeholder='Nombre(s)'> </div> </div><div class='col-xl-12'> <div class='form-group'> <input type='text' id='register_apellidos' placeholder='Apellido(s)'> </div> </div> <div class='col-xl-12'> <div class='form-group'> <input type='text' id='register_direccion' placeholder='Dirección'> </div> </div> <div class='col-xl-12'> <div class='form-group'> <input type='text' id='register_email' placeholder='Correo Electrónico' onkeyup='check_email();'>  <span id='message_email_ok'></span> </div><!-- end .form-group --> </div><!-- end .col-xl- --> <div class='col-xl-6'> <div class='form-group'> <input type='text' id='register_celular' placeholder='Celular'> </div> </div> <div class='col-xl-6'> <div class='form-group'> <input type='text' id='register_dni' placeholder='DNI'> </div> </div> <div class='col-xl-6'> <div class='form-group'> <input type='password' id='register_password' placeholder='Password'> </div><!-- end .form-group --> </div><!-- end .col-xl- --> <div class='col-xl-6'> <div class='form-group'> <input type='password' id='register_repeat_password' placeholder='Repetir Password' onkeyup='check_repeat_password();'> <span id='message_repeat_ok'></span> </div><!-- end .form-group --> </div><!-- end .col-xl- --> <div class='col-xl-12'> <div class='form-group'> <center><button type='button' id='boton_login' onclick='login_ajax()' class='btn btn-primary'>Crear cliente</button></center> </div> </div>");
}
;
function recargar_clientes()
{
    $.post("getRTablaClientes.jsp", {dni: $("#txt_buscar").val()},
            function (data)
            {
                $('#contenido-clientes').html(data);
            }
    );
}
;