var check_email = function () {
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    campo = document.getElementById('register_email').value;
    if (emailRegex.test(campo)) {
        document.getElementById('message_email_ok').style.color = 'green';
        document.getElementById('message_email_ok').innerHTML = 'Correcto.';
    } else {
        document.getElementById('message_email_ok').style.color = 'red';
        document.getElementById('message_email_ok').innerHTML = 'Ingreso un email incorrecto.';
    }
};
var check_nombres = function ()
{
    campo = document.getElementById('register_nombres').value;
    if (campo === "")
    {
        document.getElementById('message_nombres_ok').innerHTML = 'Tiene que ingresar su nombre';
    } else
    {
        document.getElementById('message_nombres_ok').innerHTML = '';
    }
};
var check_apellidos = function ()
{
    campo = document.getElementById('register_apellidos').value;
    if (campo === "")
    {
        document.getElementById('message_apellidos_ok').innerHTML = 'Tiene que ingresar sus apellidos';
    } else
    {
        document.getElementById('message_apellidos_ok').innerHTML = '';
    }
};
var check_direccion = function ()
{
    campo = document.getElementById('register_direccion').value;
    if (campo === "")
    {
        document.getElementById('message_direccion_ok').innerHTML = 'Tiene que ingresar su dirección';
    } else
    {
        document.getElementById('message_direccion_ok').innerHTML = '';
    }
};
var check_celular = function ()
{
    campo = document.getElementById('register_celular').value;
    if (campo === "")
    {
        document.getElementById('message_celular_ok').innerHTML = 'Tiene que ingresar su número';
    } else
    {
        if (campo.length === 9)
        {
            document.getElementById('message_celular_ok').innerHTML = '';
        } else
        {
            document.getElementById('message_celular_ok').innerHTML = 'El número celular tiene 9 digitos';
        }
    }
};
var check_dni = function ()
{
    campo = document.getElementById('register_dni').value;
    if (campo === "")
    {
        document.getElementById('message_dni_ok').innerHTML = 'Tiene que ingresar su documento';
    } else
    {
        if (campo.length === 8)
        {
            document.getElementById('message_dni_ok').innerHTML = '';
        } else
        {
            document.getElementById('message_dni_ok').innerHTML = 'El dni tiene 8 digitos';
        }
    }
};
var check_password = function ()
{
    campo = document.getElementById('register_password').value;
    if (campo === "")
    {
        document.getElementById('message_password_ok').innerHTML = 'Tiene que ingresar su contraseña';
    } else
    {
        document.getElementById('message_password_ok').innerHTML = '';
    }
};
var validate = function (evt) {
    var theEvent = evt || window.event;
    if (theEvent.type === 'paste')
    {
        key = event.clipboardData.getData('text/plain');
    } else
    {
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
    }
    var regex = /[0-9]|\./;
    if (!regex.test(key)) {
        theEvent.returnValue = false;
        if (theEvent.preventDefault)
            theEvent.preventDefault();
    }
};
var check_repeat_password = function () {
    if (document.getElementById('register_repeat_password').value === "")
    {
        document.getElementById('message_repeat_ok').style.color = 'red';
        document.getElementById('message_repeat_ok').innerHTML = 'Tiene que repetir la contraseña';
    } else
    {
        if (document.getElementById('register_password').value === document.getElementById('register_repeat_password').value) {
            document.getElementById('message_repeat_ok').style.color = 'green';
            document.getElementById('message_repeat_ok').innerHTML = 'Correcto.';
        } else {
            document.getElementById('message_repeat_ok').style.color = 'red';
            document.getElementById('message_repeat_ok').innerHTML = 'Las contraseñas no coinciden.';
        }
    }
};
//Checks para formulario movilidad
var check_marca = function ()
{
    campo = document.getElementById('marca_mo').value;
    if (campo === "")
    {
        document.getElementById('message_marca_ok').innerHTML = 'Tiene que ingresar la marca.';
    } else
    {
        document.getElementById('message_marca_ok').innerHTML = '';
    }
};
var check_modelo = function ()
{
    campo = document.getElementById('modelo_mo').value;
    if (campo === "")
    {
        document.getElementById('message_modelo_ok').innerHTML = 'Tiene que ingresar el modelo.';
    } else
    {
        document.getElementById('message_modelo_ok').innerHTML = '';
    }
};
var check_placa = function ()
{
    campo = document.getElementById('placa_mo').value;
    if (campo === "")
    {
        document.getElementById('message_placa_ok').innerHTML = 'Tiene que ingresar la placa.';
    } else
    {
        document.getElementById('message_placa_ok').innerHTML = '';
    }
};
//Para formulario categoria
var check_des_categoria = function ()
{
    campo = document.getElementById('descripcion_ca').value;
    if (campo === "")
    {
        document.getElementById('message_des_categoria_ok').innerHTML = 'Tiene que ingresar el nombre de la categoria.';
    } else
    {
        document.getElementById('message_des_categoria_ok').innerHTML = '';
    }
};
//Para formulario servicio
var check_select_categoria = function ()
{
    campo = document.getElementById('codigo_ca').value;
    if (campo === "0")
    {
        document.getElementById('message_servicio_ca_ok').innerHTML = 'Tiene que seleccionar una categoria.';
    } else
    {
        document.getElementById('message_servicio_ca_ok').innerHTML = '';
    }
};
var check_servicio = function ()
{
    campo = document.getElementById('descripcion_se').value;
    if (campo === "")
    {
        document.getElementById('message_descripcion_se_ok').innerHTML = 'Tiene que ingresar el nombre del servicio.';
    } else
    {
        document.getElementById('message_descripcion_se_ok').innerHTML = '';
    }
};
var check_precio = function ()
{
    campo = document.getElementById('precio_se').value;
    if (campo === "")
    {
        document.getElementById('message_precio_se_ok').innerHTML = 'Tiene que ingresar el precio.';
    } else
    {
        document.getElementById('message_precio_se_ok').innerHTML = '';
    }
};
//Formulario choferes
var check_select_movilidad = function ()
{
    campo = document.getElementById('id_movilidad').value;
    if (campo === "0")
    {
        document.getElementById('message_chofer_mov_ok').innerHTML = 'Tiene que seleccionar una movilidad';
    } else
    {
        document.getElementById('message_chofer_mov_ok').innerHTML = '';
    }
};
var check_disponibilidad = function ()
{
    campo = document.getElementById('disponibilidad_cho').value;
    if (campo === "")
    {
        document.getElementById('message_disponibilidad_cho_ok').innerHTML = 'Tiene que ingresar su disponibilidad';
    } else
    {
        document.getElementById('message_disponibilidad_cho_ok').innerHTML = '';
    }
};