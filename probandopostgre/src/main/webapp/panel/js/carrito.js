let prendas = [];
let nuevaLongitud = 0;
function guardararray_local()
{
    if ($("#prendas_tipo").val() !== "0" & $("#prendas_cantidad").val() !== "0" & $("#prendas_categoria").val() !== "0" & $("#prendas_servicio").val() !== "0" & $("#prendas_descripcion").val() !== "")
    {
        let pedido =
                {
                    prendas_tipo: $("#prendas_tipo").val(),
                    prendas_cantidad: $("#prendas_cantidad").val(),
                    prendas_categoria: $("#prendas_categoria").val(),
                    prendas_servicio: $("#prendas_servicio").val(),
                    servicio_costo: $("#costo-item").val(),
                    costo_subtotal: $("#prendas_cantidad").val() * $("#costo-item").val(),
                    prendas_descripcion: $("#prendas_descripcion").val()
                };
        nuevaLongitud = prendas.push(pedido);
        $('#mensaje_error_prendas').html("");
        crearTabla();
        limpiar_form_pedido();
    } else
    {
        $('#mensaje_error_prendas').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Revisa que todos los campos esten llenos</p>");
    }
}
;
function eliminar_pedido(indice)
{
    let elementoEliminado = prendas.splice(indice, 1);
    crearTabla();
}
;
function cargar_pedido(indice)
{

    $.post("panel/operaciones/prendas/formPrendas.jsp", {prendas_tipo: prendas[indice].prendas_tipo, prendas_cantidad: prendas[indice].prendas_cantidad, prendas_categoria: prendas[indice].prendas_categoria, prendas_servicio: prendas[indice].prendas_servicio, prendas_descripcion: prendas[indice].prendas_descripcion, indice: indice},
            function (data)
            {
                $('#form_prenda').html(data);
                obtener_costo();
            }
    );
}
;
function crearTabla()
{
    let datos = "";
    let total_tabla = 0;
    prendas.forEach(function (elemento, indice, array)
    {
        datos = datos + "<tr><td>" + (indice + 1) + "</td><td>" + elemento.prendas_tipo + "</td><td>" + elemento.prendas_cantidad + "</td><td>" + elemento.prendas_categoria + "</td>" + "</td><td>" + elemento.prendas_servicio + "</td>" + "</td><td>" + elemento.prendas_descripcion + "</td><td>S/" + elemento.servicio_costo + ".00</td>";
        datos = datos + "<td><a style='color: #f00;cursor: pointer;' onclick='cargar_pedido(" + indice + ");'>Editar</a></td>";
        datos = datos + "<td><a style='color: #f00;cursor: pointer;' onclick='eliminar_pedido(" + indice + ");'>Eliminar</a></td><td>S/" + elemento.costo_subtotal + ".00</td></tr>";
        total_tabla = total_tabla + elemento.costo_subtotal;
    });
    if (prendas.length !== 0)
    {
        datos = datos + "<tr><th id='total' colspan='9'>Total:</th><td>S/" + total_tabla + ".00</td></tr>";
        $('#tempTabla').html("<div class='table-responsive'><table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'><thead><tr><th>Número</th><th>Tipo de prenda</th><th>Cantidad</th><th>Categoria</th><th>Servicio</th><th>Descripción</th><th>Precio/Unidad</th><th>Modificar</th><th>Eliminar</th><th>Sub Total</th></tr>" + datos + "</thead></table></div>");
    } else {
        $('#tempTabla').html("");
    }
}
;
function editararray_local(indice)
{
    if ($("#prendas_tipo").val() !== "0" & $("#prendas_cantidad").val() !== "0" & $("#prendas_categoria").val() !== "0" & $("#prendas_servicio").val() !== "0" & $("#prendas_descripcion").val() !== "")
    {
        let pedido =
                {
                    prendas_tipo: $("#prendas_tipo").val(),
                    prendas_cantidad: $("#prendas_cantidad").val(),
                    prendas_categoria: $("#prendas_categoria").val(),
                    prendas_servicio: $("#prendas_servicio").val(),
                    servicio_costo: $("#costo-item").val(),
                    costo_subtotal: $("#prendas_cantidad").val() * $("#costo-item").val(),
                    prendas_descripcion: $("#prendas_descripcion").val()
                };
        prendas[indice] = pedido;
        crearTabla();
        limpiar_form_pedido();
    } else
    {
        $('#mensaje_error_prendas').html("<p style='color: #f00; font-weight: 600;text-align: center;font-size: 20px;'>Revisa que todos los campos esten llenos</p>");
    }
}
;
function limpiar_form_pedido()
{
    $.post("panel/operaciones/prendas/formPrendas.jsp",
            function (data)
            {
                $('#form_prenda').html(data);
            }
    );
}
;
function recargar_pedido()
{
    $.post("panel/operaciones/prendas/formPrendas.jsp", {prendas_tipo: $("#prendas_tipo").val(), prendas_cantidad: $("#prendas_cantidad").val(), prendas_categoria: $("#prendas_categoria").val(), prendas_servicio: $("#prendas_servicio").val(), prendas_descripcion: $("#prendas_descripcion").val()},
            function (data)
            {
                $('#form_prenda').html(data);
            }
    );
}
;
function obtener_costo()
{
    $.ajax({
        url: "panel/operaciones/servicio/obtenerPrecio.jsp",
        data: "descripcion_se=" + $("#prendas_servicio").val(),
        dataType: "json",
        method: "POST",
        success: function (result)
        {
            $('#hidden-costo').html("<input type='hidden' id='costo-item' value='" + result + "'>");
        }
    });
}
;
//<input type="hidden" id="costo-item" value="">