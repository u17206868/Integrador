/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Solicitud 
{
    private int codigo_solicitud;
    private int id_cliente;
    private int mov_recolector;
    private int cod_fecha_recolector;
    private int cod_hora_recolector;
    private int mov_repartidor;
    private int cod_fecha_repartidor;
    private int cod_hora_repartidor;
    private int cod_departamento;
    private int cod_provincia;
    private int cod_distrito;
    private int precio_total;
    private boolean status;
    private String reg_ingreso;
    private String reg_salida;
    private boolean tipo_de_pedido;
    private boolean pedido_cancelado;
    private String prendas_tipo, prendas_cantidad, prendas_categoria, prendas_servicio, prendas_descripcion, sub_total;

    public Solicitud() {
        this.codigo_solicitud = 0;
        this.id_cliente = 0;
        this.mov_recolector = 0;
        this.cod_fecha_recolector = 0;
        this.cod_hora_recolector = 0;
        this.mov_repartidor = 0;
        this.cod_fecha_repartidor = 0;
        this.cod_hora_repartidor = 0;
        this.cod_departamento = 0;
        this.cod_provincia = 0;
        this.cod_distrito = 0;
        this.precio_total = 0;
        this.status = false;
        this.reg_ingreso = "";
        this.reg_salida = "";
        this.tipo_de_pedido = false;
        this.pedido_cancelado = false;
        this.prendas_tipo = "";
        this.prendas_cantidad = "";
        this.prendas_categoria = "";
        this.prendas_servicio = "";
        this.prendas_descripcion = "";
        this.sub_total = "";
    }

    public Solicitud(int codigo_solicitud, int id_cliente, int mov_recolector, int cod_fecha_recolector, int cod_hora_recolector, int mov_repartidor, int cod_fecha_repartidor, int cod_hora_repartidor, int cod_departamento, int cod_provincia, int cod_distrito, int precio_total, boolean status, String reg_ingreso, String reg_salida, boolean tipo_de_pedido, boolean pedido_cancelado, String prendas_tipo, String prendas_cantidad, String prendas_categoria, String prendas_servicio, String prendas_descripcion, String sub_total) {
        this.codigo_solicitud = codigo_solicitud;
        this.id_cliente = id_cliente;
        this.mov_recolector = mov_recolector;
        this.cod_fecha_recolector = cod_fecha_recolector;
        this.cod_hora_recolector = cod_hora_recolector;
        this.mov_repartidor = mov_repartidor;
        this.cod_fecha_repartidor = cod_fecha_repartidor;
        this.cod_hora_repartidor = cod_hora_repartidor;
        this.cod_departamento = cod_departamento;
        this.cod_provincia = cod_provincia;
        this.cod_distrito = cod_distrito;
        this.precio_total = precio_total;
        this.status = status;
        this.reg_ingreso = reg_ingreso;
        this.reg_salida = reg_salida;
        this.tipo_de_pedido = tipo_de_pedido;
        this.pedido_cancelado = pedido_cancelado;
        this.prendas_tipo = prendas_tipo;
        this.prendas_cantidad = prendas_cantidad;
        this.prendas_categoria = prendas_categoria;
        this.prendas_servicio = prendas_servicio;
        this.prendas_descripcion = prendas_descripcion;
        this.sub_total = sub_total;
    }
    
    /*public Solicitud(int codigo_solicitud, int id_cliente, int mov_recolector, int cod_fecha_recolector, int cod_hora_recolector, int mov_repartidor, int cod_fecha_repartidor, int cod_hora_repartidor, int cod_departamento, int cod_provincia, int cod_distrito, int precio_total, boolean status, String prendas_tipo, String prendas_cantidad, String prendas_categoria, String prendas_servicio, String prendas_descripcion, String sub_total) {
        this.codigo_solicitud = codigo_solicitud;
        this.id_cliente = id_cliente;
        this.mov_recolector = mov_recolector;
        this.cod_fecha_recolector = cod_fecha_recolector;
        this.cod_hora_recolector = cod_hora_recolector;
        this.mov_repartidor = mov_repartidor;
        this.cod_fecha_repartidor = cod_fecha_repartidor;
        this.cod_hora_repartidor = cod_hora_repartidor;
        this.cod_departamento = cod_departamento;
        this.cod_provincia = cod_provincia;
        this.cod_distrito = cod_distrito;
        this.precio_total = precio_total;
        this.status = status;
        this.prendas_tipo = prendas_tipo;
        this.prendas_cantidad = prendas_cantidad;
        this.prendas_categoria = prendas_categoria;
        this.prendas_servicio = prendas_servicio;
        this.prendas_descripcion = prendas_descripcion;
        this.sub_total = sub_total;
    }*/
    public int getCodigo_solicitud() {
        return codigo_solicitud;
    }

    public void setCodigo_solicitud(int codigo_solicitud) {
        this.codigo_solicitud = codigo_solicitud;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getMov_recolector() {
        return mov_recolector;
    }

    public void setMov_recolector(int mov_recolector) {
        this.mov_recolector = mov_recolector;
    }

    public int getCod_fecha_recolector() {
        return cod_fecha_recolector;
    }

    public void setCod_fecha_recolector(int cod_fecha_recolector) {
        this.cod_fecha_recolector = cod_fecha_recolector;
    }

    public int getCod_hora_recolector() {
        return cod_hora_recolector;
    }

    public void setCod_hora_recolector(int cod_hora_recolector) {
        this.cod_hora_recolector = cod_hora_recolector;
    }

    public int getMov_repartidor() {
        return mov_repartidor;
    }

    public void setMov_repartidor(int mov_repartidor) {
        this.mov_repartidor = mov_repartidor;
    }

    public int getCod_fecha_repartidor() {
        return cod_fecha_repartidor;
    }

    public void setCod_fecha_repartidor(int cod_fecha_repartidor) {
        this.cod_fecha_repartidor = cod_fecha_repartidor;
    }

    public int getCod_hora_repartidor() {
        return cod_hora_repartidor;
    }

    public void setCod_hora_repartidor(int cod_hora_repartidor) {
        this.cod_hora_repartidor = cod_hora_repartidor;
    }

    public int getCod_departamento() {
        return cod_departamento;
    }

    public void setCod_departamento(int cod_departamento) {
        this.cod_departamento = cod_departamento;
    }

    public int getCod_provincia() {
        return cod_provincia;
    }

    public void setCod_provincia(int cod_provincia) {
        this.cod_provincia = cod_provincia;
    }

    public int getCod_distrito() {
        return cod_distrito;
    }

    public void setCod_distrito(int cod_distrito) {
        this.cod_distrito = cod_distrito;
    }

    public int getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(int precio_total) {
        this.precio_total = precio_total;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPrendas_tipo() {
        return prendas_tipo;
    }

    public void setPrendas_tipo(String prendas_tipo) {
        this.prendas_tipo = prendas_tipo;
    }

    public String getPrendas_cantidad() {
        return prendas_cantidad;
    }

    public void setPrendas_cantidad(String prendas_cantidad) {
        this.prendas_cantidad = prendas_cantidad;
    }

    public String getPrendas_categoria() {
        return prendas_categoria;
    }

    public void setPrendas_categoria(String prendas_categoria) {
        this.prendas_categoria = prendas_categoria;
    }

    public String getPrendas_servicio() {
        return prendas_servicio;
    }

    public void setPrendas_servicio(String prendas_servicio) {
        this.prendas_servicio = prendas_servicio;
    }

    public String getPrendas_descripcion() {
        return prendas_descripcion;
    }

    public void setPrendas_descripcion(String prendas_descripcion) {
        this.prendas_descripcion = prendas_descripcion;
    }

    public String getSub_total() {
        return sub_total;
    }

    public void setSub_total(String sub_total) {
        this.sub_total = sub_total;
    }

    public String getReg_ingreso() {
        return reg_ingreso;
    }

    public void setReg_ingreso(String reg_ingreso) {
        this.reg_ingreso = reg_ingreso;
    }

    public String getReg_salida() {
        return reg_salida;
    }

    public void setReg_salida(String reg_salida) {
        this.reg_salida = reg_salida;
    }

    public boolean getTipo_de_pedido() {
        return tipo_de_pedido;
    }

    public void setTipo_de_pedido(boolean tipo_de_pedido) {
        this.tipo_de_pedido = tipo_de_pedido;
    }

    public boolean getPedido_cancelado() {
        return pedido_cancelado;
    }

    public void setPedido_cancelado(boolean pedido_cancelado) {
        this.pedido_cancelado = pedido_cancelado;
    }
    
}
