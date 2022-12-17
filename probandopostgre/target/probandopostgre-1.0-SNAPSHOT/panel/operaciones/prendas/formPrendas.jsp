<%@page import="java.util.ArrayList"%>
<%@page import="procesos.gestionMovilidad"%>
<%@page import="procesos.gestionCategoria"%>
<%@page import="procesos.gestionPrenda"%>
<%@page import="procesos.gestionServicio"%>
<%@page import="entidades.Movilidad"%>
<%@page import="entidades.Categoria"%>
<%@page import="entidades.Prenda"%>
<%@page import="entidades.Servicio"%>
<%
    String html3 = "";
    String prendas_categoria = request.getParameter("prendas_categoria");
    String prendas_servicio = "0";
    String prendas_descripcion = "";
    String prendas_tipo = request.getParameter("prendas_tipo");
    int prendas_cantidad = 0;
    Movilidad movilidad = new Movilidad();
    Prenda prenda = new Prenda();
    Categoria categoria = new Categoria();
    Servicio servicio = new Servicio();
    ArrayList<Categoria> categorias = new gestionCategoria().filtrarCategoria("");
    ArrayList<Prenda> prendas = new gestionPrenda().filtrarPrenda("");
    ArrayList<Servicio> servicios;
    String button_design = "12";
    String javascript = "guardararray_local();";
    if (request.getParameter("prendas_categoria") != null) {
        javascript = " editararray_local(" + request.getParameter("indice") + ");";
        prendas_cantidad = Integer.parseInt(request.getParameter("prendas_cantidad"));
        prendas_servicio = request.getParameter("prendas_servicio");
        prendas_descripcion = request.getParameter("prendas_descripcion");
        categorias = new gestionCategoria().filtrarCategoria("");
        prendas = new gestionPrenda().filtrarPrenda("");
        button_design = "6";
        servicios = new gestionServicio().filtrarCategoria(new gestionCategoria().getIDCategoria(prendas_categoria));
        for (Servicio x : servicios) {
            if (x.getDescripcion_se().equals(prendas_servicio)) {
                html3 += "<option value='" + x.getDescripcion_se() + "' selected>" + x.getDescripcion_se() + " S/" + x.getPrecio_se() + ".00</option>";
            } else {
                html3 += "<option value='" + x.getDescripcion_se() + "'>" + x.getDescripcion_se() + " S/" + x.getPrecio_se() + ".00</option>";
            }
        }
    } else {
        prendas_categoria = "0";
    }
    String button_name = "Crear movilidad";
    String button_ajax = "registro_movilidad_ajax";
    String dataID1 = "id_movilidad";
    String dataID2 = "marca_mo";
    String dataID3 = "modelo_mo";
    String dataID4 = "placa_mo";
    String sms1 = "message_marca_ok";
    String sms2 = "message_modelo_ok";
    String sms3 = "message_placa_ok";
    String holder1 = "Marca";
    String holder2 = "Modelo";
    String holder3 = "Placa";
    String call_ajax1 = "check_marca();";
    String call_ajax2 = "check_modelo();";
    String call_ajax3 = "check_placa();";
    String html2 = "</br> <div class='col-xl-3'> <div class='form-group'> <select class='form-control-file py-2' id='prendas_tipo' name='prendas_tipo'>"
            + "<option value='0'>Seleccionar prenda</option>";
    for (Prenda x : prendas) {
        if (x.getNombre_prenda().equals(prendas_tipo)) {
            html2 += "<option value='" + x.getNombre_prenda() + "'  selected>" + x.getNombre_prenda() + "</option>";
        } else {
            html2 += "<option value='" + x.getNombre_prenda() + "'>" + x.getNombre_prenda() + "</option>";
        }
    }
    html2 += "</select></div></div>"
            + "<div class='col-xl-3'> <div class='form-group'> <select class='form-control-file py-2' id='prendas_cantidad'  name='prendas_cantidad'> "
            + "<option value='0'>Seleccionar cantidad</option> ";
    for (int x = 1; x <= 12; x++) {
        if (x == prendas_cantidad) {
            html2 += "<option value='" + x + "' selected>" + x + "</option>";
        } else {
            html2 += "<option value='" + x + "'>" + x + "</option>";
        }
    }
    html2 += "</select> </div> </div><div class='col-xl-3'><div class='form-group'>"
            + "<select class='form-control-file py-2' id='prendas_categoria' name='prendas_categoria' onchange='cargar_servicios();'>"
            + "<option value='0'>Seleccionar categoria</option>";
    for (Categoria x : categorias) {
        if (x.getDescripcion_ca().equals(prendas_categoria)) {
            html2 += "<option value='" + x.getDescripcion_ca() + "' selected>" + x.getDescripcion_ca() + "</option>";
        } else {
            html2 += "<option value='" + x.getDescripcion_ca() + "'>" + x.getDescripcion_ca() + "</option>";
        }
    }
    html2 += "</select></div></div>"
            + "<div class='col-xl-3'> <div class='form-group'>"
            + "<select class='form-control-file py-2' id='prendas_servicio' name='prendas_servicio' onchange='obtener_costo();'>"
            + "<option value='0'>Seleccionar servicio</option>";
    html2 += html3;
    html2 += "</select></div></div>"
            + "<div class='col-xl-12'> <div class='form-group'> "
            + "<input type='text' id='prendas_descripcion' placeholder='Ingrese una descripcion de la prenda' value='" + prendas_descripcion + "'> "
            + "</div> </div>"
            + "<div class='col-xl-" + button_design + "'> <div class='aonomy-btn'> "
            + "<button id='boton_guardar_prenda' onclick='" + javascript + "'>Guardar prenda</button>"
            + "</div><br></div>";
    if (!prendas_categoria.equals("0"))
    {
        html2 += "<div class='col-xl-" + button_design + "'> <div class='aonomy-btn'> "
            + "<button id='boton_cancelar_editar' onclick='limpiar_form_pedido();'>Cancelar</button>"
            + "</div><br></div></div>";
    }   
    html2 += "<div class='col-xl-12' id='mensaje_error_prendas'></div>";
    out.print(html2);
%>