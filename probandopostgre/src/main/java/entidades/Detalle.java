/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

public class Detalle {
    private int codigo_detalle;
    private int codigo_solicitud;
    private String nombre_prenda;
    private int cantidad;
    private String descripcion_ca;
    private String descripcion_se;
    private String descripcion;
    private int sub_total;

    public Detalle() {
        this.codigo_detalle = 0;
        this.codigo_solicitud = 0;
        this.nombre_prenda = "";
        this.cantidad = 0;
        this.descripcion_ca = "";
        this.descripcion_se = "";
        this.descripcion = "";
        this.sub_total = 0;
    }

    public Detalle(int codigo_detalle, int codigo_solicitud, String nombre_prenda, int cantidad, String descripcion_ca, String descripcion_se, String descripcion, int sub_total) {
        this.codigo_detalle = codigo_detalle;
        this.codigo_solicitud = codigo_solicitud;
        this.nombre_prenda = nombre_prenda;
        this.cantidad = cantidad;
        this.descripcion_ca = descripcion_ca;
        this.descripcion_se = descripcion_se;
        this.descripcion = descripcion;
        this.sub_total = sub_total;
    }

    public int getCodigo_detalle() {
        return codigo_detalle;
    }

    public void setCodigo_detalle(int codigo_detalle) {
        this.codigo_detalle = codigo_detalle;
    }

    public int getCodigo_solicitud() {
        return codigo_solicitud;
    }

    public void setCodigo_solicitud(int codigo_solicitud) {
        this.codigo_solicitud = codigo_solicitud;
    }

    public String getNombre_prenda() {
        return nombre_prenda;
    }

    public void setNombre_prenda(String nombre_prenda) {
        this.nombre_prenda = nombre_prenda;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion_ca() {
        return descripcion_ca;
    }

    public void setDescripcion_ca(String descripcion_ca) {
        this.descripcion_ca = descripcion_ca;
    }

    public String getDescripcion_se() {
        return descripcion_se;
    }

    public void setDescripcion_se(String descripcion_se) {
        this.descripcion_se = descripcion_se;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getSub_total() {
        return sub_total;
    }

    public void setSub_total(int sub_total) {
        this.sub_total = sub_total;
    }
    
}
