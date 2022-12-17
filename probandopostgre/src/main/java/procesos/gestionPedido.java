package procesos;

import entidades.Pedido;
import dao.daoPedido;
import entidades.Consultar;
import entidades.Detalle;
import entidades.Solicitud;
import java.util.ArrayList;

public class gestionPedido {
    public ArrayList<Pedido> filtrarLista(String nombre_cliente, String busqueda)
    {
        return new daoPedido().filtrarLista(nombre_cliente, busqueda);
    }
    public ArrayList<Pedido> listaCompleta(String nombre_cliente, String busqueda)
    {
        return new daoPedido().listaCompleta(nombre_cliente, busqueda);
    }
    public ArrayList<Detalle> filtrarDetalle(int codigo_solicitud)
    {
        return new daoPedido().filtrarDetalle(codigo_solicitud);
    }
    public ArrayList<Consultar> generarArrayDetalles(String prendas_tipo, String prendas_cantidad, String prendas_categoria, String prendas_servicio, String prendas_descripcion, String sub_total){
        return new daoPedido().generarArrayDetalles(prendas_tipo, prendas_cantidad, prendas_categoria, prendas_servicio, prendas_descripcion, sub_total);
    }
    public int generarSolicitud(int tipo_solicitud, Solicitud solicitud){
        return new daoPedido().generarSolicitud(tipo_solicitud, solicitud);
    }
    public int registrarIngresoSalida(int codigo_solicitud, boolean ingreso){
        return new daoPedido().registrarIngresoSalida(codigo_solicitud, ingreso);
    }
    public int cancelarSolicitud(int codigo_solicitud){
        return new daoPedido().cancelarSolicitud(codigo_solicitud);
    }
    public int completarSolicitud(int codigo_solicitud){
        return new daoPedido().completarSolicitud(codigo_solicitud);
    }
    public Pedido getPedido(int codigo_solicitud){
        return new daoPedido().getPedido(codigo_solicitud);
    }
    public ArrayList<Detalle> getDetalle(int codigo_solicitud){
        return new daoPedido().getDetalle(codigo_solicitud);
    }
}
