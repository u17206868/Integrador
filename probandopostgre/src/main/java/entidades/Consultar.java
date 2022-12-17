/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author tianb
 */
public class Consultar {
    private int codigo_detalle;
    private int codigo_solicitud;
    private int codigo_prenda;
    private int cantidad;
    private int codigo_ca;
    private int codigo_se;
    private String descripcion;
    private int sub_total;

    public Consultar() {
        this.codigo_detalle = 0;
        this.codigo_solicitud = 0;
        this.codigo_prenda = 0;
        this.cantidad = 0;
        this.codigo_ca = 0;
        this.codigo_se = 0;
        this.descripcion = "";
        this.sub_total = 0;
    }

    public Consultar(int codigo_detalle, int codigo_solicitud, int codigo_prenda, int cantidad, int codigo_ca, int codigo_se, String descripcion, int sub_total) {
        this.codigo_detalle = codigo_detalle;
        this.codigo_solicitud = codigo_solicitud;
        this.codigo_prenda = codigo_prenda;
        this.cantidad = cantidad;
        this.codigo_ca = codigo_ca;
        this.codigo_se = codigo_se;
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

    public int getCodigo_prenda() {
        return codigo_prenda;
    }

    public void setCodigo_prenda(int codigo_prenda) {
        this.codigo_prenda = codigo_prenda;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCodigo_ca() {
        return codigo_ca;
    }

    public void setCodigo_ca(int codigo_ca) {
        this.codigo_ca = codigo_ca;
    }

    public int getCodigo_se() {
        return codigo_se;
    }

    public void setCodigo_se(int codigo_se) {
        this.codigo_se = codigo_se;
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
