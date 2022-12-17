/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Pedido {
    private int codigo_solicitud;
    private String nombres_apellidos;
    private String dni;
    private String placa_recolector;
    private String nombre_recolector;
    private String fecha_recolector;
    private String placa_repartidor;
    private String nombre_repartidor;
    private String fecha_repartidor;
    private String fecha_hora_ingreso;
    private String fecha_hora_salida;
    private String distrito;
    private String correo;
    private int precio_total;
    private boolean status;
    private boolean tipo_pedido;
    private boolean cancelado;

    public Pedido() {
        this.codigo_solicitud = 0;
        this.nombres_apellidos = "";
        this.dni = "";
        this.placa_recolector = "";
        this.nombre_recolector = "";
        this.fecha_recolector = "";
        this.placa_repartidor = "";
        this.nombre_repartidor = "";
        this.fecha_repartidor = "";
        this.fecha_hora_ingreso = "";
        this.fecha_hora_salida = "";
        this.distrito = "";
        this.correo = "";
        this.precio_total = 0;
        this.status = false;
        this.tipo_pedido = false;
        this.cancelado = false;
    }

    public Pedido(int codigo_solicitud, String nombres_apellidos, String placa_recolector, 
            String nombre_recolector, String fecha_recolector, String placa_repartidor, 
            String nombre_repartidor, String fecha_repartidor, String fecha_hora_ingreso, 
            String fecha_hora_salida, String distrito, String correo, int precio_total, boolean status, 
            boolean tipo_pedido, boolean cancelado, String dni) {
        this.codigo_solicitud = codigo_solicitud;
        this.nombres_apellidos = nombres_apellidos;
        this.dni = dni;
        this.placa_recolector = placa_recolector;
        this.nombre_recolector = nombre_recolector;
        this.fecha_recolector = fecha_recolector;
        this.placa_repartidor = placa_repartidor;
        this.nombre_repartidor = nombre_repartidor;
        this.fecha_repartidor = fecha_repartidor;
        this.fecha_hora_ingreso = fecha_hora_ingreso;
        this.fecha_hora_salida = fecha_hora_salida;
        this.distrito = distrito;
        this.correo = correo;
        this.precio_total = precio_total;
        this.status = status;
        this.tipo_pedido = tipo_pedido;
        this.cancelado = cancelado;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    

    public int getCodigo_solicitud() {
        return codigo_solicitud;
    }

    public void setCodigo_solicitud(int codigo_solicitud) {
        this.codigo_solicitud = codigo_solicitud;
    }

    public String getNombres_apellidos() {
        return nombres_apellidos;
    }

    public void setNombres_apellidos(String nombres_apellidos) {
        this.nombres_apellidos = nombres_apellidos;
    }

    public String getPlaca_recolector() {
        return placa_recolector;
    }

    public void setPlaca_recolector(String placa_recolector) {
        this.placa_recolector = placa_recolector;
    }

    public String getNombre_recolector() {
        return nombre_recolector;
    }

    public void setNombre_recolector(String nombre_recolector) {
        this.nombre_recolector = nombre_recolector;
    }

    public String getFecha_recolector() {
        return fecha_recolector;
    }

    public void setFecha_recolector(String fecha_recolector) {
        this.fecha_recolector = fecha_recolector;
    }

    public String getPlaca_repartidor() {
        return placa_repartidor;
    }

    public void setPlaca_repartidor(String placa_repartidor) {
        this.placa_repartidor = placa_repartidor;
    }

    public String getNombre_repartidor() {
        return nombre_repartidor;
    }

    public void setNombre_repartidor(String nombre_repartidor) {
        this.nombre_repartidor = nombre_repartidor;
    }

    public String getFecha_repartidor() {
        return fecha_repartidor;
    }

    public void setFecha_repartidor(String fecha_repartidor) {
        this.fecha_repartidor = fecha_repartidor;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
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

    public String getFecha_hora_ingreso() {
        return fecha_hora_ingreso;
    }

    public void setFecha_hora_ingreso(String fecha_hora_ingreso) {
        this.fecha_hora_ingreso = fecha_hora_ingreso;
    }

    public String getFecha_hora_salida() {
        return fecha_hora_salida;
    }

    public void setFecha_hora_salida(String fecha_hora_salida) {
        this.fecha_hora_salida = fecha_hora_salida;
    }

    public boolean getTipo_pedido() {
        return tipo_pedido;
    }

    public void setTipo_pedido(boolean tipo_pedido) {
        this.tipo_pedido = tipo_pedido;
    }

    public boolean getCancelado() {
        return cancelado;
    }

    public void setCancelado(boolean cancelado) {
        this.cancelado = cancelado;
    }
    
}
